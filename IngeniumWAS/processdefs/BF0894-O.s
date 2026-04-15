# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:31 PM EDT

#*******************************************************************************
#*  Component:   BF0894-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0894-O
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

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-TAMRA-EFF-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date Record Created";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-TAMRA-7PAY-ANN-AMT-T[11]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table11";
        SType = "Currency";
        Label = "7-Pay Annual Premium";
        Index = "1";
    }

    IN MIR-TAMRA-7PAY-CUM-AMT-T[11]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table11";
        SType = "Currency";
        Label = "7-Pay Cumulative Premium";
        Index = "1";
    }

    IN MIR-TAMRA-ACB-AMT-T[11]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table11";
        SType = "Currency";
        Label = "Adjusted Cost Basis Value";
        Index = "1";
    }

    IN MIR-TAMRA-EFF-DT-T[11]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table11";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Date Record Created";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-TAMRA-REASN-CD-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "TAMRA-REASN-CD";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    IN MIR-TAMRA-STAT-CD-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "TAMRA-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

}

