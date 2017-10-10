#SingleInstance force
#Persistent
#NoEnv

#IfWinActive, ahk_exe Diablo III.exe
	Macro_Enable=0
	Timer_Sprint = 0
	
	$Q::
	{
		Macro_Enable := !Macro_Enable
		If Macro_Enable
		{
			SetCapsLockState, AlwaysOn
			SendInput {F}
			SendInput +{LButton}
			SetTimer, Sprint, 4000
			SetTimer, Battle_Rage, 100000
			SetTimer, Wrath_of_the_Berserker, 500
			Timer_Sprint = 1
		} 
		Else 
		{
			SetTimer, Sprint, Off
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
			If Macro_Enable and Timer_Sprint
			{
				SendInput {SHIFT down}
				SendInput {D down}
				SetTimer, Sprint, Off
				Timer_Sprint = 0
			}
		}
		If Macro_Enable and !Timer_Sprint
		{
			SendInput {SHIFT up}
			SendInput {D up}
			SetTimer, Sprint, 4000
			Timer_Sprint = 1
		}
	}
	Return

	Sprint:
	{
		SendInput {S}
	}
	Return

	Battle_Rage:
	{
		SendInput {RButton}
	}
	Return

	Wrath_of_the_Berserker:
	{
		SendInput {F}
	}
	Return
#IfWinActive