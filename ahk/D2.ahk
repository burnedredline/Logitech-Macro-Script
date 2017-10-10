#SingleInstance force
#Persistent
#NoEnv

#IfWinActive, Diablo II
	Macro_Sleep := 50

	$Space::
	{
		; While GetKeyState("Space", "P")
		; {
		; 	if !GetKeyState("Alt", "P")
		; 	{
		; 		SendInput {Alt Down}
		; 	}
		; 	SendInput {LButton}
		; 	Sleep Macro_Sleep
		; }
		; SendInput {Alt Up}
		While GetKeyState("Space", "P")
		{
			SendInput {LButton}
			Sleep Macro_Sleep
		}
	}
	Return

	$W::
	{
		While GetKeyState("W", "P")
		{
			SendInput {LButton}
			Sleep Macro_Sleep
		}
	}
	Return

	~A::
	{
		Sleep Macro_Sleep
		SendInput {RButton}
	}
	Return

	~S::
	{
		Sleep Macro_Sleep
		SendInput {RButton}
	}
	Return

	~D::
	{
		Sleep Macro_Sleep
		SendInput {RButton}
	}
	Return

	~F::
	{
		Sleep Macro_Sleep
		SendInput {RButton}
	}
	Return

	~G::
	{
		Sleep Macro_Sleep
		SendInput {RButton}
	}
	Return

	~H::
	{
		Sleep Macro_Sleep
		SendInput {RButton}
	}
	Return

	~Z::
	{
		Sleep Macro_Sleep
		SendInput {RButton}
	}
	Return

	~X::
	{
		Sleep Macro_Sleep
		SendInput {RButton}
	}
	Return

	$F1::
	{
		SendInput {Shift Down}
		Sleep 10
		SendInput {1}
		Sleep 10
		SendInput {Shift Up}
	}
	Return

	$F2::
	{
		SendInput {Shift Down}
		Sleep 10
		SendInput {2}
		Sleep 10
		SendInput {Shift Up}
	}
	Return

	$F3::
	{
		SendInput {Shift Down}
		Sleep 10
		SendInput {2}
		Sleep 10
		SendInput {Shift Up}
	}
	Return

#IfWinActive
