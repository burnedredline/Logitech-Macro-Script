#SingleInstance force
#Persistent
#NoEnv

#IfWinActive, ahk_exe deadspace2.exe
	Pressed = 0

	$RButton::
	{
		If Pressed = 0
		{
			SendInput {0 down}
			Pressed = 1
		}
		Else
		{
			SendInput {0 up}
			Pressed = 0
		}
	}
	Return

#IfWinActive
