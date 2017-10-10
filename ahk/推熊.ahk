#SingleInstance force
#Persistent
#NoEnv

#IfWinActive, ahk_exe Diablo III.exe
	Macro_Cancel = 1

	$D::
	{
		If Macro_Cancel
		{
			Macro_Cancel = 0
			SendInput {F}
			Sleep, 200
			SendInput {D}
			SendInput {LShift Down}
	        SendInput {LButton Down}
			SetTimer, Wall_of_Death, 200
			SetTimer, Corpse_Spiders, 4000
		}
	}
	Return

	~Space::
	{
		if !Macro_Cancel
		{
			Macro_Cancel = 1
			SendInput {LButton Up}
			SendInput {LShift Up}
			SetTimer, Corpse_Spiders, off
			SetTimer, Wall_of_Death, off
		}
	}
	Return

	Wall_of_Death:
	{
		SendInput {D}
	}
	Return

	Corpse_Spiders:
	{
		SendInput {LButton Up}
		Sleep, 400
		SendInput {F}
		SendInput {LButton Down}
	}
	Return

	Zombie_Charger:
	{
		SendInput +{LButton}
	}
	Return

#IfWinActive
