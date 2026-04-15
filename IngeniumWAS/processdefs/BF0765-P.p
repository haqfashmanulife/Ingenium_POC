# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0765-P.p                                                    *
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
#*******************************************************************************

P-STEP BF0765-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0765";
        BusinessFunctionName = "Commission Detail History";
        BusinessFunctionType = "Commd";
        MirName = "CCWM0931";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-TRXN-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "THI";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-POL-TRXN-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "THI";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-POL-TRXN-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "THI";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-POL-TRXN-TASK-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "THI";
        DefaultConstant = "9999";
        SType = "Text";
        Label = "Task Number";
    }

    INOUT MIR-POL-TRXN-TIME
    {
        Key;
        Mandatory;
        Length = "7";
        DBTableName = "THI";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Text";
        Label = "Time";
    }

    OUT MIR-AGT-ID
    {
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
    }

    OUT MIR-AGT-ID-2
    {
        Length = "6";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Commissionable Agent Number";
    }

    OUT MIR-CVG-AGT-CPREM-AMT
    {
        Length = "13";
        DBTableName = "TCVGA";
        SType = "Currency";
        Label = "Commissionable Premium";
    }

    OUT MIR-CVG-AGT-SHR-PCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TCVGA";
        SType = "Percent";
        Label = "Share";
    }

    OUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }

    OUT MIR-DV-AGT-REASN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-REASN-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Reason";
    }

    OUT MIR-DV-ANNV-PYR-QTY
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "DV_PREV_ANN_YR_QTY";
    }

    OUT MIR-DV-COMM-AMT
    {
        Length = "13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Net Commission";
    }

    OUT MIR-DV-COMM-CHRG-FCT
    {
        Length = "4";
        Decimals = "3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Charge Factor";
    }

    OUT MIR-DV-COMM-PMT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-COMM-PMT-TYP-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Commission Payment Type";
    }

    OUT MIR-DV-COMM-SRC-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "DV-COMM-SRC-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "DV_TRXN_SCR_CD";
    }

    OUT MIR-DV-ENTR-BUS-FCN-ID
    {
        Length = "4";
        DBTableName = "THI";
        SType = "Text";
        Label = "Transaction ID";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-PD-TO-MO-QTY
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Month of Paid to Date";
    }

    OUT MIR-DV-PREM-DUE-MO-QTY
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Premium Due Month";
    }

    OUT MIR-DV-PREM-PD-YR-QTY
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Years Paid";
    }

    OUT MIR-OVRID-ID
    {
        Length = "2";
        DBTableName = "TAS";
        SType = "Text";
        Label = "Agent Situation";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
    }

    OUT MIR-POL-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Currency";
    }

    OUT MIR-POL-INS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Type";
    }

    OUT MIR-POL-TRXN-BTCH-NUM
    {
        Length = "7";
        Decimals = "0";
        DBTableName = "THI";
        SType = "Number";
        Label = "Batch Number";
    }

    OUT MIR-RTBL2-1-RT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        DBTableName = "TCC";
        SType = "Percent";
        Label = "Percentage Rate";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-SERV-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Branch";
    }

    OUT MIR-USER-ID
    {
        Length = "8";
        DBTableName = "THI";
        SType = "Text";
        Label = "User ID";
    }
    OUT MIR-SO-ID
    {
  Length = "5";
  DBTableName = "TAG";
  SType = "Text";
  Label = "Sales Office";
    }

    OUT MIR-CVG-AGT-TYP-CD
    {
  Length = "1";
  DBTableName = "TCVGA";
  SType = "Text";
  Label = "Coverage Agent Type";
    }

    OUT MIR-COMM-TYP-CD
    {
        Length = "1";
  SType = "Text";
  Label = "Commission Type";
    }

    OUT MIR-TRANS-DT
    {
        Length = "10";
        DBTableName = "TUHCO";
        SType = "Date";
        Label = "Transaction Effective Date";
    }

    OUT MIR-APP-RECV-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
  Label = "Application Received Date";
     }
     
#NWLCOM CHANGES STARTS HERE
    OUT MIR-PREM-PD-DT
    {
        Length = "10";
        DBTableName = "TTH";
        SType = "Date";
        Label = "Premium Paid Date";
    }

    OUT MIR-CWA-PRCES-DT
    {
        Length = "10";
        DBTableName = "TTH";
        SType = "Date";
        Label = "CWA Process Date";
    }
#NWLCOM CHANGES ENDS HERE    

     OUT MIR-CVG-ISS-DT
     {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
  Label = "Coverage Issue Date";
     }

     OUT MIR-INSRD-BTH-DT
     {
        Length = "10";
        DBTableName = "TCVGC";
        SType = "Date";
  Label = "Insured Date of Birth";
     }
     OUT MIR-CVG-FACE-AMT
     {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Currency";
  Label = "Coverage Face Amount";
     }
     OUT MIR-PAY-NUM
     {
        Length = "5";
        SType = "Number";
        Label = "Payment Number";
     }

    OUT MIR-STD-PREM-AMT
    {
        Length = "13";
        DBTableName = "TCVGA";
        SType = "Currency";
        Label = "Standard Premium COI";
    }

    OUT MIR-DV-STD-COMM-AMT
    {
        Length = "13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Standard Premium Conv P";
    }

    OUT MIR-EXTR-PREM-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Extra Premium COI";
    }

    OUT MIR-EXTR-PREM-COMM-RT
    {
        Signed;
        Length = "7";
        DBTableName = "Derived";
        Decimals = "4";
        SType = "Percent";
        Label = "Extra Premium Com.Rate";
    }

    OUT MIR-AFYC-SSTD-CNVR-P-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUHCO";
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
