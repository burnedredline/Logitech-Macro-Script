;【游戏心得】
;【暗影三刀卡药水】带吸血被动和杀回药水，换地图或死亡后先吃药水，再开翅膀，就卡上了

#SingleInstance force
#Persistent
#NoEnv

GroupAdd, MyGame, ahk_exe Diablo III.exe
GroupAdd, MyGame, ahk_exe Diablo III64.exe
#IfWinActive, ahk_group MyGame
	Macro_ID := 0
	Macro_Sleep := 100
	Macro_Running := 0

	$1:: ;巫医 - 刀鸡套
	{
		If Macro_ID = 0
		{
			SetCapsLockState, AlwaysOn
			SetTimer, LBClick, 25
			Macro_ID := 1
		}
		Else If Macro_ID = 1
		{
			SetTimer, LBClick, Off
			SetCapsLockState, AlwaysOff
			Macro_ID := 0
		}
	}
	Return

	$2:: ;恶魔猎手 - 不洁多重
	{
		If Macro_ID = 0
		{
			SetCapsLockState, AlwaysOn
			Gosub, Vengeance
			SetTimer, Companion, 1000
			SetTimer, Vengeance, 500
			Macro_ID := 2
		}
		Else If Macro_ID = 2
		{
			SetTimer, Vengeance, Off
			SetTimer, Companion, Off
			SetCapsLockState, AlwaysOff
			Macro_ID := 0
		}
	}
	Return

	$3:: ;野蛮人 - 冲锋抛石
	{
		If Macro_ID = 0
		{
			SetCapsLockState, AlwaysOn
			Gosub, Call_of_the_Ancients
			Gosub, Wrath_of_the_Berserker
			SetTimer, Battle_Rage, 60000
			SetTimer, Wrath_of_the_Berserker, 500
			Macro_ID := 3
		}
		Else If Macro_ID = 3
		{
			SetTimer, Battle_Rage, off
			SetTimer, Wrath_of_the_Berserker, off
			SetCapsLockState, AlwaysOff
			Macro_ID := 0
		}
	}
	Return

	$4:: ;武僧 - 千飓拳法
	{
		If Macro_ID = 0
		{
			Macro_ID := 4
			SetCapsLockState, AlwaysOn
		}
		Else If Macro_ID = 4
		{
			SendInput {D Up}
			SetTimer, Dashing_Strike, Off
			SetTimer, Cyclone_Strike, Off
			SetTimer, Breath_of_Heaven, Off
			SetCapsLockState, AlwaysOff
			Macro_Running := 0
			Macro_ID := 0
		}
	}
	Return

	$5:: ;恶魔猎手 - 暗影三刀
	{
		If Macro_ID = 0
		{
			SetCapsLockState, AlwaysOn
			Gosub, Shadow_Power
			Gosub, Vengeance
			Gosub, Fan_of_Knives
			SetTimer, Shadow_Power, 7500
			SetTimer, Companion, 1000
			SetTimer, Vengeance, 500
			SetTimer, Fan_of_Knives, 500
			Macro_ID := 5
		}
		Else If Macro_ID = 5
		{
			SetTimer, Fan_of_Knives, Off
			SetTimer, Vengeance, Off
			SetTimer, Companion, Off
			SetTimer, Shadow_Power, Off
			SetCapsLockState, AlwaysOff
			Macro_ID := 0
		}
	}
	Return

	~A::
	{
		If (Macro_ID = 4) and Macro_Running ;武僧 - 千飓拳法
		{
			SetTimer, Dashing_Strike, Off
			SetTimer, Dashing_Strike, On
		}
		Else If (Macro_ID = 5) ;恶魔猎手 - 暗影三刀
		{
			SetTimer, Shadow_Power, Off
			SetTimer, Shadow_Power, On
		}
	}
	Return

	~S::
	{
		If (Macro_ID = 4) and Macro_Running ;武僧 - 千飓拳法
		{
			SetTimer, Cyclone_Strike, Off
			SetTimer, Cyclone_Strike, On
		}
		Else If (Macro_ID = 5) ;恶魔猎手 - 暗影三刀
		{
			SetTimer, Shadow_Power, Off
			SetTimer, Shadow_Power, On
		}
	}
	Return

	$D::
	{
		If Macro_ID = 2 ;恶魔猎手 - 不洁多重
		{
			SendInput {D Down} ;Gosub, Multishot
			Evasive_Fire_Time := 0
			Gosub, Evasive_Fire
			While GetKeyState("D", "P")
			{
				Evasive_Fire_Time := Evasive_Fire_Time + Macro_Sleep
				If Evasive_Fire_Time = 2000
				{
					Gosub, Evasive_Fire
					Evasive_Fire_Time := 0
				}
				Sleep Macro_Sleep
			}
			SendInput {D Up}
			Evasive_Fire_Time := 0
		}
		Else If Macro_ID = 4 ;武僧 - 千飓拳法
		{
			Macro_Running := !Macro_Running
			If Macro_Running
			{
				Gosub, Dashing_Strike
				SendInput {D Down}
				SetTimer, Dashing_Strike, 5500
				SetTimer, Cyclone_Strike, 4500
				SetTimer, Breath_of_Heaven, 500
			}
			Else
			{
				SendInput {D Up}
				SetTimer, Dashing_Strike, Off
				SetTimer, Cyclone_Strike, Off
				SetTimer, Breath_of_Heaven, Off
			}
		}
		Else If Macro_ID = 5 ;恶魔猎手 - 暗影三刀
		{
			While GetKeyState("D", "P")
			{
				SendInput {D}
				Sleep Macro_Sleep
			}
		}
		Else
		{
			SendInput {D}
		}
	}
	Return

	~LButton::
	{
		If Macro_ID = 1
		{
			SendInput {A}
		}
	}
	Return

	$RButton::
	{
		If Macro_ID = 1
		{
			SendInput {D}
			Sleep, 500
			SendInput {RButton}
			Sleep, 500
			SendInput {D}
			Sleep, 500
			SendInput {S}
		}
		Else
		{
			SendInput {RButton}
		}
	}
	Return

	~Space::
	{
		If (Macro_ID = 4) and Macro_Running
		{
			SendInput {D Up}
			SetTimer, Dashing_Strike, Off
			SetTimer, Cyclone_Strike, Off
			SetTimer, Breath_of_Heaven, Off
			Macro_Running := 0
		}
	}
	Return

	~W::
	{
		If (Macro_ID = 4) and Macro_Running
		{
			SendInput {D Up}
			SetTimer, Dashing_Strike, Off
			SetTimer, Cyclone_Strike, Off
			SetTimer, Breath_of_Heaven, Off
			Macro_Running := 0
		}
	}
	Return

	;通用

	LBClick: ;鼠标左键
		SendInput {LButton}
	Return

	;恶魔猎手

	Companion: ;恶魔猎手 - 战宠
		SendInput +{LButton}
	Return

	Evasive_Fire: ;恶魔猎手 - 回避射击
		SendInput {S}
	Return

	Multishot: ;恶魔猎手 - 多重射击 & 暗影飞刀
		SendInput {D}
	Return

	Vengeance: ;恶魔猎手 - 复仇
		SendInput {F}
	Return

	Fan_of_Knives: ;恶魔猎手 - 刀扇
		SendInput {RButton}
	Return

	Shadow_Power: ;恶魔猎手 - 暗影之力
		SendInput {S}
	Return

	;野蛮人

	WarCry: ;野蛮人 - 战吼
		SendInput {A}
	Return

	Battle_Rage: ;野蛮人 - 战斗怒火
		SendInput {S}
	Return

	Furious_Charge: ;野蛮人 - 狂暴冲撞
		SendInput {D}
	Return

	Wrath_of_the_Berserker: ;野蛮人 - 狂暴者之怒
		SendInput {F}
	Return

	Ancient_Spear: ;野蛮人 - 上古之矛
		SendInput +{LButton}
	Return

	Call_of_the_Ancients: ;野蛮人 - 先祖召唤
		SendInput {RButton}
	Return

	;武僧

	Dashing_Strike: ;武僧 - 疾风击
		SendInput {A}
	Return

	Cyclone_Strike: ;武僧 - 飓风破
		SendInput {S}
	Return

	Crippling_Wave: ;武僧 - 断筋诀
		SendInput {D}
	Return

	Breath_of_Heaven: ;武僧 - 回天息
		SendInput +{LButton}
	Return

	Epiphany: ;武僧 - 灵光悟
		SendInput {RButton}
	Return

#IfWinActive
