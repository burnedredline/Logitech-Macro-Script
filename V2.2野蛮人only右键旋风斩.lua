--���ܰ������ã�
----����Ҽ�->����ն

Barbarian_Macro_LoopInterval = 10

function OnEvent(event, arg, family)
    --if (event == "G_RELEASED" and arg == 4) then --4Ϊ�޼�����G4��
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 5) then --3Ϊ�޼�����м���5Ϊ���ǰ����4Ϊ�������
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
               
        --��סlalt���ж�����ն
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