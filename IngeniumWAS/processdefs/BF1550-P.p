# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1550-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1550-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1550";
        BusinessFunctionName = "Matched Client Lab Tests Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM1380";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-LTST-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TLABR";
        SType = "Date";
        Label = "Date Test Performed";
    }

    IN MIR-CLI-LTST-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Sequence";
    }

    IN MIR-LTST-ID
    {
        Key;
        Mandatory;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        DBTableName = "TLABR";
        SType = "Selection";
        Label = "Test Number";
    }

    OUT MIR-ALPHA-RESP-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "LABTN";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Alpha Result Edit Pointer";
    }

    OUT MIR-BAD-LAB-INFO-IND
    {
        Length = "1";
        DBTableName = "TLABR";
        SType = "Indicator";
        Label = "Test results are unacceptable";
    }

    OUT MIR-BLOOD-DRW-DT
    {
        Length = "10";
        DBTableName = "TLABR";
        SType = "Date";
        Label = "Date Blood Sample Drawn";
    }

    OUT MIR-BLOOD-DRW-TIME
    {
        Length = "4";
        DBTableName = "TLABR";
        SType = "Time";
        Label = "Time Blood Sample Drawn";
    }

    OUT MIR-CLI-LTST-LAB-ID
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LABCD";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Laboratory Name";
    }

    OUT MIR-CLI-LTST-RMRK-TXT
    {
        Length = "204";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Remarks";
    }

    OUT MIR-CLI-LTST-RSLT-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "TSTRS";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Test Range Result";
    }

    OUT MIR-CLI-LTST-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-LTST-STAT-CD";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Test Status";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-CO-MAX-NRNG-QTY
    {
        Length = "7";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Maximum - Company";
    }

    OUT MIR-CO-MIN-NRNG-QTY
    {
        Length = "7";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Minimum - Company";
    }

    OUT MIR-DV-CLI-INSRD-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Age";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-LAB-GEN-REF-ID
    {
        Length = "20";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Laboratory Reference Number";
    }

    OUT MIR-LAB-MAX-NRNG-QTY
    {
        Length = "7";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Maximum - Lab";
    }

    OUT MIR-LAB-MIN-NRNG-QTY
    {
        Length = "7";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Minimum - Lab";
    }

    OUT MIR-LAB-RMRK-NUM
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Lab Remark";
    }

    OUT MIR-PREV-MEAL-DT
    {
        Length = "10";
        DBTableName = "TLABR";
        SType = "Date";
        Label = "Last Meal Date";
    }

    OUT MIR-PREV-MEAL-TIME
    {
        Length = "4";
        DBTableName = "TLABR";
        SType = "Time";
        Label = "Last Meal Time";
    }

    OUT MIR-RSLT-REC-CREAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RSLT-REC-CREAT-CD";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Test Creation Type";
    }

    OUT MIR-SAMPL-VOID-DT
    {
        Length = "10";
        DBTableName = "TLABR";
        SType = "Date";
        Label = "Date Urinalysis Sample Taken";
    }

    OUT MIR-SERUM-DESC-TXT
    {
        Length = "8";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Appearance of Serum";
    }

    OUT MIR-STAT-CHNG-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "TSTRE";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Reason Status Changed";
    }

    OUT MIR-UNIT-MESUR-TXT
    {
        Length = "5";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Unit of Measure";
    }

    OUT MIR-URIN-DESC-TXT
    {
        Length = "204";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Appearance of Urine";
    }

}

