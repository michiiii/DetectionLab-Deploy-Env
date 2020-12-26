Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Setting timezone to W. Europe Standard Time..."
c:\windows\system32\tzutil.exe /s "W. Europe Standard Time"

Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Setting keyboard language to German..."
Set-WinUserLanguageList -LanguageList de-DE -Force

Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Disable NLA..."
(Get-WmiObject -class "Win32_TSGeneralSetting" -Namespace root\cimv2\terminalservices -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0)

	Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Disable Firewall..."
	Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
