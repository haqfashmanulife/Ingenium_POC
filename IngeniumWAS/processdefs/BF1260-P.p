# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF1260-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1260-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1260";
        BusinessFunctionName = "Transaction Inquiry";
        BusinessFunctionType = "Trnxinq";
        MirName = "NCWM0173";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-BCKWRD-SCROLL-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Scroll Backward Ind";
    }

    INOUT MIR-DV-TRNXT-TYP-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-TYP-CD";
        DBTableName = "Derived";
        DefaultConstant = "00";
        SType = "Selection";
        Label = "Transaction Type";
    }

    INOUT MIR-TRNXT-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TTRAN";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Date Created";
    }

    INOUT MIR-TRNXT-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TTRAN";
        SType = "Text";
        DefaultConstant = "000";
        Label = "Sequence Number";
    }

    INOUT MIR-TRNXT-TASK-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TTRAN";
        DefaultSession = "LSIR-TASK-ID";
        SType = "Text";
        Label = "CICS Task Number";
    }

    INOUT MIR-TRNXT-TIME
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TTRAN";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Time";
        Label = "Time";
    }

    INOUT MIR-USER-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TTRAN";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    OUT MIR-TRNXT-DTL-INFO-T[14]
    {
        Length = "456";
        FieldGroup = "Table14";
        KeyColumn;
        DBTableName = "TTRAN";
        SType = "Text";
        Label = "Details";
        Index = "1";
    }

}

