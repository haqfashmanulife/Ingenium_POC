# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:51 PM EDT

#*******************************************************************************
#*  Component:   BF5002-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01CP02  EKM      Limit display of Agent information to 2 Agents            *
#*                                                                             *
#*******************************************************************************

P-STEP BF5002-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "5002";
        BusinessFunctionName = "Jet Issue Policy Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0195";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-AGT-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table3";
        KeyColumn;
        DBTableName = "TPOLW";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    INOUT MIR-BILL-LEAD-TIME-DUR
    {
        Length = "3";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Lead Time";
    }

    INOUT MIR-CLI-ID-T[3]
    {
        Length = "10";
        FieldGroup = "Table3";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    INOUT MIR-CVG-AD-FACE-AMT-T[8]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table8";
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Coverage Enhancement";
        Index = "1";
    }

    INOUT MIR-CVG-FACE-AMT-T[8]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table8";
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Interest Handling Indicator";
        Index = "1";
    }

    INOUT MIR-CVG-LIVES-INSRD-CD-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number of Lives Insured";
        Index = "1";
    }

    INOUT MIR-CVG-LTA-SELCT-IND-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Lifetime accident (benefit provided; result of accident)";
        Index = "1";
    }

    INOUT MIR-CVG-LTB-SELCT-IND-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Coverage Par Code";
        Index = "1";
    }

    INOUT MIR-CVG-RT-AGE-T[8]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table8";
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Withdrawal Order";
        Index = "1";
    }

    INOUT MIR-DIR-BILL-CSH-AMT
    {
        Length = "15";
        DBTableName = "TTA";
        SType = "Currency";
        Label = "Cash Amount";
    }

    INOUT MIR-DPOS-TRM-DY-DUR-T[8]
    {
        Length = "3";
        FieldGroup = "Table8";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Deposit Term - Days";
        Index = "1";
    }

    INOUT MIR-DPOS-TRM-MO-DUR-T[8]
    {
        Length = "3";
        FieldGroup = "Table8";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Deposit Term (Months)";
        Index = "1";
    }

    INOUT MIR-IA-QUOT-NUM
    {
        Length = "6";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Quote Number";
    }

    INOUT MIR-INSRD-CLI-ID-2-T[8]
    {
        Length = "10";
        FieldGroup = "Table8";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Second Insured's Client Number";
        Index = "1";
    }

    INOUT MIR-INSRD-CLI-ID-T[8]
    {
        Length = "10";
        FieldGroup = "Table8";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "First Insured's client Number";
        Index = "1";
    }

    INOUT MIR-OUT-ALLOC-AMT-PCT-T[8]
    {
        Length = "15";
        Decimals = "3";
        FieldGroup = "Table8";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Alloc Out Amt";
        Index = "1";
    }

    INOUT MIR-OWN-OCCP-SELCT-IND-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Own occupation benefit";
        Index = "1";
    }

    INOUT MIR-PDISAB-SELCT-IND-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Plan";
        Index = "1";
    }

    INOUT MIR-POL-AGT-SHR-PCT-T[2]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table3";
        DBTableName = "TPOLW";
        SType = "Percent";
        Label = "Agent Share";
        Index = "1";
    }

    INOUT MIR-POL-APL-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Automatic premium loan is a separate option from nonforfeiture";
    }

    INOUT MIR-POL-APP-RECV-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Application Received Date";
    }

    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Premium Mode";
    }

    INOUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Billing Type";
    }

    INOUT MIR-POL-CLI-REL-SUB-CD-T[3]
    {
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-SUB-CD";
        DBTableName = "TPOLC";
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
        DBTableName = "TPOLC";
        SType = "Selection";
        Label = "Policy / Client Relationship Type";
        Index = "1";
    }

    INOUT MIR-POL-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Country of Issue Location";
    }

    INOUT MIR-POL-DB-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Death Benefit Option";
    }

    INOUT MIR-POL-DIV-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Policy Dividend Option";
    }

    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    INOUT MIR-POL-ISS-LOC-CD
    {
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Issue Location";
    }

    INOUT MIR-POL-NFO-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-NFO-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Non-forfeiture Option";
    }

    INOUT MIR-POL-PAC-DRW-DY
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Day";
        Label = "Deposit Day";
    }

    INOUT MIR-POL-PNSN-QUALF-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PNSN-QUALF-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Pension Qualified Indicator";
    }

    INOUT MIR-POL-PNSN-SRC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PENSR";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Registered Pension Source";
    }

    INOUT MIR-POL-REG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Registered";
    }

    INOUT MIR-POL-REG-FND-SRC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REG-FND-SRC-CD";
        DBTableName = "TCFLW";
        SType = "Selection";
        Label = "Source of Deposit";
    }

    INOUT MIR-POL-REINS-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Reinsurance";
    }

    INOUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    INOUT MIR-POL-SNDRY-REASN-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUNRE";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Sundry Reason";
    }

    INOUT MIR-REDC-EP-SELCT-IND-T[8]
    {
        Length = "1";
        FieldGroup = "Table8";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Reduced elimination period for hospitalization Confinement (EP/HOSP)";
        Index = "1";
    }

    INOUT MIR-REG-SAV-PORTN-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Savings Portion Amount";
    }

    INOUT MIR-REG-SAV-PORTN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SAV-PORTN-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Savings Indicator";
    }

    INOUT MIR-REL-CVG-NUM-T[8]
    {
        Length = "2";
        FieldGroup = "Table8";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connected Coverage Number";
        Index = "1";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Sub Company";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
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

    OUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Location Province/State";
    }

    OUT MIR-CVG-CSTAT-CD-T[8]
    {
        Length = "40";
        FieldGroup = "Table8";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "40";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-POL-GRS-APREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Gross Annual Premium";
    }

    OUT MIR-POL-MISC-SUSP-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    OUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Mode Premium Amount";
    }

    INOUT MIR-POL-BUS-CLAS-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Hidden";
        Label = "Business Class";
    }

}

