# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF2230-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016103  6.1.1J   Added Search Language Group Code                          *
#*  017098  6.1.1J   Removed CLI-ID field                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2230-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Alphalist";
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
        Mandatory;
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }

    INOUT MIR-DV-SRCH-GR-CD
    {
        DefaultConstant = "KJ";
        Length = "2";
        SType = "YesNo";
        Label = "Search Language Group Code";
    }

}

