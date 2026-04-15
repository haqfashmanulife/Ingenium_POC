#*******************************************************************************
#*  Component:   BF9B74VIR-O.s                                                 *
#*  Description: Rider Surrender/Rider FA Reduction List                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *

#*******************************************************************************

S-STEP BF9B74VIR-O
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
    OUT index
    {
	SType="Hidden";
    }
    IN MIR-POL-ID-BASE 
    {
        DisplayOnly;
        Key;
        Label = "Policy Id";
        Length = "9";
        SType = "Text";
    }

    IN MIR-POL-ID-SFX 
    {
        DisplayOnly;
        Key;
        Label = "Suffix";
        Length = "1";
        SType = "Text";
    }

    IN MIR-APPL-CTL-PRCES-DT
    {
        Label = "Date Of Change";
        Length = "10";
        Mandatory;
        SType = "Date";
    }


    IN MIR-CVG-NUM-T[90] 
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

    IN MIR-PLAN-ID-T[90] 
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

    IN MIR-CVG-FACE-AMT-T[90] 
    {   
        CurrencyCode = "MIR-POL-CRCY-CD";

        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    IN MIR-CVG-NEW-FACE-AMT-T[90] 
    {  
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "Derived";
        Index = "1";
        Label = "New Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    IN MIR-NEW-FACE-AMT-T[90] 
    {    
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "Derived";
        Index = "1";
        Label = "New Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    IN MIR-CVG-ISS-EFF-DT-T[90] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Issue Date";
        Length = "10";
        SType = "Date";
    }

    IN MIR-DV-INSRD-CLI-NM-T[90] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "Derived";
        Index = "1";
        Label = "Insured Name";
        Length = "75";
        SType = "Text";
    }

    IN MIR-CVG-STBL-1-CD-T[90] 
    {

        CodeSource = "CSOM9D29";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T";
        FilterField2 = "MIR-CVG-STBL-1-CD-T";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Insurance Period";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CVG-STBL-2-CD-T[90] 
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

    IN MIR-CVG-STBL-3-CD-T[90] 
    {

        CodeSource = "CSOM9D30";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T";
        FilterField2 = "MIR-CVG-STBL-3-CD-T";       
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Sub Table 3";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CVG-STBL-4-CD-T[90] 
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

    IN MIR-CVG-MPREM-AMT-T[90] 
    {
  
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Current Premium";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    IN MIR-CVG-NEW-MPREM-AMT-T[90] 
    {   
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "Derived";
        Index = "1";
        Label = "New Premium";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    IN  MIR-CVG-CSV-AMT-T[90]
    {
   
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "16";
         FieldGroup = "Table99";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "New CSV";
         Index = "1";
    }

    IN MIR-CVG-PREM-CHNG-DT-T[90] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Renewal Date";
        Length = "10";
        SType = "Date";
    }

    IN MIR-CVG-WP-IND-T[90]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label ="Waiver Of Premium";
        Index = "1";
    }


    IN  MIR-TOT-CVG-MPREM-AMT 
    {
     
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Label = "Current Total Premium";
         Length = "16";
         SType = "Currency";
         Signed;
    }

    IN  MIR-TOT-CVG-NEW-MPREM-AMT 
    {
   
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Label = "New Total Premium";
         Length = "16";
         SType = "Currency";
         Signed;
    }

    IN  MIR-TOT-CSV-AMT 
    {
     
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Label = "Total CSV";
         Length = "16";
         SType = "Currency";
         Signed;
    }

    IN  MIR-POL-SNDRY-AMT
    {
    
         CurrencyCode = "MIR-POL-CRCY-CD";
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

        Length = "2";
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
        CurrencyCode = "MIR-POL-CRCY-CD";
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
   
        CurrencyCode = "MIR-POL-CRCY-CD";
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
     
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "16";
         FieldGroup = "Table10";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "CSV";
         Index = "1";
    }

  IN MIR-DV-EFF-DT
  {
     DisplayOnly;
    Length = "10";
    DBTableName = "Derived";
    SType = "Date";
    Label = "Effective Date";
  }
    IN MIR-APL-BAL-AMT
    {
   
         CurrencyCode = "MIR-POL-CRCY-CD";

        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "APL Balance";
    }
    IN MIR-DV-APL-LOAN-INT-AMT
    {
   
        CurrencyCode = "MIR-POL-CRCY-CD";

        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "APL Interest";
    }
    IN MIR-CSL-BAL-AMT
    {
 
        CurrencyCode = "MIR-POL-CRCY-CD";

        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Policy Loan Balance ";
    }
   IN MIR-DV-LOAN-INT-AMT
    {
   
        CurrencyCode = "MIR-POL-CRCY-CD";
 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Policy Loan Interest";
    }
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
    IN  MIR-DV-NET-PAY-AMT 
    {

         CurrencyCode = "MIR-PAYO-CRCY-CD";
         DisplayOnly;
         Label = "Net Payment Amount";
         Length = "16";
         SType = "Currency";
         Signed;
    }
 
    IN MIR-CVG-PRIM-GR-ID-T[90]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Group ID";
        Index = "1";
    }
    
    IN  MIR-ANNIV-DT-T[100]
    {
        Length = "10";
        SType = "Selection";
        Label = "Anniversary date";  
        Index = "1";        
    }
    
    IN  MIR-INSRD-AGE-T[100]
    {
        DisplayOnly;            
        Length = "3";
        SType = "Number";
        Label = "Insured age";
        Index = "1"; 
    }
    
    IN  MIR-ELPSD-ISS-YR-T[100]
    {
        DisplayOnly;            
        Length = "3";
        SType = "Number";
        Label = "Years Elapsed Since New Business Issue";
        Index = "1";         
    }
    
    IN  MIR-ELPSD-FA-RED-YR-T[100]
    {
        DisplayOnly;            
        Length = "3";
        SType = "Number";
        Label = "Years Elapsed Since FA Reduction";
        Index = "1";         
    }     

    IN  MIR-CSV-AMT-T[100]
    {  
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;            
        Length = "16";
        SType = "Currency";
        Label = "Cash Surrender Value";
        Index = "1";
    }
    
    IN  MIR-TOT-ACCUM-AMT-T[100]
    {
  
        CurrencyCode = "MIR-POL-CRCY-CD";

        DisplayOnly;            
        Length = "16";
        SType = "Currency";
        Label = "Accumulated Premiums Paid";
        Index = "1";
    }    
      
    IN  MIR-CSV-RATE-T[100]
    {
        DisplayOnly;            
        Length = "3";
        SType = "Percent";
        Label = "CSV rate";
        Index = "1";
    }      
 
      INOUT MIR-POL-CRCY-CD
        {
     
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
    }
 
    IN MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Text";
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
   IN MIR-PAYO-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        }    

   IN MIR-DIFF-FA-ACC-CSV-MNTHLY
    {
         Length = "16";
         SType = "Currency";
         Label = "Amount";
     }

    IN  MIR-TOT-PD-PREM-AMT
    { 
        Label = "Total Premium Paid for the Policy";
        Length = "16";
        SType = "Currency";
        Signed; 
    }
     IN MIR-CRNT-INCR-FACE-AMT-T[90] 
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        FieldGroup = "Table99";
        Index = "1";
        Label = "Current Increased Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    }
    IN MIR-NEW-INCR-FACE-AMT-T[90]
     {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "New Increased Face Amount";
        Index = "1";
        Signed;
        Length = "16";
    }
    IN MIR-VIR-TRAD-PD-TO-MO-NUM
    {
    
        Label = "Next Payment Date:";
        DisplayOnly;
        Length = "07";
        SType = "text";
    }  
    
    IN MIR-VIR-CI-FRST-ELAPS-YRS-DUR
    {
 
        Label = "Elapsed years:";
        DisplayOnly;
        Length = "07";
        SType = "text";
    } 
    
    IN MIR-VIR-ACTV-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Active";
    }
    
    IN MIR-VIR-BILL-MODE-CD
    {
        DisplayOnly;    
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Text";
        Label = "Payment frequency";
    } 
    
    IN MIR-VIR-LOAN-AMT
    {   
        DisplayOnly;    
        Signed;
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "13";
        SType = "Currency";
        Label = "Policy loan balance:";
    }  
    
    IN MIR-VIR-INT-STR-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Interest start date";
    }  
    
    IN MIR-VIR-APL-LOAN-AMT
    {   
        DisplayOnly;
        Signed;
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "13";
        SType = "Currency";
        Label = "APL balance:";
    }     
    
    IN MIR-VIR-POL-LOAN-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "APL date";
    }    
    
    IN MIR-VIR-PREPAY-MNG-IND
    {
        DisplayOnly;    
        Length = "1";
        SType = "Indicator";
        Label = "Prepayment management";
    }
    
    IN MIR-VIR-SEI-ASS-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Seizure assignment";
    }    
    
    IN MIR-VIR-CVG-NUM-T[99] 
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

    IN MIR-VIR-PLAN-ID-T[99] 
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        DisplayOnly;
        FieldGroup = "Table99";
        Index = "1";
        Label = "Plan";
        Length = "40";
        SType = "Text";
    }

    IN MIR-VIR-CVG-FACE-AMT-T[99] 
    {   
        CurrencyCode = "MIR-POL-CRCY-CD";     
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    } 
}
