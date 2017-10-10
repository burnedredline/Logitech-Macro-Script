#SingleInstance force
#Persistent
#NoEnv

#IfWinActive, ahk_exe Diablo III.exe
	Macro_Enable=0
	Timer_Battle_Rage = 0
	
	$Q::
	{
		Macro_Enable := !Macro_Enable
		If Macro_Enable
		{
			SetCapsLockState, AlwaysOn
			SendInput {RButton}
			SendInput {F}
			SendInput {S}
			SendInput +{LButton}
			SetTimer, WarCry, 55000
			SetTimer, Battle_Rage, 2000
			SetTimer, Wrath_of_the_Berserker, 500
			Timer_Battle_Rage = 1
		} 
		Else 
		{
			SetTimer, WarCry, Off
			SetTimer, Battle_Rage, Off
			SetTimer, Wrath_of_the_Berserker, Off
			SetCapsLockState, AlwaysOff
		}
	}
	Return
	
	$D::
	{
		While GetKeyState("D", "P")
		{
			If Macro_Enable and Timer_Battle_Rage
			{
				SendInput {SHIFT down}
				SendInput {D down}
				SetTimer, Battle_Rage, Off
				Timer_Battle_Rage = 0
			}
			sleep 10
		}
		If Macro_Enable and !Timer_Battle_Rage
		{
			SendInput {SHIFT up}
			SendInput {D up}
			SetTimer, Battle_Rage, 2000
			Timer_Battle_Rage = 1
		}
	}
	Return

	WarCry:
	{
		SendInput {RButton}
	}
	Return

	Battle_Rage:
	{
		SendInput {S}
	}
	Return

	Wrath_of_the_Berserker:
	{
		SendInput {F}
	}
	Return
#IfWinActive