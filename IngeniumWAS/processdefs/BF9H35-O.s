# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF9H35-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYSD28     CTS      INITIAL VERSION OF UISYS POLICY INQUIRY SCREEN         *
#*                                                                             *
#*******************************************************************************

S-STEP BF9H35-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "INput";
        DelEmptyRows;
        FocusField = "MIR-POL-ID";
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

      IN  MIR-POL-ID
      {
          Key;
          Mandatory;
          Length = "10";
          DBTableName = "TU3P2";
          SType = "Text";
          Label = "Policy Id";
      }
      IN  MIR-LARG-TYP
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Large Type Code";
      }    
      IN  MIR-POL-INFO-CTL
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Policy information: Present or not CTL";
      }
      IN  MIR-BENE-INFO-CTL
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefit information: present or not CTL";
      }
      IN  MIR-CNVR-INFO-CTL
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Conversion information: present or not CTL";
      }
      IN  MIR-MAT-PREM-BENE-NM
      { 
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Maturity premium beneficiary";
      }
      IN  MIR-PUA-DIV-UNIT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Paid-up addition dividend";
      }
      IN  MIR-NEW-PUA-PREM-AMT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "New paid-up addition pure endowment premium";
      }
      IN  MIR-NEW-PUA-APREM-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "New accumulated paid-up addition pure endowment premium";
      }
      IN  MIR-NEW-PUA-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "New paid-up addition date (year, month)";
      }
	  
      IN  MIR-OLD-PUA-PREM-AMT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Old paid-up addition pure endowment premium";
      }
      IN  MIR-OLD-PUA-APREM-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Old accumulated paid-up addition pure endowment premium";
      }
      IN  MIR-OLD-PUA-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Old paid-up addition date (year, month)";
      }
      IN  MIR-NO-PUA-STRT-YM 
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "No-paid up addition start date (year, month)";
      }
      IN  MIR-PUA-EXP-DIV-AMT 
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Paid-up addition expected dividend";
      }
      IN  MIR-DIV-NEW-IND 
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "New dividend control";
      }
      IN  MIR-DIV-NEW-ALLOC-YR 
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "New allocated dividend year";
      }
      IN  MIR-DIV-NEW-CALC-YR 
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "New dividend calculation year";
      }
      IN  MIR-DIV-NEW-ALLOC-AMT 
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "New allocated dividend ";
      }
      IN  MIR-DIV-NEW-ADJ-AMT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "New dividend adjustment";
      }
      IN  MIR-DIV-OLD-IND 
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Old dividend control";
      }
      IN  MIR-DIV-OLD-ALLOC-YR 
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Old allocated dividend year";
      }
      IN  MIR-DIV-OLD-CALC-YR
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Old Dividend calculation year";
      }
      IN  MIR-DIV-OLD-ALLOC-AMT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Old allocated dividend ";
      }
      IN  MIR-DIV-OLD-ADJ-AMT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Old dividend adjustment";
      }
      IN  MIR-OFFSET-CURR-PMT-YR
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Current year payment year";
      }
      IN  MIR-OFFSET-PMT-DIV-AMT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Current year payment dividend";
      }
      IN  MIR-OFFSET-PMT-FINAL-YR
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Dividend payment final year";
      }
      IN  MIR-OFFSET-PMT-FINAL-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Dividend payment final date (year, month)";
      }
      IN  MIR-OFFSET-DIV-EXDF 
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Dividend excess and deficiency";
      }
      IN  MIR-OFFSET-ACCUM-DIV-AMT      
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Payment dividend accumulated";
      }
      IN  MIR-CUST-DIV-DT       
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Custody date";
      }
      IN  MIR-CUST-DIV-AMT        
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Custody dividend accumulation";
      }
      IN  MIR-CUST-DIV-INT-AMT         
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Custody interest accumulation ";
      }
      IN  MIR-CUST-FINAL-YR         
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Custody final year";
      }
      IN  MIR-DPOS-DIV-AMT        
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Deposit dividend accumulation";
      }
      IN  MIR-DPOL-DIV-INT-AMT        
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Deposit interest accumulation";
      }
      IN  MIR-PUA-DIV-ACCUM-AMT         
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Paid-up addition dividend";
      }
      IN  MIR-PUA-NEW-DIV-AMT         
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "New paid-up addition dividend";
      }
      IN  MIR-PUA-NEW-DIV-YM         
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "New paid-up addition date (year. month)";
      }
      IN  MIR-PUA-PREV-DIV-AMT         
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Old paid-up addition premium";
      }
      IN  MIR-PUA-PREV-DIV-YM          
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Old paid-up addition date (year,month)";
      }
      IN  MIR-PUA-ADD-PLAN-DIV-AMT        
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Paid-up addition planned dividend";
      }
      IN  MIR-CM-PMT-YR-5-IND          
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Congratulatory money payment status・5 years 10months payment part";
      }
      IN  MIR-CM-PMT-YR-11-IND          
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Congratulatory money payment status・11years”";
      }
      IN  MIR-CM-PMT-YR-14-IND          
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Congratulatory money payment status・14 years”";
      }
      IN  MIR-CM-PMT-YR-17-IND         
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Congratulatory money payment status・17 years”";
      }
      IN  MIR-CM-PMT-COUNT         
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "No. of congratulatory money payment advent";
      }
      IN  MIR-CM-PMT-ACCUM-AMT          
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Congratulatory money payment value accumulation";
      }
      IN  MIR-CM-YPMT-FINAL-DT           
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Congratulatory money payment final date (Year, month, date)";
      }
      IN  MIR-ANTY-MODEL          
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Annuity model";
      }
      IN  MIR-ANTY-DUR           
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Annuity period";
      }
      IN  MIR-ANTY-GUAR-DUR           
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Annuity guarentee period";
      }
      IN  MIR-ANTY-POST-PAYUP-AMT          
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Basic annuity value after paying up";
      }
      IN  MIR-ANTY-PREM-APL          
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Premium subject to APL";
      }
      IN  MIR-ANTY-DISAB-BNFT-CD           
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Disability benefit description classification";
      }
      IN  MIR-ANTY-TQL-RDR-ADD-DT       
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Tax qualified rider addition date";
      }
      IN  MIR-ANTY-DOWN-PMT-S1-AMT      
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Down payment S1 (Basic annuity value)";
      }
      IN  MIR-ANTY-DOWN-PMT-S2-AMT          
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Down payment S2 (Annuity resources)";
      }
      IN  MIR-ANTY-TYP       
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Annuity type";
      }
      IN  MIR-EXTN-START-DT       
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Extension start";
      }
      IN  MIR-EXTN-END-DT       
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Extension end";
      }
      IN  MIR-EXTN-ENDW-DIV-AMT  
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Pure endowment dividend";
      }
      IN  MIR-EXTN-RESOURCE  
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Extension resource";
      }
      IN  MIR-EMP-INS-IND
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Internal, external control";
      }
      IN  MIR-EMP-COMP-CD  
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "AffiliationM";
      }
      IN  MIR-EMP-EMPID
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Employee ID";
      }
      IN  MIR-EMP-P1
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "P1";
      }
      IN  MIR-EMP-P2
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "P2";
      }
      IN  MIR-SPROD-CD
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Soft products code";
      }
      IN  MIR-PREM-PMT-F
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "F type premium payment date";
      }
      IN  MIR-PADV-INT-CAP-DT
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "residuals of prepaid premium Interest Capitalization date";
      }
      IN  MIR-PADV-INT-TOT-AMT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Interest for prepayment total";
      }
      IN  MIR-PADV-ST-DT-1
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment start date (1)";
      }
      IN  MIR-PADV-DT-1
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment date (1)";
      }
      IN  MIR-PADV-DEP-FND-1
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Premium deposit funds (1)";
      }
      IN  MIR-PADV-CTRL-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Prepayment control (1)";
      }
      IN  MIR-PADV-INT-CAP-BS-DT-1
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest Capitalization base date (1)";
      }
      IN  MIR-PADV-UNEARNED-INT-1
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Unearned interest (1)";
      }
      IN  MIR-PADV-CAP-CTRL-IND-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Interest capitalization necessity control (1)";
      }
      IN  MIR-PADV-DEP-YM-1
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Deposit year and month (1)";
      }
      IN  MIR-PADV-ST-DT-2
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment start date (2)";
      }
      IN  MIR-PADV-DT-2
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment year and month (2)";
      }
      IN  MIR-PADV-DEP-FND-2
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Premium deposit funds (2)";
      }
      IN  MIR-PADV-CTRL-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Prepayment control (2)";
      }
      IN  MIR-PADV-INT-CAP-BS-DT-2
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization base date (2)";
      }
      IN  MIR-PADV-UNEARNED-INT-2
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Unearned interest (2)";
      }
      IN  MIR-PADV-CAP-CTRL-IND-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Interest capitalization necessity control (2)";
      }
      IN  MIR-PADV-DEP-YM-2
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Deposit year and month (2)";
      }
      IN  MIR-PADV-ST-DT-3  
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment start date (3)";
      }
      IN  MIR-PADV-DT-3  
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment year and month (3)";
      }
      IN  MIR-PADV-DEP-FND-3  
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Premium deposit funds (3)";
      }
      IN  MIR-PADV-CTRL-3  
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Prepayment control (3)";
      }
      IN  MIR-PADV-INT-CAP-BS-DT-3  
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization base date (3)";
      }
      IN  MIR-PADV-UNEARNED-INT-3   
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Unearned interest (3)";
      }
      IN  MIR-PADV-CAP-CTRL-IND-3
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Interest capitalization necessity control (3)";
      }
      IN  MIR-PADV-DEP-YM-3
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Deposit year and month (3)";
      }
      IN  MIR-PADV-ST-DT-4
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment start date (4)";
      }
      IN  MIR-PADV-DT-4
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment year and month (4)";
      }
      IN  MIR-PADV-DEP-FND-4
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Premium deposit funds (4)";
      }
      IN  MIR-PADV-CTRL-4
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Prepayment control (4)";
      }
      IN  MIR-PADV-INT-CAP-BS-DT-4
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization base date (4)";
      }
      IN  MIR-PADV-UNEARNED-INT-4 
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Unearned interest (4)";
      }
      IN  MIR-PADV-CAP-CTRL-IND-4 
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Interest capitalization necessity control (4)";
      }
      IN  MIR-PADV-DEP-YM-4 
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Deposit year and month (4)";
      }
      IN  MIR-PADV-ST-DT-5     
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment start date (5)";
      }
      IN  MIR-PADV-DT-5    
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment year and month (5)";
      }
      IN  MIR-PADV-DEP-FND-5      
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Premium deposit funds (5)";
      }
      IN  MIR-PADV-CTRL-5    
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Prepayment control (5)";
      }
      IN  MIR-PADV-INT-CAP-BS-DT-5  
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization base date (5)";
      }
      IN  MIR-PADV-UNEARNED-INT-5   
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Unearned interest (5)";
      }
      IN  MIR-PADV-CAP-CTRL-IND-5   
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Interest capitalization necessity control (5)";
      }
      IN  MIR-PADV-DEP-YM-5 
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Deposit year and month (5)";
      }
      IN  MIR-SAV-PREPAY-ST-DT-1   
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment start date (1)";
      }
      IN  MIR-SAV-PREPAY-FREQ-1    
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Prepayment frequency (1)";
      }
      IN  MIR-SAV-PREPAY-CTL-IND-1   
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Prepayment control (1)";
      }
      IN  MIR-SAV-PREPAY-DEP-YM-1    
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Deposit year and month (1)";
      }
      IN  MIR-SAV-PREPAY-ST-DT-2   
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment start date (2)";
      }
      IN  MIR-SAV-PREPAY-FREQ-2    
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Prepayment frequency (2)";
      }
      IN  MIR-SAV-PREPAY-CTL-IND-2   
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Prepayment control (2)";
      }
      IN  MIR-SAV-PREPAY-DEP-YM-2    
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Deposit year and month (2)";
      }
      IN  MIR-SAV-PREPAY-ST-DT-3 
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment start date (3)";
      }
      IN  MIR-SAV-PREPAY-FREQ-3
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Prepayment frequency (3)";
      }
      IN  MIR-SAV-PREPAY-CTL-IND-3   
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Prepayment control (3)";
      }
      IN  MIR-SAV-PREPAY-DEP-YM-3    
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Deposit year and month (3)";
      }
      IN  MIR-SAV-PREPAY-ST-DT-4   
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment start date (4)";
      }
      IN  MIR-SAV-PREPAY-FREQ-4   
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Prepayment frequency (4)";
      }
      IN  MIR-SAV-PREPAY-CTL-IND-4   
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Prepayment control (4)";
      }
      IN  MIR-SAV-PREPAY-DEP-YM-4
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Deposit year and month (4)";
      }
      IN  MIR-SAV-PREPAY-ST-DT-5   
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment start date (5)";
      }
      IN  MIR-SAV-PREPAY-FREQ-5   
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Prepayment frequency (5)";
      }
      IN  MIR-SAV-PREPAY-CTL-IND-5   
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Prepayment control (5)";
      }
      IN  MIR-SAV-PREPAY-DEP-YM-5
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Deposit year and month (5)";
      }
      IN  MIR-SAV-PREPAY-ST-DT-6   
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment start date (6)";
      }
      IN  MIR-SAV-PREPAY-FREQ-6   
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Prepayment frequency (6)";
      }
      IN  MIR-SAV-PREPAY-CTL-IND-6   
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Prepayment control (6)";
      }
      IN  MIR-SAV-PREPAY-DEP-YM-6
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Deposit year and month (6)";
      }
      IN  MIR-PPAY-BULK-BOX   
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Bulk box";
      }
      IN  MIR-PPAY-UNEARN-INT   
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Unearned interest";
      }
      IN  MIR-PPAY-INT-CAP-YM   
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization (year and month)";
      }
      IN  MIR-PPAY-PRCS-CD-1    
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Process code (CH) (1)";
      }
      IN  MIR-PPAY-PRCS-DT-1   
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Process date: Year month day (1)";
      }
      IN  MIR-PPAY-INT-CAP-YM-1    
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization/ appropriation year and month (1)";
      }
      IN  MIR-PPAY-EARN-VALU-1   
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Earnings value (1)";
      }
      IN  MIR-PPAY-BALANCE-1    
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Pre-payment balance (1)";
      }
      IN  MIR-PPAY-INT-CAP-MTHS-1   
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "No. of months of interest capitalization (1)";
      }
      IN  MIR-PPAY-UNRN-MTH-LAPS-1    
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Number of unearned months lapsed (1)";
      }
      IN  MIR-PPAY-COUNT-1   
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "No. of prepayments (1)";
      }
      IN  MIR-PPAY-NXT-APROP-YM-1    
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Next appropriation year and month (1)";
      }
      IN  MIR-PPAY-PRCS-CD-2    
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Process code (CH) (2)";
      }
      IN  MIR-PPAY-PRCS-DT-2   
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Process date: Year month day (2)";
      }
      IN  MIR-PPAY-INT-CAP-YM-2    
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization/ appropriation year and month (2)";
      }
      IN  MIR-PPAY-EARN-VALU-2   
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Earnings value (2)";
      }
      IN  MIR-PPAY-BALANCE-2    
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Pre-payment balance (2)";
      }
      IN  MIR-PPAY-INT-CAP-MTHS-2   
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "No. of months of interest capitalization (2)";
      }
      IN  MIR-PPAY-UNRN-MTH-LAPS-2    
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Number of unearned months lapsed (2)";
      }
      IN  MIR-PPAY-COUNT-2   
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "No. of prepayments (2)";
      }
      IN  MIR-PPAY-NXT-APROP-YM-2    
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Next appropriation year and month (2)";
      }
      IN  MIR-PPAY-PRCS-CD-3    
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Process code (CH) (3)";
      }
      IN  MIR-PPAY-PRCS-DT-3   
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Process date: Year month day (3)";
      }
      IN  MIR-PPAY-INT-CAP-YM-3    
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization/ appropriation year and month (3)";
      }
      IN  MIR-PPAY-EARN-VALU-3   
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Earnings value (3)";
      }
      IN  MIR-PPAY-BALANCE-3    
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Pre-payment balance (3)";
      }
      IN  MIR-PPAY-INT-CAP-MTHS-3   
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "No. of months of interest capitalization (3)";
      }
      IN  MIR-PPAY-UNRN-MTH-LAPS-3    
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Number of unearned months lapsed (3)";
      }
      IN  MIR-PPAY-COUNT-3   
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "No. of prepayments (3)";
      }
      IN  MIR-PPAY-NXT-APROP-YM-3    
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Next appropriation year and month (3)";
      }
      IN  MIR-PPAY-PRCS-CD-4    
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Process code (CH) (4)";
      }
      IN  MIR-PPAY-PRCS-DT-4   
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Process date: Year month day (4)";
      }
      IN  MIR-PPAY-INT-CAP-YM-4    
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization/ appropriation year and month (4)";
      }
      IN  MIR-PPAY-EARN-VALU-4   
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Earnings value (4)";
      }
      IN  MIR-PPAY-BALANCE-4    
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Pre-payment balance (4)";
      }
      IN  MIR-PPAY-INT-CAP-MTHS-4   
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "No. of months of interest capitalization (4)";
      }
      IN  MIR-PPAY-UNRN-MTH-LAPS-4    
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Number of unearned months lapsed (4)";
      }
      IN  MIR-PPAY-COUNT-4   
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "No. of prepayments (4)";
      }
      IN  MIR-PPAY-NXT-APROP-YM-4    
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Next appropriation year and month (4)";
      }
      IN  MIR-PPAY-PRCS-CD-5    
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Process code (CH) (5)";
      }
      IN  MIR-PPAY-PRCS-DT-5   
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Process date: Year month day (5)";
      }
      IN  MIR-PPAY-INT-CAP-YM-5    
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization/ appropriation year and month (5)";
      }
      IN  MIR-PPAY-EARN-VALU-5   
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Earnings value (5)";
      }
      IN  MIR-PPAY-BALANCE-5    
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Pre-payment balance (5)";
      }
      IN  MIR-PPAY-INT-CAP-MTHS-5   
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "No. of months of interest capitalization (5)";
      }
      IN  MIR-PPAY-UNRN-MTH-LAPS-5    
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Number of unearned months lapsed (5)";
      }
      IN  MIR-PPAY-COUNT-5   
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "No. of prepayments (5)";
      }
      IN  MIR-PPAY-NXT-APROP-YM-5    
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Next appropriation year and month (5)";
      }
      IN  MIR-RBON-CHRGBK-IND   
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment, charge back control";
      }
      IN  MIR-RBON-CHRGBK-LPAY-DT    
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Last date (year, month, day) of payment (Charge back)";
      }
      IN  MIR-RBON-CHRGBK-AMT 
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Value of this time's payment (charge back)";
      }
      IN  MIR-RBON-PREV-ACCUM-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Previous recover bonus payment accumulated value";
      }
      IN  MIR-RBON-BNFT-PMT-CD-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 1st payment status";
      }
      IN  MIR-RBON-BNFT-PMT-CD-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 2";
      }
      IN  MIR-RBON-BNFT-PMT-CD-3
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 3";
      }
      IN  MIR-RBON-BNFT-PMT-CD-4
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 4";
      }
      IN  MIR-RBON-BNFT-PMT-CD-5
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 5";
      }
      IN  MIR-RBON-BNFT-PMT-CD-6
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 6";
      }
      IN  MIR-RBON-BNFT-PMT-CD-7
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 7";
      }
      IN  MIR-RBON-BNFT-PMT-CD-8
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 8";
      }
      IN  MIR-RBON-BNFT-PMT-CD-9
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 9";
      }
      IN  MIR-RBON-BNFT-PMT-CD-10
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 10";
      }
      IN  MIR-RBON-BNFT-PMT-CD-11
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 11";
      }
      IN  MIR-RBON-BNFT-PMT-CD-12
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 12";
      }
      IN  MIR-RBON-BNFT-PMT-CD-13
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 13";
      }
      IN  MIR-RBON-BNFT-PMT-CD-14
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 14";
      }
      IN  MIR-RBON-BNFT-PMT-CD-15
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 15";
      }
      IN  MIR-RBON-BNFT-PMT-CD-16
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 16";
      }
      IN  MIR-RBON-BNFT-PMT-CD-17
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 17";
      }
      IN  MIR-RBON-BNFT-PMT-CD-18
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 18";
      }
      IN  MIR-RBON-BNFT-PMT-CD-19
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 19";
      }
      IN  MIR-RBON-BNFT-PMT-CD-20
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 20";
      }
      IN  MIR-RBON-BNFT-PMT-CD-21
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 21";
      }
      IN  MIR-RBON-BNFT-PMT-CD-22
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 22";
      }
      IN  MIR-RBON-BNFT-PMT-CD-23
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 23";
      }
      IN  MIR-RBON-BNFT-PMT-CD-24
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 24";
      }
      IN  MIR-RBON-BNFT-PMT-CD-25
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 25";
      }
      IN  MIR-RBON-BNFT-PMT-CD-26
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 26";
      }
      IN  MIR-RBON-BNFT-PMT-CD-27
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 27";
      }
      IN  MIR-RBON-BNFT-PMT-CD-28
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 28";
      }
      IN  MIR-RBON-BNFT-PMT-CD-29
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 29";
      }
      IN  MIR-RBON-BNFT-PMT-CD-30
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 30";
      }
      IN  MIR-RBON-BNFT-PMT-CD-31
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 31";
      }
      IN  MIR-RBON-BNFT-PMT-CD-32
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 32";
      }
      IN  MIR-RBON-BNFT-PMT-CD-33
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 33";
      }
      IN  MIR-RBON-BNFT-PMT-CD-34
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 34";
      }
      IN  MIR-RBON-BNFT-PMT-CD-35
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 35";
      }
      IN  MIR-RBON-BNFT-PMT-CD-36
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Benefits payment status 36";
      }
      IN  MIR-SMKR-CD
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Smoking classification CTL";
      }
      IN  MIR-SMKR-CIG-COUNT
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "No. of cigarettes smoked";
      }
      IN  MIR-DIV-HIST-PMT-CAT-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment classification (1)";
      }
      IN  MIR-DIV-HIST-DIV-YR-1
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Dividend year (1)";
      }
      IN  MIR-DIV-HIST-PMT-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment date (year, month, day) (1)";
      }
      IN  MIR-DIV-HIST-PMT-CAT-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment classification (2)";
      }
      IN  MIR-DIV-HIST-DIV-YR-2
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Dividend year (2)";
      }
      IN  MIR-DIV-HIST-PMT-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment date (year, month, day) (2)";
      }
      IN  MIR-DIV-HIST-PMT-CAT-3
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment classification (3)";
      }
      IN  MIR-DIV-HIST-DIV-YR-3
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Dividend year (3)";
      }
      IN  MIR-DIV-HIST-PMT-DT-3
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment date (year, month, day) (3)";
      }
      IN  MIR-DIV-DISB-CHG-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment method change date: year, month, day";
      }
      IN  MIR-DIV-DISB-CHG-YR
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Change year";
      }
      IN  MIR-DIV-DISB-PREV-PMT-CD
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Previous dividend payment code";
      }
      IN  MIR-HLTH-DPOS-IND
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Deposit control";
      }
      IN  MIR-HLTH-DPOS-LST-DEP-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Last deposit year and month";
      }
      IN  MIR-HLTH-DPOS-INT-CAP-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization year and month";
      }
      IN  MIR-HLTH-DPOS-PREV-ACAMT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Accumulated deposit (Excluding this time)";
      }
      IN  MIR-HLTH-DPOS-CURR-AMT
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "This time's deposit";
      }
      IN  MIR-HLTH-DPOS-ACCUM-INT
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Accumulated interest";
      }
      IN  MIR-HLTH-PMT-PREV-ACAMT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Accumulated deposit payment (Excluding this time)";
      }
      IN  MIR-HLTH-PMT-CURR-AMT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "This time's deposit payment";
      }
      IN  MIR-HLTH-PMT-INT-AMT
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest payment amount";
      }
      IN  MIR-HLTH-PMT-ACCUM-VALU
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Accumulated payment value";
      }
      IN  MIR-HLTH-PYHST-IND-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (1)";
      }
      IN  MIR-HLTH-PYHST-TOT-AMT-1
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Payment value total (1)";
      }
      IN  MIR-HLTH-PYHST-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment date: year, month, day (1)";
      }
      IN  MIR-HLTH-PYHST-BRCH-ID-1
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (1)";
      }
      IN  MIR-HLTH-PYHST-AB-CTRL-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "A-B Control (1)";
      }
      IN  MIR-HLTH-PYHST-IND-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (2)";
      }
      IN  MIR-HLTH-PYHST-TOT-AMT-2
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Payment value total (2)";
      }
      IN  MIR-HLTH-PYHST-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment date: year, month, day (2)";
      }
      IN  MIR-HLTH-PYHST-BRCH-ID-2
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (2)";
      }
      IN  MIR-HLTH-PYHST-AB-CTRL-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "A-B Control (2)";
      }
      IN  MIR-HLTH-PYHST-IND-3
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (3)";
      }
      IN  MIR-HLTH-PYHST-TOT-AMT-3
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Payment value total (3)";
      }
      IN  MIR-HLTH-PYHST-DT-3
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment date: year, month, day (3)";
      }
      IN  MIR-HLTH-PYHST-BRCH-ID-3
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (3)";
      }
      IN  MIR-HLTH-PYHST-AB-CTRL-3
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "A-B Control (3)";
      }
      IN  MIR-HLTH-PYHST-IND-4
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (4)";
      }
      IN  MIR-HLTH-PYHST-TOT-AMT-4
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Payment value total (4)";
      }
      IN  MIR-HLTH-PYHST-DT-4
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment date: year, month, day (4)";
      }
      IN  MIR-HLTH-PYHST-BRCH-ID-4
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (4)";
      }
      IN  MIR-HLTH-PYHST-AB-CTRL-4
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "A-B Control (4)";
      }
      IN  MIR-HLTH-PYHST-IND-5
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (5)";
      }
      IN  MIR-HLTH-PYHST-TOT-AMT-5
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Payment value total (5)";
      }
      IN  MIR-HLTH-PYHST-DT-5
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment date: year, month, day (5)";
      }
      IN  MIR-HLTH-PYHST-BRCH-ID-5
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (5)";
      }
      IN  MIR-HLTH-PYHST-AB-CTRL-5
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "A-B Control (5)";
      }
      IN  MIR-B-NEW-DIV-YR
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "New dividend year";
      }
      IN  MIR-B-NEW-CURR-INC-PREM
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "New current increase premium";
      }
      IN  MIR-B-NEW-ACCUM-INC-PREM
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "New accumulated increased premium";
      }
      IN  MIR-B-OLD-DIV-YR
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Old dividend year";
      }
      IN  MIR-B-OLD-CURR-INC-PREM
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Old current increased premium";
      }
      IN  MIR-B-OLD-ACCUM-INC-PREM
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Old accumulated increased premium";
      }
      IN  MIR-SALES-POL-ID-1
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Policy ID 1";
      }
      IN  MIR-SALES-SMAL-TYP-1
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Small type 1";
      }
      IN  MIR-SALES-POL-ID-2
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Policy ID 2";
      }
      IN  MIR-SALES-SMAL-TYP-2
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Small type 2";
      }
      IN  MIR-SALES-POL-INFO-1
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Policy information 1";
      }
      IN  MIR-SALES-POL-INFO-2
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Policy information 2";
      }
      IN  MIR-AUTOEXT-SETL-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Settlement date: year, month, day";
      }
      IN  MIR-AUTOEXT-EXLS-PREM
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Excess/shortage in premium";
      }
      IN  MIR-AUTOEXT-EXLS-LN-INT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Excess/shortage in loan interest";
      }
      IN  MIR-AUTOEXT-PREPAY-INT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Interest for prepayment";
      }
      IN  MIR-AUTOEXT-INT-CAP-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization year and month";
      }
      IN  MIR-AUTOEXT-TERM-TXFR-CD
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Term rider transfer code";
      }
      IN  MIR-AUTOEXT-SAV-IND
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Automatic extension save bit, before extension before loan history bit";
      }
      IN  MIR-PARTL-EXL-PART-1  
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Partial exclusion part (1)";
      }
      IN  MIR-PART-EXCL-PERIOD-1
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Partial exclusion period (1)";
      }
      IN  MIR-PARTL-EXL-PART-2  
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Partial exclusion part (2)";
      }
      IN  MIR-PART-EXCL-PERIOD-2
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Partial exclusion period (2)";
      }
      IN  MIR-PARTL-EXL-PART-3  
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Partial exclusion part (3)";
      }
      IN  MIR-PART-EXCL-PERIOD-3
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Partial exclusion period (3)";
      }
      IN  MIR-RDR-PMT-LAST-DEP-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Last deposit date: year, month, end";
      }
      IN  MIR-RDR-PMT-INT-CAP   
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization";
      }
      IN  MIR-RDR-PMT-ACUM-DEP-AMT     
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Accumulated deposit";
      }
      IN  MIR-RDR-PMT-ACUM-INT-AMT     
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Accumulated interest";
      }
      IN  MIR-RDR-PMT-DT     
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment date: year, month, day";
      }
      IN  MIR-TAXWH-CD     
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control bit, available policy ";
      }
      IN  MIR-TAXWH-INIT-APREM     
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Initial year accumulated premium";
      }
      IN  MIR-TAXWH-NEXT-APREM
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Next year accumulated premium (Initial year + 2nd year)";
      }
      IN  MIR-SAVING-SGL-PAY-CD
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control bit, Single payment P ";
      }
      IN  MIR-SAVING-LVL-PAY-CD
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control bit, level payment P";
      }
      IN  MIR-SAVING-NB-LVL-PAY-CD
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control bit, at the time of new business level payment P ";
      }
      IN  MIR-SAVING-MAT-DT-CD
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control bit, Set maturity date";
      }
      IN  MIR-SAVING-LIAB-ST-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Liability commencement date";
      }
      IN  MIR-SAVING-MAT-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Maturity date";
      }
      IN  MIR-WLPUA-DIV-AMT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Paid-up addition dividend";
      }
      IN  MIR-WLPUA-CUR-PREM-AMT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "New paid-up addition whole life premium";
      }
      IN  MIR-WLPUA-CUR-APREM-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "New accumulated paid-up addition whole life premium";
      }
      IN  MIR-WLPUA-CURR-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "New paid-up addition year and month";
      }
      IN  MIR-WLPUA-PREV-PREM-AMT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Old paid-up whole life premium";
      }
      IN  MIR-WLPUA-PREV-APREM-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Old accumulated paid-up addition whole life premium";
      }
      IN  MIR-WLPUA-PREV-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Old paid-up addition year and month";
      }
      IN  MIR-WLPUA-PLAN-DIV
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Paid-up addition planned dividend";
      }
      IN  MIR-RENW-ACTV-19
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Renewal activities 19";
      }
      IN  MIR-RENW-ACTV-25
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Renewal activities 25";
      }
      IN  MIR-RENW-ACTV-CD-49
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "New renewal activities CTL/ 49th continuation activity";
      }
      IN  MIR-RENW-ACTV-CD-37
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "New renewal activities CTL/ 37th continuation activity";
      }
      IN  MIR-RENW-ACTV-CD-25
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "New renewal activities CTL/ 25th continuation activity";
      }
      IN  MIR-WL-PPAY-RPRM-INS-IND
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control bit, Rider premium deposit (installment)";
      }
      IN  MIR-WL-PPAY-RPRM-OTP-IND
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control bit, Rider premium deposit (One time payment)";
      }
      IN  MIR-WL-PPAY-DEEM-CNCL-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Deemed cancellation date";
      }
      IN  MIR-WL-PPAY-INDV-MPREM
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Individual monthly payment rider premium";
      }
      IN  MIR-WL-PPAY-RDR-PREM-DUR
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Rider premium payment period";
      }
      IN  MIR-WL-PPAY-RDR-ELAPS
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Rider elapse";
      }
      IN  MIR-SPDIV-PMT-CD-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment code (1)";
      }
      IN  MIR-SPDIV-PMT-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment date (1)";
      }
      IN  MIR-SPDIV-DISC-DIV-YR-1
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Discount dividend year (1)";
      }
      IN  MIR-SPDIV-CALC-YR-1
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Calculation year (1)";
      }
      IN  MIR-SPDIV-AMT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Special dividend (1)";
      }
      IN  MIR-SPDIV-AMT-TO-ADD-1
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Amount to be added (1)";
      }
      IN  MIR-SPDIV-PMT-CD-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment code (2)";
      }
      IN  MIR-SPDIV-PMT-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment date (2)";
      }
      IN  MIR-SPDIV-DISC-DIV-YR-2
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Discount dividend year (2)";
      }
      IN  MIR-SPDIV-CALC-YR-2
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Calculation year (2)";
      }
      IN  MIR-SPDIV-AMT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Special dividend (2)";
      }
      IN  MIR-SPDIV-AMT-TO-ADD-2
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Amount to be added (2)";
      }
      IN  MIR-SPDIV-LAST-RAPROP-YR
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Last reserve appropriation year";
      }
      IN  MIR-SPDIV-RAPROP-ACCUM
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Reserve appropriation special dividend accumulation";
      }
      IN  MIR-SPDIV-FREQ
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Frequency";
      }
      IN  MIR-SPDIV-DISC-VAL-V-AMT
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Discount value V proportional amount";
      }
      IN  MIR-SPDIV-PMT-COMP-ACCUM
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment completed special dividend accumulation";
      }
      IN  MIR-SVBNE-DFR-LAST-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Last deferred year and month";
      }
      IN  MIR-SVBNE-DFR-INT-CAP-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization year and month ";
      }
      IN  MIR-SVBNE-DFR-ACCUM
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Deferred survival benefit accumulation";
      }
      IN  MIR-SVBNE-DEFER-INT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Deferred interest";
      }
      IN  MIR-SVBNE-PMT-DEFER-ACUM
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Deferred payment accumulation (excluding this time)";
      }
      IN  MIR-SVBNE-PMT-CURR-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "This time payment amount";
      }
      IN  MIR-SVBNE-PMT-INT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Interest payment";
      }
      IN  MIR-SVBNE-PMT-ACCUM-VALU
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment amount accumulated value";
      }
      IN  MIR-SVBNE-HST-PYCB-CD-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (1)";
      }
      IN  MIR-SVBNE-HST-PYCB-AMT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back value total (1)";
      }
      IN  MIR-SVBNE-HST-PYCB-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back date (1)";
      }
      IN  MIR-SVBNE-HST-BRCH-CD-1
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (1)";
      }
      IN  MIR-SVBNE-HST-ELIG-PMT-1
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Number of eligible payments (1)";
      }
      IN  MIR-SVBNE-HST-PYCB-CD-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (2)";
      }
      IN  MIR-SVBNE-HST-PYCB-AMT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back value total (2)";
      }
      IN  MIR-SVBNE-HST-PYCB-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back date (2)";
      }
      IN  MIR-SVBNE-HST-BRCH-CD-2
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (2)";
      }
      IN  MIR-SVBNE-HST-ELIG-PMT-2
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Number of eligible payments (2)";
      }
      IN  MIR-SVBNE-HST-PYCB-CD-3
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (2)";
      }
      IN  MIR-SVBNE-HST-PYCB-AMT-3
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back value total (3)";
      }
      IN  MIR-SVBNE-HST-PYCB-DT-3
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back date (3)";
      }
      IN  MIR-SVBNE-HST-BRCH-CD-3
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (3)";
      }
      IN  MIR-SVBNE-HST-ELIG-PMT-3
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Number of eligible payments (3)";
      }
      IN  MIR-SVBNE-HST-PYCB-CD-4
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (3)";
      }
      IN  MIR-SVBNE-HST-PYCB-AMT-4
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back value total (3)";
      }
      IN  MIR-SVBNE-HST-PYCB-DT-4
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back date (4)";
      }
      IN  MIR-SVBNE-HST-BRCH-CD-4
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (4)";
      }
      IN  MIR-SVBNE-HST-ELIG-PMT-4
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Number of eligible payments (4)";
      }
      IN  MIR-SVBNE-HST-PYCB-CD-5
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (5)";
      }
      IN  MIR-SVBNE-HST-PYCB-AMT-5
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back value total (5)";
      }
      IN  MIR-SVBNE-HST-PYCB-DT-5
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back date (5)";
      }
      IN  MIR-SVBNE-HST-BRCH-CD-5
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (5)";
      }
      IN  MIR-SVBNE-HST-ELIG-PMT-5
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Number of eligible payments (5)";
      }
      IN  MIR-CHINS-CD
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Children's insurance type";
      }
      IN  MIR-CHINS-PMT-6
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Award payment time arrived BIT/ 6th arrival/19 years 7 months";
      }
      IN  MIR-CHINS-PMT-5
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Award payment time arrived BIT/ 5th arrival/17 years 7 months";
      }
      IN  MIR-CHINS-PMT-4
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Award payment time arrived BIT/ 4th arrival/14 years 7 months";
      }
      IN  MIR-CHINS-PMT-3
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Award payment time arrived BIT/ 3rd arrival/11 years 7 months";
      }
      IN  MIR-CHINS-PMT-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Award payment time arrived BIT/ 2nd arrival/5 years 7 months";
      }
      IN  MIR-CHINS-PMT-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Award payment time arrived BIT/ 1st arrival/3 years 7 months";
      }
      IN  MIR-CHINS-BEFOR-BTH-IND
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Child insurance policy status BIT/ Issue before birth additional provisions invalid policy";
      }
      IN  MIR-CHINS-LUMPSUM-IND
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Child insurance status BIT/ education annuity lump sum payment ";
      }
      IN  MIR-CHINS-EDU-ANTY-IND
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Child insurance policy status BIT/ Education annuity payment";
      }
      IN  MIR-CHINS-INFORM-BTH-IND
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Child insurance policy status BIT/ birth reported";
      }
      IN  MIR-CHINS-ADD-PROV-IND
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Child insurance policy status BIT/issue additional provisions before birth";
      }
      IN  MIR-CHINS-EXP-BTH-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Expected birth date";
      }
      IN  MIR-CHINS-MTHLY-PREM
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Individual monthly premium";
      }
      IN  MIR-DEFR-PMT-LAST-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Last deferred year and month";
      }
      IN  MIR-DEFR-PMT-INT-CAP-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalized year and month";
      }
      IN  MIR-DEFR-PMT-ACCUM-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Deferred award accumulation";
      }
      IN  MIR-DEFR-PMT-ACCUM-INT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Deferred interest accumulation";
      }
      IN  MIR-AWD-PMT-PREV-TOT-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Award payment accumulation (Excluding this time)";
      }
      IN  MIR-AWD-PMT-CURR-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "This time award payment value";
      }
      IN  MIR-AWD-PMT-INT-AMT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Interest payment value";
      }
      IN  MIR-AWD-PMT-CURR-TOT-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment accumulated value";
      }
      IN  MIR-AWD-PHIST-PYCB-CD-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (1)";
      }
      IN  MIR-AWD-PHIST-PYCB-AMT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back amount total (1)";
      }
      IN  MIR-AWD-PHIST-PYCB-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back date (1)";
      }
      IN  MIR-AWD-PHIST-BRCH-CD-1
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (1)";
      }
      IN  MIR-AWD-PHIST-PYCB-CD-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (2)";
      }
      IN  MIR-AWD-PHIST-PYCB-AMT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back amount total (2)";
      }
      IN  MIR-AWD-PHIST-PYCB-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back date (2)";
      }
      IN  MIR-AWD-PHIST-BRCH-CD-2
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (2)";
      }
      IN  MIR-AWD-PHIST-PYCB-CD-3
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (3)";
      }
      IN  MIR-AWD-PHIST-PYCB-AMT-3
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back amount total (3)";
      }
      IN  MIR-AWD-PHIST-PYCB-DT-3
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back date (3)";
      }
      IN  MIR-AWD-PHIST-BRCH-CD-3
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (3)";
      }
      IN  MIR-AWD-PHIST-PYCB-CD-4
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (4)";
      }
      IN  MIR-AWD-PHIST-PYCB-AMT-4
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back amount total (4)";
      }
      IN  MIR-AWD-PHIST-PYCB-DT-4
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back date (4)";
      }
      IN  MIR-AWD-PHIST-BRCH-CD-4
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (4)";
      }
      IN  MIR-AWD-PHIST-PYCB-CD-5
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment/ charge back control (5)";
      }
      IN  MIR-AWD-PHIST-PYCB-AMT-5
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back amount total (5)";
      }
      IN  MIR-AWD-PHIST-PYCB-DT-5
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment/ charge back date (5)";
      }
      IN  MIR-AWD-PHIST-BRCH-CD-5
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office (5)";
      }
      IN  MIR-SALES-2G-POL-ID-1
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Policy ID 1";
      }
      IN  MIR-SALES-2G-SMAL-TYP-1
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Small type 1";
      }
      IN  MIR-SALES-2G-POL-ID-2
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Policy ID 2";
      }
      IN  MIR-SALES-2G-SMAL-TYP-2
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Small type 2";
      }
      IN  MIR-SALES-2G-POL-ID-3
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Policy ID 3";
      }
      IN  MIR-SALES-2G-SMAL-TYP-3
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Small type 3";
      }
      IN  MIR-SALES-2G-POL-ID-4
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Policy ID4";
      }
      IN  MIR-SALES-2G-SMAL-TYP-4
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Small type 4";
      }
      IN  MIR-SALES-2G-POL-ID-5
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Policy ID 5";
      }
      IN  MIR-SALES-2G-SMAL-TYP-5
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Small type 5";
      }
      IN  MIR-SALES-2G-POL-ID-6
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Policy ID 6";
      }
      IN  MIR-SALES-2G-SMAL-TYP-6
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Small type 6";
      }
      IN  MIR-IPENDW-LAST-DEFR-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Last deferred date";
      }
      IN  MIR-IPENDW-INT-CAP-DT
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalizaition date";
      }
      IN  MIR-IPENDW-ACUM-DEFR-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Deferred amount (Accumulated)";
      }
      IN  MIR-IPENDW-ACUM-INT
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Accumulated interest";
      }
      IN  MIR-IPENDW-PREV-DEFR-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Previous deferred amount";
      }
      IN  MIR-IPENDW-LAST-PMT-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Last payment date";
      }
      IN  MIR-IPENDW-LAST-PMT-VALU
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Last payment deferred value";
      }
      IN  MIR-IPENDW-LAST-PMT-INT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Last payment interest";
      }
      IN  MIR-IPENDW-ACUM-PMT
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Accumulated payment premium total";
      }
      IN  MIR-IPENDW-ACUM-PMT-WINT
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Accumulated payment total (Including interest)";
      }
      IN  MIR-BEST-DFR-INT-CAP-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization year and month";
      }
      IN  MIR-BEST-DFR-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Deferred amount";
      }
      IN  MIR-BEST-DFR-ACCUM-INT
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Accumulated interest";
      }
      IN  MIR-BEST-DFR-PMT-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment date";
      }
      IN  MIR-BEST-DFR-PMT-W-INT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Paid increase premium (including interest)";
      }
      IN  MIR-PI-RDR-ADDN-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Rider addition date";
      }
      IN  MIR-PI-RDR-RNW-COMM-19-1
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Renewal activities commission 19 payment year and month";
      }
      IN  MIR-PI-RDR-RNW-COMM-25-1
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Renewal activities commission 25 payment year and month";
      }
      IN  MIR-PI-RDR-ADDN-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Rider addition date";
      }
      IN  MIR-PI-RDR-RNW-COMM-19-2
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Renewal activities commission 19 payment year and month";
      }
      IN  MIR-PI-RDR-RNW-COMM-25-2
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Renewal activities commission 25 payment year and month";
      }
      IN  MIR-PI-RDR-ADDN-DT-3
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Rider addition date";
      }
      IN  MIR-PI-RDR-RNW-COMM-19-3
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Renewal activities commission 19 payment year and month";
      }
      IN  MIR-PI-RDR-RNW-COMM-25-3
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Renewal activities commission 25 payment year and month";
      }
      IN  MIR-PI-RDR-ADDN-DT-4
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Rider addition date";
      }
      IN  MIR-PI-RDR-RNW-COMM-19-4
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Renewal activities commission 19 payment year and month";
      }
      IN  MIR-PI-RDR-RNW-COMM-25-4
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Renewal activities commission 25 payment year and month";
      }
      IN  MIR-PI-RDR-ADDN-DT-5
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Rider addition date";
      }
      IN  MIR-PI-RDR-RNW-COMM-19-5
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Renewal activities commission 19 payment year and month";
      }
      IN  MIR-PI-RDR-RNW-COMM-25-5
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Renewal activities commission 25 payment year and month";
      }
      IN  MIR-SPDIV-PMT-CD
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment code";
      }
      IN  MIR-SPDIV-PMT-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment date";
      }
      IN  MIR-SPDIV-DISC-DIV-YR
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Discount dividend year";
      }
      IN  MIR-SPDIV-CD
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Special dividend";
      }
      IN  MIR-SPDIV-PAID-ACCUM-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Paid special dividend accumulated";
      }
      IN  MIR-SPDIV-NEW-BASE-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Main/V proportion μpart payment appraisal value (new)";
      }
      IN  MIR-SPDIV-NEW-PUA-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Whole life S paid-up addition / V proportion μpart payment appraisal value (new)";
      }
      IN  MIR-SPDIV-NEW-SPL-1-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Special 1/V proportion μ part payment appraisal value (new)";
      }
      IN  MIR-SPDIV-NEW-SPL-2-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Special 2/V proportion μ part payment appraisal value (new)";
      }
      IN  MIR-SPDIV-NEW-SPL-3-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Special 3/V proportion μ part payment appraisal value (new)";
      }
      IN  MIR-SPDIV-NEW-SPL-4-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Special 4/V proportion μ part payment appraisal value (new)";
      }
      IN  MIR-SPDIV-NEW-SPL-5-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Special 5/V proportion μ part payment appraisal value (new)";
      }
      IN  MIR-SPDIV-OLD-BASE-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Main/V proportion μpart payment appraisal value (old)";
      }
      IN  MIR-SPDIV-OLD-PUA-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Whole life S paid-up addition / V proportion μpart payment appraisal value (old)";
      }
      IN  MIR-SPDIV-OLD-SPL-1-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Special 1/V proportion μ part payment appraisal value (old)";
      }
      IN  MIR-SPDIV-OLD-SPL-2-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Special 2/V proportion μ part payment appraisal value (old)";
      }
      IN  MIR-SPDIV-OLD-SPL-3-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Special 3/V proportion μ part payment appraisal value (old)";
      }
      IN  MIR-SPDIV-OLD-SPL-4-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Special 4/V proportion μ part payment appraisal value (old)";
      }
      IN  MIR-SPDIV-OLD-SPL-5-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Special 5/V proportion μ part payment appraisal value (old)";
      }
      IN  MIR-SPDIV-DFR-LST-DEF-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Last deferred date";
      }
      IN  MIR-SPDIV-DFR-INT-CAP-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Interest capitalization year and month";
      }
      IN  MIR-SPDIV-DFR-AC-DEF-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Deferred amount (accumulated)";
      }
      IN  MIR-SPDIV-DFR-AC-INT
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Accumulated interest";
      }
      IN  MIR-SPDIV-DFR-LST-PMT-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Deferred last payment date";
      }
      IN  MIR-PRE-ALLOC-CTL-IND-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Pre-allocation control (1)";
      }
      IN  MIR-PRE-ALLOC-DIV-YR-1
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Dividend year (1)";
      }
      IN  MIR-PRE-ALLOC-CURR-DIV-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Current dividend (1)";
      }
      IN  MIR-PRE-ALLOC-CTL-IND-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Pre-allocation control (2)";
      }
      IN  MIR-PRE-ALLOC-DIV-YR-2
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Dividend year (2)";
      }
      IN  MIR-PRE-ALLOC-CURR-DIV-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Current dividend (2)";
      }
      IN  MIR-PRE-ALLOC-CTL-IND-3
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Pre-allocation control (3)";
      }
      IN  MIR-PRE-ALLOC-DIV-YR-3
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Dividend year (3)";
      }
      IN  MIR-PRE-ALLOC-CURR-DIV-3
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Current dividend (3)";
      }
      IN  MIR-PRE-ALLOC-CTL-IND-4
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Pre-allocation control (4)";
      }
      IN  MIR-PRE-ALLOC-DIV-YR-4
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Dividend year (4)";
      }
      IN  MIR-PRE-ALLOC-CURR-DIV-4
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Current dividend (4)";
      }
      IN  MIR-PRE-ALLOC-CTL-IND-5
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Pre-allocation control (5)";
      }
      IN  MIR-PRE-ALLOC-DIV-YR-5
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Dividend year (5)";
      }
      IN  MIR-PRE-ALLOC-CURR-DIV-5
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Current dividend (5)";
      }
      IN  MIR-PRE-ALLOC-CTL-IND-6
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Pre-allocation control (6)";
      }
      IN  MIR-PRE-ALLOC-DIV-YR-6
      {
          DisplayOnly;
          Length = "4";
          SType = "Text";
          Label = "Dividend year (6)";
      }
      IN  MIR-PRE-ALLOC-CURR-DIV-6
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Current dividend (6)";
      }
      IN  MIR-PRE-ALLOC-ACCUM-DIV
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Accumulated dividend";
      }
      IN  MIR-PRE-ALLOC-ACCUM-INT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Accumulated interest ";
      }
      IN  MIR-RDRUP-STAT-CTL
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Rider update status CTL";
      }
      IN  MIR-RDRUP-RPT-DAY
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Reporting day ";
      }
      IN  MIR-RDRUP-NOTI-DRAFT-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Notice drafting date";
      }
      IN  MIR-RDRUP-SP-MTH-ER-PREM
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Bank rider specific month earned premium after rider update";
      }
      IN  MIR-RDRUP-EMP-DISC-PREM
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Employee discount earned premium after rider update";
      }
      IN  MIR-RDRUP-WRIT-AGT
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Writing agent";
      }
      IN  MIR-RDRUP-CMN-WRIT-AGT
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Common writing agent";
      }
      IN  MIR-RDRUP-UPDT-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Date updated ";
      }
      IN  MIR-RDRUP-INIT-PREM-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Initial premium deposit date";
      }
      IN  MIR-RDRUP-PREV-STAT-CTL
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Previous rider update status CTL";
      }
      IN  MIR-RDRUP-PREV-RPT-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Previous reporting date";
      }
      IN  MIR-RDRUP-PREV-UPDT-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Previous update date";
      }
      IN  MIR-RDRUP-PREV-INPREM-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Previous initial premium deposit date";
      }
      IN  MIR-TERM-RDR-CD
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Rider code";
      }
      IN  MIR-APP-BEN-RT
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Benefit rate";
      }
      IN  MIR-APP-BEN-RT-ANTY-TERM
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Benefit rate (Annuity payment term)";
      }
      IN  MIR-APP-PYMT-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment date (Year, month, day)";
      }
      IN  MIR-APP-PYMT-OCCUR-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Date (Year, month, day) of payment occurance";
      }
      IN  MIR-APP-CTRT-EXCL-IND
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Contracts excluded from payment post update";
      }
      IN  MIR-BAS-CHG-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Date (year, month, day) of policy conditions change";
      }
      IN  MIR-BAS-CHG-CALC-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Calculation date (Year, month, day)";
      }
      IN  MIR-BAS-CHG-UPDT-CALC-T
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ For policy conditions update calculation";
      }
      IN  MIR-BAS-CHG-INFO-IND
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Policy information bit";
      }
      IN  MIR-BAS-CHG-SURR-CHG-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Applicable date for early surrender charge";
      }
      IN  MIR-BAS-CHG-SURR-MVMT-CD
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Applicable movement code for early surrender charge";
      }
      IN  MIR-BAS-CHG-DP1
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ１";
      }
      IN  MIR-BAS-CHG-DP2
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ２";
      }
      IN  MIR-BAS-CHG-D2P1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "2nd ΔＰ１";
      }
      IN  MIR-BAS-CHG-D2P2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "2nd ΔＰ２";
      }
      IN  MIR-BAS-CHG-DV1
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ１";
      }
      IN  MIR-BAS-CHG-DV2
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ２";
      }
      IN  MIR-BAS-CHG-NTFR-BAL-U
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Conversion, not transferred balance (U)";
      }
      IN  MIR-BAS-CHG-RES-PER-U
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Conversion residual period (U)";
      }
      IN  MIR-BAS-CHG-NTFR-BAL-U0
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Conversion, not transferred balance (U0)";
      }
      IN  MIR-BAS-CHG-RES-PER-U0
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Conversion residual period (U0)";
      }
      IN  MIR-BAS-CHG-LIEN-RT
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate ";
      }
      IN  MIR-BAS-CHG-PREPAY-DT
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Prepayment completion date (year, month) at the time of conditions change";
      }
      IN  MIR-BAS-CHG-SSTD-PREM-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Substandard premium 1";
      }
      IN  MIR-BAS-CHG-SSTD-PREM-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Substandard premium 2";
      }
      IN  MIR-BAS-CHG-MED-RDR-S-RT
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Medical rider S rate";
      }
      IN  MIR-RDR-CHG-PLAN-CD-1
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (1)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-1
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider G-no.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-1
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Position within the group";
      }
      IN  MIR-RDR-CHG-DP1
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ１（±）";
      }
      IN  MIR-RDR-CHG-DP2
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ２（±）";
      }
      IN  MIR-RDR-CHG-D2P1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "2nd ΔＰ１";
      }
      IN  MIR-RDR-CHG-D2P2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "2nd ΔＰ２";
      }
      IN  MIR-RDR-CHG-DV1
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ１（±）";
      }
      IN  MIR-RDR-CHG-DV2
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ２（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-1
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-1
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-1
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation";
      }
      IN  MIR-RDR-CHG-PLAN-CD-2
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (2)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-2
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Group -no.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-2
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "In-group position ";
      }
      IN  MIR-RDR-CHG-DP3
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ３（±）";
      }
      IN  MIR-RDR-CHG-DP4
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ４（±）";
      }
      IN  MIR-RDR-CHG-D2P3
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "2nd  ΔＰ３（±）";
      }
      IN  MIR-RDR-CHG-D2P4
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "2nd ΔＰ４（±）";
      }
      IN  MIR-RDR-CHG-DV3
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ３（±）";
      }
      IN  MIR-RDR-CHG-DV4
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ４（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-2
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-2
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-2
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation";
      }
      IN  MIR-RDR-CHG-PLAN-CD-3
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (3)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-3
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider G-no.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-3
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "In-group position ";
      }
      IN  MIR-RDR-CHG-DP5
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ５（±）";
      }
      IN  MIR-RDR-CHG-DP6
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ６（±）";
      }
      IN  MIR-RDR-CHG-D2P5
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ５（±）";
      }
      IN  MIR-RDR-CHG-D2P6
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ６（±）";
      }
      IN  MIR-RDR-CHG-DV5
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ５（±）";
      }
      IN  MIR-RDR-CHG-DV6
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ６（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-3
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate ";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-3
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-3
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation";
      }
      IN  MIR-RDR-CHG-PLAN-CD-4
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (4)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-4
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider g-no.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-4
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "In-group position ";
      }
      IN  MIR-RDR-CHG-DP7
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ７（±）";
      }
      IN  MIR-RDR-CHG-DP8
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ８（±）";
      }
      IN  MIR-RDR-CHG-D2P7
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ７（±）";
      }
      IN  MIR-RDR-CHG-D2P8
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ８（±）";
      }
      IN  MIR-RDR-CHG-DV7
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ７（±）";
      }
      IN  MIR-RDR-CHG-DV8
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ８（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-4
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-4
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-4
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation";
      }
      IN  MIR-RDR-CHG-PLAN-CD-5
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (5)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-5
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider G-no.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-5
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "In-group position ";
      }
      IN  MIR-RDR-CHG-DP9
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ９（±）";
      }
      IN  MIR-RDR-CHG-DP10
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ１０（±）";
      }
      IN  MIR-RDR-CHG-D2P9
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ９（±）";
      }
      IN  MIR-RDR-CHG-D2P10
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ１０（±）";
      }
      IN  MIR-RDR-CHG-DV9
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ９（±）";
      }
      IN  MIR-RDR-CHG-DV10
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ１０（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-5
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-5
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-5
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation";
      }
      IN  MIR-RDR-CHG-PLAN-CD-6
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (6)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-6
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider G-No.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-6
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "In-group position";
      }
      IN  MIR-RDR-CHG-DP11
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ１１（±）";
      }
      IN  MIR-RDR-CHG-DP12
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ１２（±）";
      }
      IN  MIR-RDR-CHG-D2P11
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ１１（±）";
      }
      IN  MIR-RDR-CHG-D2P12
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ１２（±）";
      }
      IN  MIR-RDR-CHG-DV11
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ１１（±）";
      }
      IN  MIR-RDR-CHG-DV12
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ１２（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-6
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-6
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-6
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation";
      }
      IN  MIR-RDR-CHG-PLAN-CD-7
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (7)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-7
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider G-No.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-7
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "In-group position";
      }
      IN  MIR-RDR-CHG-DP13
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ１３（±）";
      }
      IN  MIR-RDR-CHG-DP14
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ１４（±）";
      }
      IN  MIR-RDR-CHG-D2P13
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ１３（±）";
      }
      IN  MIR-RDR-CHG-D2P14
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ１４（±）";
      }
      IN  MIR-RDR-CHG-DV13
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ１３（±）";
      }
      IN  MIR-RDR-CHG-DV14
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ１４（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-7
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-7
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-7
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation";
      }
      IN  MIR-RDR-CHG-PLAN-CD-8
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (8)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-8
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider G-No.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-8
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "In-group position ";
      }
      IN  MIR-RDR-CHG-DP15
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ１５（±）";
      }
      IN  MIR-RDR-CHG-DP16
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ１６（±）";
      }
      IN  MIR-RDR-CHG-D2P15
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ１５（±）";
      }
      IN  MIR-RDR-CHG-D2P16
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ１６（±）";
      }
      IN  MIR-RDR-CHG-DV15
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ１５（±）";
      }
      IN  MIR-RDR-CHG-DV16
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ１６（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-8
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-8
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-8
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation";
      }
      IN  MIR-RDR-CHG-PLAN-CD-9
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (9)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-9
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider G-No.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-9
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "In-group position";
      }
      IN  MIR-RDR-CHG-DP17
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ１７（±）";
      }
      IN  MIR-RDR-CHG-DP18
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ１８（±）";
      }
      IN  MIR-RDR-CHG-D2P17
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ１７（±）";
      }
      IN  MIR-RDR-CHG-D2P18
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ１８（±）";
      }
      IN  MIR-RDR-CHG-DV17
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ１７（±）";
      }
      IN  MIR-RDR-CHG-DV18
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ１８（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-9
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate ";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-9
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-9
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation ";
      }
      IN  MIR-RDR-CHG-PLAN-CD-10
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (10)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-10
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider G-No.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-10
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "In-group position";
      }
      IN  MIR-RDR-CHG-DP19
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ１９（±）";
      }
      IN  MIR-RDR-CHG-DP20
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ２０（±）";
      }
      IN  MIR-RDR-CHG-D2P19
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ１９（±）";
      }
      IN  MIR-RDR-CHG-D2P20
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ２０（±）";
      }
      IN  MIR-RDR-CHG-DV19
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ１９（±）";
      }
      IN  MIR-RDR-CHG-DV20
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ２０（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-10
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate ";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-10
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-10
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation";
      }
      IN  MIR-RDR-CHG-PLAN-CD-11
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (11)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-11
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider G-No.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-11
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "In-group position";
      }
      IN  MIR-RDR-CHG-DP21
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ２１（±）";
      }
      IN  MIR-RDR-CHG-DP22
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ２２（±）";
      }
      IN  MIR-RDR-CHG-D2P21
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ２１（±）";
      }
      IN  MIR-RDR-CHG-D2P22
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ２２（±）";
      }
      IN  MIR-RDR-CHG-DV21
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ２１（±）";
      }
      IN  MIR-RDR-CHG-DV22
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ２２（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-11
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-11
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-11
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation";
      }
      IN  MIR-RDR-CHG-PLAN-CD-12
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (12)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-12
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider G-No.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-12
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "In-group position";
      }
      IN  MIR-RDR-CHG-DP23
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ２３（±）";
      }
      IN  MIR-RDR-CHG-DP24
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ２４（±）";
      }
      IN  MIR-RDR-CHG-D2P23
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ２３（±）";
      }
      IN  MIR-RDR-CHG-D2P24
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ２４（±）";
      }
      IN  MIR-RDR-CHG-DV23
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ２３（±）";
      }
      IN  MIR-RDR-CHG-DV24
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ２４（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-12
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate ";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-12
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-12
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation";
      }
      IN  MIR-RDR-CHG-PLAN-CD-13
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (13)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-13
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider G-No.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-13
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "In-group position";
      }
      IN  MIR-RDR-CHG-DP25
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ２５（±）";
      }
      IN  MIR-RDR-CHG-DP26
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ２６（±）";
      }
      IN  MIR-RDR-CHG-D2P25
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ２５（±）";
      }
      IN  MIR-RDR-CHG-D2P26
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ２６（±）";
      }
      IN  MIR-RDR-CHG-DV25
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ２５（±）";
      }
      IN  MIR-RDR-CHG-DV26
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ２６（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-13
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate ";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-13
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-13
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation ";
      }
      IN  MIR-RDR-CHG-PLAN-CD-14
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (14)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-14
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider G-No.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-14
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "In-group position ";
      }
      IN  MIR-RDR-CHG-DP27
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ２７（±）";
      }
      IN  MIR-RDR-CHG-DP28
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ２８（±）";
      }
      IN  MIR-RDR-CHG-D2P27
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ２７（±）";
      }
      IN  MIR-RDR-CHG-D2P28
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ２８（±）";
      }
      IN  MIR-RDR-CHG-DV27
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ２７（±）";
      }
      IN  MIR-RDR-CHG-DV28
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ２８（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-14
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-14
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-14
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation ";
      }
      IN  MIR-RDR-CHG-PLAN-CD-15
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider code (15)";
      }
      IN  MIR-RDR-CHG-GRP-NUM-15
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Rider G-No.";
      }
      IN  MIR-RDR-CHG-SEQ-NUM-15
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "In-group position";
      }
      IN  MIR-RDR-CHG-DP29
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ２９（±）";
      }
      IN  MIR-RDR-CHG-DP30
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＰ３０（±）";
      }
      IN  MIR-RDR-CHG-D2P29
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ２９（±）";
      }
      IN  MIR-RDR-CHG-D2P30
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Second ΔＰ３０（±）";
      }
      IN  MIR-RDR-CHG-DV29
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ２９（±）";
      }
      IN  MIR-RDR-CHG-DV30
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "ΔＶ３０（±）";
      }
      IN  MIR-RDR-CHG-LIEN-RT-15
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Lien rate";
      }
      IN  MIR-RDR-CHG-SSTD-PREM-15
      {
          DisplayOnly;
          Length = "9";
          SType = "Text";
          Label = "Substandard premium";
      }
      IN  MIR-RDR-CHG-UP-CALC-T-15
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "ｔθ for calculation";
      }
      IN  MIR-BAS-UP-DEP-CTL
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Deposit CTL";
      }
      IN  MIR-BAS-UP-DEP-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Deposit date (Year, month, day)";
      }
      IN  MIR-BAS-UP-S2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Base policy S2";
      }
      IN  MIR-BAS-UP-P1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Base policy P1";
      }
      IN  MIR-BAS-UP-RDR-TOT-PREM
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Bank rider specific month total premium";
      }
      IN  MIR-BAS-UP-OP-RDR
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "IN patient rider";
      }
      IN  MIR-BAS-UP-OP-RDR-DL-BEN
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "IN patient rider daily benefit";
      }
      IN  MIR-BAS-UP-OP-RDR-P
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "IN patient rider P";
      }
      IN  MIR-BAS-UP-INJ-RDR-CD
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Injury rider code";
      }
      IN  MIR-BAS-UP-INJ-RDR-S
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Injury rider S";
      }
      IN  MIR-BAS-UP-INJ-RDR-P
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Injury rider P";
      }
      IN  MIR-BAS-UP-FAM-RDR-CD
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Family medical rider code";
      }
      IN  MIR-BAS-UP-FAM-RDR-BEN
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Family medical rider daily benefit";
      }
      IN  MIR-BAS-UP-FAM-RDR-P
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Family medical rider P";
      }
      IN  MIR-BAS-UP-ACR-CD
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Accident coverage rider code";
      }
      IN  MIR-BAS-UP-ACR-S
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Accident coverage rider basic S";
      }
      IN  MIR-BAS-UP-ACR-P
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Accident coverage rider P";
      }
      IN  MIR-BAS-UP-AR-CD
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Accident rider code";
      }
      IN  MIR-BAS-UP-AR-S
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Accident rider S";
      }
      IN  MIR-BAS-UP-AR-P
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Accident rider P";
      }
      IN  MIR-BAS-UP-ADB-CD
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Accidental death rider code";
      }
      IN  MIR-BAS-UP-ADB-S
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Accidental death rider S";
      }
      IN  MIR-BAS-UP-ADB-P
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Accidental death rider P";
      }
      IN  MIR-BAS-UP-TAR-CD
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Traffic accident rider code";
      }
      IN  MIR-BAS-UP-TAR-S
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Traffic accident rider basic S";
      }
      IN  MIR-BAS-UP-TAR-P
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Traffic accident rider P";
      }
      IN  MIR-BAS-UP-TMR-CD
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Total medical rider code";
      }
      IN  MIR-BAS-UP-TMR-S
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Total medical rider basic S";
      }
      IN  MIR-BAS-UP-TMR-P
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Total medical rider P";
      }
      IN  MIR-BAS-UP-ADR-CD
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Adult disease rider code";
      }
      IN  MIR-BAS-UP-ADR-BEN
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Adult disease rider daily benefit";
      }
      IN  MIR-BAS-UP-ADR-P
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Adult diseases rider P";
      }
      IN  MIR-BAS-UP-ADH-CD
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Adult diseases hospitalization rider code";
      }
      IN  MIR-BAS-UP-ADH-BEN
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Adult disease hospitalization rider daily benefit";
      }
      IN  MIR-BAS-UP-ADH-P
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Adult disease hospitalization rider P";
      }
      IN  MIR-BAS-UP-AHR-CD
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Accident hospitalization rider code";
      }
      IN  MIR-BAS-UP-AHR-AMT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Accident hospitalization rider daily amount ";
      }
      IN  MIR-BAS-UP-AHR-P
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Accident hospitalization rider P";
      }
      IN  MIR-ANTY-CHG-BASE-AMT-90
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Base annuity amount (90%)";
      }
      IN  MIR-ANTY-CHG-RSC-90
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Annuity resources (90%)";
      }
      IN  MIR-ANTY-CHG-DPAY-BAS-90
      {
          DisplayOnly;
          Length = "5";
          SType = "Text";
          Label = "Down payment base annuity amount (90%)";
      }
      IN  MIR-ANTY-CHG-DPAY-RSC-90
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Down payment annuity resources (90%)";
      }
      IN  MIR-ANTY-CHG-APU-BAS-90
      {
          DisplayOnly;
          Length = "5";
          SType = "Text";
          Label = "Base annuity amount after paid-up (90%)";
      }
      IN  MIR-ANTY-CHG-APU-RSC-90
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Annuity resources after paid-up (90%)";
      }
      IN  MIR-ANTY-CHG-RDR-BAS-90
      {
          DisplayOnly;
          Length = "5";
          SType = "Text";
          Label = "Rider base annuity amount (90%)";
      }
      IN  MIR-ANTY-CHG-RDR-RSC-90
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Rider annuity resources (90%)";
      }
      IN  MIR-ANTY-CHG-DV-90
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "ΔＶ(90%)";
      }
      IN  MIR-ANTY-CHG-CNV-BAL-U
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Base policy conversion, not transferred balance (U)";
      }
      IN  MIR-ANTY-CHG-TOT-PRE-BAL
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Total prepayment balance";
      }
      IN  MIR-ANTY-CHG-IND-PRE-BAL
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Individual annuity prepayment balance";
      }
      IN  MIR-ANTY-CHG-ACC-DOD
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Accumulated dividends on deposit";
      }
      IN  MIR-ANTY-CHG-ACC-INT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Accumulated interest on deposit ";
      }
      IN  MIR-ANTY-CHG-ACC-REG-DEP
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Accumulated destination registered deposits";
      }
      IN  MIR-ANTY-CHG-ACC-REG-INT
      {
          DisplayOnly;
          Length = "7";
          SType = "Text";
          Label = "Accumulated destination registered interest on deposits";
      }
      IN  MIR-ANTY-CHG-LAPS-YM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Elapsed years and months at the time of conditions change";
      }
      IN  MIR-NCB-PMT-CHGBK-CTL
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Payment, charge back control";
      }
      IN  MIR-NCB-PMT-CHGBK-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment (charge back) date (year, month, day)";
      }
      IN  MIR-NCB-PMT-CHBK-AMT
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Payment (charge back) amount";
      }
      IN  MIR-NCB-ACCUM-OS-AMT
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Accumulated IN standing amount";
      }
      IN  MIR-SBP-PMT-CHGBK-ACUAMT
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Payment, charge back amount accumulation";
      }
      IN  MIR-SBP-CTL-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control (1)";
      }
      IN  MIR-SBP-PMT-CHGBK-AMT-1
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Payment, charge back amount total";
      }
      IN  MIR-SBP-PMT-CHGBK-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment. charge back date (Year, month, day)";
      }
      IN  MIR-SBP-PMT-BASE-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Base date (year, month, day) for payment";
      }
      IN  MIR-SBP-BRCH-CD-1
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office";
      }
      IN  MIR-SBP-CTL-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control (2)";
      }
      IN  MIR-SBP-PMT-CHGBK-AMT-2
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Payment, charge back amount total";
      }
      IN  MIR-SBP-PMT-CHGBK-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment. charge back date (Year, month, day)";
      }
      IN  MIR-SBP-PMT-BASE-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Base date (year, month, day) for payment";
      }
      IN  MIR-SBP-BRCH-CD-2
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office";
      }
      IN  MIR-SBP-CTL-3
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control (3)";
      }
      IN  MIR-SBP-PMT-CHGBK-AMT-3
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Payment, charge back amount total";
      }
      IN  MIR-SBP-PMT-CHGBK-DT-3
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment. charge back date (Year, month, day)";
      }
      IN  MIR-SBP-PMT-BASE-DT-3
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Base date (year, month, day) for payment";
      }
      IN  MIR-SBP-BRCH-CD-3
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office";
      }
      IN  MIR-SBP-CTL-4
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control (4)";
      }
      IN  MIR-SBP-PMT-CHGBK-AMT-4
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Payment, charge back amount total";
      }
      IN  MIR-SBP-PMT-CHGBK-DT-4
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment. charge back date (Year, month, day)";
      }
      IN  MIR-SBP-PMT-BASE-DT-4
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Base date (year, month, day) for payment";
      }
      IN  MIR-SBP-BRCH-CD-4
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office";
      }
      IN  MIR-SBP-CTL-5
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control (5)";
      }
      IN  MIR-SBP-PMT-CHGBK-AMT-5
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Payment, charge back amount total";
      }
      IN  MIR-SBP-PMT-CHGBK-DT-5
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Payment. charge back date (Year, month, day)";
      }
      IN  MIR-SBP-PMT-BASE-DT-5
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Base date (year, month, day) for payment";
      }
      IN  MIR-SBP-BRCH-CD-5
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Handling branch office";
      }
      IN  MIR-BAS-UP-SOL-BRCH-CD
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Soliciting branch office at the time of base policy update ";
      }
      IN  MIR-BAS-UP-WAGT-CD
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Writing agent at the time of base policy update";
      }
      IN  MIR-BAS-UP-CMN-WAGT-CD
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Common writing agent at the time of base policy update";
      }
      IN  MIR-BAS-UP-PREM-WV-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Policy date (Year, month, day) at the time of premium waiver ";
      }
      IN  MIR-BAS-UP-PREM-WV-DURYM
      {
          DisplayOnly;
          Length = "6";
          SType = "Text";
          Label = "Elapsed years and months at the time of premium waiver";
      }
      IN  MIR-BNFT-PMT-DT
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Benefit payment event year/month/date";
      }
      IN  MIR-XFER-BUS-CD-1
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Business Code(1) ";
      }
      IN  MIR-XFER-CTL-RFLCTD-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Already reflected(1) ";
      }
      IN  MIR-XFER-CTL-REMIT-PRCES-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Remittance processing(1) ";
      }
      IN  MIR-XFER-CTL-PREV-REMIT-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Remittance already done(1) ";
      }
      IN  MIR-XFER-CTL-FA-DEFR-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Face amount deferral(1) ";
      }
      IN  MIR-XFER-CTL-FA-DEFR-PMT1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Face amount deferral payment(1) ";
      }
      IN  MIR-XFER-CTL-TRXN-INFO-IND1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Transaction information available or not(1) ";
      }
      IN  MIR-XFER-OPER-KEY-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Operator KEY(1) ";
      }
      IN  MIR-XFER-PRCES-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Process year/month/date(1) ";
      }
      IN  MIR-XFER-XPRY-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Expiry Date(1) ";
      }
      IN  MIR-XFER-NET-FIN-VALU-1
      {
          DisplayOnly;
          Length = "11";
          SType = "Text";
          Label = "Net financial value(1) ";
      }
      IN  MIR-XFER-REMIT-SERL-NUM1
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Remittance acceptance serial number(1) ";
      }
      IN  MIR-XFER-BUS-CD-2
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Business Code(2) ";
      }
      IN  MIR-XFER-CTL-RFLCTD-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Already reflected(2) ";
      }
      IN  MIR-XFER-CTL-REMIT-PRCES-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Remittance processing(2) ";
      }
      IN  MIR-XFER-CTL-PREV-REMIT-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Remittance done(2) ";
      }
      IN  MIR-XFER-CTL-FA-DEFR-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Face amount deferral(2) ";
      }
      IN  MIR-XFER-CTL-FA-DEFR-PMT2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Face amount deferral payment(2) ";
      }
      IN  MIR-XFER-CTL-TRXN-INFO-IND2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Transaction information available or not(2) ";
      }
      IN  MIR-XFER-OPER-KEY-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Operator KEY(2) ";
      }
      IN  MIR-XFER-PRCES-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Process year/month/date(2) ";
      }
      IN  MIR-XFER-XPRY-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Expiry Date(2) ";
      }
      IN  MIR-XFER-NET-FIN-VALU-2
      {
          DisplayOnly;
          Length = "11";
          SType = "Text";
          Label = "Net financial value(2) ";
      }
      IN  MIR-XFER-REMIT-SERL-NUM2
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Remittance acceptance serial number(2) ";
      }
      IN  MIR-LOAN-ADDR-REQIR-IND-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Loan address not required BIT(1)";
      }
      IN  MIR-LOAN-SHR-NUM-1
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Shared Number(1)";
      }
      IN  MIR-LOAN-CURR-BAL-1
      {
          DisplayOnly;
          Length = "11";
          SType = "Text";
          Label = "Current loan balance(1)";
      }
      IN  MIR-LOAN-XCES-SHRT-INT-1
      {
          DisplayOnly;
          Length = "11";
          SType = "Text";
          Label = "Excess/Short Interest(1)";
      }
      IN  MIR-LOAN-INT-RT-1
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Loan interest rate(1)";
      }
      IN  MIR-LOAN-INT-EFF-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Interest effective year/month/date(1)";
      }
      IN  MIR-LOAN-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Loan date year/month/date(1)";
      }
      IN  MIR-LOAN-REPAY-DUE-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Repayment due date(1)";
      }
      IN  MIR-LOAN-INT-CALC-CAT-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Interest calculation category(1)";
      }
      IN  MIR-LOAN-BUS-CD-1
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Business Code(1)";
      }
      IN  MIR-LOAN-CTL-RFLCTD-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Already reflected(1)";
      }
      IN  MIR-LOAN-CTL-REMIT-PRCES-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Remittance mode(1)";
      }
      IN  MIR-LOAN-CTL-PREV-REMIT-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Remittance(1)";
      }
      IN  MIR-LOAN-OPER-KEY-1
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Operator KEY(1)";
      }
      IN  MIR-LOAN-PRCES-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Process year/month/date(1)";
      }
      IN  MIR-LOAN-XPRY-DT-1
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Expiry Date(1)";
      }
      IN  MIR-LOAN-NET-FIN-VALU-1
      {
          DisplayOnly;
          Length = "11";
          SType = "Text";
          Label = "Net financial value(1)";
      }
      IN  MIR-LOAN-REMIT-SERL-NUM1
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Remittance acceptance serial number(1)";
      }
      IN  MIR-LOAN-ADDR-REQIR-IND-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Loan address not required BIT(2) ";
      }
      IN  MIR-LOAN-SHR-NUM-2
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Shared Number(2) ";
      }
      IN  MIR-LOAN-CURR-BAL-2
      {
          DisplayOnly;
          Length = "11";
          SType = "Text";
          Label = "Current loan balance(2) ";
      }
      IN  MIR-LOAN-XCES-SHRT-INT-2
      {
          DisplayOnly;
          Length = "11";
          SType = "Text";
          Label = "Excess/Short Interest(2) ";
      }
      IN  MIR-LOAN-INT-RT-2
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Loan interest rate(2) ";
      }
      IN  MIR-LOAN-INT-EFF-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Interest effective year/month/date(2) ";
      }
      IN  MIR-LOAN-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Loan year/month/date(2) ";
      }
      IN  MIR-LOAN-REPAY-DUE-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Repayment due date(2) ";
      }
      IN  MIR-LOAN-INT-CALC-CAT-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Interest calculation category(2) ";
      }
      IN  MIR-LOAN-BUS-CD-2
      {
          DisplayOnly;
          Length = "3";
          SType = "Text";
          Label = "Business Code(2) ";
      }
      IN  MIR-LOAN-CTL-RFLCTD-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Already reflected(2) ";
      }
      IN  MIR-LOAN-CTL-REMIT-PRCES-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Remittance mode(2) ";
      }
      IN  MIR-LOAN-CTL-PREV-REMIT-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Control/Remittance(2) ";
      }
      IN  MIR-LOAN-OPER-KEY-2
      {
          DisplayOnly;
          Length = "1";
          SType = "Text";
          Label = "Operator KEY(2) ";
      }
      IN  MIR-LOAN-PRCES-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Process year/month/date(2) ";
      }
      IN  MIR-LOAN-XPRY-DT-2
      {
          DisplayOnly;
          Length = "8";
          SType = "Text";
          Label = "Expiry Date(2) ";
      }
      IN  MIR-LOAN-NET-FIN-VALU-2
      {
          DisplayOnly;
          Length = "11";
          SType = "Text";
          Label = "Net financial value(2) ";
      }
      IN  MIR-LOAN-REMIT-SERL-NUM2
      {
          DisplayOnly;
          Length = "10";
          SType = "Text";
          Label = "Remittance acceptance serial number(2) ";
      }
      IN MIR-ADD1-5-36-FLD-15   
      {
          Length = "1";
          SType = "Text";
          Label = "Additional Survivor Benefit G";
      }
      IN MIR-ADD1-5-36-FLD-16
      {
          Length = "1";
          SType = "Text";
          Label = "Allocation Dividend G";
      }
      IN MIR-ADD1-5-36-FLD-17   
      {
          Length = "1";
          SType = "Text";
          Label = "Offset G";
      }
      IN MIR-ADD1-5-36-FLD-18    
      {
          Length = "1";
          SType = "Text";
          Label = "Deposit Dividend G";
      }
      IN MIR-ADD1-5-36-FLD-19   
      {
          Length = "1";
          SType = "Text";
          Label = "Accumulation G";
      }
      IN MIR-ADD1-5-36-FLD-20    
      {
          Length = "1";
          SType = "Text";
          Label = "Vesting G";
      }
      IN MIR-ADD1-5-36-FLD-21   
      {
          Length = "1";
          SType = "Text";
          Label = "Congratulatory Benefit for Entrance of School";
      }
      IN MIR-ADD1-5-36-FLD-29   
      {
          Length = "1";
          SType = "Text";
          Label = "Annuity (1) G";
      }
      IN MIR-ADD2-0-35-FLD-1
      {
          Length = "1";
          SType = "Text";
          Label = "Change Part (1)";
      }
      IN MIR-ADD2-0-35-FLD-3
      {
          Length = "1";
          SType = "Text";
          Label = "Loan Part (1)";
      }
      IN MIR-ADD2-0-35-FLD-4
      {
          Length = "1";
          SType = "Text";
          Label = "Loan Part (2)";
      }
      IN MIR-ADD2-0-35-FLD-11
      {
          Length = "1";
          SType = "Text";
          Label = "Extension G";
      }
      IN MIR-ADD2-0-35-FLD-17
      {
          Length = "1";
          SType = "Text";
          Label = "Employee Insurance G";
      }
      IN MIR-ADD2-0-35-FLD-18
      {
          Length = "1";
          SType = "Text";
          Label = "Soft Product G";
      }
      IN MIR-ADD2-0-35-FLD-19
      {
          Length = "1";
          SType = "Text";
          Label = "F type Benefit Payout G";
      }
      IN MIR-ADD2-0-35-FLD-20
      {
          Length = "1";
          SType = "Text";
          Label = "Living Advance Premium G";
      }
      IN MIR-ADD2-0-35-FLD-21
      {
          Length = "1";
          SType = "Text";
          Label = "Saving Advance Premium G";
      }
      IN MIR-ADD2-0-35-FLD-26
      {
          Length = "1";
          SType = "Text";
          Label = "New Living Advance Premium G";
      }
      IN MIR-ADD2-0-35-FLD-29
      {
          Length = "1";
          SType = "Text";
          Label = "Change Part (2)";
      }
      IN MIR-ADD2-0-35-FLD-30
      {
          Length = "1";
          SType = "Text";
          Label = "Congratulatory Recovery Benefit G";
      }
      IN MIR-ADD2-0-35-FLD-31
      {
          Length = "1";
          SType = "Text";
          Label = "Smoking Information G";
      }
      IN MIR-ADD2-0-35-FLD-34
      {
          Length = "1";
          SType = "Text";
          Label = "Dividend Amount History G";
      }
      IN MIR-ADD3-0-35-FLD-2    
      {
          Length = "1";
          SType = "Text";
          Label = "Change of Dividend Payment Method G";
      }
      IN MIR-ADD3-0-35-FLD-3    
      {
          Length = "1";
          SType = "Text";
          Label = "Health Congratulatory Benefit Accumulation G";
      }
      IN MIR-ADD3-0-35-FLD-4    
      {
          Length = "1";
          SType = "Text";
          Label = "Health Congratulatory Benefit Payment G";
      }
      IN MIR-ADD3-0-35-FLD-5    
      {
          Length = "1";
          SType = "Text";
          Label = "Health Congratulatory Benefit Payment History G";
      }
      IN MIR-ADD3-0-35-FLD-6   
      {
          Length = "1";
          SType = "Text";
          Label = "Vesting G";
      }
      IN MIR-ADD3-0-35-FLD-8    
      {
          Length = "1";
          SType = "Text";
          Label = "Set Policy Sales G";
      }
      IN MIR-ADD3-0-35-FLD-9    
      {
          Length = "1";
          SType = "Text";
          Label = "Auto Extended Account G";
      }
      IN MIR-ADD3-0-35-FLD-21    
      {
          Length = "1";
          SType = "Text";
          Label = "Partial Exclusion G ";
      }
      IN MIR-ADD3-0-35-FLD-26    
      {
          Length = "1";
          SType = "Text";
          Label = "Eligible Rider Payout Accumulation G";
      }
      IN MIR-ADD3-0-35-FLD-31    
      {
          Length = "1";
          SType = "Text";
          Label = "Taxation of Tax Withheld G";
      }
      IN MIR-ADD3-0-35-FLD-33    
      {
          Length = "1";
          SType = "Text";
          Label = "21th Century Saving Bases G";
      }
      IN MIR-ADD3-0-35-FLD-35    
      {
           Length = "1";
           SType = "Text";
           Label = "Vesting Whole Life Benefit  G";
      }
      IN MIR-IND-3-35-FLD-1    
      {
          Length = "1";
          SType = "Text";
          Label = "Trail CommissionＧ";
      }
      IN MIR-IND-3-35-FLD-2    
      {
          Length = "1";
          SType = "Text";
          Label = "Whole Life Payment MaturityＧ";
      }
      IN MIR-IND-3-35-FLD-3    
      {
          Length = "1";
          SType = "Text";
          Label = "Whole Life Special DividendＧ";
      }
      IN MIR-IND-3-35-FLD-8    
      {
          Length = "1";
          SType = "Text";
          Label = "Deferral Survior Benefit DeferralＧ";
      }
      IN MIR-IND-3-35-FLD-9    
      {
          Length = "1";
          SType = "Text";
          Label = "SurvivorBenefit PaymentＧ";
      }
      IN MIR-IND-3-35-FLD-10    
      {
          Length = "1";
          SType = "Text";
          Label = "Survivor Benefit Payment HistoryＧ";
      }
      IN MIR-IND-3-35-FLD-11    
      {
          Length = "1";
          SType = "Text";
          Label = "Children Insurance BasicＧ";
      }
      IN MIR-IND-3-35-FLD-12    
      {
          Length = "1";
          SType = "Text";
          Label = "Deferral Congratulatory MoneyＧ";
      }
      IN MIR-IND-3-35-FLD-13    
      {
          Length = "1";
          SType = "Text";
          Label = "Congratulatory Money PaymentＧ";
      }
      IN MIR-IND-3-35-FLD-14   
      {
          Length = "1";
          SType = "Text";
          Label = "Congratulatory Money Payment HistoryＧ";
      }
      IN MIR-IND-3-35-FLD-17    
      {
          Length = "1";
          SType = "Text";
          Label = "Set Sales 2G";
      }
    IN MIR-ADD5-0-35-FLD-7
    {
        Length = "1";
        SType = "Text";
        Label = "Additional Survivor Benefit DeferralＧ";
    }
      IN MIR-ADD5-0-35-FLD-8       
      {
          Length = "1";
          SType = "Text";
          Label = "Deferral VestingＧ";
      }
      IN MIR-ADD5-0-35-FLD-9       
      {
          Length = "1";
          SType = "Text";
          Label = "Trail Commission for Interm AddiionＧ";
      }
      IN MIR-ADD5-0-35-FLD-10       
      {
          Length = "1";
          SType = "Text";
          Label = "Term Life Special Dividend AmountＧ";
      }
      IN MIR-ADD5-0-35-FLD-11       
      {
          Length = "1";
          SType = "Text";
          Label = "Deferral Special Dividend Ｇ";
      }
      IN MIR-ADD5-0-35-FLD-20       
      {
          Length = "1";
          SType = "Text";
          Label = "Allocation G:";
      }
      IN MIR-ADD5-0-35-FLD-21       
      {
          Length = "1";
          SType = "Text";
          Label = "Rider Update Info.Ｇ";
      }
      IN MIR-ADD5-0-35-FLD-23       
      {
          Length = "1";
          SType = "Text";
          Label = "Application Form ManagementＧ";
      }
      IN MIR-ADD5-0-35-FLD-28       
      {
          Length = "1";
          SType = "Text";
          Label = "Cancer Check-up Lump Sum maountＧ";
      }
      IN MIR-ADD5-0-35-FLD-31       
      {
          Length = "1";
          SType = "Text";
          Label = "Saving RiderＧ";
      }
      IN MIR-ADD5-0-35-FLD-32       
      {
          Length = "1";
          SType = "Text";
          Label = "Policy Provision Change BasicＧ";
      }
      IN MIR-ADD5-0-35-FLD-33       
      {
          Length = "1";
          SType = "Text";
          Label = "Policy Provision Change RiderＧ";
      }
      IN MIR-ADD5-0-35-FLD-34       
      {
          Length = "1";
          SType = "Text";
          Label = "Base Policy Info at UpdateＧ";
      }
      IN MIR-ADD5-0-35-FLD-35       
      {
          Length = "1";
          SType = "Text";
          Label = "Policy Provision Change AnnuityＧ";
      }
      IN MIR-ADD6-0-24-FLD-1
      {
          Length = "1";
          SType = "Text";
          Label = "No-Accident Benefit Payment G";
      }
      IN MIR-ADD6-0-24-FLD-12
      {
          Length = "1";
          SType = "Text";
          Label = "Living Benefit Payout History G";
      }
      IN MIR-ADD6-0-24-FLD-23
      {
          Length = "1";
          SType = "Text";
          Label = "Base Policy Information at Renewal G";
      }
      IN MIR-ADD6-26-35-FLD-2
      {
          Length = "1";
          SType = "Text";
          Label = "異動情報２Ｇ";
      }
}