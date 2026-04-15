#*******************************************************************************
#*  Component:   BF9B94-O.s                                                    *
#*  Description: Rider Surrender/Rider FA Reduction List                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1172  CTS      INITIAL VERSION                                           *
#*  Q13430  CTS      TRAIL CALC CHANGES FOR APL PROCESS                        *
#*  Q11779  CTS      CHANGES TO ADD DV EFFECTIVE DATE                          *
#*  MP161J  CTS      CHANGES TO ADD WAIVER OF PREMIUM INDICATOR                *
#*  TVI15B  CTS      TVI15B - CHANGES FOR FA REDUCTION                         *
#*  M213L1  CTS      CHANGES FOR RUM                                           *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  MP334A  CTS      CHANGES DONE FOR ADDITION OF NEW FIELD TOTAL PREMIUM PAID *
#*  UYS014  CTS      ADDITION OF NEW FIELD FOR INCREASING FACE AMOUNT          *
#*  UYS32E  CTS      ADDITIONAL ITEMS FOR UNEARNED INTEREST                    *
#*  23802P  CTS      SUL MATURITY ADMIN CHANGES                                *
#*  S23388  CTS      FIX TO DISPLAY CURRECNY CODE                              *
#*  UY3068  CTS      ADDITION OF NEW FIELDS AS PART OF FA REDUCTION            *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*  CD3002  CTS      CAHNGES DONE AS PART OF CERBERUS DAY-3                    *
#*  NVCA02  CTS      CHANGES DONE AS PART OF ONTARIO FA REDUCTION              *
#*******************************************************************************

S-STEP BF9B94-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
        Type = "Output";
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
	SType="Hidden";
    }

    IN MIR-POL-ID-BASE 
    {
        DefaultSession = "MIR-POL-ID-BASE";
        DisplayOnly;
        Key;
        Label = "Policy Id";
        Length = "9";
        SType = "Text";
    }

    IN MIR-POL-ID-SFX 
    {
        DefaultSession = "MIR-POL-ID-SFX";
        DisplayOnly;
        Key;
        Label = "Suffix";
        Length = "1";
        SType = "Text";
    }

    IN MIR-APPL-CTL-PRCES-DT
    {
        DefaultSession = "LSIR-PRCES-DT";
        Label = "Date Of Change";
        Length = "10";
        Mandatory;
        SType = "Date";
    }

    IN MIR-MLJ-ACPT-DT
    {
        DefaultSession = "LSIR-PRCES-DT";
        Label = "Company Received Date";
        Length = "10";
        SType = "Date";
    }

    IN MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        Label = "Pay Out Method";
        Length = "1";
        SType = "Selection";
    }

    IN MIR-JRNL-DT
    {
        DefaultSession = "LSIR-PRCES-DT";
        Label = "Journal Date";
        Length = "10";
        SType = "Date";
    }

    IN MIR-CVG-NUM-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        KeyColumn;
        Label = "Coverage No";
        Length = "2";
        SType = "Text";
    }

    IN MIR-PLAN-ID-T[99] 
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Plan";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CVG-FACE-AMT-T[99] 
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    IN MIR-CVG-NEW-FACE-AMT-T[99] 
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "Derived";
        Index = "1";
        Label = "New Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    IN MIR-NEW-FACE-AMT-T[99] 
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "Derived";
        Index = "1";
        Label = "New Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    }
    IN MIR-CVG-ISS-EFF-DT-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Issue Date";
        Length = "10";
        SType = "Date";
    }

    IN MIR-DV-INSRD-CLI-NM-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "Derived";
        Index = "1";
        Label = "Insured Name";
        Length = "75";
        SType = "Text";
    }
    IN MIR-CVG-STBL-1-CD-T[99] 
    {
#* M241A3 changes START here* 
#        CodeSource = "EDIT";
#        CodeType = "STB1";
        CodeSource = "CSOM9D29";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T";
        FilterField2 = "MIR-CVG-STBL-1-CD-T";
#* M241A3 changes END here* 
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Insurance Period";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CVG-STBL-2-CD-T[99] 
    {
        CodeSource = "EDIT";
        CodeType = "STB2";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Benefit-Day Type";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CVG-STBL-3-CD-T[99] 
    {
#* M241A3 changes START here* 
#       CodeSource = "EDIT";
#       CodeType = "STB3";
        CodeSource = "CSOM9D30";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T";
        FilterField2 = "MIR-CVG-STBL-3-CD-T";
#* M241A3 changes END here* 
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Sub Table 3";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CVG-STBL-4-CD-T[99] 
    {
        CodeSource = "EDIT";
        CodeType = "STB4";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Sub Table 4";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CVG-MPREM-AMT-T[99] 
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Current Premium";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    IN MIR-CVG-NEW-MPREM-AMT-T[99] 
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "Derived";
        Index = "1";
        Label = "New Premium";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    IN  MIR-CVG-CSV-AMT-T[99]
    {
 #M245B2 CHANGES START HERE    
         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
         DisplayOnly;
         Signed;
         Length = "16";
         FieldGroup = "Table99";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "CSV";
         Index = "1";
    }

#NVCA02 CHANGES START HERE 
    IN MIR-BASE-MTHLY-PREM-AMT-T[99] 
    {  
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Base Monthly Premium";
        Length = "16";
        SType = "Currency";
        Signed;
    }
	
    IN MIR-NEW-BASE-MTHLY-PREM-AMT-T[99] 
    {    
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "Derived";
        Index = "1";
        Label = "New Base Monthly Premium";
        Length = "16";
        SType = "Currency";
        Signed;
    }
#NVCA02 ENDS HERE 
    IN MIR-CVG-PREM-CHNG-DT-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Renewal Date";
        Length = "10";
        SType = "Date";
    }

#MP161J STARTS
    IN MIR-CVG-WP-IND-T[99]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label ="Waiver Of Premium";
        Index = "1";
    }
#MP161J ENDS 

    IN  MIR-TOT-CVG-MPREM-AMT 
    {
 #M245B2 CHANGES START HERE    
         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
         DisplayOnly;
         Label = "Current Total Premium";
         Length = "16";
         SType = "Currency";
         Signed;
    }

    IN  MIR-TOT-CVG-NEW-MPREM-AMT 
    {
 #M245B2 CHANGES START HERE    
         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
         DisplayOnly;
         Label = "New Total Premium";
         Length = "16";
         SType = "Currency";
         Signed;
    }

    IN  MIR-TOT-CSV-AMT 
    {
 #M245B2 CHANGES START HERE    
         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
         DisplayOnly;
         Label = "Total CSV";
         Length = "16";
         SType = "Currency";
         Signed;
    } 
#UY3068 CHANGES START HERE 
    IN MIR-INC-FACE-AMT
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "16";
         DBTableName = "TPOL";
         SType = "Currency";
         Label = "Increased Survival Face Amount ";
    }
    IN MIR-NEW-INC-FACE-AMT
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "16";
         DBTableName = "TPOL";
         SType = "Currency";
         Label = "Post-reduction Increased Survival Face Amount ";
    }
    IN MIR-VST-FACE-AMT
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "16";
         DBTableName = "TPOL";
         SType = "Currency";
         Label = "Vesting Face Amount";
    }
    IN MIR-NEW-VST-FACE-AMT
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "16";
         DBTableName = "TPOL";
         SType = "Currency";
         Label = "New Vesting Face Amount";
    }
    IN MIR-CSV-INC-FA-POR
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "16";
         SType = "Currency";
         Label = "CSV of Increased Survival Face Amount ";
    }
    IN MIR-CSV-VSTNG-FA-POR
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "16";
         SType = "Currency";
         Label = "CSV of Vesting Face Amount Portion";
    }
