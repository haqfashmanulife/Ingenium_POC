# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

#*******************************************************************************
#*  Component:   BF9190-O                                                      *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  1CNB02  DEL      NEW FOR CONVERSION POLICIES                               *
#*  1CPR03  EKM      ADDED MIR-ADJ-ESC-CHRG-AMT & MIR-ADJ-MO-PREM-AMT          *
#*  B01104  AT       Conversion status - display description                   *
#*  MP334E           Ingenium Tax report changes                               *
#*******************************************************************************

S-STEP BF9190-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

  IN MIR-PLAN-ID 
  {
    DisplayOnly;
                Key;
    Length = "40";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Product Name";
  }

  IN MIR-OWN-CLI-NM 
  {
    DisplayOnly;
                Key;
    Length = "50";
    SType = "Text";
    Label = "Policy Owner";
  }

  IN MIR-CNVR-KEY-NUM 
  {
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Conversion Number";
  }

  IN MIR-POL-ISS-EFF-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Policy Issue Effective Date";
  }

  IN MIR-POL-DISP-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Final Disposition Date";
  }

  IN MIR-POL-STAT-CD 
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "POL-CSTAT-CD";
    SType = "Text";
    Label = "Current Policy Status";
  }

  IN MIR-TOT-DTH-BNFT-AMT 
  {
    DisplayOnly;
    Length = "15";
    SType = "Currency";
    Label = "Total Death Benefit Amount";
  }

  IN MIR-TOT-DLY-HOSP-BNFT-AMT 
  {
    DisplayOnly;
    Length = "15";
    SType = "Currency";
    Label = "Total Hospitalization Benefit Per Day";
  }

  IN MIR-SEQ-NUM 
  {
    Key;
    DisplayOnly;
    Length = "3";
    SType = "Text";
    Label = "Conversion Sequence Number";
  }
  IN MIR-CSTAT-CD 
  {
    DisplayOnly;
    Length = "20";
    CodeSource = "DataModel";
    CodeType = "CSTAT-CD";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Conversion Update Status";
  }

  IN MIR-CNVR-ISS-EFF-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Issue Date";
  }

  IN MIR-CNVR-XPRY-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Maturity Date";
  }

  IN MIR-ESC-XEMP-SPREM-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Conversion Flex Fund (SP)";
  }

  IN MIR-ESC-XEMP-RSRV-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Conversion Flex Fund (V)";
  }

  IN MIR-ESC-SPREM-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Conversion Fund SE (SP)";
  }

  IN MIR-ESC-RSRV-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Conversion Fund SE (V)";
  }

  IN MIR-ESC-CHRG-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "ESC Chargeable ";
  }

       
  IN MIR-ADJ-ESC-CHRG-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Adjusted ESC Chargeable";
  }

       
  IN MIR-ADJ-MO-PREM-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Adjusted Monthly Standard Premium";
  }

       
  IN MIR-ORIG-SML-PROD-CD 
  {
    DisplayOnly;
    Length = "3";
    SType = "Text";
    Label = "Small Product Type";
  }

  IN MIR-ORIG-POL-ID 
  {
    DisplayOnly;
    Length = "1";
    SType = "Text";
    Label = "Policy Number";
  }

  IN MIR-ORIG-POL-ISS-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Issue Date";
  }

  IN MIR-ORIG-POL-MAT-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Maturity Date";
  }

  IN MIR-INSRD-CLI-NM 
  {
    DisplayOnly;
    Length = "50";
    SType = "Text";
    Label = "Insured Name";
  }

  IN MIR-INSRD-CLI-ID 
  {
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Pre-Coversion Insured Client Id";
  }

  IN MIR-ORIG-MO-PREM-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Monthly  Standard Premium";
  }

  IN MIR-ORIG-LTD-PREM-PD 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Premium Recieved without Dividend";
  }

  IN MIR-DTH-BNFT-AMT 
  {
    DisplayOnly;
    Length = "15";
    SType = "Currency";
    Label = "Death Benefit Amount";
  }

  IN MIR-DLY-HOSP-BNFT-AMT 
  {
    DisplayOnly;
    Length = "15";
    SType = "Currency";
    Label = " Hospital Benefit Per Day";
  }

  IN MIR-ORIG-TOT-LOAN-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Loans";
  }

  IN MIR-ORIG-PMT-MTHD-CD 
  {
    DisplayOnly;
    Length = "2";
    CodeSource = "EDIT";
    CodeType = "DHYPC";
    SType = "Text";
    Label = "Payment Method";
  }

  IN MIR-ORIG-AFYC-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "AFYC";
  }

  IN MIR-ORIG-PAY-NUM 
  {
    DisplayOnly;
    Length = "4";
    SType = "Text";
    Label = "Number of Months Elapsed";
  }

  IN MIR-ORIG-CPREM-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Premium For Commission";
  }

  IN MIR-ORIG-COMM-FACE-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Face Amount For Commission";
  }
        IN MIR-TOT-MPREM
       {
        Length = "15";
        DBTableName = "TPOLX";
        SType = "Currency";
        Label = "Face Amount For Commission";
      }
