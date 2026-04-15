# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppCwaFTJUL.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB01  GW       New App. Entry Flow                                       *
#*  B00394  WBP      Add Misc Susp Amt and remove Premium Required field       *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*  P00929  ROC      CHANGE RECEIPT NUMBER LENGTH FROM 10 TO 8                 *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP AppCwaFTJUL
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "cashYesNo";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    IN BannerBar;

    IN BannerBarSize;

    IN BannerProductID
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
    }

    IN BannerPolicyID;

    IN BannerPrimaryInsured;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }


    # RADIO BUTTON TO TRACK IF CASH WITH APP
    # SUBMITTED.

    INOUT cashYesNo
    {
        SType = "YesNo";
        Label = "Was Payment Submitted With This Application?";
        DefaultConstant = "N";
    }

  INOUT MIR-RECPT-NBR
  {
    Mandatory;
#P00929     Length = "10";

    Length = "8";
    SType = "Number";
    Label = "Receipt Number";
  }

  INOUT MIR-RECPT-DT
  {
    Mandatory;
    Length = "10";
    SType = "Date";
    Label = "Receipt Date";
  }

  INOUT MIR-RECPT-AMT
  {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
       # CurrencyCode = "MIR-POL-CRCY-CD";
         CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
    Mandatory;
    Length = "15";
    SType = "Currency";
    Label = "Cash with Application Amount";
  }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }

    INOUT MIR-DV-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Hidden";
        Label = "Process date";
    }

    INOUT MIR-DV-CWA-SUSP-BAL
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
       # CurrencyCode = "MIR-POL-CRCY-CD";
         CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Cash with App Suspense Amount";
    }
#M245B2 CHANGES START HERE     
      INOUT MIR-POL-CRCY-CD
        {
     
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
        }
#M245B2 CHANGES END HERE    
      INOUT MIR-PREM-CRCY-CD
        {
     
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
       }
}

