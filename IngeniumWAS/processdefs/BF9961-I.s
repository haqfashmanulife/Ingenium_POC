#*******************************************************************************
#*  Component:   BF9961-I.s                                                    *
#*  Description: Client List Inquiry                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  FT2001  01SEP04  INITIAL VERSION                                           *
#*******************************************************************************

S-STEP BF9961-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Clinqlist";
        Type = "Input";
        FocusField = "MIR-DV-SRCH-GR-CD";
        FocusFrame = "ContentFrame";
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
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-CLI-INDV-GIV-NM
    {
        Key;
        Length = "25";
        SType = "Text";
        Label = "First Name";
    }

    INOUT MIR-CLI-INDV-SUR-NM
    {
        Key;
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }

    INOUT MIR-DV-SRCH-GR-CD
    {
        DefaultConstant = "KJ";
        SType = "YesNo";
        Label = "Search Language Group Code";
    }

}

