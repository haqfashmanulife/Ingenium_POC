# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:58 PM EDT

#*******************************************************************************
#*  Component:   BF5001-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF5001-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
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

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-AGT-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        KeyColumn;
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    INOUT MIR-BILL-LEAD-TIME-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Billing Lead Time";
    }

    INOUT MIR-CLI-ID-T[3]
    {
        Length = "10";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    INOUT MIR-CVG-AD-FACE-AMT-T[8]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table8";
        SType = "Currency";
        Label = "AD Face Amount";
        Index = "1";
    }

    INOUT MIR-CVG-AD-MULT-FCT-T[8]
    {
        Signed;
        Length = "3";
        Decimals = "2";
        FieldGroup = "Table8";
        SType = "Number";
        Label = "ADB Rating Multiplier";
        Index = "1";
    }

    INOUT MIR-CVG-COLA-SELCT-CD-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        CodeSource = "DataModel";
        CodeType = "CVG-COLA-SELCT-CD";
        SType = "Selection";
        Label = "Cost of Living Adjustment Benefit (COLA)";
        Index = "1";
    }

    INOUT MIR-CVG-ENHC-TYP-CD-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        CodeSource = "DataModel";
        CodeType = "CVG-ENHC-TYP-CD";
        SType = "Selection";
        Label = "Coverage Enhancement";
        Index = "1";
    }

    INOUT MIR-CVG-FACE-AMT-T[8]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table8";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    INOUT MIR-CVG-INT-PAYO-CD-T[8]
    {
        Length = "40";
        FieldGroup = "Table8";
        CodeSource = "DataModel";
        CodeType = "PLAN-INT-PAYO-CD";
        SType = "Selection";
        Label = "Interest Handling Indicator";
        Index = "1";
    }

    INOUT MIR-CVG-LIVES-INSRD-CD-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        SType = "Text";
        Label = "Number of Lives Insured";
        Index = "1";
    }

    INOUT MIR-CVG-LTA-SELCT-IND-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        SType = "Indicator";
        Label = "Lifetime accident (benefit provided; result of accident)";
        Index = "1";
    }

    INOUT MIR-CVG-LTB-SELCT-IND-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        SType = "Indicator";
        Label = "Lifetime benefits (result of either accident or sickness)";
        Index = "1";
    }

    INOUT MIR-CVG-ORIG-CD-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        CodeSource = "EDIT";
        CodeType = "ORIG";
        SType = "Selection";
        Label = "Origin of Coverage";
        Index = "1";
    }

    INOUT MIR-CVG-OUT-ALLOC-CD-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        CodeSource = "DataModel";
        CodeType = "CVG-OUT-ALLOC-CD";
        SType = "Selection";
        Label = "Allocation Code";
        Index = "1";
    }

    INOUT MIR-CVG-PAR-CD-T[8]
    {
        Length = "40";
        FieldGroup = "Table8";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        SType = "Selection";
        Label = "Coverage Par Code";
        Index = "1";
    }

    INOUT MIR-CVG-RT-AGE-T[8]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table8";
        SType = "Number";
        Label = "Age";
        Index = "1";
    }

    INOUT MIR-CVG-SEX-CD-T[8]
    {
        Length = "40";
        FieldGroup = "Table8";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        SType = "Selection";
        Label = "Sex";
        Index = "1";
    }

    INOUT MIR-CVG-SMKR-CD-T[8]
    {
        Length = "40";
        FieldGroup = "Table8";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        SType = "Selection";
        Label = "Smoker";
        Index = "1";
    }

    INOUT MIR-CVG-STBL-1-CD-T[8]
    {
        Length = "2";
        FieldGroup = "Table8";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Selection";
        Label = "Sub-table 1";
        Index = "1";
    }

    INOUT MIR-CVG-STBL-2-CD-T[8]
    {
        Length = "3";
        FieldGroup = "Table8";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Selection";
        Label = "Sub-table 2";
        Index = "1";
    }

    INOUT MIR-CVG-STBL-3-CD-T[8]
    {
        Length = "40";
        FieldGroup = "Table8";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Selection";
        Label = "Sub-table 3";
        Index = "1";
    }

    INOUT MIR-CVG-STBL-4-CD-T[8]
    {
        Length = "2";
        FieldGroup = "Table8";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Selection";
        Label = "Sub-table 4";
        Index = "1";
    }

    INOUT MIR-CVG-WP-MULT-FCT-T[8]
    {
        Signed;
        Length = "3";
        Decimals = "2";
        FieldGroup = "Table8";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
        Index = "1";
    }

    INOUT MIR-CVG-WTHDR-ORDR-CD-T[8]
    {
        Length = "40";
        FieldGroup = "Table8";
        CodeSource = "DataModel";
        CodeType = "CVG-WTHDR-ORDR-CD";
        SType = "Selection";
        Label = "Withdrawal Order";
        Index = "1";
    }

    INOUT MIR-DIR-BILL-CSH-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Cash Amount";
    }

    INOUT MIR-DPOS-TRM-DY-DUR-T[8]
    {
        Length = "3";
        FieldGroup = "Table8";
        SType = "Text";
        Label = "Deposit Term - Days";
        Index = "1";
    }

    INOUT MIR-DPOS-TRM-MO-DUR-T[8]
    {
        Length = "3";
        FieldGroup = "Table8";
        SType = "Text";
        Label = "Deposit Term (Months)";
        Index = "1";
    }

    INOUT MIR-IA-QUOT-NUM
    {
        Length = "6";
        SType = "Text";
        Label = "Quote Number";
    }

    INOUT MIR-INSRD-CLI-ID-2-T[8]
    {
        Length = "10";
        FieldGroup = "Table8";
        SType = "Text";
        Label = "Second Insured's Client Number";
        Index = "1";
    }

    INOUT MIR-INSRD-CLI-ID-T[8]
    {
        Length = "10";
        FieldGroup = "Table8";
        SType = "Text";
        Label = "First Insured's client Number";
        Index = "1";
    }

    INOUT MIR-OUT-ALLOC-AMT-PCT-T[8]
    {
        Length = "15";
        Decimals = "3";
        FieldGroup = "Table8";
        SType = "Percent";
        Label = "Alloc Out Amt";
        Index = "1";
    }

    INOUT MIR-OWN-OCCP-SELCT-IND-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        SType = "Indicator";
        Label = "Own occupation benefit";
        Index = "1";
    }

    INOUT MIR-PDISAB-SELCT-IND-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        SType = "Indicator";
        Label = "Partial disability benefit";
        Index = "1";
    }

    INOUT MIR-PLAN-ID-T[8]
    {
        Length = "40";
        FieldGroup = "Table8";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Plan";
        Index = "1";
    }

    INOUT MIR-POL-AGT-SHR-PCT-T[3]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Agent Share";
        Index = "1";
    }

    INOUT MIR-POL-APL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Automatic premium loan is a separate option from nonforfeiture";
    }

    INOUT MIR-POL-APP-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Application Received Date";
    }

    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Selection";
        Label = "Premium Mode";
    }

    INOUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Selection";
        Label = "Billing Type";
    }

    INOUT MIR-POL-CLI-REL-SUB-CD-T[3]
    {
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-SUB-CD";
        SType = "Selection";
        Label = "Policy / Client Relationship Sub Type";
        Index = "1";
    }

    INOUT MIR-POL-CLI-REL-TYP-CD-T[3]
    {
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-TYP-CD";
        SType = "Selection";
        Label = "Policy / Client Relationship Type";
        Index = "1";
    }

    INOUT MIR-POL-DB-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        SType = "Selection";
        Label = "Death Benefit Option";
    }

    INOUT MIR-POL-DIV-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Selection";
        Label = "Policy Dividend Option";
    }

    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    INOUT MIR-POL-ISS-LOC-CD
    {
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        SType = "Selection";
        Label = "Issue Location";
        FilterFields = "1";
        FilterField1 = "MIR-POL-CTRY-CD";
    }

    INOUT MIR-POL-NFO-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-NFO-CD";
        SType = "Selection";
        Label = "Non-forfeiture Option";
    }

    INOUT MIR-POL-PAC-DRW-DY
    {
        Length = "10";
        SType = "Day";
        Label = "Deposit Day";
    }

    INOUT MIR-POL-PNSN-QUALF-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PNSN-QUALF-CD";
        SType = "Selection";
        Label = "Pension Qualified Indicator";
    }

    INOUT MIR-POL-PNSN-SRC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PENSR";
        SType = "Selection";
        Label = "Registered Pension Source";
    }

    INOUT MIR-POL-REG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        SType = "Selection";
        Label = "Registered";
    }

    INOUT MIR-POL-REG-FND-SRC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REG-FND-SRC-CD";
        SType = "Selection";
        Label = "Source of Deposit";
    }

    INOUT MIR-POL-REINS-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        SType = "Selection";
        Label = "Reinsurance";
    }

    INOUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    INOUT MIR-POL-SNDRY-REASN-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUNRE";
        SType = "Selection";
        Label = "Sundry Reason";
    }

    INOUT MIR-REDC-EP-SELCT-IND-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        SType = "Indicator";
        Label = "Reduced elimination period for hospitalization Confinement (EP/HOSP)";
        Index = "1";
    }

    INOUT MIR-REG-SAV-PORTN-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Savings Portion Amount";
    }

    INOUT MIR-REG-SAV-PORTN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SAV-PORTN-CD";
        SType = "Selection";
        Label = "Savings Indicator";
    }

    INOUT MIR-REL-CVG-NUM-T[8]
    {
        Length = "2";
        FieldGroup = "Table8";
        SType = "Text";
        Label = "Connected Coverage Number";
        Index = "1";
    }

    INOUT MIR-POL-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Country";
        DefaultSession = "MIR-USER-SESN-CTRY-CD";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-CLI-CRNT-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Current Location";
    }

    IN MIR-CVG-CSTAT-CD-T[8]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table8";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-GRS-APREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Gross Annual Premium";
    }

    IN MIR-POL-MISC-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    IN MIR-POL-MPREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Mode Premium Amount";
    }

}

