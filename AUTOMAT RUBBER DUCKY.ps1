function logAutomatu()
{
$path = New-Item -Path 'C:\temp' -ItemType Directory
$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path $path\wynik\log_automat.txt -append
}
function localAdmin()
{
try{
$Password = 'ZOO$tan!eMY' | ConvertTo-SecureString -AsPlainText -Force
$UserAccountName = 'licek'
$user = New-LocalUser -Name $UserAccountName -Password $Password
Add-LocalGroupMember -Group "Administratorzy" -Member $UserAccountName
$user | Set-LocalUser -PasswordNeverExpires:$true
}
catch
{
"$(Get-Date) Błąd przy tworzeniu administartora lokalnego" | Out-File "C:\wynik\log.txt" -append;
}
}
function UAC()
{
try{
Set-ItemProperty -Path REGISTRY::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 5
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name PromptOnSecureDesktop -Value 0
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorUser -Value 3
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableInstallerDetection -Value 1
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Value 1
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableVirtualization -Value 1
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name ValidateAdminCodeSignatures -Value 0
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name FilterAdministratorToken -Value 0
}
catch
{
"$(Get-Date) Błąd przy zmianie ustawień UAC" | Out-File "C:\wynik\log.txt" -append;
}
}
function installChoco()
{
try{
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) 
    $installDIR= 'C:\ProgramData\chocolatey'
    $evpath = [Environment]::GetEnvironmentVariable("Path")
    $evpath += "C:\ProgramData\chocolatey\bin"
    [Environment]::SetEnvironmentVariable("Path", $evpath)
    choco feature enable -n allowGlobalConfirmation
    }
    catch
    {
        "$(Get-Date) Błąd przy instalacji chocolatey" | Out-File "C:\wynik\log.txt" -append;
    }

}
function uninstallChoco()
{
$chocoPath = "C:\ProgramData\chocolatey"
try
        {
            Remove-Item $chocoPath -Force -Recurse
            "Usunięto Choco"
                
        }
        catch 
        {
            "$(get-date) błąd przy usuwaniu chocolatey " | Out-File $path\wynik\log.txt -append;
        }
}
function installApps()
{
try
{
choco install zoom
choco install 7zip
choco install adobrereader
choco install googlechrome
choco install slack
choco install zoom
choco install thunderbird
choco install firefox
choco install libreoffice
}
catch
{
"$(Get-Date) Błąd przy instalacji programów" | Out-File "C:\wynik\log.txt" -append;
}

}



logAutomatu
UAC
localAdmin
installApps
installChoco
uninstallChoco





