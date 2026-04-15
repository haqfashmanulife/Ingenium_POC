# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1552-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1552-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1552";
        BusinessFunctionName = "Matched Client Lab Tests Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM1380";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BAD-LAB-INFO-IND
    {
        Length = "1";
        DBTableName = "TLABR";
        SType = "Indicator";
        Label = "Test results are unacceptable";
    }

    INOUT MIR-BLOOD-DRW-DT
    {
        Length = "10";
        DBTableName = "TLABR";
        SType = "Date";
        Label = "Date Blood Sample Drawn";
    }

    INOUT MIR-BLOOD-DRW-TIME
    {
        Length = "4";
        DBTableName = "TLABR";
        SType = "Time";
        Label = "Time Blood Sample Drawn";
    }

    INOUT MIR-CLI-LTST-LAB-ID
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LABCD";
        DBTableName = "TLABR";
        SType = "Selection";
        Label = "Laboratory Name";
    }

    INOUT MIR-CLI-LTST-RMRK-TXT
    {
        Length = "204";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Remarks";
    }

    INOUT MIR-CLI-LTST-RSLT-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "TSTRS";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Test Range Result";
    }

    INOUT MIR-CLI-LTST-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-LTST-STAT-CD";
        DBTableName = "TLABR";
        SType = "Selection";
        Label = "Test Status";
    }

    INOUT MIR-LAB-GEN-REF-ID
    {
        Length = "20";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Laboratory Reference Number";
    }

    INOUT MIR-LAB-RMRK-NUM
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        DBTableName = "TLABR";
        SType = "Selection";
        Label = "Lab Remark";
    }

    INOUT MIR-PREV-MEAL-DT
    {
        Length = "10";
        DBTableName = "TLABR";
        SType = "Date";
        Label = "Last Meal Date";
    }

    INOUT MIR-PREV-MEAL-TIME
    {
        Length = "4";
        DBTableName = "TLABR";
        SType = "Time";
        Label = "Last Meal Time";
    }

    INOUT MIR-SAMPL-VOID-DT
    {
        Length = "10";
        DBTableName = "TLABR";
        SType = "Date";
        Label = "Date Urinalysis Sample Taken";
    }

    INOUT MIR-SERUM-DESC-TXT
    {
        Length = "8";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Appearance of Serum";
    }

    INOUT MIR-STAT-CHNG-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "TSTRE";
        DBTableName = "TLABR";
        SType = "Selection";
        Label = "Reason Status Changed";
    }

    INOUT MIR-URIN-DESC-TXT
    {
        Length = "204";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Appearance of Urine";
    }

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

    IN MIR-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TDOCM";
        SType = "Selection";
        Label = "Document Name";
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
        Decimals = "0";
        DBTableName = "TLABR";
        SType = "Number";
        Label = "Maximum - Company";
    }

    OUT MIR-CO-MIN-NRNG-QTY
    {
        Length = "7";
        Decimals = "0";
        DBTableName = "TLABR";
        SType = "Number";
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

    OUT MIR-LAB-MAX-NRNG-QTY
    {
        Length = "7";
        Decimals = "0";
        DBTableName = "TLABR";
        SType = "Number";
        Label = "Maximum - Lab";
    }

    OUT MIR-LAB-MIN-NRNG-QTY
    {
        Length = "7";
        Decimals = "0";
        DBTableName = "TLABR";
        SType = "Number";
        Label = "Minimum - Lab";
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

    OUT MIR-UNIT-MESUR-TXT
    {
        Length = "5";
        DBTableName = "TLABR";
        SType = "Text";
        Label = "Unit of Measure";
    }

}

