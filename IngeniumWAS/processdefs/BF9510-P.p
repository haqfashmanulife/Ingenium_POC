# Converted from PathFinder 2.2 to 3.0 Jul 16, 2007 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF9510-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPMPFA  CTS      Retrieve the monthly benefit reduction details data       *
#*  ABU120  CTS      Modified the field Account Type MIR-BNK-ACC-TYP-CD on     *
#*                   Monthly Benefit Reduction screen                          *
#*  IPMTX2  CTS      Added new field MIR-POL-PAYO-TAXWH-IND                    *
#*  ABF281  CTS      Added new field MIR-PAYO-TAXWH-OVRID-IND                  *
#*  ISLIMP  CTS      ADDED 2 NEW FIELDS AND COMMENTED OUT 2 EXISTING FIELDS AS *
#*                   PART OF INSURANCE LAW                                     *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

P-STEP BF9510-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9510";
        BusinessFunctionName = "Monthly Benefit Reduction ";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9510";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-PRCES-STATE-CD
    {
         Length = "1";
         DBTableName = "Derived";
         SType = "Hidden";
         Label = "process code";
    }

    INOUT MIR-POL-ID-BASE
    {
        DefaultSession = "MIR-POL-ID-BASE";
        Key;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT  MIR-POL-ID-SFX
    {
        DefaultSession = "MIR-POL-ID-SFX";
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-PAYO-NUM
    {
      Length = "5";
        DefaultConstant = "00000";
        SType = "Text";
        Label = "Payout Number";
        DisplayOnly;
    }

    INOUT MIR-POL-PAYO-TYP-CD
    {
        Length = "31";
  CodeSource = "DataModel";
      CodeType = "POL-PAYO-TYP-CD";
      SType = "Text";
        Label = "Payout Type";
        DisplayOnly;
    }
# Confirmation screen fields

    INOUT MIR-NEW-MTHLY-BNFT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label= "New Monthly Benefit Amount";
    }

    INOUT MIR-LMPSM-WTHDR-AMT
    {
        Length = "15";
        SType = "Currency";
        Label= "Lumpsum Withdrawal Amount";
    }

    INOUT MIR-WTHLD-TAX-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Withholding Tax Amount";
    }
#IPMTX2 changes starts
    INOUT MIR-POL-PAYO-TAXWH-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Bypass Tax Withholding Calculations";
    }
#IPMTX2 changes Ends

#ABF281 changes starts
    INOUT MIR-PAYO-TAXWH-OVRID-IND
    {
        Length = "1";
        DBTableName = "TPAHS";
        SType = "Indicator";
        Label = "Override Withholding Tax Amount";
    }
#ABF281 changes Ends

    INOUT MIR-REMITTANCE-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Remittance Amount";
    }

    INOUT MIR-EFF-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-BNFT-REDC-REASN-CD
    {
        CodeSource = "DataModel";
        CodeType = "BNFT-REDC-REASN-CD";
        Length = "31";
        SType = "Selection";
        Label = "Reason For Reduction";
    }

    INOUT MIR-DLAY-INT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Delay Interest";
    }

    INOUT MIR-FIRM-BNK-TRXN-TYP-CD
    {
        Length = "15";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "FBNK-CAT-CD";
        Label = "Transaction Type";
    }

    INOUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Bank Number";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Branch Number";
    }

#CHANGED FOR ABU120
    INOUT MIR-BNK-ACC-TYP-CD
    {
#       Length = "15";
        Length = "3";
        DBTableName = "TBNKA";
#       CodeSource = "DataModel";
        CodeSource = "EDIT";
#       CodeType = "BNK-ACCT-TYP-CD";
        CodeType = "FBACC";
#       SType = "Text";
        SType = "Selection";
        Label = "Account Type";
    }
#ABU120 CHANGES ENDS

    INOUT MIR-CLI-BNK-ACCT-NUM
    {
        Length = "4";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
    }

    INOUT MIR-BNK-BR-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        SType = "Text";
        DBTableName = "TBNKA";
        Label = "Account Holder Name";
    }

# Additional details screen fields
# ISLIMP - Changes start here

#    INOUT MIR-HO-CLM-FRM-ACPT-DT
#    {
#        Length = "10";
#        SType = "Date";
#    }

#    INOUT MIR-DOC-COMPLT-DT
#    {
#        Length = "10";
#        SType = "Date";
#    }

    INOUT MIR-CLM-CO-RECV-DT
    {
        Length = "10";
        SType = "Date";
    }

    INOUT MIR-FINAL-DOC-COMPLT-DT
    {
        Length = "10";
        SType = "Date";
    }

# ISLIMP - Changes end here

# MP113B CHANGES STARTS HERE  

    INOUT MIR-LMPSM-PMT-AMT
    {		
        Label = "Lumpsum Payment Amount";
        Length = "15";
        SType = "Currency";
    }
	
    INOUT MIR-MKTVAL-ADJ-RT
    {
        Decimals = "5";
        Label = "Market Value Adjustment Rate";
        Length = "15";
        SType = "Number";
    }
  
    INOUT MIR-UNPAY-SPLT-PMT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Unpaid Split Payment Amount";
    }
    
    INOUT MIR-SPLT-PMT-INT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Interest for Split Payment Amount";
    }    

# MP113B CHANGES ENDS HERE

    INOUT MIR-TAX-TYP-CD
    {
        Length = "02";
        DBTableName = "TBNKA";
        CodeSource = "DataModel";
        CodeType = "TAX-TYP-CD";
        SType = "Selection";
        Label = "Tax Type";
    }

#UY3049 ANNUITY Payout
    INOUT MIR-LMPSM-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "LMPSM-TYP-CD";
        SType = "Selection";
        Label = "LumpSum Type";
    }
#UY3049 CHANGES STARTS
    INOUT MIR-10-POL-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Policy Id";
    }
    
    INOUT MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#UY3049 CHANGES ENDS
}
