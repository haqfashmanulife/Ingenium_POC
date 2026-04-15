# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:22 PM EDT

#*******************************************************************************
#*  Component:   BF0390-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0390-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    IN MIR-CHKPT-INSTC-ID
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Instance Number";
    }

    IN MIR-CHKPT-PGM-ID
    {
        Key;
        DisplayOnly;
        Length = "8";
        CodeSource = "XTAB";
        CodeType = "PROGM";
        SType = "Text";
        Label = "Program Name";
    }

    IN MIR-CHKPT-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CHKPT-STAT-CD";
        SType = "Text";
        Label = "Current Checkpoint Status";
    }

    IN MIR-CHKPT-WRK-INFO
    {
        DisplayOnly;
        Length = "237";
        SType = "Text";
        Label = "Work Area Display";
    }

    IN MIR-COMIT-FREQ-UOW-QTY
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Commit Frequency Units";
    }

    IN MIR-COMIT-MAX-SEC-DUR
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Commit Frequency Maximum Time";
    }

    IN MIR-COMIT-MIN-SEC-DUR
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Commit Frequency Minimum Time";
    }

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Previous Update Date";
    }

    IN MIR-PREV-UPDT-USER-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Previous Update User ID";
    }

}

