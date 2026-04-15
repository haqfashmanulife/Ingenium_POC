# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF1322-P.p                                                    *
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

P-STEP BF1322-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1322";
        BusinessFunctionName = "Client Contact History Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0351";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-CNTCT-RETEN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-CNTCT-RETEN-CD";
        DBTableName = "TCH";
        SType = "Selection";
        Label = "Retention Period";
    }

    INOUT MIR-CLI-CNTCT-SUB-CD
    {
        Length = "6";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Activity Type";
    }

    INOUT MIR-CLI-CNTCT-TYP-CD
    {
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CHACT";
        DBTableName = "TCH";
        SType = "Selection";
        Label = "Activity";
    }

    INOUT MIR-FOLWUP-ACT-CD
    {
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CHFUA";
        DBTableName = "TCH";
        SType = "Selection";
        Label = "Action";
    }

    INOUT MIR-FOLWUP-DT
    {
        Length = "10";
        DBTableName = "TCH";
        SType = "Date";
        Label = "Date";
    }

    INOUT MIR-FOLWUP-NOTE-TXT
    {
        MixedCase;
        Length = "150";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Comments";
    }

    INOUT MIR-FOLWUP-USER-ID
    {
        Length = "8";
        DBTableName = "TCH";
        SType = "Text";
        Label = "User ID";
    }

    INOUT MIR-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-USER-ID
    {
        Length = "8";
        DBTableName = "TCH";
        SType = "Text";
        Label = "User ID";
    }

    IN MIR-CLI-CNTCT-DT
    {
        Key;
        Length = "10";
        DBTableName = "TCH";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Date";
    }

    IN MIR-CLI-CNTCT-SEQ-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCH";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

}

