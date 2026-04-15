#*******************************************************************************
#*  Component:   BF9985-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#     Release  Description                                              *
#*                                                                             *
#*  MFFPI    JE       NEW FOR PA INQUIRY - FUND INQUIRY SCREEN                 *
#*******************************************************************************

S-STEP BF9985-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-POL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy Paid to Date";
    }
    
    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Current Policy Status";
    }
    
    IN MIR-DV-POL-FND-CVG-REC-CTR
    {
        Length = "2";
        SType = "Text";
        Label = "Number of SA Riders";
    }    

    IN MIR-POL-MPREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Modal Premium as of Paid to Date";
    }
    
    IN MIR-POL-GRS-APREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount of Gross Annual Premium";
    }
    
    IN MIR-DV-TOT-SA-PREM-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "SA Rider Premium";
    }
    
    IN MIR-POL-UL-SHRT-AMT 
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Planned Periodic Premium Amount";
    }
    
    IN  MIR-POL-CNVR-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        SType = "Text";
        Label = "Conversion Policy Type Code";
    } 
#*                                                 Basic Information
    IN MIR-PLAN-ID 
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan ID";
    }

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Issue Date of the Policy";
    }
    
    IN MIR-RECPT-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Application Received Date";
        Index = "1";
    }
    
    IN MIR-PROD-APP-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        SType = "Text";
        Label = "Product Application Type Code";
    }    
    
    IN MIR-POL-SUB-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        SType = "Text";
        Label = "Policy Sub Status";
    }
    
    IN MIR-FREE-XFER-QTY
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Free Transfers Ramaining";
    }

#*                                               SA Rider Information
    IN MIR-CVG-NUM1-T[9]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table1";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-CVG-CSTAT-CD1-T[9]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM1-T[9]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    IN MIR-CVG-RT-AGE1-T[9]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Age of Insured";
        Index = "1";
    }

    IN MIR-CVG-XPCT-ANTY-AGE1-T[9]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Annuity Age";
        Index = "1";
    }

    IN MIR-CVG-PMT-LTD-AMT1-T[9]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table1";
        SType = "Currency";
        Label = "Cumulative Gross Premiums Paid to Date";
        Index = "1";
    }

    IN MIR-DV-PMT-LTD-AMT1-T[9]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table1";
        SType = "Currency";
        Label = "Cumulative Net Premiums Paid to Date";
        Index = "1";
    }

    IN MIR-CVG-SURR-LTD-AMT1-T[9]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table1";
        SType = "Currency";
        Label = "Gross Surrendered to Date";
        Index = "1";
    }

    IN MIR-DV-SURR-LTD-AMT1-T[9]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table1";
        SType = "Currency";
        Label = "Net Surrendered to Date";
        Index = "1";
    }

#*                                               Fund Surrender Value Information
    IN MIR-CVG-NUM2-T[27]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table2";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-FND-ID2-T[27]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
     }

    IN MIR-FND-UNIT-VALU2-T[27]
    {
        DisplayOnly;
        Length = "17";
        Decimals = "9";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Fund Unit Price";
        Index = "1";
    }

    IN MIR-FND-UNIT-QTY2-T[27]
    {
        DisplayOnly;
        Length = "17";
        Decimals = "4";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Fund Unit Balance";
        Index = "1";
    }

    IN MIR-FND-ACUM-VAL2-T[27]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Accumulated Fund Value";
        Index = "1";
    }

    IN MIR-DV-ACUM-FND-VAL2-T[27]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Accumulated Coverage Value";
        Index = "1";
    }

    IN MIR-DV-SURRCHRG2-T[27]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Coverage Surrender Charge";
        Index = "1";
    }

    IN MIR-DV-NET-GCSV-AMT2-T[27]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Coverage Net Surrender Value";
        Index = "1";
    }

    IN MIR-DV-JS-LOAD-CD2-T[27]
      {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Java Script Load Code";
        Index = "1";
    }

#*                                               Fund Allocation Information
    IN MIR-PAI-DV-POL-PAYO-TYP-CD3-T[196]
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PAI-DV-POL-PAYO-TYP-CD";
        DBTableName = "TMAD";
        SType = "Text";
        Label = "Allocation Type";
        Index = "1";
    }

    IN MIR-CDI-EFF-DT3-T[196]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table3";
        SType = "Date";
        Label = "Activity Effective Date";
        Index = "1";
    }

    IN MIR-CVG-NUM3-T[196]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-PLAN-ID3-T[196]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
     }

    IN MIR-CVG-CSTAT-CD3-T[196]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-DV-FND-DESC-TXT3-T[196]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Fund Name";
        Index = "1";
    }

    IN MIR-CDI-ALLOC-PCT3-T[196]
    {
        DisplayOnly;
        Length = "7";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Allocation Percentage to Fund";
        Index = "1";
    }

    IN MIR-CDI-ALLOC-AMT3-T[196]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Amount Allocation to Fund";
        Index = "1";
    }

#*                                               Fund Activity Information
    IN MIR-CVG-NUM4-T[6]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table4";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-CIA-EFF-DT4-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table4";
        SType = "Date";
        Label = "Activity Effective Date";
        Index = "1";
    }

    IN MIR-PAI-CIA-REASN-CD4-T[6]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "PAI-CIA-REASN-CD";
        DBTableName = "TMAD";
        SType = "Text";
        Label = "Activity Reason";
        Index = "1";
    }

    IN MIR-CIA-FND-TRXN-AMT4-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table4";
        SType = "Currency";
        Label = "Gross Amount";
        Index = "1";
    }

    IN MIR-CIA-CLI-TRXN-AMT4-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table4";
        SType = "Currency";
        Label = "Net Amount";
        Index = "1";
    }

    IN MIR-CIA-LOAD-AMT4-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table4";
        SType = "Currency";
        Label = "Transfer Charges";
        Index = "1";
    }

    IN MIR-CIA-REVRS-PRCES-DT4-T[6]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table4";
        SType = "Date";
        Label = "Effective Date of Reversal";
        Index = "1";
    }

}