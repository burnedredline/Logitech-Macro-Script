#SingleInstance force
#Persistent
#NoEnv

GroupAdd, MyGame, ahk_exe deadspace2.exe
GroupAdd, MyGame, ahk_exe TombRaider.exe
GroupAdd, MyGame, ahk_exe ROTTR.exe
;GroupAdd, MyGame, ahk_exe deadspace3.exe
Return

#IfWinActive, ahk_group MyGame
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
