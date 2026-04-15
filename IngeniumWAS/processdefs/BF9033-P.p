# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT


#*******************************************************************************
#*  Component:   BF9033-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  01aug01  New for NB10                                              *
#*                                                                             *
#*******************************************************************************

P-STEP BF9033-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9033";
        BusinessFunctionName = "UW Range Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "NCWM9033";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-UWRT-TBL-TYP-CD
    {
        Key;
        Mandatory;
        Length = "5";
        Decimals = "0";
        CodeSource = "EDIT";
        CodeType = "UWRT";
        DBTableName = "TUWRT";
        SType = "Selection";
        Label = "Table Type";
    }

    IN MIR-UWRT-MAX-AGE
    {
        Key;
        Mandatory;
        Length = "3";
        Decimals = "0";
        DBTableName = "TUWRT";
        SType = "Number";
        Label = "Maximum Age";
    }

    IN MIR-UWRT-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RAT-STD-SEX-CD";
        DBTableName = "TUWRT";
        SType = "Selection";
        Label = "Sex";
    }


    IN MIR-UWRT-UW-TBL-RNG-1-QTY
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

    IN MIR-UWRT-UW-TBL-RNG-2-QTY
    {
        Key;
        Length = "4";
        Decimals = "1";
        DBTableName = "TUWRT";
        SType = "Number";
        Signed;
        Label = "Range 2 Maximum";
    }


}


