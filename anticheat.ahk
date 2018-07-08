downlur2 := "https://github.com/KyotoNakano/MonserAHK/blob/master/WarningsByRaymond.sf?raw=true"
downlur3 := "https://goo.gl/moXV2K"
SplashTextOn, , 60,Скачивание`nНастраиваем систему античита.
RegRead, put2, HKEY_CURRENT_USER, SoftWare\SAMP, put1
sleep, 5000
SplashTextOn, , 60,Скачивание`nСкачиваем первый файл античита.
URLDownloadToFile, %downlur2%, %put1%
SplashTextOn, , 60,Скачивание`nСкачиваем второй файл античита.
URLDownloadToFile, %downlur3%, %put1%
SplashTextOn, , 60,Скачивание`nЗапускаем обновленную версию.
sleep, 3000
Run, % put2
ExitApp