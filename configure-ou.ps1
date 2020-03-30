Import-Module ActiveDirectory
# Purpose: Sets up the Server and Workstations OUs

Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Checking AD services status..."
$svcs = "adws","dns","kdc","netlogon"
Get-Service -name $svcs -ComputerName localhost | Select Machinename,Name,Status

# Hardcoding DC hostname in hosts file
Add-Content "c:\windows\system32\drivers\etc\hosts" "        192.168.38.102    dc.windomain.local"

# Force DNS resolution of the domain
ping /n 1 dc.windomain.local
ping /n 1 windomain.local

Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Creating Server and Workstation OUs..."
Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Creating Servers OU..."

if (!([ADSI]::Exists("LDAP://OU=Servers,DC=windomain,DC=local")))
{
  New-ADOrganizationalUnit -Name "Servers" -Server "dc.windomain.local"
}
else
{
    Write-Host "'[{0:HH:mm}]' -f (Get-Date)) Servers OU already exists. Moving On."
}

Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Creating Workstations OU"
if (!([ADSI]::Exists("LDAP://OU=Workstations,DC=windomain,DC=local")))
{
  New-ADOrganizationalUnit -Name "Workstations"
}
else
{
  Write-Host "'[{0:HH:mm}]' -f (Get-Date)) Workstations OU already exists. Moving On."
}

Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Creating Workstations OU"
if (!([ADSI]::Exists("LDAP://OU=UserAccounts,DC=windomain,DC=local")))
{
  New-ADOrganizationalUnit -Name "UserAccounts"
}
else
{
  Write-Host "'[{0:HH:mm}]' -f (Get-Date)) UserAccounts OU already exists. Moving On."
}

if (!([ADSI]::Exists("LDAP://OU=US,OU=UserAccounts,DC=windomain,DC=local")))
{
  New-ADOrganizationalUnit -Name "US" -Path "OU=UserAccounts, DC=WINDOMAIN, DC=LOCAL"
}
else
{
  Write-Host "'[{0:HH:mm}]' -f (Get-Date)) US OU already exists. Moving On."
}

if (!([ADSI]::Exists("LDAP://OU=France,OU=UserAccounts,DC=windomain,DC=local")))
{
  New-ADOrganizationalUnit -Name "France" -Path "OU=UserAccounts, DC=WINDOMAIN, DC=LOCAL"
}
else
{
  Write-Host "'[{0:HH:mm}]' -f (Get-Date)) France OU already exists. Moving On."
}

if (!([ADSI]::Exists("LDAP://OU=Brazil,OU=UserAccounts,DC=windomain,DC=local")))
{
  New-ADOrganizationalUnit -Name "Brazil" -Path "OU=UserAccounts, DC=WINDOMAIN, DC=LOCAL"
}
else
{
  Write-Host "'[{0:HH:mm}]' -f (Get-Date)) Brazil OU already exists. Moving On."
}

if (!([ADSI]::Exists("LDAP://OU=Canada,OU=UserAccounts,DC=windomain,DC=local")))
{
  New-ADOrganizationalUnit -Name "Canada" -Path "OU=UserAccounts, DC=WINDOMAIN, DC=LOCAL"
}
else
{
  Write-Host "'[{0:HH:mm}]' -f (Get-Date)) Canada OU already exists. Moving On."
}

if (!([ADSI]::Exists("LDAP://OU=Germany,OU=UserAccounts,DC=windomain,DC=local")))
{
  New-ADOrganizationalUnit -Name "Germany" -Path "OU=UserAccounts, DC=WINDOMAIN, DC=LOCAL"
}
else
{
  Write-Host "'[{0:HH:mm}]' -f (Get-Date)) Germany OU already exists. Moving On."
}

if (!([ADSI]::Exists("LDAP://OU=Australia,OU=UserAccounts,DC=windomain,DC=local")))
{
  New-ADOrganizationalUnit -Name "Australia" -Path "OU=UserAccounts, DC=WINDOMAIN, DC=LOCAL"
}
else
{
  Write-Host "'[{0:HH:mm}]' -f (Get-Date)) Australia OU already exists. Moving On."
}

if (!([ADSI]::Exists("LDAP://OU=Groups,DC=windomain,DC=local")))
{
  New-ADOrganizationalUnit -Name "Groups" -Path "DC=WINDOMAIN, DC=LOCAL"
}
else
{
  Write-Host "'[{0:HH:mm}]' -f (Get-Date)) Groups OU already exists. Moving On."
}

if (!([ADSI]::Exists("LDAP://OU=Global,OU=Groups,DC=windomain,DC=local")))
{
	New-ADOrganizationalUnit -Name "Global" -Path "OU=Groups, DC=WINDOMAIN, DC=LOCAL"
}
else
{
  Write-Host "'[{0:HH:mm}]' -f (Get-Date)) Global OU already exists. Moving On."
}

if (!([ADSI]::Exists("LDAP://OU=AdministrativeAccounts,DC=windomain,DC=local")))
{
	New-ADOrganizationalUnit -Name "AdministrativeAccounts"  -Path "DC=WINDOMAIN, DC=LOCAL"
}
else
{
  Write-Host "'[{0:HH:mm}]' -f (Get-Date)) AdministrativeAccounts OU already exists. Moving On."
}

if (!([ADSI]::Exists("LDAP://OU=ServiceAccounts,OU=AdministrativeAccounts,DC=windomain,DC=local")))
{
	New-ADOrganizationalUnit -Name "ServiceAccounts"  -Path "OU=AdministrativeAccounts,DC=WINDOMAIN, DC=LOCAL"
}
else
{
  Write-Host "'[{0:HH:mm}]' -f (Get-Date)) ServiceAccounts OU already exists. Moving On."
}

# Sysprep breaks auto-login. Let's restore it here:
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name AutoAdminLogon -Value 1
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name DefaultUserName -Value "vagrant"
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name DefaultPassword -Value "vagrant"
