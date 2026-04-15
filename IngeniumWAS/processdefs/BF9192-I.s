# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

#*******************************************************************************
#*  Component:   BF9192-I                                                      *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  1CNB02  DEL      NEW FOR CONVERSION POLICIES                               *
#*  1CPR03  EKM      ADDED MIR-ADJ-ESC-CHRG-AMT & MIR-ADJ-MO-PREM-AMT          *
#*  B01151  EKM      FIXED SPELLING: MIR-HOSP-BNFT-AMT TO MIR-DLY-HOSP-BNFT-AMT*
#*  B01104  AT       Conversion status - display description                   *
#*  MP334E  CTS      PRE-CONVERSION POLICY OWNERFIELD EDITS                    *
#*******************************************************************************

S-STEP BF9192-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    Type = "Input";
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
    SType="Hidden";
  }

  IN MIR-POL-ID-BASE
  {
    Key;
    DisplayOnly;
    Length = "9";
    DefaultSession = "MIR-POL-ID-BASE";
    SType = "Text";
    Label = "Policy Id";
  }

  IN MIR-POL-ID-SFX
  {
    Key;
    DisplayOnly;
    Length = "1";
    DefaultSession = "MIR-POL-ID-SFX";
    SType = "Text";
    Label = "Suffix";
  }

  IN MIR-OWN-CLI-NM
  {
    DisplayOnly;
    Length = "50";
    SType = "Text";
    Label = "Policy Owner";
  }

  IN MIR-PLAN-ID
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "text";
    Label = "Product Name";
  }

  IN MIR-SEQ-NUM 
  {
    Key;
    DisplayOnly;
    Length = "3";
    SType = "Text";
    Label = "Conversion Sequence Number";
  }

  IN  MIR-CNVR-KEY-NUM
  {
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Conversion Key Number";
  }

  IN    MIR-CSTAT-CD
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
    SType = "Date";
                Mandatory;
    Label = "Conversion Target Effective Date";
  }

  INOUT MIR-CNVR-XPRY-DT
  {
    Length = "10";
    SType = "Date";
                Mandatory;
    Label = "Converion Target Maturity Date";
  }

  INOUT MIR-ESC-SPREM-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Conversion Flex Fund (SP)";
  }

  INOUT MIR-ESC-RSRV-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Conversion Flex Fund (V)";
  }

  INOUT MIR-ESC-XEMP-SPREM-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Conversion Fund SE (SP)";
  }

  INOUT MIR-ESC-XEMP-RSRV-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Conversion Fund SE (V)";
  }

  INOUT MIR-ESC-CHRG-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "ESC Chargeable ";
  }

  
  IN MIR-ADJ-ESC-CHRG-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Adjusted ESC Chargeable ";
  }

  
  IN MIR-ADJ-MO-PREM-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Adjusted Monthly Standard Premium";
  }

  
  INOUT MIR-ORIG-SML-PROD-CD
  {
    Length = "3";
    SType = "Text";
                Mandatory;
                Label = "Small Product Code";
  }

  INOUT MIR-ORIG-POL-ID
  {
    Length = "7";
    SType = "Text";
                Mandatory;
    Label = "Pre-Conversion Policy Id";
  }

  INOUT MIR-ORIG-POL-ISS-DT
  {
    Length = "10";
                Mandatory;
    SType = "Date";
    Label = "Issue Date";
  }

  INOUT MIR-ORIG-POL-MAT-DT
  {
    Length = "10";
    SType = "Date";
                Mandatory;
    Label = "Maturity Date";
  }

  INOUT MIR-INSRD-CLI-NM
  {
    DisplayOnly;
    Length = "50";
    SType = "Text";
    Label = "Insured Name";
  }

  INOUT MIR-INSRD-CLI-ID
  {
    Length = "10";
                Mandatory;
                CodeSource = "CSOM4904";
                FilterFields = "2";
                FilterField1 = "MIR-POL-ID-BASE";
                FilterField2 = "MIR-POL-ID-SFX";
                SType = "Selection";
                Label = "Select Application Clients";
  }

  INOUT MIR-ORIG-MO-PREM-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Monthly  Standard Premium";
  }

  INOUT MIR-ORIG-LTD-PREM-PD
  {
    Length = "16";
    SType = "Currency";
    Label = "Premium Recieved withoutDividend";
  }

  INOUT MIR-DTH-BNFT-AMT
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Death Benefit Amount";
  }

  INOUT MIR-DLY-HOSP-BNFT-AMT
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = " Hospital Benefit Per Day";
  }

  INOUT MIR-ORIG-TOT-LOAN-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Loans";
  }

  INOUT MIR-ORIG-PMT-MTHD-CD
  {
    Length = "2";
    CodeSource = "EDIT";
                Mandatory;
    CodeType = "DHYPC";
    SType = "Selection";
    Label = "Payment Method";
  }

  INOUT MIR-ORIG-AFYC-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "AFYC";
  }

  INOUT MIR-ORIG-PAY-NUM
  {
    Length = "4";
    SType = "Text";
    Label = "Number of Months Elapsed";
  }

  INOUT MIR-ORIG-CPREM-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Premium For Commission";
  }

  INOUT MIR-ORIG-COMM-FACE-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Face Amount For Commission";
  }
     INOUT MIR-INSRD-CLI-ID-T[1]
    {
        SType = "Hidden";
    }
    #MP334E CHANGES STARTS HERE
    
       INOUT MIR-CRNT-OWN-PREM-PD-AMT  
       {
        
        Length = "15";                         				         
        SType = "Currency";							         
        Label = "Current owner's Premiums paid";				         
       }									       	
    									         
       INOUT MIR-POL-OWN-CHNG-CNT						         
       {
        
        Length = "2";                         				         
        SType = "Text"; 							         
        Label = "Number of owner change";					         
       }									       
    									       	
       INOUT MIR-POL-OWN-CHNG-DT
       {
        
        Length = "10";                         
        SType = "DATE";								 
        Label = "Last owner change date";						 
       }										 
       										 
       INOUT MIR-PREV-OWN-KJ-NM							
       {
        
        Length = "100"; 								 
        SType = "Text";								 
        Label = "Name";								 
       }										 
    										 
        INOUT MIR-PREV-OWN-KA-NM							
        {
        
        Length = "100";
        SType = "Text";
        Label = "Name";
        }
       
       INOUT MIR-PREV-OWN-CO-KJ-NM
       {
         
         Length = "100";
         SType = "Text";
         Label = "Company Name";
       }
    
        INOUT MIR-PREV-OWN-CO-KA-NM
        {
         
         Length = "100";
         SType = "Text";
         Label = "Company Name";
        }   
    
       INOUT MIR-PREV-OWN-BTH-DT
      {
        
        Length = "10"; 
        SType = "Date";
        Label = "Birth Date";
      }
            
       INOUT MIR-PREV-OWN-SEX-CD
           {
               Length = "40";
               CodeSource = "DataModel";
               CodeType = "CLI-SEX-CD";
               SType = "Selection";
               Label = "Sex";
           }
    
    
        INOUT MIR-PREV-OWN-ADDR-LOC-CD
        {
        
        Length = "8";
        SType = "Text";
        Label = "Address Code";
        } 
    
        IN MIR-PREV-CLI-PREFCT-TXT
        {	
            
            Length = "11";
            SType = "Text";
            Label = "Prefecture";
        }
    
        IN MIR-PREV-CLI-CITY-NM-TXT
        {
            
            Length = "30";
            SType = "Text";
            Label = "City";
        }
    
        IN MIR-PREV-CLI-ADDR-LN-1-TXT
        {
            
            Length = "30";
            SType = "Text";
            Label = "Neighborhood";    
        } 
        
        IN MIR-PREV-CLI-KA-PREFCT-TXT
        {
            
            Length = "11";
            SType = "Text";
            Label = "Prefecture";
        }
        
        
        IN MIR-PREV-CLI-KA-CITY-TXT
        {
            
            Length = "30";
            SType = "Text";
            Label = "City";
        }
        
        IN MIR-PREV-CLI-KA-NGHBRHD-TXT
        {
            
            Length = "30";
            SType = "Text";
            Label = "Neighborhood";    
        } 
        
        INOUT MIR-PREV-CLI-ADDR-ADDL-TXT
        {
            
            
            Length = "72";
            SType = "Text";
            Label = "Samakata-bu";
        }    
    
       
    #MP334E CHANGES ENDS HERE

}
