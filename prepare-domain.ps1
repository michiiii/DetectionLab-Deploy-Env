Import-Module ActiveDirectory

### Vulnerabilities
##### Sensitive Data in LDAP
Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Adding Users with sensitive data in Attributes..."
if (!([ADSI]::Exists("LDAP://CN=PrinterAdmin,OU=ServiceAccounts,OU=AdministrativeAccounts,DC=windomain,DC=local")))
{
	
	New-ADUser -Name "PrinterAdmin" -DisplayName "PrinterAdmin" -SamAccountName "printeradm" -description "Change: ITCH-29492 - PW reset to x!3945jjlkJ2mN4QQ2" -UserPrincipalName "printeradm" -GivenName "Printer" -Surname "Administrator" -AccountPassword ((ConvertTo-SecureString "x!3945jjlkJ2mN4QQ2" -AsPlainText -Force)) -Enabled $true -Path "OU=ServiceAccounts, OU=AdministrativeAccounts, DC=WINDOMAIN, DC=LOCAL" -ChangePasswordAtLogon $false -PasswordNeverExpires $true
	Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Created user printeradm with sensitive data in User Attributes" 
}
else
{
	Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) The user $SAM already exists. Moving On."
}
 


### Kerberoastable Users
Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Adding Kerberoastable Users..."
if (!([ADSI]::Exists("LDAP://CN=DBAdmin,OU=ServiceAccounts,OU=AdministrativeAccounts,DC=windomain,DC=local")))
{
	
	New-ADUser -Name "DBAdmin" -DisplayName "DBAdmin" -SamAccountName "dbadm" -description "DatabaseAdministrationAccount" -UserPrincipalName "dbadm" -GivenName "Database" -Surname "Administrator" -AccountPassword ((ConvertTo-SecureString "kd329Sl23kcJk3A$" -AsPlainText -Force)) -Enabled $true -Path "OU=ServiceAccounts, OU=AdministrativeAccounts, DC=WINDOMAIN, DC=LOCAL" -ChangePasswordAtLogon $false -PasswordNeverExpires $true
	setspn -s http/wef.windomain.local:1433 windomain.local\dbadm
	Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Created user Kerberoastable User DBAdmin..." 
}
else
{
	Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) The user DBAdmin already exists. Moving On."
}

if (!([ADSI]::Exists("LDAP://CN=WebAdmin,OU=ServiceAccounts,OU=AdministrativeAccounts,DC=windomain,DC=local")))
{
	
	New-ADUser -Name "WebAdmin" -DisplayName "WebAdmin" -SamAccountName "webadm" -description "WebAdministrationAccount" -UserPrincipalName "webadm" -GivenName "Web" -Surname "Administrator" -AccountPassword ((ConvertTo-SecureString "Web1234!200" -AsPlainText -Force)) -Enabled $true -Path "OU=ServiceAccounts, OU=AdministrativeAccounts, DC=WINDOMAIN, DC=LOCAL" -ChangePasswordAtLogon $false -PasswordNeverExpires $true
	setspn -s http/wef.windomain.local:8080 windomain.local\webadm
	Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Created user Kerberoastable User WebAdmin..." 
}
else
{
	Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) The user WebAdmin already exists. Moving On."
} 

if (!([ADSI]::Exists("LDAP://CN=IAMadmin,OU=ServiceAccounts,OU=AdministrativeAccounts,DC=windomain,DC=local")))
{
	
	New-ADUser -Name "IAMadmin" -DisplayName "IAMadmin" -SamAccountName "iamadm" -description "IAMAdministrationAccount" -UserPrincipalName "iamadm" -GivenName "IAM" -Surname "Administrator" -AccountPassword ((ConvertTo-SecureString "k3jdfiu2KAn3!" -AsPlainText -Force)) -Enabled $true -Path "OU=ServiceAccounts, OU=AdministrativeAccounts, DC=WINDOMAIN, DC=LOCAL" -ChangePasswordAtLogon $false -PasswordNeverExpires $true
	setspn -s http/wef.windomain.local:445 windomain.local\iamadm
	Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Created user Kerberoastable User IAMadmin..." 
}
else
{
  Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) The user IAMadmin already exists. Moving On."
} 

if (!([ADSI]::Exists("LDAP://CN=SoundAdmin,OU=ServiceAccounts,OU=AdministrativeAccounts,DC=windomain,DC=local")))
{
	
	
	New-ADUser -Name "SoundAdmin" -DisplayName "SoundAdmin" -SamAccountName "soundadm" -description "SoundAdministrationAccount" -UserPrincipalName "soundadm" -GivenName "Sound" -Surname "Administrator" -AccountPassword ((ConvertTo-SecureString "k2k3kkksllaKLs!$" -AsPlainText -Force)) -Enabled $true -Path "OU=ServiceAccounts, OU=AdministrativeAccounts, DC=WINDOMAIN, DC=LOCAL" -ChangePasswordAtLogon $false -PasswordNeverExpires $true
	setspn -s http/wef.windomain.local:1337 windomain.local\soundadm
	Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Created user Kerberoastable User SoundAdmin..." 
}
else
{
  Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) The user SoundAdmin already exists. Moving On."
}

