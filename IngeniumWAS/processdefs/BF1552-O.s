# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:45 PM EDT

#*******************************************************************************
#*  Component:   BF1552-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1552-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    IN MIR-BAD-LAB-INFO-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Test results are unacceptable";
    }

    IN MIR-BLOOD-DRW-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Blood Sample Drawn";
    }

    IN MIR-BLOOD-DRW-TIME
    {
        DisplayOnly;
        Length = "4";
        SType = "Time";
        Label = "Time Blood Sample Drawn";
    }

    IN MIR-CLI-LTST-LAB-ID
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LABCD";
        SType = "Text";
        Label = "Laboratory Name";
    }

    IN MIR-CLI-LTST-RMRK-TXT
    {
        DisplayOnly;
        Length = "204";
        SType = "Text";
        Label = "Remarks";
    }

    IN MIR-CLI-LTST-RSLT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "TSTRS";
        SType = "Text";
        Label = "Test Range Result";
    }

    IN MIR-CLI-LTST-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-LTST-STAT-CD";
        SType = "Text";
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

    IN MIR-LAB-GEN-REF-ID
    {
        DisplayOnly;
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

    IN MIR-LAB-RMRK-NUM
    {
        DisplayOnly;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        SType = "Text";
        Label = "Lab Remark";
    }

    IN MIR-PREV-MEAL-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Meal Date";
    }

    IN MIR-PREV-MEAL-TIME
    {
        DisplayOnly;
        Length = "4";
        SType = "Time";
        Label = "Last Meal Time";
    }

    IN MIR-SAMPL-VOID-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Urinalysis Sample Taken";
    }

    IN MIR-SERUM-DESC-TXT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Appearance of Serum";
    }

    IN MIR-STAT-CHNG-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "TSTRE";
        SType = "Text";
        Label = "Reason Status Changed";
    }

    IN MIR-UNIT-MESUR-TXT
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Unit of Measure";
    }

    IN MIR-URIN-DESC-TXT
    {
        DisplayOnly;
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

