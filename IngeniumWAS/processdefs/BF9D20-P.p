# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF9D20-P.p                                                    *
#*  Description: Health Congratulatory benefit History                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3071  CTS      INGENIUM HEALTH CONGRATULATORY BENEFIT                    *
#*  S47335  CTS      FIELD ADDITION                                            *
#*******************************************************************************

P-STEP BF9D20-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9D20";
        BusinessFunctionName = "Health Congratulatory benefit History Retrieve";               
        BusinessFunctionType = "HLhist";
        MirName = "CCWM9D20";
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
	CodeType = "TRNS-CAT-CD";
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
        Label = "This time's Transaction Amount";
        Index = "1";
    }
    
    OUT MIR-DEFR-HLBEN-AMT-T[30]
    {
        Length = "15";
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Accrued Deferral Health Congratulatory Amount";
        Index = "1";
    }

    OUT MIR-DEFR-HLBEN-INT-AMT-T[30]
    {
        Length = "15";
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Accrued Deferral Health Congratulatory Amount Interest";
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

}