--脚本按键设置：
----鼠标左键->旋风斩

Barbarian_Macro_LoopInterval = 10
EnablePrimaryMouseButtonEvents(true)

function OnEvent(event, arg, family)
    --if (event == "G_RELEASED" and arg == 4) then --4为罗技键盘G4键
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 3) then --3为罗技鼠标中键，5为侧键前进，4为侧键返回
        Barbarian_Macro_FullyAuto()
    end
end

function Barbarian_Macro_FullyAuto()
    if (IsKeyLockOn("capslock")) then
        PressKey("rshift")
        PressMouseButton(1)
    end
	
    while (IsKeyLockOn("capslock")) do               
        Sleep(Barbarian_Macro_LoopInterval) --循环间隔
		
        if (IsModifierPressed("lalt")) then --按住lalt键中断旋风斩
            ReleaseMouseButton(1)
            ReleaseKey("rshift")
        else
            if not (IsMouseButtonPressed(1)) then
                ReleaseMouseButton(1)
                PressKey("rshift")
                PressMouseButton(1)
            else
                if (IsModifierPressed("lctrl")) then --按住lctrl键开门或吃祭坛
                    ReleaseKey("rshift")
                else
                    if not (IsModifierPressed("rshift")) then
                        PressKey("rshift")
                    end
                end
            end
        end
    end
        
    ReleaseMouseButton(1)
    ReleaseKey("rshift")
end