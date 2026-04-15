# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:01 PM EDT

#*******************************************************************************
#*  Component:   BF6982-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  NWLLTC  CTS      CHANGES FOR POLICY LOAN QUOTE SCREEN                      *
#*  MP1542  CTS      CHANGES FOR AUTOMATIC PREMIUM LOAN PROCESSING             *
#*  TVI031  CTS      CHANGES FOR APS PROCESSING                                *
#*  M319A2  CTS      Changes done for FXWL Policy Loan Processing              *
#*  Q94501  CTS      CHANGES TO NEW LOAN INPUT SCREEN FOR FXWL                **
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*******************************************************************************

S-STEP BF6982-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Valueln";
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
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }
# NWLLTC CHANGES STARTS HERE
    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
#        Label = "Process Date";
        Label = "Effective Date";
    }
# NWLLTC CHANGES ENDS HERE

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
        ReadOnly;
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
        ReadOnly;
    }
# NWLLTC CHANGES STARTS HERE
    INOUT MIR-LOAN-AMT
    {
        Signed;
#M319A2 CHANGES START HERE    
#Q94501 CHANGES START HERE    
        #CurrencyCode="MIR-LOAN-CRCY-CD";
        CurrencyCode = "MIR-POL-CRCY-CD";
#Q94501 CHANGES END HERE   
#M319A2 CHANGES END HERE   
        Length = "15";
        SType = "Currency";
        Label = "Loan Amount Requested";
    }
# NWLLTC CHANGES ENDS HERE
# TVI031 CHANGES STARTS HERE MODIFIED THE DMAD VARIABLE FOR THE MIR
# MP1542 CHANGES STARTS HERE
#    INOUT MIR-LOAN-TYP-CD
#    {
#        Mandatory;
#        Length = "20";
#        CodeSource = "DataModel";
#        CodeType = "POL-LOAN-ID";
#        SType = "Selection";
#        Label = "Type of Loan";
#    }
# MP1542 CHANGES ENDS HERE

    INOUT MIR-LOAN-TYP-CD
    {
        Mandatory;
        Length = "20";
        CodeSource = "DataModel";
        CodeType = "LOAN-TYP-CD";
        SType = "Selection";
        Label = "Type of Loan";
    }
# TVI031 CHANGES ENDS HERE
# M319A2 CHANGES STARTS HERE
    INOUT MIR-JPY-TRXN-AMT
    {
        Signed;
        Length = "15";
#Q94501 CHANGES START HERE            
        CurrencyCode = "MIR-PMT-CRCY-CD";
#Q94501 CHANGES END HERE    
        SType = "Currency";
        Label = "Loan Amount Requested (Converted value in Yen)";
    }
    
     INOUT MIR-POL-CRCY-CD
     {     
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }   
     INOUT MIR-PMT-CRCY-CD
     {     
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }        
#Q94501 CHANGES START HERE         
     #INOUT MIR-LOAN-CRCY-CD
     #{
     #    Key;
     #    Mandatory;
     #    Length = "5";
     #    CodeSource = "EDIT";
     #    CodeType = "LCRCY";
     #    SType = "Selection";
     #    Label = "Currency";
     #}
#Q94501 CHANGES END HERE    
# M319A2 CHANGES ENDS HERE
#UYS043- Changes START here
    INOUT MIR-VIR-SCREEN-IND
      {
        Length = "1";
        SType = "Indicator";
        Label = "Please check in case of virtual quote implementation";
      }
#UYS043- Changes End here 
}

