# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:58 PM EDT

#*******************************************************************************
#*  Component:   BF5000Ann-O.s                                                 *
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

S-STEP BF5000Ann-O
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

    IN MIR-AGT-ID-T[2]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table3";
        KeyColumn;
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    IN MIR-BILL-LEAD-TIME-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Billing Lead Time";
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

    IN MIR-CLI-ID-T[3]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Client ID";
        Index = "1";
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

    IN MIR-CVG-INT-PAYO-CD-T[8]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table8";
        CodeSource = "DataModel";
        CodeType = "PLAN-INT-PAYO-CD";
        SType = "Text";
        Label = "Interest Handling Indicator";
        Index = "1";
    }

    IN MIR-CVG-OUT-ALLOC-CD-T[8]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table8";
        CodeSource = "DataModel";
        CodeType = "CVG-OUT-ALLOC-CD";
        SType = "Text";
        Label = "Allocation Code";
        Index = "1";
    }

    IN MIR-CVG-RT-AGE-T[8]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table8";
        SType = "Number";
        Label = "Age";
        Index = "1";
    }

    IN MIR-CVG-WTHDR-ORDR-CD-T[8]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table8";
        CodeSource = "DataModel";
        CodeType = "CVG-WTHDR-ORDR-CD";
        SType = "Text";
        Label = "Withdrawal Order";
        Index = "1";
    }

    IN MIR-DPOS-TRM-DY-DUR-T[8]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table8";
        SType = "Text";
        Label = "Deposit Term - Days";
        Index = "1";
    }

    IN MIR-DPOS-TRM-MO-DUR-T[8]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table8";
        SType = "Text";
        Label = "Deposit Term (Months)";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-IA-QUOT-NUM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Quote Number";
    }

    IN MIR-INSRD-CLI-ID-T[8]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table8";
        SType = "Text";
        Label = "Annuitant";
        Index = "1";
    }

    IN MIR-OUT-ALLOC-AMT-PCT-T[8]
    {
        DisplayOnly;
        Length = "15";
        Decimals = "3";
        FieldGroup = "Table8";
        SType = "Number";
        Label = "Alloc Out Amt";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[8]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table8";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    IN MIR-POL-AGT-SHR-PCT-T[2]
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Agent Share";
        Index = "1";
    }

    IN MIR-POL-APP-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Application Received Date";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Premium Mode";
    }

    IN MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Billing Type";
    }

    IN MIR-POL-CLI-REL-SUB-CD-T[3]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-SUB-CD";
        SType = "Text";
        Label = "Policy / Client Relationship Sub Type";
        Index = "1";
    }

    IN MIR-POL-CLI-REL-TYP-CD-T[3]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-TYP-CD";
        SType = "Text";
        Label = "Policy / Client Relationship Type";
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

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    IN MIR-POL-ISS-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-POL-CTRY-CD";
        SType = "Text";
        Label = "Issue Location";
    }

    IN MIR-POL-MISC-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    IN MIR-POL-PAC-DRW-DY
    {
        DisplayOnly;
        Length = "10";
        SType = "Day";
        Label = "Deposit Day";
    }

    IN MIR-POL-PNSN-QUALF-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PNSN-QUALF-CD";
        SType = "Text";
        Label = "Pension Qualified Indicator";
    }

    IN MIR-POL-PNSN-SRC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PENSR";
        SType = "Text";
        Label = "Registered Pension Source";
    }

    IN MIR-POL-REG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        SType = "Text";
        Label = "Registered";
    }

    IN MIR-POL-REG-FND-SRC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REG-FND-SRC-CD";
        SType = "Text";
        Label = "Source of Deposit";
    }

    IN MIR-POL-SNDRY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    IN MIR-POL-SNDRY-REASN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUNRE";
        SType = "Text";
        Label = "Sundry Reason";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-POL-CTRY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country of Issue Location";
    }

}

