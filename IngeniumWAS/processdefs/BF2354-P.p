# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:51 PM EDT

#*******************************************************************************
#*  Component:   BF2354-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2354-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2354";
        BusinessFunctionName = "Diary Activity Log Policy List";
        BusinessFunctionType = "List";
        MirName = "CCWM2354";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CPEVNT-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TDALG";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-CPEVNT-TRXN-DT
    {
        Key;
        Length = "10";
        DBTableName = "TDALG";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Record Date";
    }

    INOUT MIR-CPEVNT-TRXN-TIME
    {
        Key;
        Length = "6";
        DBTableName = "TDALG";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Time";
        Label = "Record Time";
    }

    INOUT MIR-EVNT-ACTV-CD
    {
        Key;
        Length = "5";
        CodeSource = "Edit";
        CodeType = "DACTV";
        DBTableName = "TDALG";
        SType = "Selection";
        Label = "Activity";
    }

    INOUT MIR-CPEVNT-GR-CD
    {
        Length = "3";
        CodeSource = "Edit";
        CodeType = "GROUP";
        DBTableName = "TDALT";
        SType = "Text";
        Label = "Group Type";
    }

    IN MIR-CPEVNT-POL-CLI-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TDALG";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-CPEVNT-POL-CLI-ID-SFX
    {
        Key;
        Mandatory;
        Length = "1";
        DBTableName = "TDALG";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-BUS-FCN-ID-T[25]
    {
        Length = "4";
        FieldGroup = "Table25";
        DBTableName = "TDALG";
        CodeSource = "Edit";
        CodeType = "GROUP";
        SType = "Text";
        Label = "Business Function ID";
        Index = "1";
    }

    OUT MIR-CPEVNT-GR-CD-T[25]
    {
        Length = "3";
        FieldGroup = "Table25";
        DBTableName = "TDALG";
        CodeSource = "Edit";
        CodeType = "GROUP";
        SType = "Text";
        Label = "Group Type";
        Index = "1";
    }

    OUT MIR-CPEVNT-POL-CLI-ID-T[25]
    {
        Length = "10";
        FieldGroup = "Table25";
        DBTableName = "TDALG";
        SType = "Text";
        Label = "Client ID";
        Index = "1";
    }

    OUT MIR-CPEVNT-SEQ-NUM-T[25]
    {
        Length = "3";
        FieldGroup = "Table25";
        DBTableName = "TDALG";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-CPEVNT-SRC-CD-T[25]
    {
        Length = "1";
        FieldGroup = "Table25";
        DBTableName = "TDALG";
        CodeSource = "DataModel";
        CodeType = "EVNT-SRC-CD";
        SType = "Text";
        Label = "Source Code";
        Index = "1";
    }

    OUT MIR-CPEVNT-TRXN-DT-T[25]
    {
        Length = "10";
        FieldGroup = "Table25";
        DBTableName = "TDALG";
        SType = "Date";
        Label = "Record Date";
        Index = "1";
    }

    OUT MIR-CPEVNT-TRXN-TIME-T[25]
    {
        Length = "6";
        FieldGroup = "Table25";
        DBTableName = "TDALG";
        SType = "Time";
        Label = "Record Time";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[25]
    {
        Length = "2";
        FieldGroup = "Table25";
        DBTableName = "TDALG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-DV-MSG-TXT-T[25]
    {
        Length = "79";
        FieldGroup = "Table25";
        DBTableName = "TDALG";
        SType = "Text";
        Label = "Comment/Information";
        Index = "1";
    }

    OUT MIR-EVNT-ACT-CD-T[25]
    {
        Length = "4";
        FieldGroup = "Table25";
        DBTableName = "TDALG";
        CodeSource = "Edit";
        CodeType = "DACTN";
        SType = "Text";
        Label = "Action";
        Index = "1";
    }

    OUT MIR-EVNT-ACTV-CD-T[25]
    {
        Length = "5";
        FieldGroup = "Table25";
        DBTableName = "TDALG";
        CodeSource = "Edit";
        CodeType = "DACTV";
        SType = "Text";
        Label = "Activity";
        Index = "1";
    }

    OUT MIR-INSRD-CLI-ID-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Insured Client";
        Index = "1";
    }

    OUT MIR-USER-ID-T[25]
    {
        Length = "8";
        FieldGroup = "Table25";
        DBTableName = "TDALG";
        SType = "Text";
        Label = "User ID";
        Index = "1";
    }

}

