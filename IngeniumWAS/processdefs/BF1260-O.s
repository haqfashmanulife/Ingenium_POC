# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:37 PM EDT

#*******************************************************************************
#*  Component:   BF1260-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1260-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-USER-ID";
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

    INOUT MIR-DV-TRNXT-TYP-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-TYP-CD";
        DefaultConstant = "00";
        SType = "Selection";
        Label = "Transaction Type";
    }

    INOUT MIR-TRNXT-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Date Created";
    }

    INOUT MIR-TRNXT-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
        DefaultConstant = "000";
    }

    INOUT MIR-TRNXT-TASK-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DefaultSession = "LSIR-TASK-ID";
        SType = "Text";
        Label = "CICS Task Number";
    }

    INOUT MIR-TRNXT-TIME
    {
        Key;
        Mandatory;
        Length = "8";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Time";
        Label = "Time";
    }

    INOUT MIR-USER-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    IN MIR-TRNXT-DTL-INFO-T[14]
    {
        DisplayOnly;
        Length = "456";
        FieldGroup = "Table14";
        KeyColumn;
        SType = "Text";
        Label = "Details";
        Index = "1";
    }

}

