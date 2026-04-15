# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF0493-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0493-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0493";
        BusinessFunctionName = "Additional Client Address Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM0490";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ADDR-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CLI-ADDR-TYP-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TCLIA";
        SType = "Selection";
        Label = "Address Type";
    }

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

}

