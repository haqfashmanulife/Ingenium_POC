# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8123-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8123-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8123";
        BusinessFunctionName = "Country Location Delete";
        BusinessFunctionType = "Delete";
        MirName = "XCWM8123";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CO-ID
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TCTLC";
        SType = "Selection";
        Label = "Company";
    }

    IN MIR-CTRY-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TCTLC";
        SType = "Selection";
        Label = "Country";
    }

    IN MIR-CTRY-LOC-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        DBTableName = "TCTLC";
        SType = "Selection";
        Label = "Location";
    }

    IN MIR-CTRY-LOC-TYP-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "CTRY-LOC-TYP-CD";
        DBTableName = "TCTLC";
        SType = "Selection";
        Label = "Location Type";
    }

}

