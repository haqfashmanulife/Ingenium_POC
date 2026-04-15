# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF0530-O.s                                                    *
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

S-STEP BF0530-O
{
    ATTRIBUTES
    {
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

    IN MIR-POL-LOAN-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-POL-LOAN-ID
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
#  MP1542 Changes start
#       CodeType = "POL-LOAN-ID";
        CodeType = "CASH-LOAN-ID";
#  MP1542 Changes End
        SType = "Text";
        Label = "Loan";
    }

    IN MIR-POL-LOAN-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-POL-LOAN-APL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Loan was the last automatic premium loan (APL)";
    }

    IN MIR-POL-LOAN-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-LOAN-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-POL-LOAN-TAXWH-AMT
    {
        DisplayOnly;
        Length = "9";
        SType = "Currency";
        Label = "Income Tax Withheld";
    }

# NWLPLH changes begin 

    IN MIR-POL-LOAN-TRXN-AMT
    {
        Signed;                
        DisplayOnly;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE 
        Label = "Loan Transaction Amount";
    }

# NWLPLH changes end

    IN MIR-POL-LOAN-TRXN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-LOAN-TRXN-CD";
        SType = "Text";
        Label = "Loan Transaction";
    }
    
# NWLPLH changes begin 

    IN MIR-LOAN-INCR-DECR-AMT
    {
        Signed;                
        DisplayOnly;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Policy Loan Balance Increased/Decreased";
    }

    IN MIR-LOAN-BAL-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Policy Loan Balance";
    }

    IN MIR-LOAN-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Policy Loan Interest";
    }

    IN MIR-LOAN-XCES-SHRT-AMT
    {
        Signed;                
        DisplayOnly;
        Length = "13";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Excess/Short Interest";
    }

    IN MIR-LOAN-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    }

# NWLPLH changes end

# M319A2 CHANGES STARTS HERE  

   IN MIR-HO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    }

    IN MIR-JPY-TRXN-AMT
    {
        Signed;                
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Loan Transaction Amount (Converted in Yen)";
    }
    IN MIR-JPY-XCHNG-EFF-DT
    { 
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Currency Exchange Date";
    }
    IN MIR-JPY-XCHNG-RT
    { 
        DisplayOnly;
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate to JPY";     
    } 
    IN MIR-POL-CRCY-CD
    {     
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    } 
    
# M319A2 CHANGES ENDS HERE    

#CHANGES FOR UYS057 -START
    IN MIR-LOAN-INT-STRT-DT
    {
        DisplayOnly;
        Length = "10";       
        SType = "Date";
        Label = "Loan Interest Start Date";
    }
#CHANGES FOR UYS057 -ENDS
}
