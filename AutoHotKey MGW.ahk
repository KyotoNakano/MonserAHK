#NoEnv
#SingleInstance force
#include samp.ahk
#IfWinActive GTA:SA:MP
#UseHook On
SendMode Input
SplashTextoff

buildscr = 7
downlurl := "https://github.com/KyotoNakano/MonserAHK/blob/master/updt.exe?raw=true"
downllen := "https://github.com/KyotoNakano/MonserAHK/raw/master/verlen.ini"

WM_HELP(){
    IniRead, vupd, %a_temp%/verlen.ini, UPD, v
    IniRead, desupd, %a_temp%/verlen.ini, UPD, des
    desupd := Utf8ToAnsi(desupd)
    IniRead, updupd, %a_temp%/verlen.ini, UPD, upd
    updupd := Utf8ToAnsi(updupd)
    msgbox, , ������ ��������� ������ %vupd%, %updupd%
    return
}
OnMessage(0x53, "WM_HELP")
Gui +OwnDialogs
SplashTextOn, , 50,��������������, ���������� ��������...`n��� �������� ����������.
URLDownloadToFile, %downllen%, %a_temp%/verlen.ini
IniRead, buildupd, %a_temp%/verlen.ini, UPD, build
if buildupd =
{
    SplashTextOn, , 50,��������������, ���������� ��������...`n������. ��� ����� � ��������.
    sleep, 2000
}
if buildupd > % buildscr
{
    IniRead, vupd, %a_temp%/verlen.ini, UPD, v
    SplashTextOn, , 60,��������������, ���������� ��������...`n���������� ���������� �� ������ %vupd%!
    sleep, 2000
    IniRead, desupd, %a_temp%/verlen.ini, UPD, des
    desupd := Utf8ToAnsi(desupd)
    IniRead, updupd, %a_temp%/verlen.ini, UPD, upd
    updupd := Utf8ToAnsi(updupd)
    SplashTextoff
    msgbox, 16384, ���������� ������� �� ������ %vupd%, %desupd%
    IfMsgBox OK
    {
        msgbox, 1, ���������� ������� �� ������ %vupd%, ������ �� �� ����������?
        IfMsgBox OK
        {
            put2 := % A_ScriptFullPath
            RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\SAMP ,put2 , % put2
            SplashTextOn, , 60,��������������, ���������� ��������...`n��������� ������ �� ������ %vupd%!
            URLDownloadToFile, %downlurl%, %a_temp%/updt.exe
            sleep, 1000
            run, %a_temp%/updt.exe
            exitapp
        }
    }
}
SetTimer, Login, 100

hello := 1

