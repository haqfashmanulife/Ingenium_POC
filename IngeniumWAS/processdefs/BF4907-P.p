# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:51 PM EDT

#*******************************************************************************
#*  Component:   BF4907-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF4907-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "4907";
        BusinessFunctionName = "Country Location Selection Box Retrieval";
        BusinessFunctionType = "Retrieve";
        MirName = "XCWM4907";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CTRY-CD
    {
        Key;
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
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "CTRY-LOCAT-TYP-CD";
        DBTableName = "TCTLC";
        SType = "Selection";
        Label = "Location Type";
    }

    OUT MIR-ETBL-DESC-TXT
    {
        Length = "40";
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Description";
    }

}

