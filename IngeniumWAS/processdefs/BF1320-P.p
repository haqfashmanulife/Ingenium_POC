# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF1320-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P01844  BP       Increase size of MIR-CLI-CNTCT-SUB-CD                     *
#*                                                                             *
#*******************************************************************************

P-STEP BF1320-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1320";
        BusinessFunctionName = "Client Contact History Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0351";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-CNTCT-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCH";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Date";
    }

    INOUT MIR-CLI-CNTCT-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCH";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCH";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-USER-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCH";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    OUT MIR-CLI-CNTCT-RETEN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-CNTCT-RETEN-CD";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Retention Period";
    }

    OUT MIR-CLI-CNTCT-SUB-CD
    {
        Length = "6";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Activity Type";
    }

    OUT MIR-CLI-CNTCT-TYP-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CHACT";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Activity";
    }

    OUT MIR-FOLWUP-ACT-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CHFUA";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Action";
    }

    OUT MIR-FOLWUP-DT
    {
        Length = "10";
        DBTableName = "TCH";
        SType = "Date";
        Label = "Date";
    }

    OUT MIR-FOLWUP-NOTE-TXT
    {
        Length = "150";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Comments";
    }

    OUT MIR-FOLWUP-USER-ID
    {
        Length = "8";
        DBTableName = "TCH";
        SType = "Text";
        Label = "User ID";
    }

    OUT MIR-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Policy Id";
    }

    OUT MIR-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Suffix";
    }

}

