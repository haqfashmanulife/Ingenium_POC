#*******************************************************************************
#*  Component:   BF9B34-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1542  CTS      S-STEP FOR APL HISTORY LIST SCREEN                        *
#*  M319B5  CTS      Changes done for FXWL APL Loan Processing                 *
#*  UYS033  CTS      ADDED NEW FIELD OVERLOAN REPAYMENT DUE DATE
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

S-STEP BF9B34-O
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

#UY3004 CHANGES START
    INOUT Dispolval
    {
        SType = "Hidden";
    }

    INOUT Dissfxval
    {
        SType = "Hidden";
    }
#UY3004 CHANGES END

    INOUT MIR-POL-LOAN-EFF-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }
    INOUT MIR-POL-LOAN-SEQ-NUM
    {
        Key;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }
    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }
    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }
    

    IN MIR-LOAN-AMT
    {
        DisplayOnly;        
        Length = "15";
        SType = "Currency";
#M319B5 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319B5 CHANGES ENDS HERE                
        Label = "APL Balance";
    }
# M319B5 CHANGES START    
    IN  MIR-LOAN-AMT-JPY 
    {

         DisplayOnly;
         Label = "Loan Balance JPY CRCY";
         Length = "16";
         SType = "Currency";
         Signed;
    }
    
    IN MIR-LOAN-JPY-XCHNG-DT
    { 
	DisplayOnly;
	Length = "10";
	SType = "Date";
	Label = "Conversion Exchange Effective date";
    }
    IN MIR-LOAN-JPY-XCHNG-RT
    { 
        DisplayOnly;
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate from FC to JPY";     
    }   
    
    INOUT MIR-POL-CRCY-CD
        {
          
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
  }
    
# M319B5 CHANGES ENDS    

    IN MIR-POL-LOAN-TRXN-CD-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "POL-LOAN-TRXN-CD";
        Link;
        SType = "Text";
        Label = "APL";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-POL-LOAN-EFF-DT-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Date";
        Label = "APL Date";
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


    IN MIR-LOAN-PD-DUR-T[10]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Paid Duration";
        Index = "1";
    }

    IN MIR-APL-DPOS-QTY-T[10]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Number of APL deposits";
        Index = "1";
    }

    IN MIR-LOAN-INCR-DECR-AMT-T[10]
    {
        Signed;        
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
#M319B5 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319B5 CHANGES ENDS HERE                        
        Label = "APL Premium";
        Index = "1";
    }

    IN MIR-LOAN-INT-AMT-T[10]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
#M319B5 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319B5 CHANGES ENDS HERE        
        Label = "Interest amount(Capitalization)";
        Index = "1";
    }

    IN MIR-LOAN-BAL-AMT-T[10]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
#M319B5 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319B5 CHANGES ENDS HERE        
        Label = "Balance of APL";
        Index = "1";
    }
# M319B5 CHANGES STARTS HERE
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
# M319B5 CHANGES ENDS HERE
    IN MIR-NXT-INT-CAP-YM-T[10]
    {
        Signed;        
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Next interest capitalization Year/month";
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

    IN MIR-POL-LOAN-SEQ-NUM-T[10]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }
#CHANGES FOR UYS033 STARTS
    IN  MIR-LOAN-REPAY-DUE-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Overloan Repayment Due Date";
    }
#CHANGES FOR UYS033 ENDS

}

