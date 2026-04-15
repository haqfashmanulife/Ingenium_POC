# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:51 PM EDT

#*******************************************************************************
#*  Component:   BF4913-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016051  602J     New for Appl Entry Flow                                   *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - Samakata-bu (ADDR-ADDL) length changed to 72            *
#*                                                                             *
#*******************************************************************************

P-STEP BF4913-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "4913";
        BusinessFunctionName = "Client Address Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM4913";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-ADDR-TYP-CD
    {
        Key;
        Mandatory;
        Length = "40";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Type";
    }

    IN MIR-CLI-ADDR-SEQ-NUM
    {
        Key;
        Length = "03";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
    }

    OUT MIR-CLI-ADDR-LN-1-TXT-T[6]
    {
        DisplayOnly;
        Length = "35";
        FieldGroup = "Table6";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-ADDL-TXT
    {
        DisplayOnly;
        Length = "72";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Samakata-bu";
    }

}

