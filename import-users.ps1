Import-Module ActiveDirectory

$Users = Import-Csv -Delimiter ";" -Path ".\final_users.csv"

foreach ($User in $Users) {
  $SAM = $User.Username
  $Displayname = $User.Displayname
  $Cn = $cn = ($Displayname -replace ",","\,")
  $Firstname = $User.Firstname
  $Lastname = $User.Lastname
  $OU = $User.Container
  $Description=$User.Description
  $UPN = $User.Username + "@windomain.local"
  $Password = (ConvertTo-SecureString $User.Password -AsPlainText -Force)
  $Group = $User.Group
  Write-Host "LDAP://CN=$Cn, $OU"

if (!([ADSI]::Exists("LDAP://CN=$cn, $ou")))
{
	New-ADUser -Name "$Displayname" -DisplayName "$Displayname" -SamAccountName "$SAM" -description "$Description" -UserPrincipalName "$UPN" -GivenName "$Firstname" -Surname "$Lastname" -AccountPassword $Password -Enabled $true -Path "$OU" -ChangePasswordAtLogon $false -PasswordNeverExpires $true
	
	Add-ADGroupMember -Identity "$Group" -Members $SAM
	Write-Host "Created user: $SAM who joined the Group $Group" 
}
else
{
  Write-Host "The user $SAM already exists. Moving On."
}
 
}