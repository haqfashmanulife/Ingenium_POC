# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:11 PM EDT

#*******************************************************************************
#*  Component:   BF9792-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  2BAC03  05MAY02  Module created                                            *
#*  U40065  06AUG04  Add new AVE fields MAX-RENW-DUR and AFTR-MAX-RENW-DUR     *
#*  MP7603  10MAR09  Added new field MIR-COMM-UPDT-CUT-DT                      *
#*                                                                             *
#*******************************************************************************

S-STEP BF9792-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-AVE-PLAN-ID";
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

    IN MIR-PLAN-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Ingenium Plan Code";
    }

    IN MIR-PLAN-ID-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Ingenium Plan ID";
    }

    IN MIR-CVG-STAT-TYP-CD
    {
        Key;
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Coverage Type";
    }

    INOUT MIR-AVE-PLAN-ID
    {
        Length = "8";
        SType = "Text";
        Label = "AVE Plan Code";
    }

    INOUT MIR-AUTO-RENW-IND
    {
        Length = "6";
        CodeSource = "DataModel";
        CodeType = "AUTO-RENW-IND";
        SType = "Selection";
        Label = "Auto Renewal";
    }

    INOUT MIR-RENW-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLANC";
        SType = "Selection";
        Label = "Ingenium Plan";
    }

    INOUT MIR-MAX-RENW-AGE
    {
        Length = "3";
        SType = "Text";
        Label = "Plan Maximum Renewal Age";
    }

    INOUT MIR-MAX-RENW-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Maximum Renewal Term";
    }

    INOUT MIR-AFTR-MAX-RENW-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Renewal Term After Maximum Age";
    }

    INOUT MIR-MAX-AGE-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLANC";
        SType = "Selection";
        Label = "Maximum Age Renewal Plan";
    }

    INOUT MIR-MALE-MAX-AGE
    {
        Length = "3";
        SType = "Text";
        Label = "Maximum Benefit Period Age, Male";
    }

    INOUT MIR-FEMALE-MAX-AGE
    {
        Length = "3";
        SType = "Text";
        Label = "Maximum Benefit Period Age, Female";
    }

    INOUT MIR-SUPP-BNFT-CD
    {
        Length = "4";
        SType = "Text";
        Label = "Supplementary Benefit Code";
    }

    INOUT MIR-MAX-GRS-PREM-QTY
    {
        Length = "3";
        SType = "Text";
        Label = "Max Annual Gross Premium";
    }

    INOUT MIR-AVE-UNIT-VALU-AMT
    {
        Length = "7";
        Decimals = "0";
        SType = "Number";
        Label = "AVE Unit Value";
    }
    
#MP7603 changes starts
    INOUT MIR-COMM-UPDT-CUT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Commission Revision Cut-off Date";
    }
#MP7603 changes Ends    

    INOUT MIR-SUPP-VCTR-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SUPP-VCTR-CALC-CD";
        SType = "Selection";
        Label = "Supp Vector Calculation Ind";
    }

    INOUT MIR-PREM-VCTR-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-VCTR-CALC-CD";
        SType = "Selection";
        Label = "Prem Vector Calculation Ind";
    }

    INOUT MIR-CSV-VCTR-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSV-VCTR-CALC-CD";
        SType = "Selection";
        Label = "CSV Vector Calculation Ind";
    }

    INOUT MIR-PLAN-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Ext - Plan Code 1-2";
    }

    INOUT MIR-PLAN-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Ext - Plan Code 3-4";
    }

    INOUT MIR-AMT-INS-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Amt of Insce Rate 1-2";
    }

    INOUT MIR-AMT-INS-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Amt of Insce Rate 3-4";
    }

    INOUT MIR-PREM-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Premium Rate 1-2";
    }

    INOUT MIR-PREM-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Premium Rate 3-4";
    }

    INOUT MIR-CSV-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: CSV Insce Rate 1-2";
    }

    INOUT MIR-CSV-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: CSV Insce Rate 3-4";
    }

    INOUT MIR-COMM-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Commission Rate 1-2";
    }

    INOUT MIR-COMM-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Commission Rate 3-4";
    }

    INOUT MIR-DIV-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Dividend Rate 1-2";
    }

    INOUT MIR-DIV-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Dividend Rate 3-4";
    }

    INOUT MIR-RSRV-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Reserve Rate 1-2";
    }

    INOUT MIR-RSRV-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Reserve Rate 3-4";
    }

    INOUT MIR-LAPS-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Lapse Rate 1-2";
    }

    INOUT MIR-LAPS-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Lapse Rate 3-4";
    }

    INOUT MIR-ADDL-1-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 1 1-2";
    }

    INOUT MIR-ADDL-1-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 1 3-4";
    }

    INOUT MIR-ADDL-2-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 2 1-2";
    }

    INOUT MIR-ADDL-2-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 2 3-4";
    }

    INOUT MIR-ADDL-3-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 3 1-2";
    }

    INOUT MIR-ADDL-3-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 3 3-4";
    }

    INOUT MIR-ADDL-4-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 4 1-2";
    }

    INOUT MIR-ADDL-4-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 4 3-4";
    }

    INOUT MIR-ADDL-5-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 5 1-2";
    }

    INOUT MIR-ADDL-5-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 5 3-4";
    }

}

