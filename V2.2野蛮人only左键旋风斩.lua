--�ű��������ã�
----������->����ն

Barbarian_Macro_LoopInterval = 10
EnablePrimaryMouseButtonEvents(true)

function OnEvent(event, arg, family)
    --if (event == "G_RELEASED" and arg == 4) then --4Ϊ�޼�����G4��
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 3) then --3Ϊ�޼�����м���5Ϊ���ǰ����4Ϊ�������
        Barbarian_Macro_FullyAuto()
    end
end

function Barbarian_Macro_FullyAuto()
    if (IsKeyLockOn("capslock")) then
        PressKey("rshift")
        PressMouseButton(1)
    end
	
    while (IsKeyLockOn("capslock")) do               
        Sleep(Barbarian_Macro_LoopInterval) --ѭ�����
		
        if (IsModifierPressed("lalt")) then --��סlalt���ж�����ն
            ReleaseMouseButton(1)
            ReleaseKey("rshift")
        else
            if not (IsMouseButtonPressed(1)) then
                ReleaseMouseButton(1)
                PressKey("rshift")
                PressMouseButton(1)
            else
                if (IsModifierPressed("lctrl")) then --��סlctrl�����Ż�Լ�̳
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