#UY3068 CHANGES END HERE

    IN  MIR-POL-SNDRY-AMT
    {
 #M245B2 CHANGES START HERE    
         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
         DisplayOnly;
         Signed;
         Length = "14";
         SType = "Currency";
         Label = "Sundry Amount";
    }

    IN  MIR-DV-OWN-CLI-NM
    {
         DisplayOnly;
         Length = "75";
         SType = "Text";
         Label = "Owner Name";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Payment Mode";
    }

    IN  MIR-DV-INSRD1-CLI-NM-T[10]
    {
        DisplayOnly;
        Length = "75";
        DBTableName = "Derived";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }

    IN  MIR-CVG-MPREM1-AMT-T[10]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Current Premium";
        Index = "1";
    }

    IN  MIR-CVG-MPREM2-AMT-T[10]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "New Premium";
        Index = "1";
    }

    IN  MIR-CVG-CSV1-AMT-T[10]
    {
 #M245B2 CHANGES START HERE    
         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
         DisplayOnly;
         Signed;
         Length = "16";
         FieldGroup = "Table10";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "CSV";
         Index = "1";
    }

#  M166P2 changes start here
    IN MIR-FARD-EFF-DT
    {
         DisplayOnly;
         Length = "10";
         SType = "Date";
         Label = "Effective Date";
    }
    IN MIR-APL-BAL-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    	DisplayOnly;
    	Length = "17";
    	SType = "Currency";
    	Label = "APL Balance";
    }

#UY3068 CHANGES START HERE
  IN MIR-CSV-UNIS-CNVR-BAL
    { 
        CurrencyCode = "MIR-POL-CRCY-CD"; 
    	DisplayOnly;
    	Length = "15";
    	SType = "Currency";
    	Label = "CSV of Unisys Conversion Balance";
    }
