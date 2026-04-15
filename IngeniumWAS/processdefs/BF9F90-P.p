# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF9F90-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M33418  CTS      POLICY PAID PREMIUM INQUIRY SCREEN                        *
#*  UYS104  CTS      ADD OF FIELD PROPORTIONAL DISTRIBUTION PAID               *
#*                   PREMIUM CALC FLAG                                         *
#*  28463C  CTS      FRA PAID PREMIUM CHANGES INQUIRY SCREEN                   *
#*******************************************************************************

P-STEP BF9F90-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9F90";
        BusinessFunctionName = "Inquiry-Policy Paid Premium";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9F90";
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
       
    OUT MIR-PD-PREM-AMT
       {
           Signed;
           Length = "16";
           SType = "Currency";
           Label = "Paid Amount";
       }
       
    OUT MIR-TOT-PAYO-AMT
       {
           Signed;
           Length = "16";
           SType = "Currency";
           Label = "Total Payout Amount";
       }
       
    OUT MIR-REMN-XPNS-AMT
       {
           Signed;
           Length = "16";
           SType = "Currency";
           Label = "Remaining Expense";
       }
#UYS104 CHANGES START HERE

    OUT MIR-PROPORTN-PREM-IND
    {
        DisplayOnly;
    	Length = "1";
    	SType = "Indicator";
	    Label = "Proportional distribution type paid premium calculation flag";
	}

#UYS104 CHANGES END HERE
#28463C CHANGES START HERE

    OUT MIR-PD-PREM-FRGN-AMT
       {
           Signed;
           Length = "16";
           SType = "Currency";
           Label = "Paid Premiums (foreign currency) for Regular Annuity";
       }

    INOUT MIR-POL-CRCY-CD
       {
          Length = "2";           
          SType = "Hidden";
          Label = "Currency";
       }
       
#28463C CHANGES END HERE       
       
    OUT MIR-EFF-DT-T[20]
       {
           Length = "10";
           FieldGroup = "Table20";
           SType = "Date";
           Label = "Effective Date";
           Index = "1";
       }
    
    OUT MIR-REASN-CD-T[20]
       {
           Length = "3";
           FieldGroup = "Table20";
           SType = "Text";
           Label = "Category";
           Index = "1";
           CodeSource = "DataModel";
           CodeType = "REASN-CD";
       }
       
    OUT MIR-PAYO-AMT-T[20]
       {
           Length = "16";
           FieldGroup = "Table20";
           SType = "Currency";
           Label = "Payout Amount";
           Index = "1"; 
       }
    INOUT MIR-RECORD-CTR
        {
           Length = "2";
           SType = "Hidden";
           Label = "Rec Count";
        }       
}