--技能按键设置：
----鼠标右键->旋风斩

Barbarian_Macro_LoopInterval = 10

function OnEvent(event, arg, family)
    --if (event == "G_RELEASED" and arg == 4) then --4为罗技键盘G4键
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 5) then --3为罗技鼠标中键，5为侧键前进，4为侧键返回
        Barbarian_Macro_FullyAuto()
    end
end

function Barbarian_Macro_FullyAuto()
    if (IsKeyLockOn("capslock")) then
        PressMouseButton(3)
        Alt_Pressed = true
    end

    while (IsKeyLockOn("capslock")) do               
        Sleep(Barbarian_Macro_LoopInterval)
               
        --按住lalt键中断旋风斩
        if (IsModifierPressed("lalt")) then 
            if not (Alt_Pressed) then
                ReleaseMouseButton(3)
                Alt_Pressed = true
            end
        else
            if (Alt_Pressed) then
                PressMouseButton(3)
                Alt_Pressed = false
            elseif not (IsMouseButtonPressed(3)) then
                ReleaseMouseButton(3)
                PressMouseButton(3)
            end
        end
    end
        
    ReleaseMouseButton(3)
end