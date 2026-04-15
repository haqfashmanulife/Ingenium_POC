# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9887-P.p                                                    *
#*  Description: Protected Claim Benefit List                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104B HIN/IH   Initial version                                           *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*******************************************************************************

P-STEP BF9887-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9887";
        BusinessFunctionName = "Protected Claim Benefit";
        BusinessFunctionType = "List";
        MirName = "CCWM9887";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DefaultSession = "MIR-CLM-ID";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim ID";
    }
    OUT MIR-DV-INS-CLI-NM
    {
        Key;
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    OUT MIR-CLMA-CLM-STAT-CD
    {
        Key;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim Status";
    }
    OUT MIR-CLMA-INSRD-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Insured Client ID";
    }
    OUT MIR-CLI-BTH-DT
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }
    OUT MIR-CLI-SEX-CD
    {
        Key;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    OUT MIR-INS-MORAL-RISK-IND   
    {
        Key;
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Insured Moral Risk";
    }
    OUT MIR-CLAIM-NOTE-IND     
    {
        Key;
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Claim Note";
    }
    OUT MIR-LIFE-INS-CLM-IND
    {
        Key;
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Life Insurance Claim In Progress";
    }
    OUT MIR-CLMA-ASSOC-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Associated Master Claim";
    }
    OUT MIR-CLMA-HIST-CLM-IND
    {
        Key;
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Historical Claim";
    }
#UYSDMC CHANGES STARTS HERE
    OUT MIR-CLMA-USYS-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Unisys Claim";
    }
#UYSDMC CHANGES ENDS HERE
    OUT MIR-POL-ID-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
    OUT MIR-CVG-NUM-T[100]
    {
        Length = "2";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }
    OUT MIR-PLAN-ID-T[100]
    {
        FieldGroup = "Table1";
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Rider Name";
        Index = "1";
    }
    OUT MIR-CVG-ISS-EFF-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }
    OUT MIR-CVG-CSTAT-CD-T[100]
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
    OUT MIR-LAPS-STRT-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Lapse Start Date";
        Index = "1";
    }
    OUT MIR-CVG-REINST-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Reinstatement Date";
        Index = "1";
    }
    OUT MIR-CVG-FACE-AMT-T[100]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }
    INOUT MIR-BNFT-NM-ID-T[100]
    {
        KeyColumn;
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
    }
    OUT MIR-BNFT-PAYBL-AMT-T[100]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Payable Amount";
        Index = "1";
    }
    OUT MIR-BNFT-STAT-CD-T[100]
    {
        Length = "4";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "CLBN-BNFT-STAT-CD";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Claim Status";
        Index = "1";
    }
}
