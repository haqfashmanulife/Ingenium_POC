# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9190-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  1CNB02  DEL      NEW FOR CONVERSION POLICIES                               *
#*  1CPR03  EKM      ADDED MIR-ADJ-ESC-CHRG-AMT & MIR-ADJ-MO-PREM-AMT          *
#*  B01160  AT       FINE TUNE BusinessFunctionName                            *
#*  B01104  AT       Conversion status - display description                   *
#*  UCPUPL  SC       UCP Upload, Add POL-HNDL-CD                               *
#*  MP334E           Ingenium Tax report changes                               *
#*******************************************************************************
 
P-STEP BF9190-P
{  
  ATTRIBUTES
  {
    BusinessFunctionId = "9190";
    BusinessFunctionName = "Pre-Conversion Policy Data Inquiry";
    BusinessFunctionType = "Retrieve";
    MirName = "CCWM9190";
  }
  

  
  OUT LSIR-RETURN-CD;
  OUT MIR-RETRN-CD;
   
  INOUT MIR-POL-ID-BASE
  {
    Key;
    Mandatory;
    Length = "9";
    DBTableName = "TPOLX";
    DefaultSession = "MIR-POL-ID-BASE";
    SType = "Text";
    Label = "Policy Id";
  }

  INOUT MIR-POL-ID-SFX
  {
    Key;
    Length = "1";
    DBTableName = "TPOLX";
    DefaultSession = "MIR-POL-ID-SFX";
    SType = "Text";
    Label = "Suffix";
  }

    INOUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Product Name";
    }

   INOUT MIR-OWN-CLI-NM
  {
    Length = "50";
    SType = "Text";
    Label = "Policy Owner";
  }
   OUT MIR-CNVR-KEY-NUM
  {
    Length = "10";
    DBTableName = "TPOL";
    SType = "Text";
    Label = "Conversion Number";
  }
   OUT MIR-POL-ISS-EFF-DT
  {
    Length = "10";                         
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Policy Issue Effective Date";
  }
   OUT MIR-POL-DISP-DT
  {
    Length = "10";                         
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Final Disposition Date";
  }

  
    OUT MIR-POL-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Policy Status";
    }


   OUT MIR-TOT-DTH-BNFT-AMT
  {
    Length = "15";
    SType = "Currency";
    Label = "Total Death Benefit Amount";
  }
    OUT MIR-TOT-DLY-HOSP-BNFT-AMT
  {
    Length = "15";
    SType = "Currency";
    Label = "Total Hospitalization Benefit Per Day";
  }
    INOUT MIR-SEQ-NUM
  {
    Length = "3";
    Key;
    Mandatory;
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Conversion Sequence Number";
  }
    OUT MIR-CSTAT-CD
  {
    Length = "20";
    CodeSource = "DataModel";
    CodeType = "CSTAT-CD";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Conversion Update Status";
  }
    OUT MIR-CNVR-ISS-EFF-DT
  {
    Length = "10";                         
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Issue Date";
  }
  
  OUT MIR-CNVR-XPRY-DT
  {
    Length = "10";
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Maturity Date";
  }
   OUT MIR-ESC-XEMP-SPREM-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Conversion Flex Fund (SP)";
  }
  
  OUT MIR-ESC-XEMP-RSRV-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Conversion Flex Fund (V)";
  }
  
  OUT MIR-ESC-SPREM-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Conversion Fund SE (SP)";
  }
  
  OUT MIR-ESC-RSRV-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Conversion Fund SE (V)";
  }
  
   OUT MIR-ESC-CHRG-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "ESC Chargeable ";
  }
 

   OUT MIR-ADJ-ESC-CHRG-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Adjusted ESC Chargeable";
  }

 
   OUT MIR-ADJ-MO-PREM-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Adjusted Monthly Standard Premium";
  }

 
  OUT MIR-ORIG-SML-PROD-CD
  {
    Length = "3";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Small Product Type";
  }

  OUT MIR-ORIG-POL-ID
  {
    Length = "1";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Policy Number";
  }
  
  OUT MIR-ORIG-POL-ISS-DT
  {
    Length = "10";                         
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Issue Date";
  }
  
  OUT MIR-ORIG-POL-MAT-DT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Maturity Date";
  }
  OUT MIR-INSRD-CLI-NM
  {
    Length = "50";
    SType = "Text";
    Label = "Insured Name";
  }
 
  OUT MIR-INSRD-CLI-ID
  {
    Length = "10";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Pre-Coversion Insured Client Id";
  }
  OUT MIR-ORIG-MO-PREM-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Monthly  Standard Premium";
  }
  OUT MIR-ORIG-LTD-PREM-PD
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Premium Recieved without Dividend";
  }
  OUT MIR-DTH-BNFT-AMT
  {
    Length = "15";
    SType = "Currency";
    Label = "Death Benefit Amount";
  }
  OUT MIR-DLY-HOSP-BNFT-AMT
  {
    Length = "15";
    SType = "Currency";
    Label = " Hospital Benefit Per Day";
  }
  OUT MIR-ORIG-TOT-LOAN-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Loans";
  }

  OUT  MIR-ORIG-PMT-MTHD-CD
  {
    Length = "2";
        CodeSource = "EDIT";
        CodeType = "DHYPC";
        DBTableName = "TPOLX";
        SType = "Text";
        Label = "Payment Method";
  }

  OUT MIR-ORIG-AFYC-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "AFYC";
  }
  OUT MIR-ORIG-PAY-NUM
  {
    Length = "4";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Number of Months Elapsed";
  }

  
   OUT MIR-ORIG-CPREM-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Premium For Commission";
  }
   OUT MIR-ORIG-COMM-FACE-AMT
  {
    Length = "16";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Face Amount For Commission";
  }
 OUT MIR-TOT-MPREM
  {
    Length = "15";
    DBTableName = "TPOLX";
    SType = "Currency";
    Label = "Face Amount For Commission";
  }
 
   OUT MIR-POL-CNVR-TYP-CD  
  {
    Length = "2";                         
    DBTableName = "TPOL";
    SType = "Text";
    Label = "Policy Conversion Type code";
  }

