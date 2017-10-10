--技能按键设置：
----鼠标左键->先祖之锤
----鼠标右键->冲锋
----A键->战斗怒火
----S键->疾跑
----D键->先祖召唤
----F键->赛亚人

Barbarian_Macro_LoopInterval = 10 --脚本循环间隔（毫秒）

function OnEvent(event, arg, family)
    --if (event == "G_RELEASED" and arg == 4) then --4为罗技键盘G4键
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 5) then --3为罗技鼠标中键，5为侧键前进，4为侧键返回
        Barbarian_Macro_FullyAuto()
    end
end

function Barbarian_Macro_FullyAuto()
    if (IsKeyLockOn("capslock")) then
        --按下并释放F键（赛亚人）
        PressAndReleaseKey("f")
        Shift_Pressed = false
        Times_Key_A = 0
        Times_Key_S = 0
        Times_Key_F = 0
    end

    --如果CapsLock键已按下则启动循环，否则退出循环
    while (IsKeyLockOn("capslock")) do 
        if (IsModifierPressed('lshift')) then
            if not (Shift_Pressed) then
                PressMouseButton(1)
                Shift_Pressed = true
                Times_Key_S = 200
            end
        else
            if (Shift_Pressed) then
                ReleaseMouseButton(1)
                Shift_Pressed = false
            end
        end
		
        Times_Key_A = Times_Key_A + 1
        Times_Key_F = Times_Key_F + 1
        if not (Shift_Pressed) then
            Times_Key_S = Times_Key_S + 1
        end
		
        --每2.3秒按下并释放S键（疾跑）
        if ((Times_Key_S*Barbarian_Macro_LoopInterval) == 2300) then
            PressAndReleaseKey("s")
            Times_Key_S = 0
        end
		
        --每0.5秒按下并释放F键（赛亚人）
        if ((Times_Key_F*Barbarian_Macro_LoopInterval) == 500) then
            PressAndReleaseKey("f")
            Times_Key_F = 0
        end
			 
        --每1秒按下并释放A键（战斗怒火）
        if ((Times_Key_A*Barbarian_Macro_LoopInterval) == 100000) then
            PressAndReleaseKey("a")
            Times_Key_A = 0
        end
		
        Sleep(Barbarian_Macro_LoopInterval) --循环间隔
    end
    ReleaseMouseButton(1)
end