# MP334E CHANGES STARTS HERE

   IN MIR-CRNT-OWN-PREM-PD-AMT  
   {
    DisplayOnly;
    Length = "15";                         				         
    DBTableName = "TPOLX ";						         
    SType = "Currency";							         
    Label = "Current owner's Premiums paid";				         
   }									       	
									         
   IN MIR-POL-OWN-CHNG-CNT						         
   {
    DisplayOnly;
    Length = "2";                         				         
    DBTableName = "TPOL";						         
    SType = "Text"; 							         
    Label = "Number of owner change";					         
   }									       
									       	
   IN MIR-POL-OWN-CHNG-DT
   {
    DisplayOnly;
    Length = "10";                         
    DBTableName = "TPOL";							 
    SType = "Date";								 
    Label = "Last owner change date";						 
   }										 
   										 
   IN MIR-PREV-OWN-KJ-NM							
   {
    DisplayOnly;
    Length = "100"; 								 
    DBTableName = "TPOLX";    							 
    SType = "Text";								 
    Label = "Name";								 
   }										 
										 
    IN MIR-PREV-OWN-KA-NM							
    {
    DisplayOnly;
    Length = "100";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Name";
    }
   
   IN MIR-PREV-OWN-CO-KJ-NM
   {
     DisplayOnly;
     Length = "100";
     DBTableName = "TPOLX";
     SType = "Text";
     Label = "Company Name";
   }

    IN MIR-PREV-OWN-CO-KA-NM
    {
     DisplayOnly;
     Length = "100";
     DBTableName = "TPOLX";
     SType = "Text";
     Label = "Company Name";
    }   

   IN MIR-PREV-OWN-BTH-DT
  {
    DisplayOnly;
    Length = "10"; 
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Birth Date";
  }
          
   IN MIR-PREV-OWN-SEX-CD
   {
    DisplayOnly;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "CLI-SEX-CD";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Sex";
   }

    IN MIR-PREV-OWN-ADDR-LOC-CD
    {
    DisplayOnly;
    Length = "8";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Address Code";
    } 

    IN MIR-PREV-CLI-PREFCT-TXT
    {	
        DisplayOnly;
        Length = "11";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "Prefecture";
    }

    IN MIR-PREV-CLI-CITY-NM-TXT
    {
        DisplayOnly;
        Length = "30";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "City";
    }

    IN MIR-PREV-CLI-ADDR-LN-1-TXT
    {
        DisplayOnly;
        Length = "30";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "Neighborhood";    
    } 
    
    IN MIR-PREV-CLI-KA-PREFCT-TXT
    {
        DisplayOnly;
        Length = "11";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "Prefecture";
    }
    
    
    IN MIR-PREV-CLI-KA-CITY-TXT
    {
        DisplayOnly;
        Length = "30";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "City";
    }
    
    IN MIR-PREV-CLI-KA-NGHBRHD-TXT
    {
        DisplayOnly;
        Length = "30";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "Neighborhood";    
    } 
    
    IN MIR-PREV-CLI-ADDR-ADDL-TXT
    {
        DisplayOnly;
        Length = "72";
        DBTableName = "TPOLX";
        SType = "Text";
        Label = "Samakata-bu";
    }    

   
#MP334E CHANGES ENDS HERE
      
 

}
