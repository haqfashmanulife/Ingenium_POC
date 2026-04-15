# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:24 PM EDT

#*******************************************************************************
#*  Component:   BF0534-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  NWLPLH  CTS      Changes for policy loan processing                        *
#*  Q01941  CTS      NWLPLH - Changes for IN varaible in to INOUT variable     *
#*  Q02504  CTS      NWLPLH - Changes for  MIR-LOAN-AMT for Standards          *
#*  MP1542  CTS      Changes for APL History                                   *
#*  M319A2  CTS      Changes done for FXWL Policy Loan Processing              *
#*  Q91591  CTS      Fix for FXWL changes                                      *
#*  UYS033  CTS      ADDED NEW FIELD OVERLOAN REPAYMENT DUE DATE               *
#*  UYS057  CTS      ADDED NEW FIELD LOAN INTEREST START DATE                  *
#*******************************************************************************

S-STEP BF0534-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-ID-BASE ";
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

#Q01941 - CHANGES STARTS HERE
    #IN MIR-POL-LOAN-EFF-DT
    INOUT MIR-POL-LOAN-EFF-DT
#Q01941 - CHANGES ENDS HERE
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }
#Q01941 - CHANGES STARTS HERE
    #IN MIR-POL-LOAN-SEQ-NUM
    INOUT MIR-POL-LOAN-SEQ-NUM
#Q01941 - CHANGES ENDS HERE
    {
        Key;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }
#Q01941 - CHANGES STARTS HERE
    #IN MIR-POL-ID-BASE
    INOUT MIR-POL-ID-BASE
#Q01941 - CHANGES ENDS HERE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }
#Q01941 - CHANGES STARTS HERE
    #IN MIR-POL-ID-SFX
    INOUT MIR-POL-ID-SFX
#Q01941 - CHANGES ENDS HERE
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
#Q01941 - CHANGES STARTS HERE
    #IN MIR-POL-LOAN-ID
    INOUT MIR-POL-LOAN-ID
#Q01941 - CHANGES ENDS HERE
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
#  MP1542 Changes start
#       CodeType = "POL-LOAN-ID";
        CodeType = "CASH-LOAN-ID";
#  MP1542 Changes End        
        SType = "Selection";
        Label = "Loan";
    }

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }
    
#Q02504 changes begin

    IN MIR-LOAN-AMT
    {
        DisplayOnly;        
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE        
        Label = "Loan Balance";
    }

#Q02504 changes end    

    IN MIR-POL-LOAN-APL-IND-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        SType = "Indicator";
        Label = "Loan was the last automatic premium loan (APL)";
        Index = "1";
    }

    IN MIR-POL-LOAN-EFF-DT-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-POL-LOAN-ID-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "POL-LOAN-ID";
        Link;
        SType = "Text";
        Label = "Loan";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-POL-LOAN-SEQ-NUM-T[10]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-POL-LOAN-STAT-CD-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "POL-LOAN-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

# NWLPLH changes begin

    IN MIR-POL-LOAN-TRXN-AMT-T[10]
    {
        Signed;
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Loan Transaction Amount";
        Index = "1";
    }

# NWLPLH changes end

    IN MIR-POL-LOAN-TRXN-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "POL-LOAN-TRXN-CD";
        SType = "Text";
        Label = "Loan Transaction";
        Index = "1";
    }

# NWLPLH changes begin 
# Q02504 changes begin
#   IN MIR-LOAN-AMT
#   {
#       DisplayOnly;        
#       Length = "15";
#       SType = "Currency";
#       Label = "Loan Balance";
#   }
# Q02504 changes begin

    IN MIR-LOAN-INCR-DECR-AMT-T[10]
    {
        Signed;        
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE        
        Label = "Policy Loan Balance Increased/Decreased";
        Index = "1";
    }

    IN MIR-LOAN-BAL-AMT-T[10]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Policy Loan Balance";
        Index = "1";
    }

    IN MIR-LOAN-INT-AMT-T[10]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Policy Loan Interest";
        Index = "1";
    }

    IN MIR-LOAN-XCES-SHRT-AMT-T[10]
    {
        Signed;        
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table10";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Excess/Short Interest";
        Index = "1";
    }

    IN MIR-LOAN-PRCES-DT-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Date";
        Label = "Process Date";
        Index = "1";
    }


# NWLPLH changes end

#CHANGES FOR UYS033 -START
    IN  MIR-LOAN-REPAY-DUE-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Overloan Repayment Due Date";
    }
#CHANGES FOR UYS033 -END

# M319A2 CHANGES STARTS HERE
# Q91591 CHANGES STARTS HERE

#    IN MIR-HO-RECV-DT
#    {
#        DisplayOnly;
#        Length = "10";
#        SType = "Date";
#        Label = "Head Office Received Date";
#    }
# Q91591 CHANGES ENDS HERE

    IN MIR-JPY-TRXN-AMT-T[10]
    {
        Signed;
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Loan Transaction Amount";
        Index = "1";
    }    
    
    IN MIR-JPY-XCHNG-EFF-DT-T[10]
    { 
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Currency Exchange Date";
    }
    IN MIR-JPY-XCHNG-RT-T[10]
    { 
        DisplayOnly;
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate to JPY";     
    } 

# Q91591 CHANGES STARTS HERE  
#     INOUT MIR-POL-CRCY-CD-T[10]
#     {     
#         Length = "2";
#         SType = "Hidden";
#         Label = "Currency";
#     } 
# Q91591 CHANGES ENDS HERE
     
     INOUT MIR-POL-CRCY-CD
     {     
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }      
# M319A2 CHANGES ENDS HERE
#CHANGES FOR UYS057 -STARTS
    IN MIR-LOAN-INT-STRT-DT-T[10]
    {
        DisplayOnly;    
        Length = "10";
        FieldGroup = "Table10";
        SType = "Date";
        Label = "Loan Interest Start Date";
        Index = "1";
    }
#CHANGES FOR UYS057 -ENDS
}
