--技能按键设置：
----鼠标左键->僵尸熊
----鼠标右键->食人鱼
----A键->灵行
----S键->收割
----D键->火墙
----F键->蜘蛛或炸弹

WitchDoctor_Macro_LoopInterval = 10 --脚本循环间隔（毫秒）

function OnEvent(event, arg, family)
    --if (event == "G_RELEASED" and arg == 4) then --4为罗技键盘G4键
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 4) then --3为罗技鼠标中键，5为侧键前进，4为侧键返回
        WitchDoctor_Macro_FullyAuto()
    end
end

function WitchDoctor_Macro_FullyAuto()
    if (IsKeyLockOn("capslock")) then
        Shift_Pressed = false
        Times_Key_D = 0
        Times_Key_F = 0
    end

    --如果CapsLock键已按下则启动循环，否则退出循环
    while (IsKeyLockOn("capslock")) do
        if (IsModifierPressed("lshift")) then 	
            if not (Shift_Pressed) then
                PressAndReleaseKey("d")
				PressAndReleaseKey("f")
                PressMouseButton(1)
                Shift_Pressed = true
            end
			
            Times_Key_D = Times_Key_D + 1
            Times_Key_F = Times_Key_F + 1
			
            --每4秒按下并释放F键（触发产能对戒）
            if (Times_Key_F*WitchDoctor_Macro_LoopInterval == 4000) then
				ReleaseMouseButton(1)
				Sleep(300)
                PressAndReleaseKey("f")
				PressMouseButton(1)
                Times_Key_F = 0
				Times_Key_D = 0
			elseif (Times_Key_D*WitchDoctor_Macro_LoopInterval == 400) then
				PressAndReleaseKey("d")
				Times_Key_D = 0
            end
        else
            if (Shift_Pressed) then
                ReleaseMouseButton(1)
                Shift_Pressed = false
                Times_Key_D = 0
                Times_Key_F = 0
            end
        end
		Sleep(WitchDoctor_Macro_LoopInterval) --循环间隔
    end
	ReleaseMouseButton(1)
end