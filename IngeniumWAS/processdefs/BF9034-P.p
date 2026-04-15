# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT


#*******************************************************************************
#*  Component:   BF9034-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  01aug01   New for release NB10                                     *
#*                                                                             *
#*******************************************************************************

P-STEP BF9034-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9034";
        BusinessFunctionName = "UW Rate Table List";
        BusinessFunctionType = "List";
        MirName = "NCWM9034";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-UWRT-TBL-TYP-CD
    {
        Key;
        Length = "5";
        Decimals = "0";
        CodeSource = "EDIT";
        CodeType = "UWRT";
        DBTableName = "TUWRT";
        SType = "Selection";
        Label = "Table Type";
    }

    INOUT MIR-UWRT-MAX-AGE
    {
        Key;
        Length = "3";
        Decimals = "0";
        DBTableName = "TUWRT";
        SType = "Number";
        Label = "Maximum Age";
    }

    INOUT MIR-UWRT-SEX-CD
    {
        Key;
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
        Length = "4";
        Decimals = "1";
        DBTableName = "TUWRT";
        SType = "Number";
        Signed;
	DefaultConstant = "-999";
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
	DefaultConstant = "-999";
        Label = "Range 2 Maximum";
    }

    OUT MIR-UWRT-TBL-TYP-CD-T[20]
    {
        Length = "5";
        FieldGroup = "Table20";
        DBTableName = "TUWRT";
        SType = "Text";
        Label = "Table Type";
        Index = "1";
    }

    OUT MIR-UWRT-MAX-AGE-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "TUWRT";
        SType = "Text";
        Label = "Maximum Age";
        Index = "1";
    }

    OUT MIR-UWRT-SEX-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TUWRT";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-UWRT-UW-TBL-RNG-1-QTY-T[20]
    {
        Length = "4";
        FieldGroup = "Table20";
        DBTableName = "TUWRT";
        SType = "Text";
        Label = "Range 1 Maximum";
        Index = "1";
    }

    OUT MIR-UWRT-UW-TBL-RNG-2-QTY-T[20]
    {
        Length = "4";
        FieldGroup = "Table20";
        DBTableName = "TUWRT";
        SType = "Text";
        Label = "Range 2 Maximum";
        Index = "1";
    }

    OUT MIR-UWRT-PASS-FAIL-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TUWRT";
        SType = "Text";
        Label = "Pass/Fail";
        Index = "1";
    }

    OUT MIR-UWRT-SCORE-NUM-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "TUWRT";
        SType = "Text";
        Label = "Score:";
        Index = "1";
    }
   OUT MIR-UWRT-TBL-TYP-CD-H[20]
    {
        Length = "5";
        FieldGroup = "Table20";
        DBTableName = "TUWRT";
        SType = "Text";
        Label = "Table Type";
        Index = "1";
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

}


