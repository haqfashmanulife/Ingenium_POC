#*******************************************************************************
#*  Component:   BF9985-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#     Release  Description                                              *
#*                                                                             *
#*  MFFPI    JE       NEW FOR PA INQUIRY - FUND INQUIRY SCREEN                 *
#*******************************************************************************

P-STEP BF9985-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9985";
        BusinessFunctionName = "PA - Fund Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9985";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-SCRN-PATH-IND;

    INOUT MIR-MORE-REC-IND;

    INOUT MIR-SAVE-POL-ID-BASE;
    
    INOUT MIR-POL-CVG-REC-CTR;

    INOUT MIR-USER-LANG-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-POL-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Paid to Date";
    }
     
    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Policy Status";
    }

    OUT MIR-DV-POL-FND-CVG-REC-CTR
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number of SA Riders";
    }    

    OUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Modal Premium as of Paid to Date";
    }

    OUT MIR-POL-GRS-APREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount of Gross Annual Premium";
    }
     
    OUT MIR-DV-TOT-SA-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "SA Rider Premium";
    }

    OUT MIR-POL-UL-SHRT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Shortage Amount";
    }

    OUT MIR-POL-CNVR-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Conversion Policy Type Code";
    }

#*                                                 Basic Information
    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan ID";
    }

    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Issue Date of the Policy";
    }

    OUT MIR-RECPT-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCWAR";
        SType = "Date";
        Label = "Receipt Date";
        Index = "1";
    }

    OUT MIR-PROD-APP-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Product Application Type Code";
    }

    OUT MIR-POL-SUB-STAT-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Policy Sub Status";
    }

    OUT MIR-FREE-XFER-QTY
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Number of Free Transfer Ramaining";
    }

#*                                               SA Rider Information
    OUT MIR-CVG-NUM1-T[9]
    {
        Length = "2";
        FieldGroup = "Table1";        
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD1-T[9]
    {
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-DV-INSRD-CLI-NM1-T[9]
    {
        Length = "75";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    OUT MIR-CVG-RT-AGE1-T[9]
    {
        Length = "3";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Age of Insured";
        Index = "1";
    }

    OUT MIR-CVG-XPCT-ANTY-AGE1-T[9]
    {
        Length = "3";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Annuity Age";
        Index = "1";
    }

    OUT MIR-CVG-PMT-LTD-AMT1-T[9]
    {
        Length = "16";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Gross Premium Paid to Date";
        Index = "1";
    }

    OUT MIR-DV-PMT-LTD-AMT1-T[9]
    {
        Length = "16";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Net Premium Paid to Date";
        Index = "1";
    }

    OUT MIR-CVG-SURR-LTD-AMT1-T[9]
    {
        Length = "16";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Gross Surrendered to Date";
        Index = "1";
    }

    OUT MIR-DV-SURR-LTD-AMT1-T[9]
    {
        Length = "16";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Net Premium Paid to Date";
        Index = "1";
    }

#*                                               Fund Surrender Value Information
    OUT MIR-CVG-NUM2-T[27]
    {
        Length = "2";
        FieldGroup = "Table2";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-FND-ID2-T[27]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }

    OUT MIR-FND-UNIT-VALU2-T[27]
    {
        Signed;
        Length = "17";
        Decimals = "9";
        FieldGroup = "Table2";
        Index = "1";
        SType = "Currency";
        Label = "Fund Unit Price";
    }

    OUT MIR-FND-UNIT-QTY2-T[27]
    {
        Signed;
        Length = "17";
        Decimals = "4";
        FieldGroup = "Table2";
        Index = "1";
        SType = "Number";
        Label = "Fund Unit Balance";
    }

    OUT MIR-FND-ACUM-VAL2-T[27]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table2";
        Index = "1";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Accumulated Fund Value";
    }

    OUT MIR-DV-ACUM-FND-VAL2-T[27]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table2";
        Index = "1";
        DBTableName = "Derived";
        Label = "Accumulated Coverage Value";
        Index = "1";
    }

    OUT MIR-DV-SURRCHRG2-T[27]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table2";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Surrender Charge";
        Index = "1";
    }

    OUT MIR-DV-NET-GCSV-AMT2-T[27]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Coverage Net Surrender Value";
        Index = "1";
    }
 
    OUT MIR-DV-JS-LOAD-CD2-T[27]
    {
        Length = "1";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Java Script Load Code";
        Index = "1";
    }

#*                                               Fund Allocation Information
    OUT MIR-PAI-DV-POL-PAYO-TYP-CD3-T[196]
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PAI-DV-POL-PAYO-TYP-CD";
        DBTableName = "TMAD";
        SType = "Text";
        Label = "Allocation Type";
        Index = "1";
    }

    OUT MIR-CDI-EFF-DT3-T[196]
    {
        Length = "10";
        FieldGroup = "Table3";
        DBTableName = "TFA";
        SType = "Date";
        Label = "Activity Effective Date";
        Index = "1";
    }

    OUT MIR-CVG-NUM3-T[196]
    {
        Length = "2";
        FieldGroup = "Table3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-PLAN-ID3-T[196]
    {
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD3-T[196]
    {
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-DV-FND-DESC-TXT3-T[196]
    {
        Length = "40";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Fund Name";
        Index = "1";
    }

    OUT MIR-CDI-ALLOC-PCT3-T[196]
    {
        Length = "7";
        Decimals = "0";
        FieldGroup = "Table3";
        DBTableName = "TCDSI";
        SType = "Percent";
        Label = "Allocation Percentage to Fund";
        Index = "1";    
    }

    OUT MIR-CDI-ALLOC-AMT3-T[196]
    {
        Length = "15";
        FieldGroup = "Table3";
        DBTableName = "TCDSI";
        SType = "Currency";
        Label = "Amount Allocation to Fund";
        Index = "1";
    }

#*                                               Fund Activity Information
    OUT MIR-CVG-NUM4-T[6]
    {
        Length = "2";
        FieldGroup = "Table4";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-CIA-EFF-DT4-T[6]
    {
        Length = "10";
        FieldGroup = "Table4";
        DBTableName = "TFA";
        SType = "Date";
        Label = "Activity Effective Date";
        Index = "1";
    }

    OUT MIR-PAI-CIA-REASN-CD4-T[6]
    {
        Length = "3";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "PAI-CIA-REASN-CD";
        DBTableName = "TMAD";
        SType = "Text";
        Label = "Activity Reason";
        Index = "1";
    }

    OUT MIR-CIA-FND-TRXN-AMT4-T[6]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table4";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Gross Amount";
        Index = "1";
    }

    OUT MIR-CIA-CLI-TRXN-AMT4-T[6]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table4";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Net Amount";
        Index = "1";
    }

    OUT MIR-CIA-LOAD-AMT4-T[6]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table4";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Transfer Charges";
        Index = "1";
    }

    OUT MIR-CIA-REVRS-PRCES-DT4-T[6]
    {
        Length = "9";
        FieldGroup = "Table4";
        DBTableName = "TFA";
        SType = "Date";
        Label = "Effective Date of Reversal";
        Index = "1";
    }

}