### Create folders and make shares
$path="C:\Shares"
if( -Not ( Test-Path -Path $path )){
    # file with path $path doesn't exist
	Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Creating Shared Folders..."
	New-Item "C:\Shares" –type directory

	New-Item "C:\Shares\Accounting and Finance" –type directory
	New-SMBShare -Name "Accounting and Finance" -Path "C:\Shares\Accounting and Finance" -FullAccess "windomain.local\Domain Admins" -ChangeAccess "windomain.local\Accounting and Finance"
	 
	New-Item "C:\Shares\Helpdesk" –type directory
	New-SMBShare -Name "Helpdesk" -Path "C:\Shares\Helpdesk" -FullAccess "windomain.local\Domain Admins" -ChangeAccess "windomain.local\Helpdesk"

	New-Item "C:\Shares\HR" –type directory
	New-SMBShare -Name "HR" -Path "C:\Shares\HR" -FullAccess "windomain.local\Domain Admins" -ChangeAccess "windomain.local\Human Resource Management"

	New-Item "C:\Shares\Management" –type directory
	New-SMBShare -Name "Management" -Path "C:\Shares\Management" -FullAccess "windomain.local\Domain Admins" -ChangeAccess "windomain.local\Management"

	New-Item "C:\Shares\Marketing" –type directory
	New-SMBShare -Name "Marketing" -Path "C:\Shares\Marketing" -FullAccess "windomain.local\Domain Admins" -ChangeAccess "windomain.local\Marketing"

	New-Item "C:\Shares\Purchasing" –type directory
	New-SMBShare -Name "Purchasing" -Path "C:\Shares\Purchasing" -FullAccess "windomain.local\Domain Admins" -ChangeAccess "windomain.local\Purchasing"

	New-Item "C:\Shares\Research and Development" –type directory
	New-SMBShare -Name "Research and Development" -Path "C:\Shares\Research and Development" -FullAccess "windomain.local\Domain Admins" -ChangeAccess "windomain.local\Research and Development"

	New-Item "C:\Shares\Sales" –type directory
	New-SMBShare -Name "Sales" -Path "C:\Shares\Sales" -FullAccess "windomain.local\Domain Admins" -ChangeAccess "windomain.local\Sales"
} else {

	Write-Host "'[{0:HH:mm}]' -f (Get-Date)) The Shares already exist"
}


