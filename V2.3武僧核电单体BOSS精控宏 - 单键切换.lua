--Macro1为疾风击BUFF宏（*--）
--Macro2为疾风击+翔龙BUFF宏（*-*）
--Macro3为疾风击+先发制人BUFF宏（**-）
--Macro4为疾风击+先发制人+翔龙BUFF宏（***）
--Macro_Other为小怪宏（---）
Macro1 = "X1"; --修改为自己宏的名称
Macro2 = "X2"; --修改为自己宏的名称
Macro3 = "X3"; --修改为自己宏的名称
Macro4 = "X4"; --修改为自己宏的名称
Macro_Other = "XXX"; --修改为自己宏的名称

CurrentMacro = ""; --正在执行的宏
CurrentMacroGroup = ""; --正在执行的宏的组
CurrentTime = 0;
EndMacroDelay = 1500; --按住前进键1.5秒停止宏，可自行修改

StartMacro_Key_AB = 5; --切换A组宏的按键
StartMacro_Key_Other = 4; --切换小怪宏的按键
--罗技鼠标的宏启动的按键代码为1左键、2右键、3中键、4返回键、5前进键、6789自己试吧

function OnEvent(event, arg, family)
    --返回键释放时，切换小怪宏
    if (event == "MOUSE_BUTTON_RELEASED" and arg == StartMacro_Key_Other) then
        RestartMacro(Macro_Other);
    end

    --前进键按下时
    if (event == "MOUSE_BUTTON_PRESSED" and arg == StartMacro_Key_AB) then
        CurrentTime = GetRunningTime(); --记录时间
    end
	
    --前进键释放时，切换A组宏
    if (event == "MOUSE_BUTTON_RELEASED" and arg == StartMacro_Key_AB) then
        --如果前进键按住超过1.5秒则停止宏
        if((GetRunningTime() - CurrentTime) >= EndMacroDelay) then
            AbortMacro();
            CurrentMacro = "";
            return;
        else
            CurrentTime = 0;
        end
		
        if (IsModifierPressed("ctrl")) then
            if (CurrentMacroGroup == "B") then 
                RestartMacro(Macro3);
            else
                RestartMacro(Macro1);
            end
        else
            if (CurrentMacroGroup == "B") then
                if (CurrentMacro == Macro1) then
                    RestartMacro(Macro2);
                else
                    RestartMacro(Macro1);
                end
            else
                if (CurrentMacro == Macro3) then
                    RestartMacro(Macro4);
                else
                    RestartMacro(Macro3);
                end
            end
        end
    end
end

--三灯全灭（初始化）
function ClearKeyLockOn()
    if (IsKeyLockOn("numlock")) then --如果numlock灯亮着，按灭它
        PressAndReleaseKey("numlock");
    end
    if (IsKeyLockOn("capslock")) then
        PressAndReleaseKey("capslock");
    end
    if (IsKeyLockOn("scrolllock")) then
        PressAndReleaseKey("scrolllock");
    end
end

--开灯标识正在执行的宏
function ChangeKeyLockOn(MacroName)
    ClearKeyLockOn();
    if(MacroName == "X1") then 
        PressAndReleaseKey("numlock");
        CurrentMacroGroup = "B";
    elseif (MacroName == "X3") then
        PressAndReleaseKey("numlock","capslock");
        CurrentMacroGroup = "A";
    elseif (MacroName == "X2") then
        PressAndReleaseKey("numlock","scrolllock");
        CurrentMacroGroup = "B";
    elseif (MacroName == "X4") then
        PressAndReleaseKey("numlock","capslock","scrolllock");
        CurrentMacroGroup = "A";
    end
end

--重启一个宏
function RestartMacro(MacroName)
    ChangeKeyLockOn(MacroName); --开灯标识正在执行的宏
    AbortMacro(); --停止宏
    PlayMacro(MacroName); --启动宏
    CurrentMacro = MacroName; --记录当前运行的宏
end
