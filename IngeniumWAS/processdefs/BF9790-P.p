# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT
#*******************************************************************************
#*  Component:   BF9790-P.p                                                    *
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

P-STEP BF9790-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9790";
        BusinessFunctionName = "AVE Reformat Control Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9790";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Ingenium Plan Code";
    }

    INOUT MIR-CVG-STAT-TYP-CD
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "DataModel";
        CodeType = "CVG-STAT-TYP-CD";
        SType = "Selection";
        Label = "Coverage Type";
    }

    OUT MIR-PLAN-ID-2
    {
        Length = "6";
        SType = "Text";
        Label = "Ingenium Plan ID";
    }

    OUT MIR-AVE-PLAN-ID
    {
        Length = "8";
        SType = "Text";
        Label = "AVE Plan Code";
    }

    OUT MIR-AUTO-RENW-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "AVE-AUTO-RENW-IND";
        SType = "Text";
        Label = "Auto Renewal";
    }

    OUT MIR-RENW-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Renewal Product Name";
    }

    OUT MIR-RENW-PLAN-ID-2
    {
        Length = "6";
        SType = "Text";
        Label = "Renewal Product ID";
    }

    OUT MIR-MAX-RENW-AGE
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Renewal Age";
    }

    OUT MIR-MAX-RENW-DUR
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Renewal Term";
    }

    OUT MIR-AFTR-MAX-RENW-DUR
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Renewal Term After Maximum Age";
    }

    OUT MIR-MAX-AGE-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Max Age Product Name";
    }

    OUT MIR-MAX-AGE-PLAN-ID-2
    {
        Length = "6";
        SType = "Text";
        Label = "Max Age Product ID";
    }

    OUT MIR-MALE-MAX-AGE
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Renewal Age - Male";
    }

    OUT MIR-FEMALE-MAX-AGE
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Renewal Age - Female";
    }

    OUT MIR-SUPP-BNFT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SUPP-BNFT-CD";
        SType = "Text";
        Label = "Supplemental Benefit Indicator";
    }

    OUT MIR-MAX-GRS-PREM-QTY
    {
        Length = "3";
        SType = "Text";
        Label = "Gross Premium";
    }

    OUT MIR-AVE-UNIT-VALU-AMT
    {
        Length = "7";
        Decimals = "0";
        Signed;
        SType = "Number";
        Label = "AVE Unit Value";
    }

#MP7603 changes starts
    OUT MIR-COMM-UPDT-CUT-DT
    {
        Length = "10";
        DBTableName = "TAVE";
        SType = "Date";
        Label = "Commission Revision Cut-off Date";
    }
#MP7603 changes Ends

    OUT MIR-SUPP-VCTR-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SUPP-VCTR-CALC-CD";
        SType = "Text";
        Label = "Supp Vector Calculation Ind";
    }

    OUT MIR-PREM-VCTR-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-VCTR-CALC-CD";
        SType = "Text";
        Label = "Prem Vector Calculation Ind";
    }

    OUT MIR-CSV-VCTR-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSV-VCTR-CALC-CD";
        SType = "Text";
        Label = "CSV Vector Calculation Ind";
    }

    OUT MIR-PLAN-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Ext - Plan Code 1-2";
    }

    OUT MIR-PLAN-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Ext - Plan Code 3-4";
    }

    OUT MIR-AMT-INS-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Amt of Insce Rate 1-2";
    }

    OUT MIR-AMT-INS-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Amt of Insce Rate 3-4";
    }

    OUT MIR-PREM-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Premium Rate 1-2";
    }

    OUT MIR-PREM-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Premium Rate 3-4";
    }

    OUT MIR-CSV-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: CSV Insce Rate 1-2";
    }

    OUT MIR-CSV-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: CSV Insce Rate 3-4";
    }

    OUT MIR-COMM-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Commission Rate 1-2";
    }

    OUT MIR-COMM-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Commission Rate 3-4";
    }

    OUT MIR-DIV-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Dividend Rate 1-2";
    }

    OUT MIR-DIV-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Dividend Rate 3-4";
    }

    OUT MIR-RSRV-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Reserve Rate 1-2";
    }

    OUT MIR-RSRV-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Reserve Rate 3-4";
    }

    OUT MIR-LAPS-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Lapse Rate 1-2";
    }

    OUT MIR-LAPS-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Lapse Rate 3-4";
    }

    OUT MIR-ADDL-1-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 1 1-2";
    }

    OUT MIR-ADDL-1-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 1 3-4";
    }

    OUT MIR-ADDL-2-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 2 1-2";
    }

    OUT MIR-ADDL-2-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 2 3-4";
    }

    OUT MIR-ADDL-3-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 3 1-2";
    }

    OUT MIR-ADDL-3-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 3 3-4";
    }

    OUT MIR-ADDL-4-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 4 1-2";
    }

    OUT MIR-ADDL-4-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 4 3-4";
    }

    OUT MIR-ADDL-5-EXT-1-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 5 1-2";
    }

    OUT MIR-ADDL-5-EXT-2-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Extension: Additional Ratefile 5 3-4";
    }

}

