# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:34 PM EDT

#*******************************************************************************
#*  Component:   BF1184-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1184-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1184";
        BusinessFunctionName = "Policy Number Assignment List";
        BusinessFunctionType = "List";
        MirName = "NCWM0075";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BUS-CLAS-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        DBTableName = "TPASS";
        SType = "Selection";
        Label = "Business Class";
    }

    INOUT MIR-CO-ID
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TPASS";
        SType = "Selection";
        Label = "Company";
    }

    OUT MIR-BUS-CLAS-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        DBTableName = "TPASS";
        SType = "Text";
        Label = "Business Class";
        Index = "1";
    }

    OUT MIR-DV-BUS-CLAS-TXT-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Description of Business Class";
        Index = "1";
    }

    OUT MIR-POL-ASIGN-END-ID-T[12]
    {
        Length = "9";
        FieldGroup = "Table12";
        DBTableName = "TPASS";
        SType = "Text";
        Label = "Policy Number Range - End";
        Index = "1";
    }

    OUT MIR-POL-ASIGN-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TPASS";
        SType = "Indicator";
        Label = "Automatic policy number assignment is enabled";
        Index = "1";
    }

    OUT MIR-POL-ASIGN-STRT-ID-T[12]
    {
        Length = "9";
        FieldGroup = "Table12";
        DBTableName = "TPASS";
        SType = "Text";
        Label = "Policy Number Range - Start";
        Index = "1";
    }

}

