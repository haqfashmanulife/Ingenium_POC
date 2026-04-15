# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT

#*******************************************************************************
#*  Component:   BF9032-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  01aug01  New for NB10                                              *
#*                                                                             *
#*******************************************************************************

P-STEP BF9032-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9032";
        BusinessFunctionName = "UW Rate Table Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM9032";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-UWRT-TBL-TYP-CD
    {
        Key;
        Mandatory;
        Length = "5";
        Decimals = "0";
        DBTableName = "TUWRT";
        SType = "Text";
        Label = "Table Type";
    }

    INOUT MIR-UWRT-MAX-AGE
    {
        Key;
        Mandatory;
        Length = "3";
        Decimals = "0";
        DBTableName = "TUWRT";
        SType = "Number";
        Label = "Maximum Age";
    }

    INOUT MIR-UWRT-SEX-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RAT-STD-SEX-CD";
        DBTableName = "TUWRT";
        SType = "Selection";
        Label = "Sex";
    }


    INOUT MIR-UWRT-UW-TBL-RNG-1-QTY
    {
        Key;
        Mandatory;
        Length = "4";
        Decimals = "1";
        DBTableName = "TUWRT";
        SType = "Number";
        Signed;
        Label = "Range 1 Maximum";
    }

    INOUT MIR-UWRT-UW-TBL-RNG-2-QTY
    {
        Key;
        Length = "4";
        Decimals = "1";
        DBTableName = "TUWRT";
        SType = "Number";
        Signed;
        Label = "Range 2 Maximum";
    }


    OUT MIR-DV-UW-TBL-RNG1
    {
        Length = "15";
        DBTableName = "TUWRT";
        SType = "Text";
        Label = "XXXXXXrg1";
    }

    OUT MIR-DV-UW-TBL-RNG2
    {
        Length = "15";
        DBTableName = "TUWRT";
        SType = "Text";
        Label = "XXXXXXrg2";
    }

    IN MIR-UWRT-PASS-FAIL-IND
    {
        Length = "1";
        DBTableName = "TUWRT";
        SType = "Text";
        Label = "Pass/Fail";
    }

    IN MIR-UWRT-SCORE-NUM
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TUWRT";
        SType = "Number";
        Signed;
        Label = "Score";
    }

}


