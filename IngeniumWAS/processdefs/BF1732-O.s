# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:49 PM EDT

#*******************************************************************************
#*  Component:   BF1732-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

S-STEP BF1732-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Pendact";
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

#UY3004 CHANGES START
    INOUT Dispolval
    {
        SType = "Hidden";
    }

    INOUT Dissfxval
    {
        SType = "Hidden";
    }
#UY3004 CHANGES END

    INOUT MIR-CIA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    INOUT MIR-CIA-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-CIA-TYP-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-TYP-CD";
        SType = "Selection";
        Label = "Activity Type";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

    IN MIR-CFN-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-CIA-CLI-TRXN-AMT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Total Premium Received";
        Index = "1";
    }

    IN MIR-CIA-EFF-DT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Activity Effective Date";
        Index = "1";
    }

    IN MIR-CIA-FND-TRXN-AMT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Net Amount";
        Index = "1";
    }

    IN MIR-CIA-LOAD-AMT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Transfer Charges";
        Index = "1";
    }

    IN MIR-CIA-REASN-CD-T[50]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CIA-REASN-CD";
        SType = "Text";
        Label = "Surrender Reason";
        Index = "1";
    }

    IN MIR-CIA-REVRS-PRCES-DT-T[50]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Effective Date of Reversal";
        Index = "1";
    }

    IN MIR-CIA-SEQ-NUM-T[50]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-CIA-TYP-CD-T[50]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table50";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "CIA-TYP-CD";
        Link;
        SType = "Text";
        Label = "Activity Type";
        Action = "SelectItem";
        Index = "1";
    }

}

