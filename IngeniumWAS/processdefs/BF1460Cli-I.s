#*******************************************************************************
#*  Component:   BF1460Cli-I.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP4FB1  H.L      New release to support Firm Banking in Surrender Process  *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *
#*  Q13367  CTS      CHANGES FOR VIRTUAL UNDO PROCESS                          *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  MP334A  CTS      CHANGES DONE FOR THE ADDITION OF NEW FIELDS               *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************
S-STEP BF1460Cli-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Tsurr";
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
    SType="Hidden";
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

  INOUT MIR-CVG-NUM
  {
    Key;
    Mandatory;
    Length = "2";
    DefaultConstant = "00";
    SType = "Text";
    Label = "Coverage Number";
  }

  INOUT MIR-DV-PRCES-STATE-CD
  {
    Length = "1";
    SType = "Hidden";
    Label = "Process State";
  }

  INOUT MIR-DV-SURR-TAX-CD
  {
    Length = "2";
    CodeSource = "DataModel";
    CodeType = "DV-SURR-TAX-CD";
    SType = "Selection";
    Label = "Tax Reporting Override";
  }

  INOUT MIR-DV-TAX-OVRID-IND
  {
    Length = "1";
    SType = "Indicator";
    Label = "Tax Override";
  }

  INOUT MIR-SUPRES-CNFRM-IND
  {
    Length = "1";
    SType = "Indicator";
    Label = "Suppress confirmation statement";
  }

  INOUT MIR-DV-SURR-REASN-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "DV-SURR-REASN-CD";
    SType = "Selection";
    Label = "Reason for Surrender";
  }

  INOUT MIR-JRNL-DT
  {
    Length = "10";
    DefaultSession = "LSIR-PRCES-DT";
    SType = "Date";
    Label = "Journal Date";
  }

  INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "DV-TRNXT-PAYO-MTHD-CD";
    SType = "Selection";
    Label = "Pay Out Method";
  }

  INOUT MIR-APPL-CTL-PRCES-DT
  {
    Mandatory;
    Length = "10";
    DefaultSession = "LSIR-PRCES-DT";
    SType = "Date";
    Label = "Process Date";
  }

#  ISLADM Changes Start here 
#  INOUT MIR-HO-FORM-ACPT-DT
#  {
#    Length = "10";
#    DefaultSession = "LSIR-PRCES-DT";
#    SType = "Date";
#    Label = "Home Office Form Acceptance Date";
#  }
#
  INOUT MIR-CO-RECV-DT
    {
    Length = "10";
    DefaultSession = "LSIR-PRCES-DT";
    SType = "Date";
    Label = "Company Received Date";
    }
#  ISLADM Changes End here 
#   Q13367 - CHANGES STARTS HERE
    INOUT MIR-SUR-TYP-IND
    {
          Length = "1";
          SType="Hidden";
    }
    INOUT MIR-DV-UNDO-VALID-CD
    {
          Length = "1";
          SType="Hidden";
    }
    INOUT MIR-DV-COMMIT-CD
    {
          Length = "1";
          SType="Hidden";
    }
#   Q13367 - CHANGES ENDS HERE
# MP245K - CHANGES STARTS HERE
  INOUT MIR-DV-HO-RECV-DT
  {
    Length = "10";
    DefaultSession = "LSIR-PRCES-DT";
    SType = "Date";
    Label = "Head Office Received Date";
  }
  INOUT MIR-DV-PAYO-JPY-BNFT-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "PAYO-JPY-BNFT-CD";
    SType = "Selection";
    Label = "JPY BENEFIT RIDER INDICATOR";
  }  
#   MP245K - CHANGES ENDS HERE
# MP334A - CHANGES START HERE

  INOUT MIR-DT-OF-DTH
  {
    Length = "10";
    SType = "Date";
    Label = "Date of Death of the Policyholder";
  }
  INOUT MIR-CLMT-CAT-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "CLMT-CAT-CD";
    SType = "Selection";
    Label = "Claimant Category";
  }
  INOUT MIR-CLMT-CLI-ID
  {
    Length = "10";
    SType = "Text";
    Label = "Claimant Client Id";
  }
# MP334A - CHANGES ENDS HERE

#27549A - CHANGES START HERE
 INOUT MIR-ATO-NOT-APPL-IND
  {
    Length = "1";
    SType = "Indicator";
    Label = "ATO not applicable";
  }
#27549A- CHANGES ENDS HERE
}
