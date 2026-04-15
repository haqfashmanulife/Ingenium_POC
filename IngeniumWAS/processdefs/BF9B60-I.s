#*******************************************************************************
#*  Component:   BF9B60-I.s                                                    *
#*  Description: COVERAGE LIST BY INSURED SCREEN                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN5231  27MAR09  COVERAGE LIST BY INSURED SCREEN                           *
#*******************************************************************************

S-STEP BF9B60-I
{
        ATTRIBUTES
        {
                BusinessFunctionType = "List";
                FocusField = "MIR-POL-ID-BASE";
                FocusFrame = "ContentFrame";
                Type = "Input";
        }

        IN Title;

        IN TitleBar;
        IN TitleBarSize;

        IN ButtonBar;
        IN ButtonBarSize;

        IN MessageFrame;
        IN MessageFrameSize;

        OUT action
        {
                SType="Hidden";
        }

        INOUT MIR-CLI-ID
        {
                Key;
                Label = "Client ID";
                Length = "10";
                Mandatory;
                SType = "Text";
        }

        INOUT MIR-POL-ID-BASE
        {
                DefaultSession = "MIR-POL-ID-BASE";
                Key;
                Label = "Policy ID";
                Length = "9";
                Mandatory;
                SType = "Text";
        }

        INOUT MIR-POL-ID-SFX
        {
                Label = "Suffix";
                Length = "1";
                SType = "Text";
        }
}
