# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9192-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  1CNB02  DEL      NEW FOR CONVERSION POLICIES                               *
#*  1CPR03  EKM      ADDED MIR-ADJ-ESC-CHRG-AMT & MIR-ADJ-MO-PREM-AMT          *
#*  B01151  EKM      FIXED SPELLING: MIR-HOSP-BNFT-AMT TO MIR-DLY-HOSP-BNFT-AMT*
#*  B01160  AT       FINE TUNE BusinessFunctionName                            *
#*  B01104  AT       Conversion status - display description                   *
#*  MP334E           Ingenium Tax report changes                               *
#*******************************************************************************
 
P-STEP BF9192-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9192";
    BusinessFunctionName = "Pre-Conversion Policy Data Update";
    BusinessFunctionType = "Update";
    MirName = "CCWM9192";
  }
  

  OUT LSIR-RETURN-CD;

  OUT MIR-RETRN-CD;

  INOUT MIR-POL-ID-BASE
  {
    Key;
    Mandatory;
    Length = "9";
    DBTableName = "TPOL";
    DefaultSession = "MIR-POL-ID-BASE";
    SType = "Text";
    Label = "Policy Id";
  }

  INOUT MIR-POL-ID-SFX
  {
    Key;
    Length = "1";
    DBTableName = "TPOL";
    DefaultSession = "MIR-POL-ID-SFX";
    SType = "Text";
    Label = "Suffix";
  }
  
  INOUT MIR-OWN-CLI-NM
  {
    Length = "50";
    DisplayOnly;
    SType = "Text";
    Label = "Policy Owner";
  }
  
  INOUT MIR-PLAN-ID
  {
    Length = "40";
    DisplayOnly;
    CodeSource = "EDIT";
    CodeType = "PLAN";
    DBTableName = "TPOL";
    SType = "Selection";
    Label = "Product Name";
  }

  INOUT MIR-SEQ-NUM
  {
    Length = "3";
    Key;
    Mandatory;
    DisplayOnly;
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Conversion Sequence Number";
  }

  INOUT MIR-CNVR-KEY-NUM
  {
    Length = "10";
    DisplayOnly;
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Conversion Key Number";
  }



   
   INOUT MIR-CSTAT-CD
  {
    Length = "20";
    CodeSource = "DataModel";
    CodeType = "CSTAT-CD";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Current Status Code";
  }
   INOUT MIR-CNVR-ISS-EFF-DT
  {
    Length = "10";                         
    DBTableName = "TPOLX";
    Mandatory;
    SType = "Date";
    Label = "Conversion Target Effective Date";
  }
  
  INOUT MIR-CNVR-XPRY-DT
  {
    Length = "10";
    DBTableName = "TPOLX";
    Mandatory;
    SType = "Date";
    Label = "Converion Target Maturity Date";
  }  
   INOUT MIR-ESC-XEMP-SPREM-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Conversion Flex Fund (SP)";
  }
  
  INOUT MIR-ESC-XEMP-RSRV-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Conversion Flex Fund (V)";
  }
  
  INOUT MIR-ESC-SPREM-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Conversion Fund SE (SP)";
  }
  
  INOUT MIR-ESC-RSRV-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Conversion Fund SE (V)";
  }
  
   INOUT MIR-ESC-CHRG-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "ESC Chargeable ";
  }
  
   INOUT MIR-ADJ-ESC-CHRG-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Adjusted ESC Chargeable";
  }
  
   INOUT MIR-ADJ-MO-PREM-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Adjusted Monthly Standard Premium";
  }
  
  INOUT MIR-ORIG-SML-PROD-CD
  {
    Length = "3";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Small Product Code";
  }

  INOUT MIR-ORIG-POL-ID
  {
    Length = "7";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Pre-Conversion Policy Id";
  }
  
  INOUT MIR-ORIG-POL-ISS-DT
  {
    Length = "10";                         
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Issue Date";
  }
  
  INOUT MIR-ORIG-POL-MAT-DT
  {
    Length = "10";
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Maturity Date";
  }
  
  INOUT MIR-INSRD-CLI-NM
  {
    Length = "50";
    DisplayOnly;
    SType = "Text";
    Label = "Insured Name";
  }
 
  INOUT MIR-INSRD-CLI-ID
  {
    Length = "10";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Pre-Coversion Insured Client Id";
  }
  INOUT MIR-ORIG-MO-PREM-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Monthly  Standard Premium";
  }
  INOUT MIR-ORIG-LTD-PREM-PD
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Premium Recieved withoutDividend";
  }
  INOUT MIR-DTH-BNFT-AMT
  {
    Length = "16";
    SType = "Currency";
    DisplayOnly;
    Label = "Death Benefit Amount";
  }
  INOUT MIR-DLY-HOSP-BNFT-AMT
  {
    Length = "16";
    SType = "Currency";
    DisplayOnly;
    Label = " Hospital Benefit Per Day";
  }
  INOUT MIR-ORIG-TOT-LOAN-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Loans";
  }

  INOUT MIR-ORIG-PMT-MTHD-CD
  {
    Length = "2";
        CodeSource = "EDIT";
        CodeType = "DHYPC";
        DBTableName = "TPOLX";
        SType = "Selection";
        Label = "Payment Method";
  }

  INOUT MIR-ORIG-AFYC-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "AFYC";
  }
  INOUT MIR-ORIG-PAY-NUM
  {
    Length = "4";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Number of Months Elapsed";
  }

  
   INOUT MIR-ORIG-CPREM-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Premium For Commission";
  }
   INOUT MIR-ORIG-COMM-FACE-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Face Amount For Commission";
  }
