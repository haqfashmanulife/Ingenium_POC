# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:40 PM EDT

#*******************************************************************************
#*  Component:   BF1490-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00272  BMB      Adjust display field to show spaces                       *
#*                   Note: The HTML element that matches this has special      *
#*                   formatting for online letter writing. Do not use UIGEN.   *
#*                                                                             *
#*******************************************************************************

P-STEP BF1490-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1490";
        BusinessFunctionName = "Face Page Tester";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0734";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TPOL";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DOC-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TDOCM";
        SType = "Selection";
        Label = "Document Name";
    }

    IN MIR-DV-PG-FRMT-TST-AMT
    {
        Key;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    INOUT MIR-DV-DOC-PG-NUM
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Page";
    }

    INOUT MIR-DV-DOC-MAX-PG-NUM
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Max Page";
    }

    INOUT MIR-DV-PG-LN-TXT-T[40]
    {
        Length = "79";
        FieldGroup = "Table40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Face page text";
        Index = "1";
    }

}

