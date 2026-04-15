# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF9D10-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP302I  6.0      New for release 6.0                                       *
#*  UY3037           Ingenium Survival Benefit                                 *
#*  CD3001           CHANGES DONE AS PART OF CERBERUS DAY 3.0                  *
#*******************************************************************************

S-STEP BF9D10-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "TDSrvhist";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-ID-BASE ";
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
        Mandatory;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-EFF-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-TOT-BAL-AMT
    {
        Length = "13";
        SType = "Currency";
#CD3001 CHANGES STARTS HERE
        CurrencyCode="MIR-POL-CRCY-CD";
#CD3001 CHANGES ENDS HERE
        Label = "Total Balance Amount";
    }
    

   IN MIR-TRXN-EFF-DT-T[30]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table30";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-TRXN-CAT-CD-T[30]
    {
        Length = "40";
        FieldGroup = "Table30";
        SType = "Text";
        Label = "Transaction Category";
        CodeSource = "DataModel";
        CodeType = "TRXN-CAT-CD";
        Index = "1";
    }

    IN MIR-TRXN-STAT-CD-T[30]
    {
        Length = "1";
        FieldGroup = "Table30";
        SType = "Text";
        Label = "Status";
        CodeSource = "DataModel";
        CodeType = "TRXN-STAT-CD";
        Index = "1";
    }
    
    IN MIR-TRXN-AMT-T[30]
    {
        Length = "15";
        DisplayOnly;
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Transaction Amount";
        Index = "1";
    }

    IN MIR-INCR-DECR-AMT-T[30]
    {
        Length = "15";
        DisplayOnly;
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Deferred Survival Benefit Increased / Decreased";
        Index = "1";
    }

    IN MIR-DEFR-BAL-AMT-T[30]
    {
        Length = "15";
        DisplayOnly;
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Deferred Survival Benefit Balance";
        Index = "1";
    }

    IN MIR-ACCUM-INT-AMT-T[30]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Deferred Survival Benefit Interest Aggregation";
        Index = "1";
    }

    IN MIR-DED-MEDIC-AMT-T[30]
    {
        Length = "15";
        DisplayOnly;
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Medical Benefit Amount";
        Index = "1";
    }

    IN MIR-PRCES-DT-T[30]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table30";
        SType = "Date";
        Label = "Process Date";
        Index = "1";
    }

     IN MIR-TRXN-SEQ-NUM-T[30]
    {
        Length = "3";
        DisplayOnly;
        FieldGroup = "Table30";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }
    #UY3037 CHANGES STARTS HERE
     IN MIR-POL-LOAN-RPAY-T[30]
    {
        Length = "15";
        DisplayOnly;
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Policy Loan Repayment";
        Index = "1";
    }
     IN MIR-APL-RPAY-T[30]
    {
        Length = "15";
        DisplayOnly;
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "APL Repayment";
        Index = "1";
    }  
    #UY3037 CHANGES ENDS HERE
	
#CD3001 CHANGES STARTS HERE
     IN MIR-RID-TRXN-EFF-DT-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table25";
        Index = "1";
        SType = "Date";
        Label = "Effective Date";
    }

     IN MIR-RID-TRXN-CAT-CD-T[30]
    {
        DisplayOnly;
        Length = "03";
        FieldGroup = "Table25";
        CodeSource = "DataModel";
        CodeType = "TRXN-CAT-CD";
        Index = "1";
        SType = "Text";
        Label = "Transaction Category";
    }

     IN MIR-RID-TRXN-STAT-CD-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table25";
        CodeSource = "DataModel";
        CodeType = "TRXN-STAT-CD";
        Index = "1";
        SType = "Text";
        Label = "Status";
    }
    
     IN MIR-RID-TRXN-AMT-T[30]
    {
        DisplayOnly;
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        FieldGroup = "Table25";
        Index = "1";
        SType = "Currency";
        Label = "Transaction Amount";
    }

     IN MIR-RID-INCR-DECR-AMT-T[30]
    {
        DisplayOnly;
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        FieldGroup = "Table25";
        Index = "1";
        SType = "Currency";
        Label = "Rider A/V Increased / Decreased";
    }

     IN MIR-RID-BAL-AMT-T[30]
    {
        DisplayOnly;
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        FieldGroup = "Table25";
        Index = "1";
        SType = "Currency";
        Label = "Rider A/V Balance";
    }

     IN MIR-RID-ACCUM-INT-AMT-T[30]
    {
        DisplayOnly;
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        FieldGroup = "Table25";
        Index = "1";
        SType = "Currency";
        Label = "Rider A/V Interest Aggregation";
    }
	 IN MIR-RID-PRCES-DT-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table25";
        Index = "1";
        SType = "Date";
        Label = "Process Date";
    }

     IN MIR-RID-TRXN-SEQ-NUM-T[30]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table25";
        Index = "1";
        SType = "Text";
        Label = "Sequence Number";
    }

     INOUT MIR-POL-CRCY-CD
    {   
        Length = "2";
        SType = "Hidden";               
    } 
    #CD3001 CHANGES ENDS HERE
}