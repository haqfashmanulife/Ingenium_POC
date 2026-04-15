# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF0990-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0990-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0990";
        BusinessFunctionName = "Branch Detail Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM5030";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-BR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TBRCH";
        SType = "Selection";
        Label = "Branch Number";
    }

    OUT MIR-CLI-ADDR-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TBRCH";
        SType = "Text";
        Label = "Address Type";
    }

    OUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TBRCH";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-DV-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
    }

}

