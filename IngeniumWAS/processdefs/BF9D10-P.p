# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF9D10-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP302I  6.0      New for release 6.0                                       *
#*  UY3037           Ingenium Survival Benefit                                 *
#*  CD3001           CHANGES DONE AS PART OF CERBERUS DAY 3.0                  *
#*******************************************************************************

P-STEP BF9D10-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9D10";
        BusinessFunctionName = "Survival Benefit History Retrieve";
        BusinessFunctionType = "TDSrvhist";
        MirName = "CCWM9D10";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
      
    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-EFF-DT
    {
        Length = "10";
        DBTableName = "TMAST";   
        SType = "Date";
        Label = "Effective date";
    }

    OUT MIR-TOT-BAL-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Total Balance Amount";
#CD3001 CHANGES STARTS HERE
        CurrencyCode="MIR-POL-CRCY-CD";
#CD3001 CHANGES ENDS HERE
    }

    OUT MIR-TRXN-EFF-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table30";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-TRXN-CAT-CD-T[30]
    {
        Length = "40";
        FieldGroup = "Table30";
        SType = "Text";
        Label = "Transaction Category";
        CodeSource = "DataModel";
	CodeType = "TRXN-CAT-CD";
        Index = "1";
    }

    OUT MIR-TRXN-STAT-CD-T[30]
    {
        Length = "1";
        FieldGroup = "Table30";
        SType = "Text";
        Label = "Status";
        CodeSource = "DataModel";
        CodeType = "TRXN-STAT-CD";
        Index = "1";
    }

    OUT MIR-TRXN-AMT-T[30]
    {
        Length = "15";
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Transaction Amount";
        Index = "1";
    }

    OUT MIR-INCR-DECR-AMT-T[30]
    {
        Length = "15";
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Deferred Survival Benefit Increased / Decreased";
        Index = "1";
    }

    OUT MIR-DEFR-BAL-AMT-T[30]
    {
        Length = "15";
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Deferred Survival Benefit Balance";
        Index = "1";
    }

    OUT MIR-ACCUM-INT-AMT-T[30]
    {
        Length = "15";
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Deferred Survival Benefit Interest Aggregation";
        Index = "1";
    }

    OUT MIR-DED-MEDIC-AMT-T[30]
    {
        Length = "15";
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Medical Benefit Amount";
        Index = "1";
    }

    OUT MIR-PRCES-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table30";
        SType = "Date";
        Label = "Process Date";
        Index = "1";
    }
 
    OUT MIR-TRXN-SEQ-NUM-T[30]
    {
        Length = "3";
        FieldGroup = "Table30";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }
    #UY3037 CHANGES STARTS HERE
    OUT MIR-POL-LOAN-RPAY-T[30]
    {
        Length = "15";
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Policy Loan Repayment";
        Index = "1";
    }
    OUT MIR-APL-RPAY-T[30]
    {
        Length = "15";
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "APL Repayment";
        Index = "1";
    }
    #UY3037 CHANGES ENDS HERE
	
#CD3001 CHANGES STARTS HERE
	OUT MIR-RID-TRXN-EFF-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table25";
        Index = "1";
        SType = "Date";
        Label = "Effective Date";
    }

    OUT MIR-RID-TRXN-CAT-CD-T[30]
    {
        Length = "03";
        FieldGroup = "Table25";
        CodeSource = "DataModel";
        CodeType = "TRXN-CAT-CD";
        Index = "1";
        SType = "Text";
        Label = "Transaction Category";
    }

    OUT MIR-RID-TRXN-STAT-CD-T[30]
    {
        FieldGroup = "Table25";
        CodeSource = "DataModel";
        CodeType = "TRXN-STAT-CD";
        Index = "1";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-RID-TRXN-AMT-T[30]
    {
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        FieldGroup = "Table25";
        Index = "1";
        SType = "Currency";
        Label = "Transaction Amount";

    }

    OUT MIR-RID-INCR-DECR-AMT-T[30]
    {
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        FieldGroup = "Table25";
        Index = "1";
        SType = "Currency";
        Label = "Rider A/V Increased / Decreased";

    }
	OUT MIR-RID-BAL-AMT-T[30]
    {
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        FieldGroup = "Table25";
        Index = "1";
        SType = "Currency";
        Label = "Rider A/V Balance";

    }

    OUT MIR-RID-ACCUM-INT-AMT-T[30]
    {
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        FieldGroup = "Table25";
        Index = "1";
        SType = "Currency";
        Label = "Rider A/V Interest Aggregation";

    }
	OUT MIR-RID-PRCES-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table25";
        Index = "1";
        SType = "Date";
        Label = "Process Date";

    }
 
    OUT MIR-RID-TRXN-SEQ-NUM-T[30]
    {
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