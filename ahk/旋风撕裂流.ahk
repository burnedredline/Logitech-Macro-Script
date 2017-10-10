#SingleInstance force
#Persistent
#NoEnv

#IfWinActive, ahk_exe Diablo III.exe
	Macro_Enable=0
	Alt_Pressed = 0
	
	$Q::
	{
		Macro_Enable := !Macro_Enable
		If Macro_Enable
		{
			SetCapsLockState, AlwaysOn
			SendInput {A}
			SendInput {F}
			SendInput {S}
			SendInput +{LButton}
			SendInput {RButton down}
			SetTimer, WarCry, 55000
			SetTimer, Battle_Rage, 100000
			SetTimer, Wrath_of_the_Berserker, 500
		} 
		Else 
		{
			SendInput {RButton up}
			SetTimer, WarCry, Off
			SetTimer, Battle_Rage, Off
			SetTimer, Wrath_of_the_Berserker, Off
			SetCapsLockState, AlwaysOff
		}
	}
	Return
	
	~Alt::
	{
		While GetKeyState("Alt", "P")
		{
			If Macro_Enable and !Alt_Pressed
			{
				SendInput {RButton up}
				Alt_Pressed = 1
			}
		}
		If Macro_Enable and Alt_Pressed
		{
			SendInput {RButton down}
			Alt_Pressed = 0
		}
	}
	Return

	WarCry:
	{
		SendInput {A}
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