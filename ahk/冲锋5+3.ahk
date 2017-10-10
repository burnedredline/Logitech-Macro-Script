#SingleInstance force
#Persistent
#NoEnv

#IfWinActive, ahk_exe Diablo III.exe
	Macro_Enable = 0

	$Q::
	{
		Macro_Enable := !Macro_Enable
		If Macro_Enable
		{
			SetCapsLockState, AlwaysOn
			SendInput {RButton} {S} {F} +{LButton}
			SetTimer, WarCry, 1000
			SetTimer, Battle_Rage, 30000
			SetTimer, Wrath_of_the_Berserker, 500
		}
		Else
		{
			SetTimer, WarCry, off
			SetTimer, Battle_Rage, off
			SetTimer, Wrath_of_the_Berserker, off
			SetCapsLockState, AlwaysOff
		}
	}
	Return

	Ancient_Spear:
	{
		SendInput {A}
	}
	Return

	WarCry:
	{
		SendInput {S}
	}
	Return

	Furious_Charge:
	{
		SendInput {D}
	}
	Return

	Wrath_of_the_Berserker:
	{
		SendInput {F}
	}
	Return

	Battle_Rage:
	{
		SendInput +{LButton}
	}
	Return

	Call_of_the_Ancients:
	{
		SendInput {RButton}
	}
	Return

#IfWinActive
