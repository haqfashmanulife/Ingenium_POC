# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

#*******************************************************************************
#*  Component:   BF9241-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL103D HIN/CL   PRINT CONTACT CLIENT LABEL                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9241-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CLM-ID";
        FocusField = "OKButton";
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

    IN MIR-CLM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Claim ID";
    }

    IN MIR-DV-ADDR-LN-1-TXT
    {
        DisplayOnly;
        Length = "54";
        SType = "Text";
        Label = "Address Line 1";
    }

    IN MIR-DV-ADDR-LN-2-TXT
    {
        DisplayOnly;
        Length = "54";
        SType = "Text";
        Label = "Address Line 2";
    }

    IN MIR-DV-ADDR-LN-3-TXT
    {
        DisplayOnly;
        Length = "54";
        SType = "Text";
        Label = "Address Line 3";
    }

    IN MIR-DV-CNTCT-CLI-NM
    {
        DisplayOnly;
        Length = "56";
        SType = "Text";
        Label = "Contact Client Name";
    }
}