#UY3068 CHANGES END HERE 

    IN MIR-APL-INT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    	DisplayOnly;
    	Length = "17";
    	SType = "Currency";
    	Label = "APL Interest";
    }

    IN MIR-CSL-BAL-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    	DisplayOnly;
    	Length = "17";
    	SType = "Currency";
    	Label = "Policy loan Balance";
    }

    IN MIR-CSL-INT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    	DisplayOnly;
    	Length = "17";
    	SType = "Currency";
    	Label = "Policy loan Interest";
	}
#23802P - Changes Start here
    IN MIR-DV-NATNL-TAXWH-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
    	DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Separate Withholding Tax (Income Tax)";
    }

    IN MIR-DV-LOC-TAXWH-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
    	DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Separate Withholding Tax (Local Tax)";
    }
#23802P - Changes End here
	
#UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST SRART HERE
    IN  MIR-XCES-SHRT-LOAN-INT-AMT
    {
   
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Label = "Excess / Short Interest";
         Length = "15";
         SType = "Currency";
         Signed;
    }
    IN  MIR-UNEARN-LOAN-INT-AMT
    {
   
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Label = "Unearned Interest";
         Length = "15";
         SType = "Currency";
         Signed;
    } 
#CD3002 CHANGES START HERE
    IN  MIR-RSRV-ACUM-PREM-AMT
    {   
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Label = "Rider Accumulation value for fractions less than a year";
         Length = "15";
         SType = "Currency";
         Signed;
    }
#CD3002 CHANGES ENDS HERE		    
#UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST END HERE

    IN MIR-DV-NET-PAY-AMT
    {
#MP245K CHANGES START HERE 
#M245B2 CHANGES START HERE    
#MP245K        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        CurrencyCode = "MIR-PAYO-CRCY-CD";
#MP245K CHANGES END HERE 
    	DisplayOnly;
#TVI15B CHANGES STARTS HERE
#    	Length = "17";
        Length = "16";
#TVI15B CHANGES ENDS  HERE
    	SType = "Currency";
    	Label = "Net Payment Amount";
    }
#M166P2 changes end here
#Q13430- Changes Start here

    IN MIR-DV-EFF-DT
  {
    Length = "10";
    DBTableName = "Derived";
    SType = "Hidden";
  }
   IN MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
    }
        IN MIR-DV-COMMIT-CD
        {
            Length = "1";
            SType = "Hidden";
    }
#Q13430- Changes End here    
#M213L1 CHANGES STARTS HERE 

    IN MIR-CVG-PRIM-GR-ID-T[99]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Group ID";
        Index = "1";
    }
    
#M213L1 CHANGES ENDS HERE 

#M245B2 CHANGES START HERE       
       IN MIR-POL-CRCY-CD
        {
           Length = "2";           
           SType = "Hidden";
           Label = "Currency";
    }
#M245B2 CHANGES END HERE      
#MP245K CHANGES START HERE 
    IN MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY BENEFIT RIDER INDICATOR";
      } 
    IN MIR-DV-JP-XCHNG-EFF-DT
    { 
	DisplayOnly;
	Length = "10";
	SType = "Date";
	Label = "Conversion Exchange Effective date";
    }
    IN MIR-DV-JP-XCHNG-RT
    { 
        DisplayOnly;
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate from FC to JPY";   
    } 
  IN MIR-DV-HO-RECV-DT
  {
    Length = "10";
    SType = "Hidden";
    Label = "Home Office Received Date";
  }      
   IN MIR-PAYO-CRCY-CD
        {
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        }      

#MP245K CHANGES END HERE 
#MP334A CHANGES START HERE
   IN  MIR-TOT-PD-PREM-AMT
   {
        DisplayOnly;  
        Label = "Total Premium Paid for the Policy";
        Length = "16";
        SType = "Currency";
        Signed; 
   }
#MP334A CHANGES END HERE
#UYS014 CHANGES STARTS HERE
    IN MIR-CRNT-INCR-FACE-AMT-T[99]
    {
#S23388 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#S23388 CHANGES END HERE 
        DisplayOnly;
        FieldGroup = "Table99";
        Index = "1";
        Label = "Current Increased Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    }   
   IN MIR-NEW-INCR-FACE-AMT-T[99]
     {
#S23388 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#S23388 CHANGES END HERE 
        DisplayOnly;
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "New Increased Face Amount";
        Index = "1";
        Signed;
        Length = "16";
    } 	
#UYS014 CHANGES ENDS HERE
#27549A - CHANGES START HERE    
    IN  MIR-ATO-NOT-APPL-IND
    {
         DisplayOnly;
         Length = "1";
         SType = "Indicator";
         Label = "ATO not applicable";
    } 
#27549A- CHANGES ENDS HERE
}