if (!([ADSI]::Exists("LDAP://CN=MercureAdmin,OU=ServiceAccounts,OU=AdministrativeAccounts,DC=windomain,DC=local")))
{
	
	
	New-ADUser -Name "MercureAdmin" -DisplayName "MercureAdmin" -SamAccountName "mercureadm" -description "MercureAdministrationAccount" -UserPrincipalName "mercureadm" -GivenName "Mercure" -Surname "Administrator" -AccountPassword ((ConvertTo-SecureString "Mercure2020!" -AsPlainText -Force)) -Enabled $true -Path "OU=ServiceAccounts, OU=AdministrativeAccounts, DC=WINDOMAIN, DC=LOCAL" -ChangePasswordAtLogon $false -PasswordNeverExpires $true
	setspn -s http/wef.windomain.local:443 windomain.local\mercureadm
	Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Created user Kerberoastable User MercureAdmin..." 
	
}
else
{
  Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) The user MercureAdmin already exists. Moving On."
}

#### ASREP Roastable Users
Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Adding ASREP Roastable Users..."

if (!([ADSI]::Exists("LDAP://CN=TankAdmin,OU=ServiceAccounts,OU=AdministrativeAccounts,DC=windomain,DC=local")))
{
	
	New-ADUser -Name "TankAdmin" -DisplayName "TankAdmin" -SamAccountName "tankadm" -description "TankAdministrationAccount" -UserPrincipalName "tankadm" -GivenName "Tank" -Surname "Administrator" -AccountPassword ((ConvertTo-SecureString "Peaceful2020!" -AsPlainText -Force)) -Enabled $true -Path "OU=ServiceAccounts, OU=AdministrativeAccounts, DC=WINDOMAIN, DC=LOCAL" -ChangePasswordAtLogon $false -PasswordNeverExpires $true
	Get-ADUser tankadm | Set-ADAccountControl -DoesNotRequirePreAuth $true
	Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Created user ASREP Roastable User TankAdmin..." 
}
else
{
  Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) The user TankAdmin already exists. Moving On."
}


### PASSWD NOT REQ User
Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Adding PASSWD_NOT_REQD User..."
if (!([ADSI]::Exists("LDAP://CN=MailerAdmin,OU=ServiceAccounts,OU=AdministrativeAccounts,DC=windomain,DC=local")))
{
	New-ADUser -Name "MailerAdmin" -DisplayName "MailerAdmin" -SamAccountName "maileradm" -description "MailerAdministrationAccount" -UserPrincipalName "maileradm" -GivenName "Mailer" -Surname "Administrator" -Enabled $true -Path "OU=ServiceAccounts, OU=AdministrativeAccounts, DC=WINDOMAIN, DC=LOCAL" -ChangePasswordAtLogon $false -PasswordNeverExpires $true -PasswordNotRequired $true
	Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Created PASSWD NOT REQ User MailerAdmin..." 
}
else
{
  Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) The user MailerAdmin already exists. Moving On."
}

### Vulnerable GPP GPO
Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Creating vulnerable honeypot GPO..."
$gpoGUID='{AB7056F2-2F4F-1337-9F13-6956913B9893}'
$gpoPath="C:\Windows\SYSVOL\sysvol\windomain.local\Policies\$($gpoGUID)\Machine"
$groupsXMLPath= "$($gpoPath)\groups.xml"

New-Item -ItemType Directory -Force -Path $gpoPath -ErrorAction SilentlyContinue
Set-Content $groupsXMLPath '<?xml version="1.0" encoding="utf-8"?><Groups clsid="{3125E937-EB16-4b4c-9934-544FC6D24D26}"><User clsid="{DF5F1855-51E5-4d24-8B1A-D9BDE98BA1D1}" name="Administrator (built-in)" image="2" changed="2019-03-17 03:17:23" uid="{D5FE7352-81E1-42A2-B7DA-118402BE4C33}"><Properties action="U" newName="PTFAdmin" fullName="" description="PTF Server Admin Account" cpassword="zglsHb5O0YV9qv9y2a/vqY30afksqSnbY2nJ9zTyTo6ksAe08TuJltE/AjSl8Oxw" changelogon="0" noChange="0" neverExpires="0" acctDisabled="0" subAuthority="RID_ADMIN" userName="Administrator (built-in)" expires="2025-03-16" /></User></Groups>'

if (!([ADSI]::Exists("LDAP://CN=PTFAdmin,OU=ServiceAccounts,OU=AdministrativeAccounts,DC=windomain,DC=local")))
{
	New-ADUser -Name "PTFAdmin" -DisplayName "PTFAdmin" -SamAccountName "PTFAdmin" -description "PTF Server Administrator Account (sensitive)" -UserPrincipalName "PTFAdmin" -GivenName "PTF" -Surname "Admin" -Enabled $true -Path "OU=ServiceAccounts, OU=AdministrativeAccounts, DC=WINDOMAIN, DC=LOCAL" -ChangePasswordAtLogon $false -PasswordNeverExpires $true -AccountPassword ((ConvertTo-SecureString "Peaceful2020!" -AsPlainText -Force)) 
	Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Created PTFAdmin Honeypot user for GPPPassword..." 
}
else
{
  Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) The user PTFAdmin already exists. Moving On."
}