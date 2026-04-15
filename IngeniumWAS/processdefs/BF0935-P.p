# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:31 PM EDT

#*******************************************************************************
#*  Component:   BF0935-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0935-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0935";
        BusinessFunctionName = "Annuity Destination Details Print";
        BusinessFunctionType = "Print";
        MirName = "CCWM4250";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CDA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCDSD";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DEST-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DEST-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCDSD";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-DEST-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCDSD";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-DEST-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-DOC-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TDOCM";
        SType = "Selection";
        Label = "Document Name";
    }

}

