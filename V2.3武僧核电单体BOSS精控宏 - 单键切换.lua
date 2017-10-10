--Macro1Ϊ�����BUFF�꣨*--��
--Macro2Ϊ�����+����BUFF�꣨*-*��
--Macro3Ϊ�����+�ȷ�����BUFF�꣨**-��
--Macro4Ϊ�����+�ȷ�����+����BUFF�꣨***��
--Macro_OtherΪС�ֺ꣨---��
Macro1 = "X1"; --�޸�Ϊ�Լ��������
Macro2 = "X2"; --�޸�Ϊ�Լ��������
Macro3 = "X3"; --�޸�Ϊ�Լ��������
Macro4 = "X4"; --�޸�Ϊ�Լ��������
Macro_Other = "XXX"; --�޸�Ϊ�Լ��������

CurrentMacro = ""; --����ִ�еĺ�
CurrentMacroGroup = ""; --����ִ�еĺ����
CurrentTime = 0;
EndMacroDelay = 1500; --��סǰ����1.5��ֹͣ�꣬�������޸�

StartMacro_Key_AB = 5; --�л�A���İ���
StartMacro_Key_Other = 4; --�л�С�ֺ�İ���
--�޼����ĺ������İ�������Ϊ1�����2�Ҽ���3�м���4���ؼ���5ǰ������6789�Լ��԰�

function OnEvent(event, arg, family)
    --���ؼ��ͷ�ʱ���л�С�ֺ�
    if (event == "MOUSE_BUTTON_RELEASED" and arg == StartMacro_Key_Other) then
        RestartMacro(Macro_Other);
    end

    --ǰ��������ʱ
    if (event == "MOUSE_BUTTON_PRESSED" and arg == StartMacro_Key_AB) then
        CurrentTime = GetRunningTime(); --��¼ʱ��
    end
	
    --ǰ�����ͷ�ʱ���л�A���
    if (event == "MOUSE_BUTTON_RELEASED" and arg == StartMacro_Key_AB) then
        --���ǰ������ס����1.5����ֹͣ��
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

--����ȫ�𣨳�ʼ����
function ClearKeyLockOn()
    if (IsKeyLockOn("numlock")) then --���numlock�����ţ�������
        PressAndReleaseKey("numlock");
    end
    if (IsKeyLockOn("capslock")) then
        PressAndReleaseKey("capslock");
    end
    if (IsKeyLockOn("scrolllock")) then
        PressAndReleaseKey("scrolllock");
    end
end

--���Ʊ�ʶ����ִ�еĺ�
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

--����һ����
function RestartMacro(MacroName)
    ChangeKeyLockOn(MacroName); --���Ʊ�ʶ����ִ�еĺ�
    AbortMacro(); --ֹͣ��
    PlayMacro(MacroName); --������
    CurrentMacro = MacroName; --��¼��ǰ���еĺ�
end
