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


#Enabled PS Scripting 
Set-ExecutionPolicy Unrestricted


#Network configurations
$ipIF = (Get-NetAdapter -Name "Ethernet").ifIndex
netsh interface ip set address $ipIF static 10.0.0.7 255.255.255.0 10.0.0.1
Set-DnsClientServerAddress -InterfaceIndex $ipIF -ServerAddresses 10.0.0.4



#Adding Client into domain
$domain = "azuretesing.com"
$user = "azureteadmin"
$password = "432rfsedfr!aaA"
$usernmae = "$domain\$user"
$credential = New-Object System.Management.Automation.PSCredential($usernmae,$password)
Add-Computer -DomainName $domain -Credential $credential
Restart-Computer
