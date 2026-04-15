# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:34 PM EDT

#*******************************************************************************
#*  Component:   BF1170-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1170-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1170";
        BusinessFunctionName = "Client Underwriting Worksheet Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM1170";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TUCON";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-UWG-WRKSHT-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TUCON";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Worksheet Number";
    }

    OUT MIR-CLI-CNFD-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Access to client information is confidential";
    }

    OUT MIR-CLI-EARN-INCM-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TCLII";
        SType = "Currency";
        Label = "Earned Income";
    }

    OUT MIR-CLI-MIB-IND-CD
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "MIB Indicator";
    }

    OUT MIR-CLI-PREV-DCLN-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Client previously declined by company";
    }

    OUT MIR-CLI-UWGDECN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Underwriting Decision";
    }

    OUT MIR-CLI-UWGDECN-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "UW Decision Changed Date";
    }

    OUT MIR-CLI-UWGDECN-TYP-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Decision Type";
    }

    OUT MIR-CNFD-COMNT-TXT
    {
        Length = "237";
        DBTableName = "TUCON";
        SType = "Text";
        Label = "Comments";
    }

    OUT MIR-DV-CLI-MIB-DTL-CD-T[60]
    {
        Length = "15";
        FieldGroup = "Table60";
        DBTableName = "Derived";
        SType = "Text";
        Label = "MIB Code";
        Index = "1";
    }

    OUT MIR-DV-CLI-TOT-ADB-AMT
    {
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total ADB Amount";
    }

    OUT MIR-DV-CLI-TOT-INS-AMT
    {
        Length = "15";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Face Amount with All Companies";
    }

    OUT MIR-DV-CLI-TOT-UWG-AMT
    {
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Amount to be Underwritten";
    }

    OUT MIR-DV-MIB-DTL-TYP-CD-T[60]
    {
        Length = "1";
        FieldGroup = "Table60";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "DV-MIB-DTL-TYP-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Type of MIB Code";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-UWG-WP-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Waiver of premium applied for";
    }

    OUT MIR-POL-CNFD-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Policy has been designated as confidential";
    }

    OUT MIR-POL-CSTAT-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE-T[6]
    {
        Length = "9";
        FieldGroup = "Table6";
        KeyColumn;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[6]
    {
        Length = "1";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-POL-REINS-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Reinsurance";
    }

    OUT MIR-POL-TIA-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Policies covered by Temporary Insurance Agreement";
    }

    OUT MIR-UWG-WRKSHT-DT
    {
        Length = "10";
        DBTableName = "TUCON";
        SType = "Date";
        Label = "Worksheet Created Date";
    }

    OUT MIR-UW-USER-1-ID
    {
        Length = "8";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "1st Underwriter Initials";
    }

    OUT MIR-UW-USER-2-ID
    {
        Length = "8";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "2nd Underwriter Initials";
    }

}

