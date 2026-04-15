# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF9F90-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M33418  CTS      POLICY OWNER CHANGE HISTORY                               *
#*  UYS104  CTS      ADD OF FIELD PROPORTIONAL DISTRIBUTION PAID               *
#*                   PREMIUM CALC FLAG                                         *
#*  28463C  CTS      FRA PAID PREMIUM CHANGES INQUIRY SCREEN                   *
#*******************************************************************************

S-STEP BF9F90-O
{
   ATTRIBUTES
       {
           BusinessFunctionType = "Retrieve";
           Type = "Output";
           DelEmptyRows;
           FocusField = "MIR-POL-ID-BASE";
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

    IN MIR-POL-ID-BASE
       {
           Key;
           DisplayOnly;
           Length = "9";
           SType = "Text";
           Label = "Policy ID";
       }
    
    IN MIR-POL-ID-SFX
       {
           Key;
           DisplayOnly;
           Length = "1";
           SType = "Text";
           Label = "Suffix";
       }
       
    IN MIR-PD-PREM-AMT
       {
           DisplayOnly;
           Signed;
           Length = "16";
           SType = "Currency";
           Label = "Paid Amount";
       }
           
    IN MIR-TOT-PAYO-AMT
       {
           DisplayOnly;
           Signed;
           Length = "16";
           SType = "Currency";
           Label = "Total Payout Amount";
       }
           
    IN MIR-REMN-XPNS-AMT
       {
           DisplayOnly;
           Signed;
           Length = "16";
           SType = "Currency";
           Label = "Remaining Expense";
       }
 #UYS104 CHANGES START HERE
    IN MIR-PROPORTN-PREM-IND
	   {
	     DisplayOnly;
	     Length = "1";
         SType = "Indicator";
         Label = "Proportional distribution type paid premium calculation flag";
	   }
 #UYS104 CHANGES END HERE
 #28463C CHANGES START HERE
    IN MIR-PD-PREM-FRGN-AMT
       {
           CurrencyCode = "MIR-POL-CRCY-CD";
           DisplayOnly;
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
 

    IN MIR-EFF-DT-T[20]
       {
           DisplayOnly;
           Length = "10";
           FieldGroup = "Table20";
           SType = "Date";
           Label = "Effective Date";
           Index = "1";
       }
        
    IN MIR-REASN-CD-T[20]
       {
           DisplayOnly;
           Length = "3";
           FieldGroup = "Table20";
           SType = "Text";
           Label = "Category";
           Index = "1";
           CodeSource = "DataModel";
           CodeType = "REASN-CD";
       }
           
    IN MIR-PAYO-AMT-T[20]
       {
           DisplayOnly;
           Signed;
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
       
    