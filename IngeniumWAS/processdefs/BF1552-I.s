# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:45 PM EDT

#*******************************************************************************
#*  Component:   BF1552-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1552-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-DOC-ID";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-BAD-LAB-INFO-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Test results are unacceptable";
    }

    INOUT MIR-BLOOD-DRW-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Date Blood Sample Drawn";
    }

    INOUT MIR-BLOOD-DRW-TIME
    {
        Length = "4";
        SType = "Time";
        Label = "Time Blood Sample Drawn";
    }

    INOUT MIR-CLI-LTST-LAB-ID
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LABCD";
        SType = "Selection";
        Label = "Laboratory Name";
    }

    INOUT MIR-CLI-LTST-RMRK-TXT
    {
        Length = "204";
        SType = "Text";
        Label = "Remarks";
    }

    INOUT MIR-CLI-LTST-RSLT-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "TSTRS";
        SType = "Text";
        Label = "Test Range Result";
    }

    INOUT MIR-CLI-LTST-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-LTST-STAT-CD";
        SType = "Selection";
        Label = "Test Status";
    }

    IN MIR-CO-MAX-NRNG-QTY
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Maximum - Company";
    }

    IN MIR-CO-MIN-NRNG-QTY
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Minimum - Company";
    }

    INOUT MIR-LAB-GEN-REF-ID
    {
        Length = "20";
        SType = "Text";
        Label = "Laboratory Reference Number";
    }

    IN MIR-LAB-MAX-NRNG-QTY
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Maximum - Lab";
    }

    IN MIR-LAB-MIN-NRNG-QTY
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Minimum - Lab";
    }

    INOUT MIR-LAB-RMRK-NUM
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        SType = "Selection";
        Label = "Lab Remark";
    }

    INOUT MIR-PREV-MEAL-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Last Meal Date";
    }

    INOUT MIR-PREV-MEAL-TIME
    {
        Length = "4";
        SType = "Time";
        Label = "Last Meal Time";
    }

    INOUT MIR-SAMPL-VOID-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Date Urinalysis Sample Taken";
    }

    INOUT MIR-SERUM-DESC-TXT
    {
        Length = "8";
        SType = "Text";
        Label = "Appearance of Serum";
    }

    INOUT MIR-STAT-CHNG-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "TSTRE";
        SType = "Selection";
        Label = "Reason Status Changed";
    }

    IN MIR-UNIT-MESUR-TXT
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Unit of Measure";
    }

    INOUT MIR-URIN-DESC-TXT
    {
        Length = "204";
        SType = "Text";
        Label = "Appearance of Urine";
    }

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-LTST-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Test Performed";
    }

    IN MIR-CLI-LTST-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence";
    }

    INOUT MIR-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Selection";
        Label = "Document Name";
    }

    IN MIR-LTST-ID
    {
        Key;
        DisplayOnly;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        SType = "Text";
        Label = "Test Number";
    }

    IN MIR-ALPHA-RESP-ETBL-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "EDIT";
        SType = "Text";
        Label = "Alpha Result Edit Pointer";
    }

    IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-DV-CLI-INSRD-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-RSLT-REC-CREAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RSLT-REC-CREAT-CD";
        SType = "Text";
        Label = "Test Creation Type";
    }

}

