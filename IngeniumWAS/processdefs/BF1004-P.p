# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF1004-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01BL18  BMB      Remove Listbill Status and add Payroll Deduction fields   *
#*                                                                             *
#*******************************************************************************

P-STEP BF1004-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1004";
        BusinessFunctionName = "Client Inquiry - List Billing Details";
        BusinessFunctionType = "Lbldtl";
        MirName = "CCWM5050";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-OWN-CLI-NM-T[12]
    {
        Length = "30";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }

    OUT MIR-DV-POL-SUM-INS-AMT-T[12]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Sum Insured";
        Index = "1";
    }

    OUT MIR-DV-TOT-BILL-AMT-T[12]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Billed Total";
        Index = "1";
    }


    OUT MIR-LBILL-GR-PICK-DY
    {
        Length = "2";
        DBTableName = "TCLIG";
        SType = "Text";
        Label = "Payroll Deduction Pick Day";
    }

    OUT MIR-LBILL-GR-DRW-DY
    {
        Length = "2";
        DBTableName = "TCLIG";
        SType = "Text";
        Label = "Payroll Deduction Draw Day";
    }

    OUT MIR-LBILL-BILL-MODE-CD
    {
        Length = "2";
        DBTableName = "TCLIG";
        SType = "Text";
        Label = "Payroll Deduction Billing Mode";
    }

    OUT MIR-POL-BILL-MODE-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
        Index = "1";
    }

    OUT MIR-POL-CSTAT-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE-T[12]
    {
        Length = "9";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-POL-PD-TO-DT-NUM-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Paid to Date";
        Index = "1";
    }

    OUT MIR-POL-SPND-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Suspend Status";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

