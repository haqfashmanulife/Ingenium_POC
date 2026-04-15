# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:34 PM EDT

#*******************************************************************************
#*  Component:   BF1074-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1074-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1074";
        BusinessFunctionName = "Client Contact Information List";
        BusinessFunctionType = "List";
        MirName = "CCWM6160";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLIC";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-CLI-CNTCT-ID-CD-T[5]
    {
        Key;
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "EDIT";
        CodeType = "CNTID";
        DBTableName = "TCLIC";
        SType = "Text";
        Label = "Contact Type";
        Index = "1";
    }

    OUT MIR-CLI-CNTCT-ID-TXT-T[5]
    {
        Length = "50";
        FieldGroup = "Table5";
        DBTableName = "TCLIC";
        SType = "Text";
        Label = "Identification Code";
        Index = "1";
    }

    OUT MIR-DV-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
    }

}

