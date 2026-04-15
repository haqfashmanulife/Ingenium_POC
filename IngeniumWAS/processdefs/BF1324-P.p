# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF1324-P.p                                                    *
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

P-STEP BF1324-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1324";
        BusinessFunctionName = "Client Contact History List";
        BusinessFunctionType = "List";
        MirName = "CCWM0351";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-CNTCT-DT
    {
        Key;
        Length = "10";
        DBTableName = "TCH";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Date";
    }

    INOUT MIR-CLI-CNTCT-SEQ-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TCH";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCH";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-USER-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCH";
        SType = "Text";
        Label = "User ID";
    }

    OUT MIR-CLI-CNTCT-DT-T[11]
    {
        Length = "10";
        FieldGroup = "Table11";
        DBTableName = "TCH";
        SType = "Date";
        Label = "Activity Date";
        Index = "1";
    }

    OUT MIR-CLI-CNTCT-RETEN-CD-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "CLI-CNTCT-RETEN-CD";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Retention Period";
        Index = "1";
    }

    OUT MIR-CLI-CNTCT-SEQ-NUM-T[11]
    {
        Length = "2";
        FieldGroup = "Table11";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-CLI-CNTCT-SUB-CD-T[11]
    {
        Length = "6";
        FieldGroup = "Table11";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Activity Type";
        Index = "1";
    }

    OUT MIR-CLI-CNTCT-TYP-CD-T[11]
    {
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "CHACT";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Activity";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[11]
    {
        Length = "10";
        FieldGroup = "Table11";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-DV-FOLWUP-TXT-IND-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Comments";
        Index = "1";
    }

    OUT MIR-FOLWUP-ACT-CD-T[11]
    {
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "CHFUA";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Action";
        Index = "1";
    }

    OUT MIR-FOLWUP-DT-T[11]
    {
        Length = "10";
        FieldGroup = "Table11";
        DBTableName = "TCH";
        SType = "Date";
        Label = "Date";
        Index = "1";
    }

    OUT MIR-FOLWUP-USER-ID-T[11]
    {
        Length = "8";
        FieldGroup = "Table11";
        DBTableName = "TCH";
        SType = "Text";
        Label = "User ID";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE-T[11]
    {
        Length = "9";
        FieldGroup = "Table11";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        DBTableName = "TCH";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

}

