# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:23 PM EDT

#*******************************************************************************
#*  Component:   BF0530-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  NWLPLH  CTS      Changes for policy loan processing                        *
#*  MP1542  CTS      Changes for APL History                                   *
#*  M319A2  CTS      Changes done for FXWL Policy Loan Processing              *
#*  UYS057  CTS      ADDED NEW FIELD LOAN INTEREST START DATE                  *
#*******************************************************************************

P-STEP BF0530-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0530";
        BusinessFunctionName = "Policy Loan Detail Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0675";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-LOAN-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TLHST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-POL-LOAN-ID
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
#  MP1542 Changes start
#       CodeType = "POL-LOAN-ID";
        CodeType = "CASH-LOAN-ID";
#  MP1542 Changes End
        DBTableName = "TPOLL";
        SType = "Selection";
        Label = "Loan";
    }

    IN MIR-POL-LOAN-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TLHST";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-DV-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-POL-LOAN-APL-IND
    {
        Length = "1";
        DBTableName = "TLHST";
        SType = "Indicator";
        Label = "Loan was the last automatic premium loan (APL)";
    }

    OUT MIR-POL-LOAN-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-LOAN-STAT-CD";
        DBTableName = "TLHST";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-POL-LOAN-TAXWH-AMT
    {
        Length = "9";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Income Tax Withheld";
    }

# NWLPLH changes begin 

    OUT MIR-POL-LOAN-TRXN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Loan Transaction Amount";
    }

# NWLPLH changes begin 

    OUT MIR-POL-LOAN-TRXN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-LOAN-TRXN-CD";
        DBTableName = "TLHST";
        SType = "Text";
        Label = "Loan Transaction";
    }

# NWLPLH changes begin 

    OUT MIR-LOAN-INCR-DECR-AMT
    {
        Signed;        
        Length = "15";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Policy Loan Balance Increased/Decreased";
    }

    OUT MIR-LOAN-BAL-AMT
    {
        Length = "15";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Policy Loan Balance";
    }

    OUT MIR-LOAN-INT-AMT
    {
        Length = "15";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Policy Loan Interest";
    }

    OUT MIR-LOAN-XCES-SHRT-AMT
    {
        Signed;        
        Length = "13";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Excess/Short Interest";
    }

    OUT MIR-LOAN-PRCES-DT
    {
        Length = "10";
        DBTableName = "TLHST";
        SType = "Date";
        Label = "Process Date";
    }

# NWLPLH changes end

# MP1542 changes start

    OUT MIR-LOAN-PD-DUR
    {
        Length = "5";
        DBTableName = "TLHST";
        SType = "Text";
        Label = "Paid Duration";
    }
    
    OUT MIR-APL-DPOS-QTY
    {
        Length = "3";
        DBTableName = "TLHST";
        SType = "Text";
        Label = "Number of APL deposits";
    }

    OUT MIR-NXT-INT-CAP-YM
    {
        Length = "7";
        DBTableName = "TLHST";
        Label = "Next interest capitalization Year/month";
    }
    
    OUT MIR-PREV-UPDT-USER-ID
    {
        Length = "8";
        DBTableName = "TLHST";
        SType = "Text";
        Label = "User ID";
    }

# MP1542 changes end
# M319A2 CHANGES STARTS HERE  

    OUT MIR-HO-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    }

    OUT MIR-JPY-TRXN-AMT
    {
        Signed;                
        Length = "15";
        SType = "Currency";
        Label = "Loan Transaction Amount (Converted in Yen)";
    }
    OUT MIR-JPY-XCHNG-EFF-DT
    { 
        Length = "10";
        SType = "Date";
        Label = "Currency Exchange Date";
    }
    OUT MIR-JPY-XCHNG-RT
    { 
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate to JPY";     
    } 
    INOUT MIR-POL-CRCY-CD
    {     
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    } 
    
# M319A2 CHANGES ENDS HERE    
#CHANGES FOR UYS057 -STARTS
    OUT MIR-LOAN-INT-STRT-DT
    {
        Length = "10";
        DBTableName = "TLHST";
        SType = "Date";
        Label = "Loan Interest Start Date";
    }
#CHANGES FOR UYS057 -ENDS
} 

