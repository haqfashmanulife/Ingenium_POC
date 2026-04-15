# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:23 PM EDT

#*******************************************************************************
#*  Component:   BF0534-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  NWLPLH  CTS      Changes for policy loan processing                        *
#*  Q02504  CTS      NWLPLH - Changes for  MIR-LOAN-AMT for Standards          *
#*  MP1542  CTS      Changes for APL History                                   *
#*  M319A2  CTS      Changes done for FXWL Policy Loan Processing              *
#*  Q91591  CTS      M319A2-Fix to correct currency code for Loan balance      * 
#*  M319B5  CTS      Changes done for FXWL APL Loan Processing                 *
#*  UYS033  CTS      ADDED NEW FIELD OVERLOAN REPAYMENT DUE DATE               *
#*  UYS057  CTS      ADDED NEW FIELD LOAN INTEREST START DATE                  *
#*******************************************************************************

P-STEP BF0534-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0534";
        BusinessFunctionName = "Policy Loan Detail List";
        BusinessFunctionType = "List";
        MirName = "CCWM0675";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-LOAN-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TLHST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-POL-LOAN-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TLHST";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

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

    IN MIR-POL-LOAN-ID
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-LOAN-ID";
        DBTableName = "TPOLL";
        SType = "Selection";
        Label = "Loan";
    }
    
# Q02504 changes begin

    OUT MIR-LOAN-AMT
    {
        Length = "15";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Loan Balance";
    }

# Q02504 changes end
# M319B5 CHANGES BEGIN
    OUT MIR-LOAN-AMT-JPY 
    {

      DBTableName = "Derived";
      SType = "Currency";
      Label = "Loan Balance JPY CRCY";
    }
    OUT MIR-LOAN-JPY-XCHNG-DT
    { 
        Length = "10";
        SType = "Date";
        Label = "Conversion Exchange Effective date";
     }
    OUT MIR-LOAN-JPY-XCHNG-RT
    { 

        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate from FC to JPY";     
    }      
# M319B5 CHANGES ENDS

    OUT MIR-DV-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-POL-LOAN-APL-IND-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";
        DBTableName = "TLHST";
        SType = "Indicator";
        Label = "Loan was the last automatic premium loan (APL)";
        Index = "1";
    }

    OUT MIR-POL-LOAN-EFF-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TLHST";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-POL-LOAN-ID-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";
        KeyColumn;
        CodeSource = "DataModel";
#  MP1542 Changes start
#       CodeType = "POL-LOAN-ID";
        CodeType = "CASH-LOAN-ID";
#  MP1542 Changes End
        DBTableName = "TPOLL";
        SType = "Text";
        Label = "Loan";
        Index = "1";
    }

    OUT MIR-POL-LOAN-SEQ-NUM-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        DBTableName = "TLHST";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-POL-LOAN-STAT-CD-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "POL-LOAN-STAT-CD";
        DBTableName = "TLHST";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

# NWLPLH changes begin

    OUT MIR-POL-LOAN-TRXN-AMT-T[10]
    {
        Signed;        
        Length = "15";
        FieldGroup = "Table10";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Loan Transaction Amount";
        Index = "1";
    }
    
# NWLPLH changes end    

    OUT MIR-POL-LOAN-TRXN-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "POL-LOAN-TRXN-CD";
        DBTableName = "TLHST";
        SType = "Text";
        Label = "Loan Transaction";
        Index = "1";
    }

# NWLPLH changes begin 
# Q02504 changes begin
#   OUT MIR-LOAN-AMT
#   {
#       Length = "15";
#       DBTableName = "TPOLL";
#       SType = "Currency";
#       Label = "Loan Balance";
#   }
# Q02504 changes end

    OUT MIR-LOAN-INCR-DECR-AMT-T[10]
    {
        Signed;        
        Length = "15";
        FieldGroup = "Table10";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Policy Loan Balance Increased/Decreased";
        Index = "1";
    }

    OUT MIR-LOAN-BAL-AMT-T[10]
    {
        Length = "15";
        FieldGroup = "Table10";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Policy Loan Balance";
        Index = "1";
    }

    OUT MIR-LOAN-INT-AMT-T[10]
    {
        Length = "15";
        FieldGroup = "Table10";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Policy Loan Interest";
        Index = "1";
    }

    OUT MIR-LOAN-XCES-SHRT-AMT-T[10]
    {
        Signed;        
        Length = "13";
        FieldGroup = "Table10";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Excess/Short Interest";
        Index = "1";
    }

    OUT MIR-LOAN-PRCES-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TLHST";
        SType = "Date";
        Label = "Process Date";
        Index = "1";
    }

# NWLPLH changes end

# MP1542 changes start

    OUT MIR-LOAN-PD-DUR-T[10]
    {
        Signed;        
        Length = "5";
        FieldGroup = "Table10";
        DBTableName = "TLHST";
        SType = "Text";
        Label = "Paid Duration";
        Index = "1";
    }
    
    OUT MIR-APL-DPOS-QTY-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        DBTableName = "TLHST";
        SType = "Text";
        Label = "Number of APL deposits";
        Index = "1";
    }

    OUT MIR-NXT-INT-CAP-YM-T[10]
    {
        Signed;        
        Length = "7";
        FieldGroup = "Table10";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Next interest capitalization Year/month";
        Index = "1";
    }

# MP1542 changes end
#CHANGES FOR UYS033 STARTS
    OUT  MIR-LOAN-REPAY-DUE-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Overloan Repayment Due Date";
    }
#CHANGES FOR UYS033 ENDS
# M319A2 CHANGES STARTS HERE

    OUT MIR-HO-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    }
    
    OUT MIR-JPY-TRXN-AMT-T[10]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Loan Transaction Amount";
        Index = "1";
    }    
    
    OUT MIR-JPY-XCHNG-EFF-DT-T[10]
    { 
        Length = "10";
        SType = "Date";
        Label = "Currency Exchange Date";
    }
    OUT MIR-JPY-XCHNG-RT-T[10]
    { 
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate to JPY";     
    } 

#Q91591 CHANGES START HERE 
#     INOUT MIR-POL-CRCY-CD-T[10]
#     {     
#         Length = "2";
#         SType = "Hidden";
#         Label = "Currency";
#     }  
#Q91591 CHANGES ENDS HERE 
# M319A2 CHANGES ENDS HERE

#Q91591 CHANGES START HERE    
    INOUT MIR-POL-CRCY-CD
     {     
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }  
#Q91591 CHANGES ENDS HERE
#CHANGES FOR UYS057 -STARTS
    OUT MIR-LOAN-INT-STRT-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TLHST";
        SType = "Date";
        Label = "Loan Interest Start Date";
        Index = "1";
    }
#CHANGES FOR UYS057 -ENDS
} 