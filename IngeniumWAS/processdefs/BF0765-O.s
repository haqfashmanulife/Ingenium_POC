# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF0765-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MP0020  SW       EXTRA PREMIUM COMMISSION (ADD 5 FIELDS)                   *
#*  NWLCOM  CTS      ADDED PREMIUM PAID DATE AND CWA PROCESS DATE FOR NWLCOM   *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  Q90593  CTS      CHANGES DONE AS PART OF FXWL CURRENCY                     *
#*******************************************************************************

S-STEP BF0765-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Commd";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-TRXN-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-POL-TRXN-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-POL-TRXN-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-POL-TRXN-TASK-ID
    {
        Key;
        DisplayOnly;
        Length = "4";
        DefaultConstant = "9999";
        SType = "Text";
        Label = "Task Number";
    }

    IN MIR-POL-TRXN-TIME
    {
        Key;
        DisplayOnly;
        Length = "7";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Text";
        Label = "Time";
    }

    IN MIR-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent ID";
    }

    IN MIR-AGT-ID-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Commissionable Agent Number";
    }

    IN MIR-CVG-AGT-CPREM-AMT
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE 
#M245B2 CHANGES START HERE    
        #CurrencyCode = "MIR-POL-CRCY-CD-1";
         CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Commissionable Premium";
    }

    IN MIR-CVG-AGT-SHR-PCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        SType = "Percent";
        Label = "Share";
    }

    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DV-AGT-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-REASN-CD";
        SType = "Text";
        Label = "Reason";
    }

    IN MIR-DV-ANNV-PYR-QTY
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "DV_PREV_ANN_YR_QTY";
    }

    IN MIR-DV-COMM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD-1";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Net Commission";
    }

    IN MIR-DV-COMM-CHRG-FCT
    {
        DisplayOnly;
        Length = "4";
        Decimals = "3";
        SType = "Number";
        Label = "Charge Factor";
    }

    IN MIR-DV-COMM-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-COMM-PMT-TYP-CD";
        SType = "Text";
        Label = "Commission Payment Type";
    }

    IN MIR-DV-COMM-SRC-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "DV-COMM-SRC-CD";
        SType = "Text";
        Label = "DV_TRXN_SCR_CD";
    }

    IN MIR-DV-ENTR-BUS-FCN-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Transaction ID";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-PD-TO-MO-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Month of Paid to Date";
    }

    IN MIR-DV-PREM-DUE-MO-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Premium Due Month";
    }

    IN MIR-DV-PREM-PD-YR-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Years Paid";
    }

    IN MIR-OVRID-ID
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Agent Situation";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Type of Plan";
    }

    IN MIR-POL-CRCY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
    }

    IN MIR-POL-INS-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Type";
    }

    IN MIR-POL-TRXN-BTCH-NUM
    {
        DisplayOnly;
        Length = "7";
        Decimals = "0";
        SType = "Number";
        Label = "Batch Number";
    }

    IN MIR-RTBL2-1-RT
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Percentage Rate";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-SERV-BR-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch";
    }

    IN MIR-USER-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "User ID";
    }
    IN MIR-SO-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Sales Office";
    }

    IN MIR-CVG-AGT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
  Label = "Coverage Agent Type";
    }

    IN MIR-COMM-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Commission Type";
    }

    IN MIR-TRANS-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
  Label = "Transaction Effective Date";
    }

    IN MIR-APP-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Application Received Date";
     }

#NWLCOM CHANGES STARTS HERE
    IN MIR-PREM-PD-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Premium Paid Date";
    }

    IN MIR-CWA-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "CWA Process Date";
    }
#NWLCOM CHANGES ENDS HERE    

    IN MIR-CVG-ISS-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
  Label = "Coverage Issue Date";
    }

    IN MIR-INSRD-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
  Label = "Insured Date of Birth";
    }
    IN MIR-CVG-FACE-AMT
    {
#M245B2 CHANGES START HERE    
#Q90593 CHANGES START HERE
        # CurrencyCode = "MIR-POL-CRCY-CD-1";
          CurrencyCode = "MIR-PREM-CRCY-CD";
#Q90593 CHANGES END HERE
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "10";
        SType = "Currency";
  Label = "Coverage Face Amount";
     }

    IN MIR-PAY-NUM
     {
        DisplayOnly;
        Length = "5";
        SType = "Number";
        Label = "Payment Number";
     }

    IN MIR-STD-PREM-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        #CurrencyCode = "MIR-POL-CRCY-CD-1";
         CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Standard Premium COI";
    }

    IN MIR-DV-STD-COMM-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD-1";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Standard Premium Conv P";
    }

    IN MIR-EXTR-PREM-AMT
    {
#M245B2 CHANGES START HERE    
#Q90593 CHANGES START HERE CHANGING CURRENCY CODE  
        # CurrencyCode = "MIR-POL-CRCY-CD-1";
          CurrencyCode = "MIR-PREM-CRCY-CD";
#Q90593 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Extra Premium COI";
    }

    IN MIR-EXTR-PREM-COMM-RT
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Extra Premium Com.Rate";
    }


    IN MIR-AFYC-SSTD-CNVR-P-AMT
    {
#M245B2 CHANGES START HERE    
#Q90593 CHANGES START HERE CHANGING CURRENCY CODE  
        # CurrencyCode = "MIR-POL-CRCY-CD-1";
          CurrencyCode = "MIR-PREM-CRCY-CD";
#Q90593 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Extra Premium Conv P";
    }
    
#M245B2 CHANGES START HERE
     INOUT MIR-POL-CRCY-CD-1
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    } 
#M245B2 CHANGES END HERE    

#M271O1 CHANGES START HERE  
     
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
}

