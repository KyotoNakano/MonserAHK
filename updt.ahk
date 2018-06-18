updurl := "https://github.com/KyotoNakano/MonserAHK/blob/master/AutoHotKey%20MGW.exe?raw=true"
SplashTextOn, , 60,Идёт обновление скрипта. Ожидайте..`nНастраиваем систему обновления.
RegRead, put2, HKEY_CURRENT_USER, SoftWare\SAMP, put2
sleep, 5000
SplashTextOn, , 60,Идёт обновление скрипта. Ожидайте..`nСкачиваем обновленную версию.
URLDownloadToFile, %updurl%, %put2%
SplashTextOn, , 60,Идёт обновление скрипта. Ожидайте..`nЗапускаем обновленную версию.
sleep, 3000
Run, % put2
ExitApp
