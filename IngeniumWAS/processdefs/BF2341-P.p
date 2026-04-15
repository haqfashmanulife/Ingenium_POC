# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:51 PM EDT

#*******************************************************************************
#*  Component:   BF2341-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2341-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2341";
        BusinessFunctionName = "Diary Activity Log Client Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM2341";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TDALG";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-EVNT-ACT-CD
    {
        Mandatory;
        Length = "4";
        CodeSource = "Edit";
        CodeType = "DACTN";
        DBTableName = "TDALG";
        SType = "Selection";
        Label = "Action";
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

    IN MIR-CPEVNT-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TDALG";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CPEVNT-TRXN-DT
    {
        Key;
        Length = "10";
        DBTableName = "TDALG";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Record Date";
    }

    IN MIR-CPEVNT-TRXN-TIME
    {
        Key;
        Length = "6";
        DBTableName = "TDALG";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Time";
        Label = "Record Time";
    }

    IN MIR-EVNT-ACTV-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "Edit";
        CodeType = "DACTV";
        DBTableName = "TDALG";
        SType = "Selection";
        Label = "Activity";
    }

    OUT MIR-CPEVNT-GR-CD
    {
        Length = "3";
        CodeSource = "Edit";
        CodeType = "GROUP";
        DBTableName = "TDALT";
        SType = "Text";
        Label = "Group Type";
    }

    OUT MIR-DV-MSG-TXT
    {
        Length = "79";
        DBTableName = "TDALT";
        SType = "Text";
        Label = "Comment/Information";
    }

}

