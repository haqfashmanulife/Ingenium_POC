# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:11 PM EDT
#*******************************************************************************
#*  Component:   BF9790-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02AC03  01MAY02  Module created                                            *
#*  U40065  06AUG04  Add new AVE fields MAX-RENW-DUR and AFTR-MAX-RENW-DUR     *
#*  MP7603  10MAR09  Added new field MIR-COMM-UPDT-CUT-DT                      *
#*                                                                             *
#*******************************************************************************

S-STEP BF9790-O
{
    ATTRIBUTES
    {
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

    IN MIR-PLAN-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Ingenium Plan";
    }

    IN MIR-CVG-STAT-TYP-CD
    {
        Key;
        DisplayOnly;
        Length = "6";
        CodeSource = "DataModel";
        CodeType = "CVG-STAT-TYP-CD";
        SType = "Text";
        Label = "Coverage Type";
    }

    IN MIR-PLAN-ID-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Ingenium Plan ID";
    }

    IN MIR-AVE-PLAN-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "AVE Plan Code";
    }

    IN MIR-AUTO-RENW-IND
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "AVE-AUTO-RENW-IND";
        SType = "Text";
        Label = "Auto Renewal";
    }

    IN MIR-RENW-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Renewal Product Name";
    }

    IN MIR-RENW-PLAN-ID-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Renewal Product ID";
    }

    IN MIR-MAX-RENW-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Renewal Age";
    }

    IN MIR-MAX-RENW-DUR
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Renewal Term";
    }

    IN MIR-AFTR-MAX-RENW-DUR
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Renewal Term After Maximum Age";
    }

    IN MIR-MAX-AGE-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Max Age Product Name";
    }

    IN MIR-MAX-AGE-PLAN-ID-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Max Age Product ID";
    }

    IN MIR-MALE-MAX-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Renewal Age - Male";
    }

    IN MIR-FEMALE-MAX-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Renewal Age - Female";
    }

    IN MIR-SUPP-BNFT-CD
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Supplemental Benefit Indicator";
    }

    IN MIR-MAX-GRS-PREM-QTY
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Gross Premium";
    }

    IN MIR-AVE-UNIT-VALU-AMT
    {
        DisplayOnly;
        Length = "7";
        Decimals = "0";
        Signed;
        SType = "Number";
        Label = "AVE Unit Value";
    }

#MP7603 changes starts
    IN MIR-COMM-UPDT-CUT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Commission Revision Cut-off Date";
    }
#MP7603 changes Ends    

    IN MIR-SUPP-VCTR-CALC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SUPP-VCTR-CALC-CD";
        SType = "Text";
        Label = "Supp Vector Calculation Ind";
    }

    IN MIR-PREM-VCTR-CALC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-VCTR-CALC-CD";
        SType = "Text";
        Label = "Prem Vector Calculation Ind";
    }

    IN MIR-CSV-VCTR-CALC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSV-VCTR-CALC-CD";
        SType = "Text";
        Label = "CSV Vector Calculation Ind";
    }

    IN MIR-PLAN-EXT-1-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Ext - Plan Code 1-2";
    }

    IN MIR-PLAN-EXT-2-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Ext - Plan Code 3-4";
    }

    IN MIR-AMT-INS-EXT-1-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Amt of Insce Rate 1-2";
    }

    IN MIR-AMT-INS-EXT-2-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Amt of Insce Rate 3-4";
    }

    IN MIR-PREM-EXT-1-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Premium Rate 1-2";
    }

    IN MIR-PREM-EXT-2-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Premium Rate 3-4";
    }

    IN MIR-CSV-EXT-1-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: CSV Insce Rate 1-2";
    }

    IN MIR-CSV-EXT-2-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: CSV Insce Rate 3-4";
    }

    IN MIR-COMM-EXT-1-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Commission Rate 1-2";
    }

    IN MIR-COMM-EXT-2-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Commission Rate 3-4";
    }

    IN MIR-DIV-EXT-1-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Dividend Rate 1-2";
    }

    IN MIR-DIV-EXT-2-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Dividend Rate 3-4";
    }

    IN MIR-RSRV-EXT-1-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Reserve Rate 1-2";
    }

    IN MIR-RSRV-EXT-2-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Reserve Rate 3-4";
    }

    IN MIR-LAPS-EXT-1-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Lapse Rate 1-2";
    }

    IN MIR-LAPS-EXT-2-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Lapse Rate 3-4";
    }

    IN MIR-ADDL-1-EXT-1-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 1 1-2";
    }

    IN MIR-ADDL-1-EXT-2-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 1 3-4";
    }

    IN MIR-ADDL-2-EXT-1-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 2 1-2";
    }

    IN MIR-ADDL-2-EXT-2-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 2 3-4";
    }

    IN MIR-ADDL-3-EXT-1-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 3 1-2";
    }

    IN MIR-ADDL-3-EXT-2-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 3 3-4";
    }

    IN MIR-ADDL-4-EXT-1-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 4 1-2";
    }

    IN MIR-ADDL-4-EXT-2-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 4 3-4";
    }

    IN MIR-ADDL-5-EXT-1-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 5 1-2";
    }

    IN MIR-ADDL-5-EXT-2-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 5 3-4";
    }

}

