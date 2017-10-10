--技能按键设置：
----鼠标左键->战斗怒火
----鼠标右键->旋风斩
----A键->战吼
----S键->无视痛苦
----D键->威吓呐喊(默认手动施放)
----F键->狂暴者之怒

Barbarian_Macro_LoopInterval = 10 --脚本循环间隔（毫秒）

function OnEvent(event, arg, family)
    --if (event == "G_RELEASED" and arg == 4) then --4为罗技键盘G4键
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 5) then --3为罗技鼠标中键，5为侧键前进，4为侧键返回
        Barbarian_Macro_FullyAuto()
    end
end

function Barbarian_Macro_FullyAuto()
    if (IsKeyLockOn("capslock")) then
        --按下并释放A键（战吼）、S键（无视苦痛）、F键（狂暴者之怒）
        --PressAndReleaseKey("a", "f", "s", "d")
        PressAndReleaseKey("a", "f", "s")
        --Shift键（右）+鼠标左键（战斗怒火）
        PressKey("rshift")
        PressAndReleaseMouseButton(1)
        Sleep(10)
        ReleaseKey("rshift")

        --按住鼠标右键（启动右键旋风斩）
        PressMouseButton(3)
        Alt_Pressed = false

        Times_Key_A = 0
        Times_Key_S = 0
        --Times_Key_D = 0
        Times_Key_F = 0
        Times_Button_LeftMouse = 0
    end

    --如果CapsLock键已按下则启动循环，否则退出循环
    while (IsKeyLockOn("capslock")) do
        Sleep(Barbarian_Macro_LoopInterval) --循环间隔

        Times_Key_A = Times_Key_A + 1
        Times_Key_S = Times_Key_S + 1
        --Times_Key_D = Times_Key_D + 1
        Times_Key_F = Times_Key_F + 1
        Times_Button_LeftMouse = Times_Button_LeftMouse + 1

        --每0.5秒按下并释放F键（狂暴者之怒）
        if ((Times_Key_F*Barbarian_Macro_LoopInterval) == 500) then
            PressAndReleaseKey("f")
            Times_Key_F = 0
        end

        --每5秒按下并释放S键（无视苦痛）
        if ((Times_Key_S*Barbarian_Macro_LoopInterval) == 5000) then
            PressAndReleaseKey("s")
            Times_Key_S = 0
        end

        --if ((Times_Key_D*Barbarian_Macro_LoopInterval) == 5000) then
            --PressAndReleaseKey("d")
            --Times_Key_D = 0
        --end

        --每55秒按下并释放A键（战吼）
        if ((Times_Key_A*Barbarian_Macro_LoopInterval) == 55000) then
            PressAndReleaseKey("a")
            Times_Key_A = 0
        end

        --每100秒按下并释放鼠标左键（战斗怒火）
        if ((Times_Button_LeftMouse*Barbarian_Macro_LoopInterval) == 100000) then
            PressKey("rshift")
            PressAndReleaseMouseButton(1)
            Sleep(10)
            ReleaseKey("rshift")
            Times_Button_LeftMouse = 0
        end

        --按住lalt键中断旋风斩（捡东西）
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