# MP334E CHANGES STARTS HERE

   OUT MIR-CRNT-OWN-PREM-PD-AMT  
   {
    Length = "15";                         				         
    DBTableName = "TPOLX ";						         
    SType = "Currency";							         
    Label = "Current owner's Premiums paid";				         
   }									       	
									         
   OUT MIR-POL-OWN-CHNG-CNT						         
   {									         
    Length = "2";                         				         
    DBTableName = "TPOL";						         
    SType = "Text"; 							         
    Label = "Number of owner change";					         
   }									       
									       	
   OUT MIR-POL-OWN-CHNG-DT
   {
    Length = "10";                         
    DBTableName = "TPOL";							      
    SType = "Date";								      
    Label = "Last owner change date";						      
   }										      
   										      
   OUT MIR-PREV-OWN-KJ-NM								
   {										      
    Length = "100"; 								      
    DBTableName = "TPOLX";    							      
    SType = "Text";								      
    Label = "Name";								      
   }										      
										      
    OUT MIR-PREV-OWN-KA-NM								
    {
    Length = "100";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Name";
    }
   
   OUT MIR-PREV-OWN-CO-KJ-NM
   {
     Length = "100";
     DBTableName = "TPOLX";
     SType = "Text";
     Label = "Company Name";
   }

    OUT MIR-PREV-OWN-CO-KA-NM
    {
     Length = "100";
     DBTableName = "TPOLX";
     SType = "Text";
     Label = "Company Name";
    }   

   OUT MIR-PREV-OWN-BTH-DT
  {
    Length = "10"; 
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Birth Date";
  }
        
   OUT MIR-PREV-OWN-SEX-CD
   {
    Length = "1";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Sex";
   }

    OUT MIR-PREV-OWN-ADDR-LOC-CD
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
    
    OUT MIR-PREV-CLI-ADDR-ADDL-TXT
    {
        Length = "72";
        DBTableName = "TPOLX";
        SType = "Text";
        Label = "Samakata-bu";
    }    

   
#MP334E CHANGES ENDS HERE
}       
