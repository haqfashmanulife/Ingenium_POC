# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:50 PM EDT

#*******************************************************************************
#*  Component:   BF1764-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

S-STEP BF1764-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-ID-BASE";
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

    INOUT MIR-BON-DIV-IDT-NUM
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Declaration Date";
    }

    INOUT MIR-BON-DIV-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-BON-DIV-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BON-DIV-TYP-CD";
        SType = "Selection";
        Label = "Record Type";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
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

    IN MIR-BON-DIV-IDT-NUM-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Declaration Date";
        Index = "1";
    }

    IN MIR-BON-DIV-PUA-AMT-T[12]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Bonus Paid Up Additions Face Amount";
        Index = "1";
    }

    IN MIR-BON-DIV-SEQ-NUM-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-BON-DIV-STAT-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "BON-DIV-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-BON-DIV-TRXN-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "BON-DIV-TRXN-CD";
        SType = "Text";
        Label = "Sub Type";
        Index = "1";
    }

    IN MIR-BON-DIV-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "BON-DIV-TYP-CD";
        SType = "Text";
        Label = "Record Type";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Coverage Number";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

}

