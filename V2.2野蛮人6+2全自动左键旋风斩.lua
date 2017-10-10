--脚本按键设置：
----鼠标左键->旋风斩
----鼠标右键->战斗怒火
----A键->战吼
----S键->无视痛苦
----D键可选（威吓呐喊、压制）
----F键->狂暴者之怒

Barbarian_Macro_LoopInterval = 10 --脚本循环间隔（毫秒）
EnablePrimaryMouseButtonEvents(true)

function OnEvent(event, arg, family)
    --if (event == "G_RELEASED" and arg == 4) then --4为罗技键盘G4键
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 3) then --3为罗技鼠标中键，5为侧键前进，4为侧键返回
        Barbarian_Macro_FullyAuto()
    end
end

function Barbarian_Macro_FullyAuto()
    if (IsKeyLockOn("capslock")) then
        --按下并释放A键（战吼）、S键（无视苦痛）、F键（狂暴者之怒）
        PressAndReleaseKey("a", "f", "s")
        --按下并释放鼠标右键（战斗怒火）
        PressAndReleaseMouseButton(3)
        Sleep(10)

        --Shift键（右）+鼠标左键（启动左键旋风斩）
        PressKey("rshift")
        PressMouseButton(1)

        Times_Key_A = 0
        Times_Key_S = 0
        Times_Key_F = 0
        Times_Button_RightMouse = 0
    end

    --如果CapsLock键已按下则启动循环，否则退出循环
    while (IsKeyLockOn("capslock")) do
        Sleep(Barbarian_Macro_LoopInterval) --循环间隔

        Times_Key_A = Times_Key_A + 1
        Times_Key_S = Times_Key_S + 1
        Times_Key_F = Times_Key_F + 1
        Times_Button_RightMouse = Times_Button_RightMouse + 1

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

        --每55秒按下并释放A键（战吼）
        if ((Times_Key_A*Barbarian_Macro_LoopInterval) == 55000) then
            PressAndReleaseKey("a")
            Times_Key_A = 0
        end

        --每100秒按下并释放鼠标右键（战斗怒火）
        if ((Times_Button_RightMouse*Barbarian_Macro_LoopInterval) == 100000) then
            PressAndReleaseMouseButton(3)
            Times_Button_RightMouse = 0
        end

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

    --循环结束，释放鼠标左键
    ReleaseMouseButton(1)
    ReleaseKey("rshift")
end
