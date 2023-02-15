$chromeHistoryPath = "C:\Users\AssessmentCenter\AppData\Local\Google\Chrome\User Data\Default"
$edgeHistoryPath = "C:\Users\AssessmentCenter\AppData\Local\Microsoft\Edge\User Data\Default"
$mozillaHistoryPath1 = "C:\Users\AssessmentCenter\AppData\Roaming\Mozilla\Firefox\profiles.ini"
$mozillaHistoryPath2 = "C:\Users\AssessmentCenter\AppData\Roaming\Mozilla\Firefox\Profiles"

$dokumentyPath = "C:\Users\AssessmentCenter\Documents\*" 
$pobranePath = "C:\Users\AssessmentCenter\Downloads\*"
$pulpitPath = "C:\Users\AssessmentCenter\Desktop\*"

#Chrome
if(Get-Process -Name chrome){
    Stop-Process -Name chrome -Force
    Write-Output "Google Chrome zostało zamknięte"

	if(Test-Path $chromeHistoryPath){
    Remove-Item $chromeHistoryPath -Recurse -Force
    }
    else{
    Write-Output "Historia Chrome została już wcześniej usunięta"
    }
}
else{
    if(Test-Path $chromeHistoryPath){
    Remove-Item $chromeHistoryPath -Recurse -Force
    }
    else{
    Write-Output "Historia Chrome została już wcześniej usunięta"
    }
}

#Edge
if(Get-Process -Name msedge ){
    Stop-Process -Name msedge -Force
    Write-Output "Microsoft Edge zostało zamknięte"

    if(Test-Path $edgeHistoryPath){
    Remove-Item $edgeHistoryPath -Recurse -Force
    }
    else{
    Write-Output "Historia Edge została już wcześniej usunięta"
    }
}
else{
    if(Test-Path $edgeHistoryPath){
    Remove-Item $edgeHistoryPath -Recurse -Force
    }
    else{
    Write-Output "Historia Edge została już wcześniej usunięta"
    }
}

#Mozilla
if(Get-Process -Name firefox){
    Stop-Process -Name firefox -Force
    Write-Output "Mozilla Firefox została zamknięta"

    if(Test-Path $mozillaHistoryPath1 -And -Test-Path $mozillaHistoryPath2){
    Remove-Item $mozillaHistoryPath1 -Recurse -Force
    Remove-Item $mozillaHistoryPath2 -Recurse -Force
    }
    else{
    Write-Output "Historia Firefox została już wcześniej usunięta"
    }
}
else{
    
    if(Test-Path $mozillaHistoryPath1 -And -Test-Path $mozillaHistoryPath2){
    Remove-Item $mozillaHistoryPath1 -Recurse -Force
    Remove-Item $mozillaHistoryPath2 -Recurse -Force
    }
    else{
    Write-Output "Historia Firefox została już wcześniej usunięta"
    }
}

Remove-Item $dokumentyPath -Recurse -Force
Remove-Item $pobranePath -Recurse -Force
Remove-Item $pulpitPath -Recurse -Force    

Clear-RecycleBin -Force #usuwanie zawartości kosza też nie wiem czy musi być