# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:43 PM EDT

#*******************************************************************************
#*  Component:   BF1440Key-I.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  NWLPLP  CTS      POLICY LOAN PROCESSING                                    *
#*                                                                             *
#*  MP228A  CTS      POLICY LOAN CHANGES FOR PAYOUT METHOD CODE                *
#*  M319A2  CTS      Changes done for FXWL Policy Loan Processing              *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

S-STEP BF1440Key-I
{
    ATTRIBUTES
    {
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

    INOUT MIR-DV-TAX-OVRID-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Tax Override";
    }

    INOUT MIR-DV-TAX-VERIF-AMT
    {
        Signed;
#M319A2 CHANGES START HERE    
        CurrencyCode="MIR-PMT-CRCY-CD";
#M319A2 CHANGES END HERE          
        Length = "13";
        SType = "Currency";
        Label = "Tax Withheld on Taxable Gain";
    }

    INOUT MIR-LOAN-AMT
    {
        Mandatory;
        Signed;
#M319A2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M319A2 CHANGES END HERE          
        Length = "15";
        SType = "Currency";
        Label = "Loan Amount Requested";
    }

    INOUT MIR-LOAN-DT
    {
        Mandatory;
        Length = "10";
# NWLPLP CHANGES STARTS HERE  
#       DefaultSession = "LSIR-PRCES-DT";
# NWLPLP CHANGES ENDS HERE  
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

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
    
# NWLPLP CHANGES STARTS HERE  

    INOUT MIR-JRNL-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Journal Date";
    } 
# NWLPLP CHANGES ENDS HERE      
# MP228A CHANGES STARTS HERE
    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        Label = "Pay Out Method";
        Length = "1";
        SType = "Selection";
    }
# MP228A CHANGES ENDS HERE
# M319A2 CHANGES STARTS HERE 

    INOUT MIR-HO-RECV-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Head Office Received Date";
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
#27549A - Changes Start here
    
     INOUT MIR-ATO-NOT-APPL-IND
     {
         Length = "1";
         SType = "Indicator";
         Label = "ATO not applicable";
     }
#27549A- Changes ends here

}