if hello := 1
{
    ShowGameText("~g~Monser GangWar AHK", 5000, 4)
}
SplashTextoff
DIR = %A_MyDocuments%\GTA San Andreas User Files\Monser Gang War\AHK\Settings
FileCreateDir, %DIR%
DIRSET = %A_MyDocuments%\GTA San Andreas User Files\Monser Gang War\AHK\Settings\options.ini
IfNotExist,%DIR%\*.ini
{
    SplashTextOn, , 60,Monser Gang War AHK,���������� ��������`n��� ��������� ������ ������...
    UrlDownloadToFile, https://www.dropbox.com/s/j9ldvbr3fabfdvb/options.ini?dl=1, %DIR%\options.ini
    SplashTextoff
}
{
        gosub, ReadSettings
Gui, Font, s8
Gui, Add, Text, x682 y309 w150 h60 , Version: 1.2`nMONSER.RU`nKyoto_Nakano � 2018
Gui, Add, Button, x682 y45 w160 h50 gCMDList1, ������ ������
Gui, Add, Tab, x22 y19 w650 h360 , �������|����|��� � ����|����|��������������
Gui, Tab, �������
Gui, Add, GroupBox, x32 y49 w300 h130 +Center, ������ �� �������
Gui, Add, Hotkey, x52 y139 w90 h20 vyesrecon, %yesrecon%
Gui, Add, Hotkey, x52 y109 w90 h20 vrecon, %recon%
Gui, Add, Hotkey, x52 y79 w90 h20 vnorecon %noecon%
Gui, Add, Text, x172 y75 w140 h30 , ������� �� ����� ������
Gui, Add, Text, x172 y109 w140 h20 , ����� �������
Gui, Add, Text, x172 y139 w140 h20 , ��� ���������
Gui, Add, GroupBox, x352 y49 w310 h100 +Center, ����� � ������
Gui, Add, Hotkey, x382 y79 w90 h20 vgg, %gg%
Gui, Add, Hotkey, x382 y109 w90 h20 vforum, %forum%
Gui, Add, Text, x492 y79 w170 h20 , �������� �������� ����
Gui, Add, Text, x492 y109 w140 h20 , ������ �� �����
Gui, Add, GroupBox, x32 y199 w630 h150 +Center, ����� ���������� �������
Gui, Add, Hotkey, x52 y229 w90 h20 vadm, %adm% 
Gui, Add, Hotkey, x52 y259 w90 h20 vloka, %loka%
Gui, Add, Hotkey, x52 y289 w90 h20 vbron, %bron%
Gui, Add, Hotkey, x52 y319 w90 h20 vleader, %leader%
Gui, Add, Text, x162 y229 w160 h20 , ��� ������ �������?
Gui, Add, Text, x162 y289 w160 h20 , ��� ����� ����������?
Gui, Add, Text, x162 y319 w160 h20 , ��� �������� �������?
Gui, Add, Text, x162 y259 w170 h20 , ��� ������� ������ �������?
Gui, Add, Hotkey, x382 y229 w90 h20 vlc, %lc%
Gui, Add, Hotkey, x382 y259 w90 h20  vduel, %duel%
Gui, Add, Hotkey, x382 y289 w90 h20  vvip, %vip%
Gui, Add, Text, x492 y230 w160 h20 , ��� ������� ���� �������?
Gui, Add, Text, x492 y259 w160 h20 , ��� ������ 1 �� 1?
Gui, Add, Text, x492 y289 w150 h20 , ����������� "VIP"?
Gui, Add, Button, x492 y329 w120 h30 gSaveButton, ���������
Gui, Tab, ����
Gui, Add, Hotkey, x52 y59 w100 h20 vmnogosms, %mnogosms%
Gui, Add, Hotkey, x52 y89 w100 h20  vcaps, %caps%
Gui, Add, Hotkey, x52 y119 w100 h20  vroz, %roz%
Gui, Add, Hotkey, x52 y149 w100 h20  vbuy, %buy%
Gui, Add, Hotkey, x52 y179 w100 h20  vofftopreport, %vofftopreport%
Gui, Add, Hotkey, x52 y209 w100 h20  vmat, %mat%
Gui, Add, Hotkey, x52 y239 w100 h20  vmutereklama, %mutereklama%
Gui, Add, Hotkey, x52 y269 w100 h20  vkleveta, %kleveta%
Gui, Add, Hotkey, x52 y299 w100 h20  voskproekta, %oskproekta%
Gui, Add, Text, x172 y59 w100 h20 , Flood
Gui, Add, Text, x172 y89 w100 h20 , Caps Lock
Gui, Add, Text, x172 y119 w100 h20 , ������
Gui, Add, Text, x172 y149 w100 h20 , ��������
Gui, Add, Text, x172 y179 w100 h20 , ������ � ������
Gui, Add, Text, x172 y209 w100 h20 , ��� � ������
Gui, Add, Text, x172 y239 w100 h20 , �������
Gui, Add, Text, x172 y269 w100 h20 , �������
Gui, Add, Text, x172 y299 w120 h20 , ����������� �������
Gui, Add, Text, x442 y269 w120 h20 , ����������� �������
Gui, Add, Hotkey, x322 y59 w100 h20 vtroll, %troll%
Gui, Add, Hotkey, x322 y89 w100 h20  vbadadm, %badadm%
Gui, Add, Hotkey, x322 y119 w100 h20  vmuteoskadm, %muteoskadm%
Gui, Add, Hotkey, x322 y149 w100 h20  vobsujdenie, %obsujdenie%
Gui, Add, Hotkey, x322 y179 w100 h20  vmuterod, %muterod%
Gui, Add, Hotkey, x322 y209 w100 h20  vneadekvat, %neadekvat%
Gui, Add, Hotkey, x322 y239 w100 h20  vofftopo, %offtopo%
Gui, Add, Hotkey, x322 y269 w100 h20 voskplayer, %oskplayer%
Gui, Add, Text, x442 y59 w140 h20 , �������� �������������
Gui, Add, Text, x442 y89 w190 h20 , ���������� � �������������
Gui, Add, Text, x442 y119 w160 h20 , ����������� �������������
Gui, Add, Text, x442 y149 w220 h20 , ���������� �������� �������������
Gui, Add, Text, x442 y179 w180 h20 , ����������/����������� ������
Gui, Add, Text, x442 y209 w140 h20 , ������������ ���������
Gui, Add, Text, x442 y239 w190 h20 , ������ /o
Gui, Add, Button, x492 y329 w120 h30 gSaveButton, ���������
Gui, Tab, ��� � ����
Gui, Add, GroupBox, x32 y49 w300 h220 +Center, ����
Gui, Add, Hotkey, x42 y79 w100 h20 vDB, %DB%
Gui, Add, Hotkey, x42 y109 w100 h20 vTK, %TK%
Gui, Add, Hotkey, x42 y139 w100 h20 vpomeha, %pomeha%
Gui, Add, Hotkey, x42 y169 w100 h20 vkicknick, %kicknick%
Gui, Add, Hotkey, x42 y199 w100 h20 vkickcapt, %kickcapt%
Gui, Add, Hotkey, x42 y229 w100 h20 vkickcheat, %kickcheat%
Gui, Add, Text, x162 y79 w100 h20 , DriveBy (DB)
Gui, Add, Text, x162 y109 w100 h20 , Team Kill (TK)
Gui, Add, Text, x162 y139 w160 h20 , ������ �������/������/�����
Gui, Add, Text, x162 y169 w120 h20 , ����������� � ����
Gui, Add, Text, x162 y199 w110 h20 , ������������ ����
Gui, Add, Text, x162 y229 w100 h20 , Cheat
Gui, Add, GroupBox, x352 y49 w300 h220 +Center, ���������
Gui, Add, Text, x362 y69 w230 h50 , ������ ��� ������ �� ������ �������/������/�����`, ������������ � ��������� � ������� ���������!
Gui, Add, Text, x362 y119 w230 h30 , ��� ������� 4+ ������ � ����`, �� ����������� � ����`, ������� ���� /sban
Gui, Add, Text, x362 y159 w230 h45 , ��� ������� 2+ ������`, �� Cheat`, ������� �������� ��������������� ��������� jail/ban
Gui, Add, Text, x362 y209 w230 h30 , ��� ������� 2+ ������ �� ������������ ����`, ������� ������ � ������
Gui, Add, GroupBox, x32 y279 w620 h90 +Center, ���
Gui, Add, Hotkey, x52 y299 w100 h20 vjailcheat, %jailcheat%
Gui, Add, Text, x172 y299 w100 h20 , Cheat
Gui, Add, Hotkey, x392 y299 w100 h20 vjailcapt, %jailcapt%
Gui, Add, Text, x512 y299 w110 h20 , ������������ ����
Gui, Add, Hotkey, x52 y329 w100 h20 vbag, %bag%
Gui, Add, Text, x172 y329 w100 h20 , ������
Gui, Add, Button, x392 y329 w120 h30 gSaveButton, ���������
Gui, Tab, ����
Gui, Add, Hotkey, x42 y59 w100 h20 vcbancheat, %cbancheat%
Gui, Add, Hotkey, x42 y89 w100 h20 vbancheat, %bancheat%
Gui, Add, Hotkey, x42 y119 w100 h20 vbannick, %bannick%
Gui, Add, Hotkey, x42 y149 w100 h20 vbanreklama, %banreklama%
Gui, Add, Hotkey, x292 y59 w100 h20 vbanrod, %banrod%
Gui, Add, Hotkey, x292 y89 w100 h20 vbanproekta, %banproekta%
Gui, Add, Hotkey, x292 y119 w100 h20 vbanadm, %banadm%
Gui, Add, Hotkey, x292 y149 w100 h20 vbanneadekvat, %banneadekvat%
Gui, Add, Text, x162 y59 w100 h20 , Cheat 4+ lvl
Gui, Add, Text, x162 y89 w100 h20 , Cheat 3 lvl
Gui, Add, Text, x162 y119 w110 h20 , ����������� � ����
Gui, Add, Text, x162 y149 w100 h20 , �������
Gui, Add, Text, x412 y149 w160 h20 , ������������ ��������� � /v
Gui, Add, Text, x412 y119 w160 h20 , ����������� �������������
Gui, Add, Text, x412 y89 w120 h20 , ����������� �������
Gui, Add, Text, x412 y59 w120 h20 , ����������� ������
Gui, Add, GroupBox, x42 y199 w610 h160 +Center, ���������
Gui, Add, Text, x52 y229 w580 h30 , ���������`, �� ������� ������`, �������� � ��. ����� ���. ��� ����� ������ � ������� ������ �� �������/������ � ��/������ � �.�.
Gui, Add, Button, x287 y319 w120 h30 +Center gSaveButton, ���������
Gui, Tab, ��������������
Gui, Add, GroupBox, x32 y49 w200 h110 +Center, ��������� Duty
Gui, Add, Hotkey, x172 y69 w40 h30 vbduty, %kbduty%
Gui, Add, Text, x42 y69 w120 h30 , ��������� �� ���������
Gui, Add, Text, x42 y119 w130 h20 , ID ����� �� ���������
Gui, Add, Edit, x182 y119 w40 h20 vDuty, 
Gui, Add, GroupBox, x242 y49 w200 h120 , �������� �������
Gui, Add, CheckBox, x252 y69 w180 h30 vaduty Checked%aduty%, ������������� ��������� �� ���������
Gui, Add, CheckBox, x252 y99 w180 h30 vconoff Checked%conoff%, �������������� /conoff
Gui, Add, CheckBox, x252 y129 w180 h30 vtimemute Checked%timemute%, �������� ��� Mute
Gui, Add, Text, x42 y170 w500 h20 , �� ����������� ���� �������� DUTY, ��� �� ��������
Gui, Add, Button, x492 y329 w120 h30 gSaveButton, ���������
Gui, Show, x511 y210 h423 w850, AutoHotKey MGW
Return
}

ReadSettings:
{
    IniRead, mnogosms, %DIRSET%, Options, mnogosms
    IniRead, caps, %DIRSET%, Options, caps
    IniRead, buy, %DIRSET%, Options, buy
	IniRead, yesrecon, %DIRSET%, Options, yesrecon
    IniRead, recon, %DIRSET%, Options, recon
	IniRead, norecon, %DIRSET%, Options, norecon
	IniRead, gg, %DIRSET%, Options, gg
	IniRead, forum, %DIRSET%, Options, forum
	IniRead, adm, %DIRSET%, Options, adm
	IniRead, loka, %DIRSET%, Options, loka
	IniRead, bron, %DIRSET%, Options, bron
	IniRead, leader, %DIRSET%, Options, leader
	IniRead, lc, %DIRSET%, Options, lc
	IniRead, duel, %DIRSET%, Options, duel
	IniRead, vip, %DIRSET%, Options, vip
	IniRead, roz, %DIRSET%, Options, roz
	IniRead, offtopreport, %DIRSET%, Options, offtopreport
	IniRead, mat, %DIRSET%, Options, mat
	IniRead, mutereklama, %DIRSET%, Options, mutereklama
	IniRead, kleveta, %DIRSET%, Options, kleveta
	IniRead, oskproekta, %DIRSET%, Options, oskproekta
	IniRead, troll, %DIRSET%, Options, troll
	IniRead, badadm, %DIRSET%, Options, badadm
	IniRead, muteoskadm, %DIRSET%, Options, muteoskadm
	IniRead, obsujdenie, %DIRSET%, Options, obsujdenie
	IniRead, muterod, %DIRSET%, Options, muterod
	IniRead, neadekvat, %DIRSET%, Options, neadekvat
	IniRead, offtopo, %DIRSET%, Options, offtopo
	IniRead, oskplayer, %DIRSET%, Options, oskplayer
	IniRead, DB, %DIRSET%, Options, DB
	IniRead, TK, %DIRSET%, Options, TK
	IniRead, pomeha, %DIRSET%, Options, pomeha
	IniRead, kicknick, %DIRSET%, Options, kicknick
	IniRead, kickcapt, %DIRSET%, Options, kickcapt
	IniRead, kickcheat, %DIRSET%, Options, kickcheat
	IniRead, jailcheat, %DIRSET%, Options, jailcheat
	IniRead, bag, %DIRSET%, Options, bag
	IniRead, jailcapt, %DIRSET%, Options, jailcapt
	IniRead, bancheat, %DIRSET%, Options, bancheat
	IniRead, cbancheat, %DIRSET%, Options, cbancheat
	IniRead, bannick, %DIRSET%, Options, bannick
	IniRead, banreklama, %DIRSET%, Options, banreklama
	IniRead, banrod, %DIRSET%, Options, banrod
	IniRead, banproekta, %DIRSET%, Options, banproekta
	IniRead, banadm, %DIRSET%, Options, banadm
	IniRead, banneadekvat, %DIRSET%, Options, banneadekvat
	IniRead, bduty, %DIRSET%, Options, bduty
    IniRead, Duty, %DIRSET%, Options, Duty
    IniRead, aduty, %DIRSET%, Options, aduty
	IniRead, conoff, %DIRSET%, Options, conoff
	IniRead, timemute, %DIRSET%, Options, timemute
}
		if conoff=ERROR
        {
            conoff=
        }
        if timemute=ERROR
        {
            timemute=
        }
		if mnogosms=ERROR
        {
            mnogosms=
        }
        if caps=ERROR
        {
            caps=
        }
		if buy=ERROR
        {
            buy=
        }
		if yesrecon=ERROR
        {
            yesrecon=
        }
		if recon=ERROR
        {
            recon=
        }
        if norecon=ERROR
        {
            norecon=
		}
		if gg=ERROR
        {
            gg=
        }
		if forum=ERROR
        {
            forum=
        }
		if adm=ERROR
        {
            adm=
        }
		if loka=ERROR
        {
            loka=
        }
		if bron=ERROR
        {
            bron=
        }
		if leader=ERROR
        {
            leader=
        }
		if lc=ERROR
        {
            lc=
        }
		if duel=ERROR
        {
            duel=
        }
		if vip=ERROR
        {
            vip=
        }
		if roz=ERROR
        {
            roz=
        }
		if offtopreport=ERROR
        {
            offtopreport=
        }
		if mat=ERROR
        {
            mat=
        }
		if mutereklama=ERROR
        {
            mutereklama=
        }
		if kleveta=ERROR
        {
            kleveta=
        }
		if oskproekta=ERROR
        {
            oskproekta=
        }
		if troll=ERROR
        {
            troll=
        }
		if badadm=ERROR
        {
            badadm=
        }
		if muteoskadm=ERROR
        {
            muteoskadm=
        }
		if obsujdenie=ERROR
        {
            obsujdenie=
        }
		if muterod=ERROR
        {
            muterod=
        }
		if neadekvat=ERROR
        {
            neadekvat=
        }
		if offtopo=ERROR
        {
            offtopo=
        }
		if oskplayer=ERROR
        {
            oskplayer=
        }
		if DB=ERROR
        {
            DB=
        }
		if TK=ERROR
        {
            TK=
        }
		if pomeha=ERROR
        {
            pomeha=
        }
		if kicknick=ERROR
        {
            kicknick=
        }
		if kickcapt=ERROR
        {
            kickcapt=
        }
		if kickcheat=ERROR
        {
            kickcheat=
        }
		if jailcheat=ERROR
        {
            jailcheat=
        }
		if bag=ERROR
        {
            bag=
        }
		if jailcapt=ERROR
        {
            jailcapt=
        }
		if bancheat=ERROR
        {
            bancheat=
        }
		if cbancheat=ERROR
        {
            cbancheat=
        }
		if bannick=ERROR
        {
            bannick=
		}
		if banreklama=ERROR
        {
            banreklama=
        }
		if banrod=ERROR
        {
            banrod=
        }
		if banproekta=ERROR
        {
            banproekta=
        }
		if banadm=ERROR
        {
            banadm=
        }
		if banneadekvat=ERROR
        {
            banneadekvat=
        }
		if bduty=ERROR
        {
            bduty=
        }
		if Duty=ERROR
        {
            Duty=
        }
		if aduty=ERROR
        {
            aduty=
		}	
		if mnogosms !=
        {
            Hotkey, ~%mnogosms%, Button1
        }
        if caps !=
        {
            Hotkey, ~%caps%, Button2
        }
        if buy !=
        {
            Hotkey, ~%buy%, Button3
        }
        if yesrecon !=
        {
            Hotkey, ~%yesrecon%, Button4
        }
		if recon !=
        {
            Hotkey, ~%recon%, Button5
        }
        if norecon !=
        {
            Hotkey, ~%norecon%, Button6
        }
        if gg !=
        {
            Hotkey, ~%gg%, Button7
        }
        if forum !=
        {
            Hotkey, ~%forum%, Button8
        }
		if adm !=
        {
            Hotkey, ~%adm%, Button9
        }
        if loka !=
        {
            Hotkey, ~%loka%, Button10
        }
        if bron !=
        {
            Hotkey, ~%bron%, Button11
        }
        if leader !=
        {
            Hotkey, ~%leader%, Button12
        }
		if lc !=
        {
            Hotkey, ~%lc%, Button13
        }
        if duel !=
        {
            Hotkey, ~%duel%, Button14
        }
        if vip !=
        {
            Hotkey, ~%vip%, Button15
        }
        if roz !=
        {
            Hotkey, ~%roz%, Button16
        }
		if offtopreport !=
        {
            Hotkey, ~%offtopreport%, Button17
        }
        if mat !=
        {
            Hotkey, ~%mat%, Button18
        }
        if mutereklama !=
        {
            Hotkey, ~%mutereklama%, Button19
        }
        if kleveta !=
        {
            Hotkey, ~%kleveta%, Button20
        }
		if oskproekta !=
        {
            Hotkey, ~%oskproekta%, Button21
        }
        if troll !=
        {
            Hotkey, ~%troll%, Button22
        }
        if badadm !=
        {
            Hotkey, ~%badadm%, Button23
        }
        if muteoskadm !=
        {
            Hotkey, ~%muteoskadm%, Button24
        }
		if obsujdenie !=
        {
            Hotkey, ~%obsujdenie%, Button25
        }
        if muterod !=
        {
            Hotkey, ~%muterod%, Button26
        }
        if neadekvat !=
        {
            Hotkey, ~%neadekvat%, Button27
        }
        if offtopo !=
        {
            Hotkey, ~%offtopo%, Button28
        }
		if oskplayer !=
        {
            Hotkey, ~%oskplayer%, Button29
        }
        if DB !=
        {
            Hotkey, ~%DB%, Button30
        }
        if TK !=
        {
            Hotkey, ~%TK%, Button31
        }
        if pomeha !=
        {
            Hotkey, ~%pomeha%, Button32
        }
		if kicknick !=
        {
            Hotkey, ~%kicknick%, Button33
        }
        if kickcapt !=
        {
            Hotkey, ~%kickcapt%, Button34
        }
        if kickcheat !=
        {
            Hotkey, ~%kickcheat%, Button35
        }
        if jailcheat !=
        {
            Hotkey, ~%jailcheat%, Button36
        }
		if bag !=
        {
            Hotkey, ~%bag%, Button37
        }
        if jailcapt !=
        {
            Hotkey, ~%jailcapt%, Button38
        }
        if bancheat !=
        {
            Hotkey, ~%bancheat%, Button39
        }
        if cbancheat !=
        {
            Hotkey, ~%cbancheat%, Button40
        }
		if banrod !=
        {
            Hotkey, ~%banrod%, Button41
        }
        if bannick !=
        {
            Hotkey, ~%bannick%, Button42
        }
        if banreklama !=
        {
            Hotkey, ~%banreklama%, Button43
        }
        if banadm !=
        {
            Hotkey, ~%banadm%, Button44
        }
		if banneadekvat !=
        {
            Hotkey, ~%banneadekvat%, Button45
        }
        if bduty !=
        {
            Hotkey, ~%bduty%, Button46
        }
        if banproekta !=
        {
            Hotkey, ~%banproekta%, Button47
		}
	return


Button1:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  15 Flood{LEFT 9}
    return
}
Button2:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  15 Caps Lock{LEFT 13}
    return
}
Button3:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  50 ��������{LEFT 12}
    return
}
Button4:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  ��������� �� ����������{LEFT 24}
    return
}
Button5:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  ������ ����� �������{LEFT 21}
    return
}
Button6:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  ������� �� ����� ������{LEFT 24}
    return
}
Button7:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  �������� ���� �� Monser Gang War <3{LEFT 36}
    return
}
Button8:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  ������ �� �������������� ����� ������ �� forum.monser.ru{LEFT 57}
    return
}
Button9:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  �����-����� ���������� �� monser.ru/buy{LEFT 40}
    return
}
Button10:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  /gw | /dm{LEFT 10}
    return
}
Button11:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  �� �������� � ������ �� Gang War{LEFT 33}
    return
}
Button12:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  �� ������ ������� ������ ������, ��� � �������� ������{LEFT 55}
    return
}
Button13:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/pm  ��������� ������ � VIP, �������� - /lc{LEFT 40}
    return
}
Button14:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  ������������ � ����� �� ������� �� /dm{LEFT 39}
    return
}
Button15:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/pm  /mm > 10 > 1 > 1{LEFT 17}
    return
}
Button16:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  120 ���������� ������. �����{LEFT 29}
    return
}
Button17:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  10 Offtop � /report{LEFT 20}
    return
}
Button18:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  20 ��� � /report{LEFT 17}
    return
}
Button19:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  120 �������{LEFT 12}
    return
}
Button20:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  60 �������{LEFT 11}
    return
}
Button21:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  180 ����������� �������{LEFT 24}
    return
}
Button22:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  120 �������� �������������{LEFT 27}
    return
}
Button23:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {F6}/mute  120 ���������� � �������������{LEFT 31}
    return
}
Button24:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  180 ����������� �������������{LEFT 30}
    return
}
Button25:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  150 ���������� �������� �������������{LEFT 38}
    return
}
Button26:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  180 ����������/����������� ������{LEFT 34}
    return
}
Button27:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  35 ������������ ���������{LEFT 26}
    return
}
Button28:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  50 Offtop � /o{LEFT 15}
    return
}
Button29:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/mute  30 ����������� �������{LEFT 23}
    return
}
Button30:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/kick  DriveBy{LEFT 8}
    return

}
Button31:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/kick  TeamKill{LEFT 9}
    return
}
Button32:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/kick  ������ �������/������{LEFT 22}
    return
}
Button33:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/skick  ����������� � ����{LEFT 19}
    return
}
Button34:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/kick  ������������ /capture{LEFT 22}
    return
}
Button35:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/kick  Cheat{LEFT 6}
    return
}
Button36:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/jail  60 Cheat{LEFT 9}
    return
}
Button37:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/jail  20 ������{LEFT 10}
    return
}
Button38:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/jail  10 ������������ /capture{LEFT 25}
    return
}
Button39:
{
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, {f6}/ban  30 Cheat{LEFT 9}
    return
}
Button40:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/cban  30 Cheat{LEFT 9}
    return
}
Button41:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/ban  30 ����������� ������{LEFT 22}
    return
}
Button42:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/ban  30 ����������� � ����{LEFT 22}
    return
}
Button43:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/cban  90 �������{LEFT 11}
    return
}
Button44:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/ban  30 ����������� �������������{LEFT 29}
    return
}
Button45:
{
    SendMessage, 0x50,, 0x4190419,, A
SendInput, {f6}/ban  2 ������������ ��������� � /v{LEFT 30}
    return
}

Button46:
{
    Sendchat("/Duty " Duty)
    return
}
Button47:
{
	SendMessage, 0x50,, 0x4190419,, A
	SendInput, {F6}/cban  90 ����������� �������{LEFT 23}
	return
}


SaveButton:
{
    Gui, Submit, NoHide
	IniWrite, %mnogosms%, %DIRSET%, Options, mnogosms
    IniWrite, %caps%, %DIRSET%, Options, caps
    IniWrite, %buy%, %DIRSET%, Options, buy
	IniWrite, %yesrecon%, %DIRSET%, Options, yesrecon
    IniWrite, %recon%, %DIRSET%, Options, recon
	IniWrite, %norecon%, %DIRSET%, Options, norecon
	IniWrite, %gg%, %DIRSET%, Options, gg
	IniWrite, %forum%, %DIRSET%, Options, forum
	IniWrite, %adm%, %DIRSET%, Options, adm
	IniWrite, %loka%, %DIRSET%, Options, loka
	IniWrite, %bron%, %DIRSET%, Options, bron
	IniWrite, %leader%, %DIRSET%, Options, leader
	IniWrite, %lc%, %DIRSET%, Options, lc
	IniWrite, %duel%, %DIRSET%, Options, duel
	IniWrite, %vip%, %DIRSET%, Options, vip
	IniWrite, %roz%, %DIRSET%, Options, roz
	IniWrite, %offtopreport%, %DIRSET%, Options, offtopreport
	IniWrite, %mat%, %DIRSET%, Options, mat
	IniWrite, %mutereklama%, %DIRSET%, Options, mutereklama
	IniWrite, %kleveta%, %DIRSET%, Options, kleveta
	IniWrite, %oskproekta%, %DIRSET%, Options, oskproekta
	IniWrite, %troll%, %DIRSET%, Options, troll
	IniWrite, %badadm%, %DIRSET%, Options, badadm
	IniWrite, %muteoskadm%, %DIRSET%, Options, muteoskadm
	IniWrite, %obsujdenie%, %DIRSET%, Options, obsujdenie
	IniWrite, %muterod%, %DIRSET%, Options, muterod
	IniWrite, %neadekvat%, %DIRSET%, Options, neadekvat
	IniWrite, %offtopo%, %DIRSET%, Options, offtopo
	IniWrite, %oskplayer%, %DIRSET%, Options, oskplayer
	IniWrite, %DB%, %DIRSET%, Options, DB
	IniWrite, %TK%, %DIRSET%, Options, TK
	IniWrite, %pomeha%, %DIRSET%, Options, pomeha
	IniWrite, %kicknick%, %DIRSET%, Options, kicknick
	IniWrite, %kickcapt%, %DIRSET%, Options, kickcapt
	IniWrite, %kickcheat%, %DIRSET%, Options, kickcheat
	IniWrite, %jailcheat%, %DIRSET%, Options, jailcheat
	IniWrite, %bag%, %DIRSET%, Options, bag
	IniWrite, %jailcapt%, %DIRSET%, Options, jailcapt
	IniWrite, %bancheat%, %DIRSET%, Options, bancheat
	IniWrite, %cbancheat%, %DIRSET%, Options, cbancheat
	IniWrite, %bannick%, %DIRSET%, Options, bannick
	IniWrite, %banreklama%, %DIRSET%, Options, banreklama
	IniWrite, %banrod%, %DIRSET%, Options, banrod
	IniWrite, %banproekta%, %DIRSET%, Options, banproekta
	IniWrite, %banadm%, %DIRSET%, Options, banadm
	IniWrite, %banneadekvat%, %DIRSET%, Options, banneadekvat
	IniWrite, %bduty%, %DIRSET%, Options, bduty
    IniWrite, %Duty%, %DIRSET%, Options, Duty
    IniWrite, %aduty%, %DIRSET%, Options, aduty
	IniWrite, %conoff%, %DIRSET%, Options, conoff
	IniWrite, %timemute%, %DIRSET%, Options, timemute
    Gosub, ReadSettings
    MsgBox, 64, AutoHotKey MGW, ���������!
    return
}
$~Enter::
sleep, 30
if (isInChat() = 0)
return
;~ gosub, checkdialogmenu
sleep 150
dwAddress := dwSAMP + 0x12D8F8
chatInput := readString(hGTA, dwAddress, 512)
writeString(hGTA, dwAddress, "")
if (chatinput="/byinfo") || if (chatinput="/byinfo ")
{
    showdialog("0", "{FFD700}���� ��� /by", "{FFD700}Cheat {FFFFFF}- ��� �� ����`n{FFD700}Rod {FFFFFF}- ��� �� ���. ������`n{FFD700}PR {FFFFFF}- ��� �� �������`n{FFD700}Adm {FFFFFF}- ��� �� ���. �������������`n{FFD700}Nick {FFFFFF}- ��� �� �������", "�������")
    return
}
If (Chatinput="/by") || If (Chatinput="/by ")
{
    addchatmessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}�����������:{FFD700} /by [ID ������] [���] [�������/��� ��������������]")
    return
}
if chatinput contains /by
{
    if (RegExMatch(Chatinput, "/by (.*) (.*) (.*)", bby))
    {
        if bby2 = cheat
        {
            sendchat("/cban " bby1 " 30 Cheat � " bby3)
            return
        }
        if bby2 = rod
        {
            sendchat("/ban " bby1 " 30 ����������� ������ � " bby3)
            return
        }
        if bby2 = pr
        {
            sendchat("/cban " bby1 " 30 ������� � " bby3)
            return
        }
        if bby2= adm
        {
            sendchat("/ban " bby1 " 30 ����������� ������������� � " bby3)
            return
        }
        if bby2= nick
        {
            sendchat("/ban " bby1 " 30 Nickname � " bby3)
            return
        }
        else
        {
            addchatmessageEx("FFFFFF", "{FFD700}[A] {FFFFFF}�����������:{FFD700} /by [ID ������] [���] [�������� ��������������]")
            return
        }
    }
    return
}
if (chatInput="/ah") || if (chatInput="/ah ")
{
showDialog("0","{FFD700}������ ������", "{FFD700}/ah {FFFFFF}- �������� ������ ������`n{FFD700}/tabl {FFFFFF}- ������� �����������`n{FFD700}/by {FFFFFF}- ��� �� ����� ������� ��������������", "�������")
    return
}
if (chatInput="/tabl") || if (chatInput="/tabl ")
{
   showDialog("1", "{FFD700}������� ���������", "{32CD32}������ ����`n{FFFFFF}��`n��`n��`n������ �������/������`n����������� � ����`n{32CD32}������ ����`n{FFFFFF}���� - 5-20 �����`n���� - 5-20 �����`n������ -60-180 �����`n������� ������ ������� - 60-180 �����`n�������� - 40-60 �����`n������ � ������ - 10-20 �����`n����� ������������� - 30-60 �����`n������� - 40-60 �����`n����������� ������� - 180 �����`n����������� ������� - 10-30 �����`n�������� ������������� - 60-120 �����`n���������� � ������������� - 60-120 �����`n����������� ������������� - 180 �����`n���������� �������� ������������� - 120-180 �����`n������� �� �������������� - 60-120 �����`n���������� ������ - 180 �����`n������������ ��������� (����, ����, ���) 30 - 40 �����`n������ � /o (��������, �����, �������, ������� ���������) 40-60 �����`n{32CD32}������ ���`n{FFFFFF}���� - 40-60 �����`n������ - 10-20 �����`n���� ������ - 5-10 �����`n{32CD32}������ ���������� ��������`n{FFFFFF}����������� � ���� - 20-30 ���� (�������� {FF0000}/ban{FFFFFF})`n����� ������������� - 5-10 ���� (�������� {FF0000}/ban{FFFFFF})`n������������ ��������� - 2-5 ��e� (������ �� ���� � /v) (�������� {FF0000}/ban{FFFFFF})`n������� ������ ������� - ��� �� 90 ���� (�������� {FF0000}/cban{FFFFFF})`n����������� ������������� - 30 ���� (�������� {FF0000}/ban{FFFFFF})`n����������� ������ - 30 ���� (�������� {FF0000}/ban{FFFFFF})`n����������� ������� - ��� �� 90 ���� (�������� {FF0000}/cban{FFFFFF})`n���� - ��� �� 30 ���� (C 3-�� ������ �������� {FF0000}/ban{FFFFFF},  � 4-�� ������ �������� {FF0000}/cban{FFFFFF})`n{32CD32}������ ���������� IP ������`n{FFFFFF}������������� ����������� � ���� - 10 ����`n������������� ����������� ������ - 10 ����`n������������� ����������� ������������� - 10 ����`n����������� ������� - 90 ����", "�������")
   return
}


Login:
{
    GetChatLine(0, alogin)
    IfInString, alogin, ��� ���������� ������� � ���������� /ia ���������� ��������� �� ��������� (/duty)
    {
        If aduty = 1
        {
            Sendchat("/duty " Duty)
        }
        If conoff = 1
        {
            Sendchat("/conoff")
        }
    }
    return
}

; ~ESC::
;~F6::
;menu:=0
;return

;~ checkdialogMenu:
;~ if (isDialogButtonSelected() == 1)
;~ {
;~    menu := 0
;~ }
;~ ifWinNotActive, GTA:SA:MP
;~ {
;~    return
;~ }
CMDList1:
{
    Gui, 13:Destroy
    Gui, 3:Color, FFFFFF
    Gui, 3:Add, Text, x6 y6 w470 h230 , /ah - �������� ������ ������`n/tabl - ������� ���������`n/by - ������ ��������� �� ������� ��������������`n/byinfo - ���� ��� /by
    Gui, 3:Add, Button, x188 y246 w100 h20 g3GuiClose, �������
    Gui, 3:Show, x325 y262 h275 w478, Command List
    Return
}





13GuiClose:
Gui, 13:Destroy
return

12GuiClose:
Gui, 12:Destroy
return

11GuiClose:
Gui, 11:Destroy
return

10GuiClose:
Gui, 10:Destroy
Return

9GuiClose:
Gui, 9:Destroy
return

8GuiClose:
Gui, 8:Destroy
return

7GuiClose:
Gui, 7:Destroy
return

6GuiClose:
Gui, 6:Destroy
return

5GuiClose:
Gui, 5:Destroy
return

4GuiClose:
Gui, 4:Destroy
return

3GuiClose:
Gui, 3:Destroy
return

2GuiClose:
Gui, 2:Destroy
return

GuiClose:
ExitApp
return