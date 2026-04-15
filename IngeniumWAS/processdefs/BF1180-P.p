# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:34 PM EDT

#*******************************************************************************
#*  Component:   BF1180-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1180-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1180";
        BusinessFunctionName = "Policy Number Assignment Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM0075";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-BUS-CLAS-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        DBTableName = "TPASS";
        SType = "Selection";
        Label = "Business Class";
    }

    IN MIR-CO-ID
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

    OUT MIR-DV-BUS-CLAS-TXT
    {
        Length = "40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Description of Business Class";
    }

    OUT MIR-POL-ASIGN-END-ID
    {
        Length = "9";
        DBTableName = "TPASS";
        SType = "Text";
        Label = "Policy Number Range - End";
    }

    OUT MIR-POL-ASIGN-IND
    {
        Length = "1";
        DBTableName = "TPASS";
        SType = "Indicator";
        Label = "Automatic policy number assignment is enabled";
    }

    OUT MIR-POL-ASIGN-STRT-ID
    {
        Length = "9";
        DBTableName = "TPASS";
        SType = "Text";
        Label = "Policy Number Range - Start";
    }

}

