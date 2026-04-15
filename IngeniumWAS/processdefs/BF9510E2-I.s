# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9510Lumpsum.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPMPFA  CTS      Initial version for partial/full Lumpsum Payment          *
#*  ABU120  CTS      Modified the field Account Type MIR-BNK-ACC-TYP-CD and    *
#*                   Date of Document Completion MIR-DOC-COMPLT-DT on          *
#*                   Monthly Benefit Reduction screen                          *
#*                                                                             *
#*  IPMTX2  CTS      Added new field MIR-POL-PAYO-TAXWH-IND                    *
#*  ABF281  CTS      Added new field MIR-PAYO-TAXWH-OVRID-IND                  *
#*  ISLIMP  CTS      ADDED 2 NEW FIELDS AND COMMENTED OUT 2 EXISTING FIELDS AS *
#*                   PART OF INSURANCE LAW                                     *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

S-STEP BF9510E2-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Retrieve";
    FocusField = "MIR-NEW-MTHLY-BNFT-AMT";
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

        INOUT MIR-DV-PRCES-STATE-CD
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

  INOUT MIR-NEW-MTHLY-BNFT-AMT
  {
    Label = "New Monthly Benefit Amount";
    Length = "15";
    SType = "Currency";
  }
  
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
    Label = "Unpaid Split Payment Amount";
    Length = "15";
    SType = "Hidden";
  }
  
  INOUT MIR-SPLT-PMT-INT-AMT
  {
    Label = "Interest for Split Payment Amount";
    Length = "15";
    SType = "Hidden";
  }  

# MP113B CHANGES ENDS HERE

  INOUT MIR-LMPSM-WTHDR-AMT
  {
    Label = "Lumpsum Withdrawal Amount";
    Length = "15";
    SType = "Hidden";
  }

  INOUT MIR-WTHLD-TAX-AMT
  {
    Label = "Withholding Tax Amount";
    Length = "15";
    SType = "Currency";
  }
#IPMTX2 changes starts
  IN MIR-POL-PAYO-TAXWH-IND
  {
#ABF281 Changes Starts
    DisplayOnly;
#ABF281 Changes Ends
    Length = "1";
    SType = "Indicator";
    Label = "Bypass Tax Withholding Calculations";
  }
#IPMTX2 changes Ends

#ABF281 changes starts
  INOUT MIR-PAYO-TAXWH-OVRID-IND
  {
    Length = "1";
    SType = "Indicator";
    Label = "Override Withholding Tax Amount";
  }
#ABF281 changes Ends

  INOUT MIR-REMITTANCE-AMT
  {
    Label = "Remittance Amount";
    Length = "15";
    SType = "Hidden";
  }

  INOUT MIR-EFF-DT
  {
    Label = "Effective Date";
    Length = "10";
    SType = "Date";
  }

  INOUT MIR-BNFT-REDC-REASN-CD
  {
    CodeSource = "DataModel";
    CodeType = "BNFT-REDC-REASN-CD";
    Label = "Reason For Reduction";
    Length = "31";
    SType = "Selection";
    Mandatory;
  }

  INOUT MIR-DLAY-INT-AMT
  {
    Label = "Delay Interest";
    Length = "15";
    SType = "Hidden";
  }

  INOUT MIR-FIRM-BNK-TRXN-TYP-CD
  {
    CodeSource = "DataModel";
    CodeType = "FBNK-CAT-CD";
    Label = "Transaction Type";
    Length = "15";
    SType = "Hidden";
  }

  INOUT MIR-BNK-ID
  {
    Label = "Bank Number";
    Length = "4";
    SType = "Text";
    Mandatory;
  }

  INOUT MIR-BNK-BR-ID
  {
    Label = "Branch Number";
    Length = "5";
    SType = "Text";
    Mandatory;
  }

#CHANGED FOR ABU120
  INOUT MIR-BNK-ACC-TYP-CD
  {
#   CodeSource = "DataModel";
                CodeSource = "EDIT";
#   CodeType = "BNK-ACCT-TYP-CD";
                CodeType = "FBACC";
    Label = "Account Type";
#   Length = "17";
                Length = "3";
    SType = "Selection";
#   Mandatory;
  }
#ABU120 CHANGES ENDS

  INOUT MIR-CLI-BNK-ACCT-NUM
  {
    Label = "Bank Account Number";
    Length = "4";
    SType = "Text";
    Mandatory;
  }

  INOUT MIR-BNK-NM
  {
    Label = "Bank Name";
    Length = "36";
    SType = "Text";
  }

  INOUT MIR-BNK-BR-NM
  {
    Label = "Branch Name";
    Length = "36";
    SType = "Text";
  }

  INOUT MIR-BNK-ACCT-HLDR-NM
  {
    Label = "Account Holder Name";
    Length = "50";
    SType = "Text";
  }

# ISLIMP - Changes start here

#  INOUT MIR-HO-CLM-FRM-ACPT-DT
#  {
#    Label = "Head Office Claim Form Acceptance Date";
#    Length = "10";
#    SType = "Date";
#    Mandatory;
#  }

#CHANGED FOR ABU120
#  INOUT MIR-DOC-COMPLT-DT
#  {
#    Label = "Date of Document Completion";
#    Length = "10";
#    SType = "Date";
#   Mandatory;
#  }
#ABU120 CHANGES ENDS

  INOUT MIR-CLM-CO-RECV-DT
  {
    Label = "Company Received Date";
    Length = "10";
    SType = "Date";
    Mandatory;
  }

  INOUT MIR-FINAL-DOC-COMPLT-DT
  {
    Label = "Company Received Date(Final)";
    Length = "10";
    SType = "Date";
  }
# ISLIMP - Changes end here

  INOUT MIR-TAX-TYP-CD
  {
    CodeSource = "DataModel";
    CodeType = "TAX-TYP-CD";
    Label = "Tax Type";
    Length = "14";
    SType = "Selection";
    Mandatory;
  }
#UY3049 CHANGES STARTS
  IN MIR-10-POL-ID
  {
      Length = "10";
      SType = "Hidden";
      Label = "Policy Id";
  }
    
  IN MIR-STR3-PAYO-IND
  {
      Length = "1";
      SType = "Hidden";
  }
#UY3049 CHANGES ENDS
}
