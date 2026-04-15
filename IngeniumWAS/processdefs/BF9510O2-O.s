# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9510Lumpsum.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPMPFA  CTS      Initial version for partial/full Lumpsum Payment          *
#*  ABU120  CTS      Modified the field Account Type MIR-BNK-ACC-TYP-CD on     *
#*                   Monthly Benefit Reduction screen                          *
#*  IPMTX2  CTS      Added new field MIR-POL-PAYO-TAXWH-IND                    *
#*  ABF281  CTS      Added new field MIR-PAYO-TAXWH-OVRID-IND                  *
#*  ISLIMP  CTS      ADDED 2 NEW FIELDS AND COMMENTED OUT 2 EXISTING FIELDS AS *
#*                   PART OF INSURANCE LAW                                     *
#*******************************************************************************

S-STEP BF9510O2-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Retrieve";
    FocusField = "MIR-POL-ID-BASE";
    FocusFrame = "ContentFrame";
    Type = "Input";
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
    SType="Hidden";
  }

        IN MIR-DV-PRCES-STATE-CD
        {
               Length = "1";
               DBTableName = "Derived";
               SType = "Hidden";
               Label = "process code";
        }

  IN MIR-POL-ID-BASE
  {
          DisplayOnly;
    Label = "Policy Id";
    Length = "9";
    SType = "Text";
  }

  IN MIR-POL-ID-SFX
  {
          DisplayOnly;
    Label = "Suffix";
    Length = "1";
    SType = "Text";
  }

  IN MIR-POL-PAYO-NUM
  {
    DisplayOnly;
    Label = "Payout Number";
    Length = "5";
          DefaultConstant = "00000";
          SType = "Text";
  }

  IN MIR-POL-PAYO-TYP-CD
  {
          Length = "31";
          CodeSource = "DataModel";
              CodeType = "POL-PAYO-TYP-CD";
          DisplayOnly;
    Label = "Payout Type";
    SType = "Text";
  }

  IN MIR-NEW-MTHLY-BNFT-AMT
  {
    DisplayOnly;
    Label = "New Monthly Benefit Amount";
    Length = "15";
    SType = "Currency";
  }
  
# MP113B CHANGES STARTS HERE	
	
  IN MIR-LMPSM-PMT-AMT
  {		
    DisplayOnly;
    Label = "Lumpsum Payment Amount";
    Length = "15";
    SType = "Hidden";
  }
	
  IN MIR-MKTVAL-ADJ-RT
  {
    Decimals = "5";
    DisplayOnly;
    Label = "Market Value Adjustment Rate";
    Length = "15";
    SType = "Hidden";
  }
  
  IN MIR-UNPAY-SPLT-PMT-AMT
  {
    DisplayOnly;
    Label = "Unpaid Split Payment Amount";
    Length = "15";
    SType = "Currency";
  } 
  
  IN MIR-SPLT-PMT-INT-AMT
  {
    DisplayOnly;
    Label = "Interest for Split Payment Amount";
    Length = "15";
    SType = "Currency";
  }   
	
# MP113B CHANGES ENDS HERE  

  IN MIR-LMPSM-WTHDR-AMT
  {
    DisplayOnly;
    Label = "Lumpsum Withdrawal Amount";
    Length = "15";
    SType = "Currency";
  }

  IN MIR-WTHLD-TAX-AMT
  {
    DisplayOnly;
    Label = "Withholding Tax Amount";
    Length = "15";
    SType = "Currency";
  }
#IPMTX2 changes starts
  IN MIR-POL-PAYO-TAXWH-IND
  {
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "Bypass Tax Withholding Calculations";
  }
#IPMTX2 changes Ends

#ABF281 changes starts
  IN MIR-PAYO-TAXWH-OVRID-IND
  {
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "Override Withholding Tax Amount";
  }
#ABF281 changes Ends

  IN MIR-REMITTANCE-AMT
  {
    DisplayOnly;
    Label = "Remittance Amount";
    Length = "15";
    SType = "Currency";
  }

  IN MIR-EFF-DT
  {
    DisplayOnly;
    Label = "Effective Date";
    DefaultSession = "LSIR-PRCES-DT";
    Length = "10";
    SType = "Date";
  }

  IN MIR-BNFT-REDC-REASN-CD
  {
    DisplayOnly;
    CodeSource = "DataModel";
    CodeType = "BNFT-REDC-REASN-CD";
    Label = "Reason For Reduction";
    Length = "31";
    SType = "Text";
  }

  IN MIR-DLAY-INT-AMT
  {
    DisplayOnly;
    Label = "Delay Interest";
    Length = "15";
    SType = "Hidden";
  }

  IN MIR-FIRM-BNK-TRXN-TYP-CD
  {
    CodeSource = "DataModel";
    CodeType = "FBNK-CAT-CD";
    DisplayOnly;
    Label = "Transaction Type";
    Length = "15";
    SType = "Text";
  }

  IN MIR-BNK-ID
  {
    DisplayOnly;
    Label = "Bank Number";
    Length = "4";
    SType = "Text";
  }

  IN MIR-BNK-BR-ID
  {
    DisplayOnly;
    Label = "Branch Number";
    Length = "5";
    SType = "Text";
  }

#CHANGED FOR ABU120
  IN MIR-BNK-ACC-TYP-CD
  {
    DisplayOnly;
#   CodeSource = "DataModel";
                CodeSource = "EDIT";
#   CodeType = "BNK-ACCT-TYP-CD";
                CodeType = "FBACC";
    Label = "Account Type";
#   Length = "15";
                Length = "3";
    SType = "Text";
  }
#ABU120 CHANGES ENDS

  IN MIR-CLI-BNK-ACCT-NUM
  {
    DisplayOnly;
    Label = "Bank Account Number";
    Length = "4";
    SType = "Text";
  }

  IN MIR-BNK-NM
  {
    DisplayOnly;
    Label = "Bank Name";
    Length = "36";
    SType = "Text";
  }

  IN MIR-BNK-BR-NM
  {
    DisplayOnly;
    Label = "Branch Name";
    Length = "36";
    SType = "Text";
  }

  IN MIR-BNK-ACCT-HLDR-NM
  {
    DisplayOnly;
    Label = "Account Holder Name";
    Length = "50";
    SType = "Text";
  }

# ISLIMP - Changes start here

#  IN MIR-HO-CLM-FRM-ACPT-DT
#  {
#    Label = "Head Office Claim Form Acceptance Date";
#    Length = "10";
#    SType = "Hidden";
#  }

#  IN MIR-DOC-COMPLT-DT
#  {
#    Label = "Date of Document Completion";
#    Length = "10";
#    SType = "Hidden";
#  }

  IN MIR-CLM-CO-RECV-DT
  {
    Label = "Company Received Date";
    Length = "10";
    SType = "Hidden";
  }

  IN MIR-FINAL-DOC-COMPLT-DT
  {
    Label = "Company Received Date(Final)";
    Length = "10";
    SType = "Hidden";
  }

# ISLIMP - Changes end here

  IN MIR-TAX-TYP-CD
  {
    CodeSource = "DataModel";
    CodeType = "TAX-TYP-CD";
    Label = "Tax Type";
    Length = "14";
    SType = "Hidden";
  }
}
