
#*******************************************************************************
#*  Component:   BF9C44-P.p                                                    *
#*  Description: CREATED FOR ANNUITY TRANSFER QUOTE SCREEN                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP113C  CTS      INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9C44-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C44";
        BusinessFunctionName = "Annuity Transfer Quote";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9C44";
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
        Label = "Policy ID";
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
    
    IN MIR-ANTY-ESTB-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Annuity Establishment Date";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Coverage Number";
    }
    
    INOUT MIR-ANTY-CAP-AMT
    {
        DisplayOnly;
        Signed;
        DBTableName = "Derived";
	Length = "15";
	SType = "Currency";
        Label = "Annuity Capital";
    }    
    
    OUT MIR-ANTY-PERI-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "Derived";
	CodeSource = "EDIT";
        CodeType = "APAYO";
        SType = "Text";
        Label = "Annuity Period";
        Index = "1";
    }    
    
    OUT MIR-DV-ASSUM-INT-RT-T[20]
    {
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Assumed Interest Rate";
        Index = "1";
    }

    OUT MIR-DV-ANTY-AMT-T[20]
    {
        DisplayOnly;
        Signed;
	Length = "15";
	Decimals = "2";
	FieldGroup = "Table20";
	DBTableName = "Derived";
	SType = "Currency";
        Label = "Annuity Amount";
        Index = "1";
    }

    OUT MIR-DV-TOT-ANTY-AMT-T[20]
    {
        DisplayOnly;
        Signed;
	Length = "15";
	Decimals = "2";
	FieldGroup = "Table20";
	DBTableName = "Derived";
	SType = "Currency";
        Label = "Total Annuity Amount to be Received";
        Index = "1";
    }
    
    OUT MIR-DV-ANTY-CAP-SHRT-AMT-T[20]
    {
        DisplayOnly;
	Signed;
	Length = "15";        
	Decimals = "2";        
	FieldGroup = "Table20";        
	DBTableName = "Derived";        
	SType = "Currency";        
	Label = "Amount of Annuity Capital Shortage";        
        Index = "1";
    }           
}