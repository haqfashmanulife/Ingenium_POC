# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF9D17-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP302U  6.0      New for release 6.0                                       *
#*******************************************************************************

P-STEP BF9D17-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9D17";
        BusinessFunctionName = "Survival Benefit Deduction Amount History Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9D17";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-SRVH-TRXN-CAT-CD
    {
        Length = "40";
        SType = "Hidden";
        Label = "Transaction Category";
        CodeSource = "DataModel";
        CodeType = "TRXN-CAT-CD";
    }
    
    INOUT MIR-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-SRVH-EFF-DT
    {
        Length = "10";
        DBTableName = "TSRVH";
        SType = "Date";
        Label = "Survival Benefit Payout/Deferral Date";
    }

    OUT MIR-SRVH-PRCES-DT    
    {    
        Length = "10";    
        DBTableName = "TSRVH"; 
        SType = "Date";    
        Label = "Process Date";    
    }    

    INOUT MIR-DV-TOT-SRVBEN-DED-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Survival Benefit Amount(After Deduction)";
    }

    INOUT MIR-DV-DED-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Deduction Amount";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner name"; 
    }
    
    OUT MIR-SBSDRY-CO-ID
    {
        Length = "75";
	DBTableName = "Derived";
        SType = "Text";
        Label = "Subsidiary Company ID"; 
    }
    
    OUT MIR-CLM-ID-T[30]
    {
        Length = "8";
        FieldGroup = "Table30";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "Claim Id";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[30]
    {
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage No";
        Index = "1";
    }
    
    OUT MIR-BNFT-NM-T[30]
    {
        Length = "5";
        FieldGroup = "Table30";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
        CodeSource = "EDIT";
    	CodeType = "BENNM";
    }
    
    OUT MIR-EVNT-STRT-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TCLBD";
        SType = "Date";
        Label = "Payment Event Start date";
        Index = "1";
    }
    
    OUT MIR-EVNT-END-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TCLBD";
        SType = "Date";
        Label = "Payment Event End date";
        Index = "1";
    }

    OUT MIR-EVNT-PAID-AMT-T[30]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table30";
        DBTableName = "TCLBD";
        SType = "Currency";
        Label = "Benefit Amount";
        Index = "1";
    }
    
}