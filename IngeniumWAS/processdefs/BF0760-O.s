# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF0760-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFFACC  CLB      Change usage of Branch/Department to Fund.                *
#*  NWLOP3  CTS      ADD NEW FIELD INTIAL CWA PROCESS DATE FOR                 *
#*  NWLOP3           NWL POLICIES PROCESSED THRU PA,WMD AND MGA                *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M271F3  CTS      JGAAP ADJUSTMENT IDCIATOR IS ADDED                        *
#*******************************************************************************

S-STEP BF0760-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Acctd";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-TRXN-SEQ-NUM";
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

    INOUT MIR-POL-TRXN-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
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

    IN MIR-ACCT-CRCY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
    }

    IN MIR-ACCT-CRNT-LOC-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Current Location";
    }

    IN MIR-ACCT-ISS-LOC-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Issue Location";
    }

    IN MIR-ACCT-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Year";
        Label = "Year";
    }

    IN MIR-BR-OR-DEPT-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
  #     CodeSource = "XTAB";
  #     CodeType = "BRCH";
        SType = "Text";
        Label = "Fund";
  #     Label = "Branch / Departments";
    }

    IN MIR-CHQ-ID
    {
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "Reference Number";
    }

    IN MIR-CLI-ADDR-CNTY-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "CTYPC";
        SType = "Text";
        Label = "County/Parish";
    }

    IN MIR-CLI-ADDR-MUN-CD
    {
        DisplayOnly;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "MCPCD";
        SType = "Text";
        Label = "Municipality";
    }

    IN MIR-ACCT-BASE-ID
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "DataModel";
        CodeType = "DV-ACCT-CD";
        SType = "Text";
        Label = "Account to Credit / Debit";
    }

    IN MIR-DV-ACCT-DESC-TXT
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Accounting Entry Description";
    }

    IN MIR-DV-ACCT-TRXN-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD-1";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-DV-CHQ-MANL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Accounting entry was a manual cheque";
    }

    IN MIR-DV-CHQ-VCHR-NUM
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Voucher Number";
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

    IN MIR-DV-SYS-CHQ-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-SYS-CHQ-TYP-CD";
        SType = "Text";
        Label = "Cheque Type";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-PLAN-ID-2
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Type of Plan";
    }

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    IN MIR-POL-PREV-ACCT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Transaction Date";
    }

    IN MIR-POL-TRXN-BTCH-NUM
    {
        DisplayOnly;
        Length = "7";
        Decimals = "0";
        SType = "Number";
        Label = "Batch Number";
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

    IN MIR-TRNXT-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "TRNXT-TYP-CD";
        SType = "Text";
        Label = "Record Type";
    }

    IN MIR-USER-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "User ID";
    }
    IN MIR-ACCT-APP-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "App Received Date";
    }
    IN MIR-JRNL-DT
    {
        DisplayOnly;
        Length = "10";
        Label = "Journal Date";
        SType = "Date";
    }
    IN MIR-BR-ID
    {
        DisplayOnly;
        Length = "5";
        Label = "Branch";
        SType = "Text";
    }
    IN MIR-ACCT-SO-ID
    {
        DisplayOnly;
        Length = "5";
        Label = "Sales Office";
        SType = "Text";
    }
    IN MIR-OPER-CAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "OPNC";
        Label = "Operation Category";
        SType = "Text";
    }
    IN MIR-PAY-CD
    {
        DisplayOnly;
        Length = "1";
        Label = "Prem Ind";
        SType = "Text";
    }
    IN MIR-GL-PROD-CD
    {
        DisplayOnly;
        Length = "7";
        Label = "G\L Product";
        SType = "Text";
    }
    IN MIR-MCL-BASE-ID
    {
        DisplayOnly;
        Length = "8";
        DBTableName = "THI";
        Label = "MLJ Account";
        SType = "Text";
    }
    IN MIR-CWA-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Initial CWA Process Date";
    }
#M271F3 CHANGES START HERE     
    IN MIR-JGAAP-ADJ-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "JGAAP ADJUSTMENT INDICATOR";
    } 
    
#M271F3 CHANGES ENDS HERE     
#M245B2 CHANGES START HERE     
    INOUT MIR-POL-CRCY-CD-1
            {
         
              Length = "2";
              SType = "Hidden";
              Label = "Currency";
    }
    
#M245B2 CHANGES END HERE    
}

