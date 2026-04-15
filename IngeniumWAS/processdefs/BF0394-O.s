# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:22 PM EDT

#*******************************************************************************
#*  Component:   BF0394-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0394-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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

    INOUT MIR-CHKPT-INSTC-ID
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Instance Number";
    }

    INOUT MIR-CHKPT-PGM-ID
    {
        Key;
        Length = "8";
        CodeSource = "XTAB";
        CodeType = "PROGM";
        SType = "Selection";
        Label = "Program Name";
    }

    IN MIR-CHKPT-INSTC-ID-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Instance Number";
        Index = "1";
    }

    IN MIR-CHKPT-PGM-ID-T[12]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "PROGM";
        Link;
        SType = "Text";
        Label = "Program Name";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-CHKPT-STAT-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CHKPT-STAT-CD";
        SType = "Text";
        Label = "Current Checkpoint Status";
        Index = "1";
    }

    IN MIR-COMIT-FREQ-UOW-QTY-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Commit Frequency Units";
        Index = "1";
    }

    IN MIR-COMIT-MAX-SEC-DUR-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Commit Frequency Maximum Time";
        Index = "1";
    }

    IN MIR-COMIT-MIN-SEC-DUR-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Commit Frequency Minimum Time";
        Index = "1";
    }

    IN MIR-PREV-UPDT-DT-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Previous Update Date";
        Index = "1";
    }

    IN MIR-PREV-UPDT-USER-ID-T[12]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Previous Update User ID";
        Index = "1";
    }

}

