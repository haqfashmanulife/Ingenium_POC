# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0760-P.p                                                    *
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

P-STEP BF0760-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0760";
        BusinessFunctionName = "Accounting Detail History";
        BusinessFunctionType = "Acctd";
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

    OUT MIR-ACCT-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Currency";
    }

    OUT MIR-ACCT-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Current Location";
    }

    OUT MIR-ACCT-ISS-LOC-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Issue Location";
    }

    OUT MIR-ACCT-YR
    {
        Length = "4";
        DBTableName = "TAC";
        SType = "Year";
        Label = "Year";
    }

    OUT MIR-BR-OR-DEPT-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
   #    CodeSource = "XTAB";
   #    CodeType = "BRCH";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Fund";
   #    Label = "Branch / Departments";
    }

    OUT MIR-CHQ-ID
    {
        Length = "16";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Reference Number";
    }

    OUT MIR-CLI-ADDR-CNTY-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "CTYPC";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "County/Parish";
    }

    OUT MIR-CLI-ADDR-MUN-CD
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "MCPCD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Municipality";
    }

    OUT MIR-ACCT-BASE-ID
    {
        Length = "6";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Account to Credit / Debit";
    }

    OUT MIR-DV-ACCT-DESC-TXT
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Accounting Entry Description";
    }

    OUT MIR-DV-ACCT-TRXN-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-DV-CHQ-MANL-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Accounting entry was a manual cheque";
    }

    OUT MIR-DV-CHQ-VCHR-NUM
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Voucher Number";
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

    OUT MIR-DV-SYS-CHQ-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-SYS-CHQ-TYP-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Cheque Type";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Plan";
    }

    OUT MIR-PLAN-ID-2
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
    }

    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    OUT MIR-POL-PREV-ACCT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Transaction Date";
    }

    OUT MIR-POL-TRXN-BTCH-NUM
    {
        Length = "7";
        Decimals = "0";
        DBTableName = "THI";
        SType = "Number";
        Label = "Batch Number";
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

    OUT MIR-TRNXT-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "TRNXT-TYP-CD";
        DBTableName = "TATRN";
        SType = "Text";
        Label = "Record Type";
    }

    OUT MIR-USER-ID
    {
        Length = "8";
        DBTableName = "THI";
        SType = "Text";
        Label = "User ID";
    }
    OUT MIR-ACCT-APP-RECV-DT
    {
        Length = "10";
        DBTableName = "THI";
        Label = "App Received Date";
        SType = "Date";
    }
    OUT MIR-JRNL-DT
    {
        Length = "10";
        DBTableName = "THI";
        Label = "Journal Date";
        SType = "Date";
    }
    OUT MIR-BR-ID
    {
        Length = "5";
        DBTableName = "THI";
        Label = "Branch";
        SType = "Text";
    }
    OUT MIR-ACCT-SO-ID
    {
        Length = "5";
        DBTableName = "THI";
        Label = "Sales Office";
        SType = "Text";
    }
    OUT MIR-OPER-CAT-CD
    {
        Length = "40";
        DBTableName = "THI";
        CodeSource = "EDIT";
        CodeType = "OPNC";
        Label = "Operation Category";
        SType = "Text";
    }
    OUT MIR-PAY-CD
    {
        Length = "1";
        DBTableName = "THI";
        Label = "Prem Ind";
        SType = "Text";
    }
    OUT MIR-GL-PROD-CD
    {
        Length = "7";
        DBTableName = "THI";
        Label = "G\L Product";
        SType = "Text";
    }
    OUT MIR-MCL-BASE-ID
    {
        Length = "8";
        DBTableName = "THI";
        Label = "MLJ Account";
        SType = "Text";
    }
    OUT MIR-CWA-PRCES-DT
    {
        Length = "10";
        DBTableName = "THI";
        Label = "Initial CWA Process Date";
        SType = "Date";
    }
#M271F3 CHANGES START HERE     
    OUT MIR-JGAAP-ADJ-IND
    {
        Length = "1";
        DBTableName = "THI";
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

