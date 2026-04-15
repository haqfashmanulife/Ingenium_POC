# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:45 PM EDT

#*******************************************************************************
#*  Component:   BF1800-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1800-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1800";
        BusinessFunctionName = "Fund Payments Allocated by Amount";
        BusinessFunctionType = "Amount";
        MirName = "SCWM0100";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CF-TAX-YR
    {
        Length = "4";
        DBTableName = "TCFLW";
        SType = "Year";
        Label = "Tax Year";
    }

    INOUT MIR-CIA-COMM-PRCES-IND
    {
        Length = "1";
        DBTableName = "TFA";
        SType = "Indicator";
        Label = "Override Default Commissions";
    }

    INOUT MIR-CIA-EFF-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TFA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    INOUT MIR-CIA-LOAD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Front-end Load Charges";
    }

    INOUT MIR-CIA-LOAD-FORCE-IND
    {
        Length = "1";
        DBTableName = "TFA";
        SType = "Indicator";
        Label = "Load Force Indicator";
    }

    INOUT MIR-CIA-REG-FND-SRC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-REG-FND-SRC-CD";
        DBTableName = "TFA";
        SType = "Selection";
        Label = "Registered Fund Source";
    }

    INOUT MIR-CIA-SRC-DEST-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-SRC-DEST-CD";
        DBTableName = "TFA";
        DefaultConstant = "C";
        SType = "Selection";
        Label = "Deposit Amount Source";
    }

    INOUT MIR-CVG-NUM
    {
        Mandatory;
        Length = "2";
        DBTableName = "TFA";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DPOS-OVRID-EFF-DT
    {
        Length = "10";
        DBTableName = "TCDSA";
        SType = "Date";
        Label = "Override Payment Effective Date";
    }

    INOUT MIR-DV-CFN-APROX-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Approximate Fund Value";
        Index = "1";
    }

    INOUT MIR-DV-CIA-DPOS-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "DV-CIA-DPOS-CD";
        DBTableName = "Derived";
        DefaultConstant = "EXC";
        SType = "Selection";
        Label = "Nature of Deposit";
    }

    INOUT MIR-DV-FND-CTR-T[25]
    {
        Length = "2";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Fund Number";
        Index = "1";
    }

    INOUT MIR-DV-IN-ALLOC-PCT-T[25]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Percent";
        Label = "Percentage to Allocate";
        Index = "1";
    }

    INOUT MIR-FIA-FND-TRXN-AMT
    {
        Mandatory;
        Signed;
        Length = "15";
        DBTableName = "TFD";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-FIA-FND-TRXN-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        DBTableName = "TFD";
        SType = "Currency";
        Label = "Net Amount";
        Index = "1";
    }

    INOUT MIR-FND-ID-T[25]
    {
        Length = "40";
        FieldGroup = "Table25";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TFA";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TFA";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }

}

