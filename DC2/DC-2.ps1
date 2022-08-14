
#Run as admin
$myWindowsID = [System.Security.Principal.WindowsIdentity]::GetCurrent();
$myWindowsPrincipal = New-Object System.Security.Principal.WindowsPrincipal($myWindowsID);
$adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator;
$myWindowsID = [System.Security.Principal.WindowsIdentity]::GetCurrent();
$myWindowsPrincipal = New-Object System.Security.Principal.WindowsPrincipal($myWindowsID);
$adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator;

if ($myWindowsPrincipal.IsInRole($adminRole))
{
    $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)";
    $Host.UI.RawUI.BackgroundColor = "DarkBlue";
    Clear-Host;
}
else {
    $newProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = "& '" + $script:MyInvocation.MyCommand.Path + "'"
    $newProcess.Verb = "runas";
    [System.Diagnostics.Process]::Start($newProcess);
    Exit;
}



#Shutdown Firewall
Set-NetFirewallProfile -All -Enabled False



#Network configurations
$ipIF = (Get-NetAdapter -Name "Ethernet").ifIndex
netsh interface ip set address $ipIF static 10.0.0.5 255.255.255.0 10.0.0.1
Set-DnsClientServerAddress -InterfaceIndex $ipIF -ServerAddresses 10.0.0.4

#Adding secondary domain controller 
Install-WindowsFeature AD-Domain-Services –IncludeManagementTools
Get-Command -Module ADDSDeployment
Install-ADDSDomainController -DomainName "azuretesing.com" -InstallDns -Credential (get-credential AZURETESING\azureteadmin) -DatabasePath "D:\ADDS\DB" -LogPath "D:\ADDS\Log" -SysvolPath "D:\ADDS\SYSVOL"