# MP334E CHANGES STARTS HERE

   INOUT MIR-CRNT-OWN-PREM-PD-AMT  
   {
    
    Length = "15";                         				         
    DBTableName = "TPOLX ";						         
    SType = "Currency";							         
    Label = "Current owner's Premiums paid";				         
   }									       	
									         
   INOUT MIR-POL-OWN-CHNG-CNT						         
   {
    
    Length = "2";                         				         
    DBTableName = "TPOL";						         
    SType = "Text"; 							         
    Label = "Number of owner change";					         
   }									       
									       	
   INOUT MIR-POL-OWN-CHNG-DT
   {
    
    Length = "10";                         
    DBTableName = "TPOL";							 
    SType = "Date";								 
    Label = "Last owner change date";						 
   }										 
   										 
   INOUT MIR-PREV-OWN-KJ-NM							
   {
    
    Length = "100"; 								 
    DBTableName = "TPOLX";    							 
    SType = "Text";								 
    Label = "Name";								 
   }										 
										 
    INOUT MIR-PREV-OWN-KA-NM							
    {
    
    Length = "100";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Name";
    }
   
   INOUT MIR-PREV-OWN-CO-KJ-NM
   {
     
     Length = "100";
     DBTableName = "TPOLX";
     SType = "Text";
     Label = "Company Name";
   }

    INOUT MIR-PREV-OWN-CO-KA-NM
    {
     
     Length = "100";
     DBTableName = "TPOLX";
     SType = "Text";
     Label = "Company Name";
    }   

   INOUT MIR-PREV-OWN-BTH-DT
  {
    
    Length = "10"; 
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Birth Date";
  }
        
   INOUT MIR-PREV-OWN-SEX-CD
   {
    
    Length = "1";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Sex";
   }

    INOUT MIR-PREV-OWN-ADDR-LOC-CD
    {
    
    Length = "8";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Address Code";
    } 

    OUT MIR-PREV-CLI-PREFCT-TXT
    {	
        
        Length = "11";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "Prefecture";
    }

    OUT MIR-PREV-CLI-CITY-NM-TXT
    {
        
        Length = "30";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "City";
    }

    OUT MIR-PREV-CLI-ADDR-LN-1-TXT
    {
        
        Length = "30";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "Neighborhood";    
    } 
    
    OUT MIR-PREV-CLI-KA-PREFCT-TXT
    {
        
        Length = "11";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "Prefecture";
    }
    
    
    OUT MIR-PREV-CLI-KA-CITY-TXT
    {
        
        Length = "30";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "City";
    }
    
    OUT MIR-PREV-CLI-KA-NGHBRHD-TXT
    {
        
        Length = "30";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "Neighborhood";    
    } 
    
    INOUT MIR-PREV-CLI-ADDR-ADDL-TXT
    {
        
        
        Length = "72";
        DBTableName = "TPOLX";
        SType = "Text";
        Label = "Samakata-bu";
    }    

   
#MP334E CHANGES ENDS HERE
}
