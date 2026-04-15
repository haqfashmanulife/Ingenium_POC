# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:51 PM EDT

#*******************************************************************************
#*  Component:   BF2344-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2344-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2344";
        BusinessFunctionName = "Diary Activity Log Client List";
        BusinessFunctionType = "List";
        MirName = "CCWM2344";
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

    IN MIR-CPEVNT-POL-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TDALG";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client ID";
    }

    OUT MIR-BUS-FCN-ID-T[25]
    {
        Length = "4";
        FieldGroup = "Table25";
        DBTableName = "TDALG";
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

    OUT MIR-REL-SYS-REF-CVG-NUM-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        DBTableName = "TRL";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-REL-SYS-REF-POL-ID-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TRL";
        SType = "Text";
        Label = "Client's policies";
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

