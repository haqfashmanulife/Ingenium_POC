#*******************************************************************************
#*  Component:   BF9305-P.p                                                    *
#*  Description: Created for Advance Payment Management Screen                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLPP6  CTS      INITIAL VERSION                                           *
#*  M319B1  CTS      CHANGES AS PART OF FXWL                                   *
#*  M319O1  CTS      CHANGES AS PART OF FXWL -CURRENCY HANDLING                *
#*  UYS025  CTS      ADVANCE PAYMENT RESERVE AMOUNT FIELD ADDED                *
#*  UY3153  CTS      CR148 DHY ANNUITY CSV                                     *
#*******************************************************************************

P-STEP BF9305-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9305";
        BusinessFunctionName = "Advance Payment Management";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9305";
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

    OUT MIR-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        Label = "Plan ID";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    INOUT MIR-PRCES-DT
    {
        Length = "10";
        DBTableName = "Derived";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Processing Date";
    }

    OUT MIR-TRAD-PD-DUR-NUM
    {
        Label = "Trad Paid Duration";
        Length = "6";
        DBTableName = "Derived";
        SType = "Text";
    }

    OUT MIR-TRAD-PD-TO-MO-NUM
    {
        Label = "Trad Paid to Month";
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
    }

    OUT MIR-POL-PD-DUR-NUM
    {
        Label = "Trad Actual Paid Duration";
        Length = "6";
        DBTableName = "Derived";
        SType = "Text";
    }

    OUT MIR-POL-PD-TO-MO-NUM
    {
        Label = "Trad Actual Paid to Month";
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
    }
#UYS025 CHANGES START HERE

    OUT MIR-ADV-PMT-RSRV-AMT
    {    
    	Signed;
    	Length = "15";
        DBTableName = "TPOL";
    	SType = "Currency";
    	CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "Advance Payment Reserve Amount";
    }  
#UYS025 CHANGES ENDS HERE

    OUT MIR-SURR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
#M319O1-AS PART OF FXWL CHNAGES STARTS HERE
	CurrencyCode = "MIR-PREM-CRCY-CD";
#M319O1-AS PART OF FXWL CHNAGES ENDS HERE
        Label = "Surrender Amount";
    }

    OUT MIR-ADV-PMT-CAT-CD-T[50]
    {
        FieldGroup = "Table50";
        Index = "1";
        Length = "4";
        DBTableName = "Derived";
        CodeSource = "DataModel";
        CodeType = "ADV-PMT-CAT-CD";
         SType = "Text";
        Label = "Category";
    }

    OUT MIR-PRCES-DT-T[50]
    {
        FieldGroup = "Table50";
        Index = "1";
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Processing Year, Month and Date";
    }

    OUT MIR-APROP-YR-MO-T[50]
    {
        FieldGroup = "Table50";
        Index = "1";
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Appropriation Year and Month";
    }

    OUT MIR-COLCT-AMT-T[50]
    {
        FieldGroup = "Table50";
        Index = "1";
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
#M319B1-AS PART OF FXWL CHNAGES STARTS HERE
	CurrencyCode = "MIR-PREM-CRCY-CD";
#M319B1-AS PART OF FXWL CHNAGES ENDS HERE
        Label = "Collection Amount";
    }

    OUT MIR-APROP-AMT-T[50]
    {
        FieldGroup = "Table50";
        Index = "1";
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
#M319B1-AS PART OF FXWL CHNAGES STARTS HERE
	CurrencyCode = "MIR-PREM-CRCY-CD";
#M319B1-AS PART OF FXWL CHNAGES ENDS HERE
        Label = "Amount Appropriated";
    }

    OUT MIR-RSDUE-AMT-T[50]
    {
        FieldGroup = "Table50";
        Index = "1";
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
#M319B1-AS PART OF FXWL CHNAGES STARTS HERE
	CurrencyCode = "MIR-PREM-CRCY-CD";
#M319B1-AS PART OF FXWL CHNAGES ENDS HERE
        Label = "Residuals of Advance Payment";
    }

    OUT MIR-NUM-MO-INT-CAP-T[50]
    {
        FieldGroup = "Table50";
        Index = "1";
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of Months of Interest Capitalization";
    }

    OUT MIR-ADV-PMT-DUR-YYMM-T[50]
    {
        FieldGroup = "Table50";
        Index = "1";
        Length = "5";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Year and Month of Advance Payment";
    }

   OUT MIR-NXT-APROP-YR-MO-T[50]
    {
        FieldGroup = "Table50";
        Index = "1";
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Next Appropriation Year and Month";
    }

    OUT MIR-INT-RT-T[50]
    {
        FieldGroup = "Table50";
        Index = "1";
        Length = "7";
        Decimals = "4";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Interest Rate";
    }

    OUT MIR-ADV-PMT-END-YR-MO-T[50]
    {
        FieldGroup = "Table50";
        Index = "1";
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Advance Payment End Year and Month";
    }

    OUT MIR-ADV-PMT-TYP-CD-T[50]
    {
        FieldGroup = "Table50";
        Index = "1";
        Length = "1";
        DBTableName = "Derived";
        CodeSource = "DataModel";
        CodeType = "ADV-PMT-TYP-CD";
        SType = "Text";
        Label = "Prepayment/Lump-sum";
    }

    OUT MIR-ADV-PMT-STAT-CD-T[50]
    {
        FieldGroup = "Table50";
        Index = "1";
        Length = "1";
        DBTableName = "Derived";
        CodeSource = "DataModel";
        CodeType = "PCHST-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    INOUT MIR-PCHST-EFF-DT
    {
        Length = "10";
        DBTableName = "PHST";
        SType = "Hidden";
    }

    INOUT MIR-PCHST-SEQ-NUM
    {
        Length = "3";
        DBTableName = "PHST";
        SType = "Hidden";
    }

    INOUT MIR-TH-PREM-PD-DT-NUM
    {
        Length = "10";
        DBTableName = "TH";
        SType = "Hidden";
    }

    INOUT MIR-HID-ADV-PMT-STRT-DT
    {
        DBTableName = "Derived";
        Length = "10";
        SType = "Hidden";
    }

    INOUT MIR-HID-ADV-PMT-DUR
    {
        DBTableName = "Derived";
        Length = "3";
        SType = "Hidden";
    }

    INOUT MIR-HID-ADV-PMT-END-DT
    {
        DBTableName = "Derived";
        Length = "10";
        SType = "Hidden";
    }

    INOUT MIR-HID-ADV-PMT-TYP-CD
    {
        DBTableName = "Derived";
        Length = "1";
        SType = "Hidden";
    }

    INOUT MIR-HID-RSDUE-AMT
    {
        DBTableName = "Derived";
        Length = "15";
        SType = "Hidden";
    }

    INOUT MIR-HID-SURR-AMT
    {
        DBTableName = "Derived";
        Length = "15";
        SType = "Hidden";
    }
#M319B1 CHANGES START HERE 
      INOUT MIR-PREM-CRCY-CD
      {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
      }
#M319B1 CHANGES END HERE
#UY3153 CHANGES START HERE

    OUT MIR-ANN-PRE-BAL-AMT
    {    
    	Signed;
    	Length = "15";
        DBTableName = "TPOL";
    	SType = "Currency";
    	CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "Annuity Prepayment Balance Amount";
    }  
    
    OUT MIR-ANN-ADV-PAY-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
	    CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "Individual Annuity Advance Payment Balance";
    }
#UY3153 CHANGES ENDS HERE    
}
