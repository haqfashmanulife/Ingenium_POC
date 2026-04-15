# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF9H35-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYDM28   CTS      INITIAL VERSION OF UNISYS POLICY INQUIRY SCREEN        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9H35-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9H35";
        BusinessFunctionName = "Unisys Policy Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9H35";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TU3P2";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-LARG-TYP
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Large Type Code";
    }    
    OUT MIR-POL-INFO-CTL
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy information: Present or not CTL";
    }
    OUT MIR-BENE-INFO-CTL
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefit information: present or not CTL";
    }
    OUT MIR-CNVR-INFO-CTL
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion information: present or not CTL";
    }
    OUT MIR-MAT-PREM-BENE-NM
    { 
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maturity premium beneficiary";
    }
    OUT MIR-PUA-DIV-UNIT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Paid-up addition dividend";
    }
    OUT MIR-NEW-PUA-PREM-AMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "New paid-up addition pure endowment premium";
    }
    OUT MIR-NEW-PUA-APREM-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "New accumulated paid-up addition pure endowment premium";
    }
    OUT MIR-NEW-PUA-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "New paid-up addition date (year, month)";
    }

    OUT MIR-OLD-PUA-PREM-AMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Old paid-up addition pure endowment premium";
    }
    OUT MIR-OLD-PUA-APREM-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Old accumulated paid-up addition pure endowment premium";
    }
    OUT MIR-OLD-PUA-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Old paid-up addition date (year, month)";
    }
    OUT MIR-NO-PUA-STRT-YM 
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "No-paid up addition start date (year, month)";
    }
    OUT MIR-PUA-EXP-DIV-AMT 
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Paid-up addition expected dividend";
    }
    OUT MIR-DIV-NEW-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New dividend control";
    }
    OUT MIR-DIV-NEW-ALLOC-YR 
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "New allocated dividend year";
    }
    OUT MIR-DIV-NEW-CALC-YR 
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "New dividend calculation year";
    }
    OUT MIR-DIV-NEW-ALLOC-AMT 
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "New allocated dividend ";
    }
    OUT MIR-DIV-NEW-ADJ-AMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "New dividend adjustment";
    }
    OUT MIR-DIV-OLD-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Old dividend control";
    }
    OUT MIR-DIV-OLD-ALLOC-YR 
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Old allocated dividend year";
    }
    OUT MIR-DIV-OLD-CALC-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Old Dividend calculation year";
    }
    OUT MIR-DIV-OLD-ALLOC-AMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Old allocated dividend ";
    }
    OUT MIR-DIV-OLD-ADJ-AMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Old dividend adjustment";
    }
    OUT MIR-OFFSET-CURR-PMT-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Current year payment year";
    }
    OUT MIR-OFFSET-PMT-DIV-AMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Current year payment dividend";
    }
    OUT MIR-OFFSET-PMT-FINAL-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Dividend payment final year";
    }
    OUT MIR-OFFSET-PMT-FINAL-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Dividend payment final date (year, month)";
    }
    OUT MIR-OFFSET-DIV-EXDF 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Dividend excess and deficiency";
    }
    OUT MIR-OFFSET-ACCUM-DIV-AMT      
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Payment dividend accumulated";
    }
    OUT MIR-CUST-DIV-DT       
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Custody date";
    }
    OUT MIR-CUST-DIV-AMT        
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Custody dividend accumulation";
    }
    OUT MIR-CUST-DIV-INT-AMT         
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Custody interest accumulation ";
    }
    OUT MIR-CUST-FINAL-YR         
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Custody final year";
    }
    OUT MIR-DPOS-DIV-AMT        
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Deposit dividend accumulation";
    }
    OUT MIR-DPOL-DIV-INT-AMT        
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Deposit interest accumulation";
    }
    OUT MIR-PUA-DIV-ACCUM-AMT         
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Paid-up addition dividend";
    }
    OUT MIR-PUA-NEW-DIV-AMT         
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "New paid-up addition dividend";
    }
    OUT MIR-PUA-NEW-DIV-YM         
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "New paid-up addition date (year. month)";
    }
    OUT MIR-PUA-PREV-DIV-AMT         
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Old paid-up addition premium";
    }
    OUT MIR-PUA-PREV-DIV-YM          
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Old paid-up addition date (year,month)";
    }
    OUT MIR-PUA-ADD-PLAN-DIV-AMT        
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Paid-up addition planned dividend";
    }
    OUT MIR-CM-PMT-YR-5-IND          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Congratulatory money payment status・5 years 10months payment part";
    }
    OUT MIR-CM-PMT-YR-11-IND          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Congratulatory money payment status・11years”";
    }
    OUT MIR-CM-PMT-YR-14-IND          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Congratulatory money payment status・14 years”";
    }
    OUT MIR-CM-PMT-YR-17-IND         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Congratulatory money payment status・17 years”";
    }
    OUT MIR-CM-PMT-COUNT         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "No. of congratulatory money payment advent";
    }
    OUT MIR-CM-PMT-ACCUM-AMT          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Congratulatory money payment value accumulation";
    }
    OUT MIR-CM-YPMT-FINAL-DT           
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Congratulatory money payment final date (Year, month, date)";
    }
    OUT MIR-ANTY-MODEL          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity model";
    }
    OUT MIR-ANTY-DUR           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Annuity period";
    }
    OUT MIR-ANTY-GUAR-DUR           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Annuity guarentee period";
    }
    OUT MIR-ANTY-POST-PAYUP-AMT          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Basic annuity value after paying up";
    }
    OUT MIR-ANTY-PREM-APL          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Premium subject to APL";
    }
    OUT MIR-ANTY-DISAB-BNFT-CD           
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Disability benefit description classification";
    }
    OUT MIR-ANTY-TQL-RDR-ADD-DT       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Tax qualified rider addition date";
    }
    OUT MIR-ANTY-DOWN-PMT-S1-AMT      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Down payment S1 (Basic annuity value)";
    }
    OUT MIR-ANTY-DOWN-PMT-S2-AMT          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Down payment S2 (Annuity resources)";
    }
    OUT MIR-ANTY-TYP       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity type";
    }
    OUT MIR-EXTN-START-DT       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Extension start";
    }
    OUT MIR-EXTN-END-DT       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Extension end";
    }
    OUT MIR-EXTN-ENDW-DIV-AMT  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Pure endowment dividend";
    }
    OUT MIR-EXTN-RESOURCE  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Extension resource";
    }
    OUT MIR-EMP-INS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Internal, external control";
    }
    OUT MIR-EMP-COMP-CD  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "AffiliationM";
    }
    OUT MIR-EMP-EMPID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Employee ID";
    }
    OUT MIR-EMP-P1
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "P1";
    }
    OUT MIR-EMP-P2
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "P2";
    }
    OUT MIR-SPROD-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Soft products code";
    }
    OUT MIR-PREM-PMT-F
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "F type premium payment date";
    }
    OUT MIR-PADV-INT-CAP-DT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "residuals of prepaid premium Interest Capitalization date";
    }
    OUT MIR-PADV-INT-TOT-AMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Interest for prepayment total";
    }
    OUT MIR-PADV-ST-DT-1
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment start date (1)";
    }
    OUT MIR-PADV-DT-1
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment date (1)";
    }
    OUT MIR-PADV-DEP-FND-1
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Premium deposit funds (1)";
    }
    OUT MIR-PADV-CTRL-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Prepayment control (1)";
    }
    OUT MIR-PADV-INT-CAP-BS-DT-1
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest Capitalization base date (1)";
    }
    OUT MIR-PADV-UNEARNED-INT-1
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Unearned interest (1)";
    }
    OUT MIR-PADV-CAP-CTRL-IND-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interest capitalization necessity control (1)";
    }
    OUT MIR-PADV-DEP-YM-1
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Deposit year and month (1)";
    }
    OUT MIR-PADV-ST-DT-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment start date (2)";
    }
    OUT MIR-PADV-DT-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment year and month (2)";
    }
    OUT MIR-PADV-DEP-FND-2
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Premium deposit funds (2)";
    }
    OUT MIR-PADV-CTRL-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Prepayment control (2)";
    }
    OUT MIR-PADV-INT-CAP-BS-DT-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization base date (2)";
    }
    OUT MIR-PADV-UNEARNED-INT-2
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Unearned interest (2)";
    }
    OUT MIR-PADV-CAP-CTRL-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interest capitalization necessity control (2)";
    }
    OUT MIR-PADV-DEP-YM-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Deposit year and month (2)";
    }
    OUT MIR-PADV-ST-DT-3  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment start date (3)";
    }
    OUT MIR-PADV-DT-3  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment year and month (3)";
    }
    OUT MIR-PADV-DEP-FND-3  
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Premium deposit funds (3)";
    }
    OUT MIR-PADV-CTRL-3  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Prepayment control (3)";
    }
    OUT MIR-PADV-INT-CAP-BS-DT-3  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization base date (3)";
    }
    OUT MIR-PADV-UNEARNED-INT-3   
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Unearned interest (3)";
    }
    OUT MIR-PADV-CAP-CTRL-IND-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interest capitalization necessity control (3)";
    }
    OUT MIR-PADV-DEP-YM-3
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Deposit year and month (3)";
    }
    OUT MIR-PADV-ST-DT-4
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment start date (4)";
    }
    OUT MIR-PADV-DT-4
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment year and month (4)";
    }
    OUT MIR-PADV-DEP-FND-4
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Premium deposit funds (4)";
    }
    OUT MIR-PADV-CTRL-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Prepayment control (4)";
    }
    OUT MIR-PADV-INT-CAP-BS-DT-4
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization base date (4)";
    }
    OUT MIR-PADV-UNEARNED-INT-4 
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Unearned interest (4)";
    }
    OUT MIR-PADV-CAP-CTRL-IND-4 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interest capitalization necessity control (4)";
    }
    OUT MIR-PADV-DEP-YM-4 
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Deposit year and month (4)";
    }
    OUT MIR-PADV-ST-DT-5     
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment start date (5)";
    }
    OUT MIR-PADV-DT-5    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment year and month (5)";
    }
    OUT MIR-PADV-DEP-FND-5      
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Premium deposit funds (5)";
    }
    OUT MIR-PADV-CTRL-5    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Prepayment control (5)";
    }
    OUT MIR-PADV-INT-CAP-BS-DT-5  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization base date (5)";
    }
    OUT MIR-PADV-UNEARNED-INT-5   
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Unearned interest (5)";
    }
    OUT MIR-PADV-CAP-CTRL-IND-5   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interest capitalization necessity control (5)";
    }
    OUT MIR-PADV-DEP-YM-5 
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Deposit year and month (5)";
    }
    OUT MIR-SAV-PREPAY-ST-DT-1   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment start date (1)";
    }
    OUT MIR-SAV-PREPAY-FREQ-1    
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Prepayment frequency (1)";
    }
    OUT MIR-SAV-PREPAY-CTL-IND-1   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Prepayment control (1)";
    }
    OUT MIR-SAV-PREPAY-DEP-YM-1    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Deposit year and month (1)";
    }
    OUT MIR-SAV-PREPAY-ST-DT-2   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment start date (2)";
    }
    OUT MIR-SAV-PREPAY-FREQ-2    
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Prepayment frequency (2)";
    }
    OUT MIR-SAV-PREPAY-CTL-IND-2   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Prepayment control (2)";
    }
    OUT MIR-SAV-PREPAY-DEP-YM-2    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Deposit year and month (2)";
    }
    OUT MIR-SAV-PREPAY-ST-DT-3 
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment start date (3)";
    }
    OUT MIR-SAV-PREPAY-FREQ-3
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Prepayment frequency (3)";
    }
    OUT MIR-SAV-PREPAY-CTL-IND-3   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Prepayment control (3)";
    }
    OUT MIR-SAV-PREPAY-DEP-YM-3    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Deposit year and month (3)";
    }
    OUT MIR-SAV-PREPAY-ST-DT-4   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment start date (4)";
    }
    OUT MIR-SAV-PREPAY-FREQ-4   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Prepayment frequency (4)";
    }
    OUT MIR-SAV-PREPAY-CTL-IND-4   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Prepayment control (4)";
    }
    OUT MIR-SAV-PREPAY-DEP-YM-4
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Deposit year and month (4)";
    }
    OUT MIR-SAV-PREPAY-ST-DT-5   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment start date (5)";
    }
    OUT MIR-SAV-PREPAY-FREQ-5   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Prepayment frequency (5)";
    }
    OUT MIR-SAV-PREPAY-CTL-IND-5   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Prepayment control (5)";
    }
    OUT MIR-SAV-PREPAY-DEP-YM-5
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Deposit year and month (5)";
    }
    OUT MIR-SAV-PREPAY-ST-DT-6   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment start date (6)";
    }
    OUT MIR-SAV-PREPAY-FREQ-6   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Prepayment frequency (6)";
    }
    OUT MIR-SAV-PREPAY-CTL-IND-6   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Prepayment control (6)";
    }
    OUT MIR-SAV-PREPAY-DEP-YM-6
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Deposit year and month (6)";
    }
    OUT MIR-PPAY-BULK-BOX   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Bulk box";
    }
    OUT MIR-PPAY-UNEARN-INT   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Unearned interest";
    }
    OUT MIR-PPAY-INT-CAP-YM   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization (year and month)";
    }
    OUT MIR-PPAY-PRCS-CD-1    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process code (CH) (1)";
    }
    OUT MIR-PPAY-PRCS-DT-1   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process date: Year month day (1)";
    }
    OUT MIR-PPAY-INT-CAP-YM-1    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization/ appropriation year and month (1)";
    }
    OUT MIR-PPAY-EARN-VALU-1   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Earnings value (1)";
    }
    OUT MIR-PPAY-BALANCE-1    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Pre-payment balance (1)";
    }
    OUT MIR-PPAY-INT-CAP-MTHS-1   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "No. of months of interest capitalization (1)";
    }
    OUT MIR-PPAY-UNRN-MTH-LAPS-1    
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of unearned months lapsed (1)";
    }
    OUT MIR-PPAY-COUNT-1   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "No. of prepayments (1)";
    }
    OUT MIR-PPAY-NXT-APROP-YM-1    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next appropriation year and month (1)";
    }
    OUT MIR-PPAY-PRCS-CD-2    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process code (CH) (2)";
    }
    OUT MIR-PPAY-PRCS-DT-2   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process date: Year month day (2)";
    }
    OUT MIR-PPAY-INT-CAP-YM-2    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization/ appropriation year and month (2)";
    }
    OUT MIR-PPAY-EARN-VALU-2   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Earnings value (2)";
    }
    OUT MIR-PPAY-BALANCE-2    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Pre-payment balance (2)";
    }
    OUT MIR-PPAY-INT-CAP-MTHS-2   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "No. of months of interest capitalization (2)";
    }
    OUT MIR-PPAY-UNRN-MTH-LAPS-2    
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of unearned months lapsed (2)";
    }
    OUT MIR-PPAY-COUNT-2   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "No. of prepayments (2)";
    }
    OUT MIR-PPAY-NXT-APROP-YM-2    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next appropriation year and month (2)";
    }
    OUT MIR-PPAY-PRCS-CD-3    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process code (CH) (3)";
    }
    OUT MIR-PPAY-PRCS-DT-3   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process date: Year month day (3)";
    }
    OUT MIR-PPAY-INT-CAP-YM-3    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization/ appropriation year and month (3)";
    }
    OUT MIR-PPAY-EARN-VALU-3   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Earnings value (3)";
    }
    OUT MIR-PPAY-BALANCE-3    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Pre-payment balance (3)";
    }
    OUT MIR-PPAY-INT-CAP-MTHS-3   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "No. of months of interest capitalization (3)";
    }
    OUT MIR-PPAY-UNRN-MTH-LAPS-3    
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of unearned months lapsed (3)";
    }
    OUT MIR-PPAY-COUNT-3   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "No. of prepayments (3)";
    }
    OUT MIR-PPAY-NXT-APROP-YM-3    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next appropriation year and month (3)";
    }
    OUT MIR-PPAY-PRCS-CD-4    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process code (CH) (4)";
    }
    OUT MIR-PPAY-PRCS-DT-4   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process date: Year month day (4)";
    }
    OUT MIR-PPAY-INT-CAP-YM-4    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization/ appropriation year and month (4)";
    }
    OUT MIR-PPAY-EARN-VALU-4   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Earnings value (4)";
    }
    OUT MIR-PPAY-BALANCE-4    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Pre-payment balance (4)";
    }
    OUT MIR-PPAY-INT-CAP-MTHS-4   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "No. of months of interest capitalization (4)";
    }
    OUT MIR-PPAY-UNRN-MTH-LAPS-4    
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of unearned months lapsed (4)";
    }
    OUT MIR-PPAY-COUNT-4   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "No. of prepayments (4)";
    }
    OUT MIR-PPAY-NXT-APROP-YM-4    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next appropriation year and month (4)";
    }
    OUT MIR-PPAY-PRCS-CD-5    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process code (CH) (5)";
    }
    OUT MIR-PPAY-PRCS-DT-5   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process date: Year month day (5)";
    }
    OUT MIR-PPAY-INT-CAP-YM-5    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization/ appropriation year and month (5)";
    }
    OUT MIR-PPAY-EARN-VALU-5   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Earnings value (5)";
    }
    OUT MIR-PPAY-BALANCE-5    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Pre-payment balance (5)";
    }
    OUT MIR-PPAY-INT-CAP-MTHS-5   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "No. of months of interest capitalization (5)";
    }
    OUT MIR-PPAY-UNRN-MTH-LAPS-5    
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of unearned months lapsed (5)";
    }
    OUT MIR-PPAY-COUNT-5   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "No. of prepayments (5)";
    }
    OUT MIR-PPAY-NXT-APROP-YM-5    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next appropriation year and month (5)";
    }
    OUT MIR-RBON-CHRGBK-IND   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment, charge back control";
    }
    OUT MIR-RBON-CHRGBK-LPAY-DT    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Last date (year, month, day) of payment (Charge back)";
    }
    OUT MIR-RBON-CHRGBK-AMT 
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Value of this time's payment (charge back)";
    }
    OUT MIR-RBON-PREV-ACCUM-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Previous recover bonus payment accumulated value";
    }
    OUT MIR-RBON-BNFT-PMT-CD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status1st payment status";
    }
    OUT MIR-RBON-BNFT-PMT-CD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 2";
    }
    OUT MIR-RBON-BNFT-PMT-CD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 3";
    }
    OUT MIR-RBON-BNFT-PMT-CD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 4";
    }

    OUT MIR-RBON-BNFT-PMT-CD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 5";
    }
    OUT MIR-RBON-BNFT-PMT-CD-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 6";
    }
    OUT MIR-RBON-BNFT-PMT-CD-7
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 7";
    }
    OUT MIR-RBON-BNFT-PMT-CD-8
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 8";
    }
    OUT MIR-RBON-BNFT-PMT-CD-9
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 9";
    }
    OUT MIR-RBON-BNFT-PMT-CD-10
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 10";
    }
    OUT MIR-RBON-BNFT-PMT-CD-11
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 11";
    }
    OUT MIR-RBON-BNFT-PMT-CD-12
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 12";
    }
    OUT MIR-RBON-BNFT-PMT-CD-13
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 13";
    }
    OUT MIR-RBON-BNFT-PMT-CD-14
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 14";
    }
    OUT MIR-RBON-BNFT-PMT-CD-15
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 15";
    }
    OUT MIR-RBON-BNFT-PMT-CD-16
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 16";
    }
    OUT MIR-RBON-BNFT-PMT-CD-17
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 17";
    }
    OUT MIR-RBON-BNFT-PMT-CD-18
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 18";
    }
    OUT MIR-RBON-BNFT-PMT-CD-19
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 19";
    }
    OUT MIR-RBON-BNFT-PMT-CD-20
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 20";
    }
    OUT MIR-RBON-BNFT-PMT-CD-21
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 21";
    }
    OUT MIR-RBON-BNFT-PMT-CD-22
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 22";
    }
    OUT MIR-RBON-BNFT-PMT-CD-23
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 23";
    }
    OUT MIR-RBON-BNFT-PMT-CD-24
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 24";
    }
    OUT MIR-RBON-BNFT-PMT-CD-25
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 25";
    }
    OUT MIR-RBON-BNFT-PMT-CD-26
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 26";
    }
    OUT MIR-RBON-BNFT-PMT-CD-27
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 27";
    }
    OUT MIR-RBON-BNFT-PMT-CD-28
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 28";
    }
    OUT MIR-RBON-BNFT-PMT-CD-29
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 29";
    }
    OUT MIR-RBON-BNFT-PMT-CD-30
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 30";
    }
    OUT MIR-RBON-BNFT-PMT-CD-31
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 31";
    }
    OUT MIR-RBON-BNFT-PMT-CD-32
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 32";
    }
    OUT MIR-RBON-BNFT-PMT-CD-33
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 33";
    }
    OUT MIR-RBON-BNFT-PMT-CD-34
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 34";
    }
    OUT MIR-RBON-BNFT-PMT-CD-35
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 35";
    }
    OUT MIR-RBON-BNFT-PMT-CD-36
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefits payment status 36";
    }
    OUT MIR-SMKR-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Smoking classification CTL";
    }
    OUT MIR-SMKR-CIG-COUNT
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "No. of cigarettes smoked";
    }
    OUT MIR-DIV-HIST-PMT-CAT-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment classification (1)";
    }
    OUT MIR-DIV-HIST-DIV-YR-1
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Dividend year (1)";
    }
    OUT MIR-DIV-HIST-PMT-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment date (year, month, day) (1)";
    }
    OUT MIR-DIV-HIST-PMT-CAT-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment classification (2)";
    }
    OUT MIR-DIV-HIST-DIV-YR-2
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Dividend year (2)";
    }
    OUT MIR-DIV-HIST-PMT-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment date (year, month, day) (2)";
    }
    OUT MIR-DIV-HIST-PMT-CAT-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment classification (3)";
    }
    OUT MIR-DIV-HIST-DIV-YR-3
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Dividend year (3)";
    }
    OUT MIR-DIV-HIST-PMT-DT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment date (year, month, day) (3)";
    }
    OUT MIR-DIV-DISB-CHG-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment method change date: year, month, day";
    }
    OUT MIR-DIV-DISB-CHG-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Change year";
    }
    OUT MIR-DIV-DISB-PREV-PMT-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Previous dividend payment code";
    }
    OUT MIR-HLTH-DPOS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deposit control";
    }
    OUT MIR-HLTH-DPOS-LST-DEP-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Last deposit year and month";
    }
    OUT MIR-HLTH-DPOS-INT-CAP-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization year and month";
    }
    OUT MIR-HLTH-DPOS-PREV-ACAMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Accumulated deposit (Excluding this time)";
    }
    OUT MIR-HLTH-DPOS-CURR-AMT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "This time's deposit";
    }
    OUT MIR-HLTH-DPOS-ACCUM-INT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Accumulated interest";
    }
    OUT MIR-HLTH-PMT-PREV-ACAMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Accumulated deposit payment (Excluding this time)";
    }
    OUT MIR-HLTH-PMT-CURR-AMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "This time's deposit payment";
    }
    OUT MIR-HLTH-PMT-INT-AMT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest payment amount";
    }
    OUT MIR-HLTH-PMT-ACCUM-VALU
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Accumulated payment value";
    }
    OUT MIR-HLTH-PYHST-IND-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (1)";
    }
    OUT MIR-HLTH-PYHST-TOT-AMT-1
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Payment value total (1)";
    }
    OUT MIR-HLTH-PYHST-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment date: year, month, day (1)";
    }
    OUT MIR-HLTH-PYHST-BRCH-ID-1
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (1)";
    }
    OUT MIR-HLTH-PYHST-AB-CTRL-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "A-B Control (1)";
    }
    OUT MIR-HLTH-PYHST-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (2)";
    }
    OUT MIR-HLTH-PYHST-TOT-AMT-2
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Payment value total (2)";
    }
    OUT MIR-HLTH-PYHST-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment date: year, month, day (2)";
    }
    OUT MIR-HLTH-PYHST-BRCH-ID-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (2)";
    }
    OUT MIR-HLTH-PYHST-AB-CTRL-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "A-B Control (2)";
    }
    OUT MIR-HLTH-PYHST-IND-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (3)";
    }
    OUT MIR-HLTH-PYHST-TOT-AMT-3
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Payment value total (3)";
    }
    OUT MIR-HLTH-PYHST-DT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment date: year, month, day (3)";
    }
    OUT MIR-HLTH-PYHST-BRCH-ID-3
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (3)";
    }
    OUT MIR-HLTH-PYHST-AB-CTRL-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "A-B Control (3)";
    }
    OUT MIR-HLTH-PYHST-IND-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (4)";
    }
    OUT MIR-HLTH-PYHST-TOT-AMT-4
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Payment value total (4)";
    }
    OUT MIR-HLTH-PYHST-DT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment date: year, month, day (4)";
    }
    OUT MIR-HLTH-PYHST-BRCH-ID-4
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (4)";
    }
    OUT MIR-HLTH-PYHST-AB-CTRL-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "A-B Control (4)";
    }
    OUT MIR-HLTH-PYHST-IND-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (5)";
    }
    OUT MIR-HLTH-PYHST-TOT-AMT-5
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Payment value total (5)";
    }
    OUT MIR-HLTH-PYHST-DT-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment date: year, month, day (5)";
    }
    OUT MIR-HLTH-PYHST-BRCH-ID-5
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (5)";
    }
    OUT MIR-HLTH-PYHST-AB-CTRL-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "A-B Control (5)";
    }
    OUT MIR-B-NEW-DIV-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "New dividend year";
    }
    OUT MIR-B-NEW-CURR-INC-PREM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "New current increase premium";
    }
    OUT MIR-B-NEW-ACCUM-INC-PREM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "New accumulated increased premium";
    }
    OUT MIR-B-OLD-DIV-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Old dividend year";
    }
    OUT MIR-B-OLD-CURR-INC-PREM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Old current increased premium";
    }
    OUT MIR-B-OLD-ACCUM-INC-PREM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Old accumulated increased premium";
    }
    OUT MIR-SALES-POL-ID-1
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Policy ID 1";
    }
    OUT MIR-SALES-SMAL-TYP-1
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Small type 1";
    }
    OUT MIR-SALES-POL-ID-2
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Policy ID 2";
    }
    OUT MIR-SALES-SMAL-TYP-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Small type 2";
    }
    OUT MIR-SALES-POL-INFO-1
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy information 1";
    }
    OUT MIR-SALES-POL-INFO-2
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy information 2";
    }
    OUT MIR-AUTOEXT-SETL-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Settlement date: year, month, day";
    }
    OUT MIR-AUTOEXT-EXLS-PREM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Excess/shortage in premium";
    }
    OUT MIR-AUTOEXT-EXLS-LN-INT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Excess/shortage in loan interest";
    }
    OUT MIR-AUTOEXT-PREPAY-INT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest for prepayment";
    }
    OUT MIR-AUTOEXT-INT-CAP-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization year and month";
    }
    OUT MIR-AUTOEXT-TERM-TXFR-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Term rider transfer code";
    }
    OUT MIR-AUTOEXT-SAV-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Automatic extension save bit, before extension before loan history bit";
    }
    OUT MIR-PARTL-EXL-PART-1  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Partial exclusion part (1)";
    }
    OUT MIR-PART-EXCL-PERIOD-1
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Partial exclusion period (1)";
    }
    OUT MIR-PARTL-EXL-PART-2  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Partial exclusion part (2)";
    }
    OUT MIR-PART-EXCL-PERIOD-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Partial exclusion period (2)";
    }
    OUT MIR-PARTL-EXL-PART-3  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Partial exclusion part (3)";
    }
    OUT MIR-PART-EXCL-PERIOD-3
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Partial exclusion period (3)";
    }
    OUT MIR-RDR-PMT-LAST-DEP-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Last deposit date: year, month, end";
    }
    OUT MIR-RDR-PMT-INT-CAP   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization";
    }
    OUT MIR-RDR-PMT-ACUM-DEP-AMT     
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accumulated deposit";
    }
    OUT MIR-RDR-PMT-ACUM-INT-AMT     
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Accumulated interest";
    }
    OUT MIR-RDR-PMT-DT     
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment date: year, month, day";
    }
    OUT MIR-TAXWH-CD     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control bit, available policy ";
    }
    OUT MIR-TAXWH-INIT-APREM     
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Initial year accumulated premium";
    }
    OUT MIR-TAXWH-NEXT-APREM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Next year accumulated premium (Initial year + 2nd year)";
    }
    OUT MIR-SAVING-SGL-PAY-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control bit, Single payment P ";
    }
    OUT MIR-SAVING-LVL-PAY-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control bit, level payment P";
    }
    OUT MIR-SAVING-NB-LVL-PAY-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control bit, at the time of new business level payment P ";
    }
    OUT MIR-SAVING-MAT-DT-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control bit, Set maturity date";
    }
    OUT MIR-SAVING-LIAB-ST-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Liability commencement date";
    }
    OUT MIR-SAVING-MAT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Maturity date";
    }
    OUT MIR-WLPUA-DIV-AMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Paid-up addition dividend";
    }
    OUT MIR-WLPUA-CUR-PREM-AMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "New paid-up addition whole life premium";
    }
    OUT MIR-WLPUA-CUR-APREM-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "New accumulated paid-up addition whole life premium";
    }
    OUT MIR-WLPUA-CURR-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "New paid-up addition year and month";
    }
    OUT MIR-WLPUA-PREV-PREM-AMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Old paid-up whole life premium";
    }
    OUT MIR-WLPUA-PREV-APREM-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Old accumulated paid-up addition whole life premium";
    }
    OUT MIR-WLPUA-PREV-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Old paid-up addition year and month";
    }
    OUT MIR-WLPUA-PLAN-DIV
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Paid-up addition planned dividend";
    }
    OUT MIR-RENW-ACTV-19
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Renewal activities 19";
    }
    OUT MIR-RENW-ACTV-25
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Renewal activities 25";
    }
    OUT MIR-RENW-ACTV-CD-49
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New renewal activities CTL/ 49th continuation activity";
    }
    OUT MIR-RENW-ACTV-CD-37
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New renewal activities CTL/ 37th continuation activity";
    }
    OUT MIR-RENW-ACTV-CD-25
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New renewal activities CTL/ 25th continuation activity";
    }
    OUT MIR-WL-PPAY-RPRM-INS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control bit, Rider premium deposit (installment)";
    }
    OUT MIR-WL-PPAY-RPRM-OTP-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control bit, Rider premium deposit (One time payment)";
    }
    OUT MIR-WL-PPAY-DEEM-CNCL-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deemed cancellation date";
    }
    OUT MIR-WL-PPAY-INDV-MPREM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Individual monthly payment rider premium";
    }
    OUT MIR-WL-PPAY-RDR-PREM-DUR
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Rider premium payment period";
    }
    OUT MIR-WL-PPAY-RDR-ELAPS
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Rider elapse";
    }
    OUT MIR-SPDIV-PMT-CD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment code (1)";
    }
    OUT MIR-SPDIV-PMT-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment date (1)";
    }
    OUT MIR-SPDIV-DISC-DIV-YR-1
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Discount dividend year (1)";
    }
    OUT MIR-SPDIV-CALC-YR-1
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Calculation year (1)";
    }
    OUT MIR-SPDIV-AMT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Special dividend (1)";
    }
    OUT MIR-SPDIV-AMT-TO-ADD-1
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Amount to be added (1)";
    }
    OUT MIR-SPDIV-PMT-CD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment code (2)";
    }
    OUT MIR-SPDIV-PMT-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment date (2)";
    }
    OUT MIR-SPDIV-DISC-DIV-YR-2
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Discount dividend year (2)";
    }
    OUT MIR-SPDIV-CALC-YR-2
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Calculation year (2)";
    }
    OUT MIR-SPDIV-AMT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Special dividend (2)";
    }
    OUT MIR-SPDIV-AMT-TO-ADD-2
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Amount to be added (2)";
    }
    OUT MIR-SPDIV-LAST-RAPROP-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Last reserve appropriation year";
    }
    OUT MIR-SPDIV-RAPROP-ACCUM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Reserve appropriation special dividend accumulation";
    }
    OUT MIR-SPDIV-FREQ
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Frequency";
    }
    OUT MIR-SPDIV-DISC-VAL-V-AMT
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Discount value V proportional amount";
    }
    OUT MIR-SPDIV-PMT-COMP-ACCUM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment completed special dividend accumulation";
    }
    OUT MIR-SVBNE-DFR-LAST-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Last deferred year and month";
    }
    OUT MIR-SVBNE-DFR-INT-CAP-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization year and month ";
    }
    OUT MIR-SVBNE-DFR-ACCUM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deferred survival benefit accumulation";
    }
    OUT MIR-SVBNE-DEFER-INT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Deferred interest";
    }
    OUT MIR-SVBNE-PMT-DEFER-ACUM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deferred payment accumulation (excluding this time)";
    }
    OUT MIR-SVBNE-PMT-CURR-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "This time payment amount";
    }
    OUT MIR-SVBNE-PMT-INT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Interest payment";
    }
    OUT MIR-SVBNE-PMT-ACCUM-VALU
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment amount accumulated value";
    }
    OUT MIR-SVBNE-HST-PYCB-CD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (1)";
    }
    OUT MIR-SVBNE-HST-PYCB-AMT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back value total (1)";
    }
    OUT MIR-SVBNE-HST-PYCB-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back date (1)";
    }
    OUT MIR-SVBNE-HST-BRCH-CD-1
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (1)";
    }
    OUT MIR-SVBNE-HST-ELIG-PMT-1
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of eligible payments (1)";
    }
    OUT MIR-SVBNE-HST-PYCB-CD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (2)";
    }
    OUT MIR-SVBNE-HST-PYCB-AMT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back value total (2)";
    }
    OUT MIR-SVBNE-HST-PYCB-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back date (2)";
    }
    OUT MIR-SVBNE-HST-BRCH-CD-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (2)";
    }
    OUT MIR-SVBNE-HST-ELIG-PMT-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of eligible payments (2)";
    }
    OUT MIR-SVBNE-HST-PYCB-CD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (2)";
    }
    OUT MIR-SVBNE-HST-PYCB-AMT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back value total (3)";
    }
    OUT MIR-SVBNE-HST-PYCB-DT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back date (3)";
    }
    OUT MIR-SVBNE-HST-BRCH-CD-3
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (3)";
    }
    OUT MIR-SVBNE-HST-ELIG-PMT-3
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of eligible payments (3)";
    }
    OUT MIR-SVBNE-HST-PYCB-CD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (3)";
    }
    OUT MIR-SVBNE-HST-PYCB-AMT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back value total (3)";
    }
    OUT MIR-SVBNE-HST-PYCB-DT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back date (4)";
    }
    OUT MIR-SVBNE-HST-BRCH-CD-4
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (4)";
    }
    OUT MIR-SVBNE-HST-ELIG-PMT-4
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of eligible payments (4)";
    }
    OUT MIR-SVBNE-HST-PYCB-CD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (5)";
    }
    OUT MIR-SVBNE-HST-PYCB-AMT-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back value total (5)";
    }
    OUT MIR-SVBNE-HST-PYCB-DT-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back date (5)";
    }
    OUT MIR-SVBNE-HST-BRCH-CD-5
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (5)";
    }
    OUT MIR-SVBNE-HST-ELIG-PMT-5
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of eligible payments (5)";
    }
    OUT MIR-CHINS-CD
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Children's insurance type";
    }
    OUT MIR-CHINS-PMT-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Award payment time arrived BIT/ 6th arrival/19 years 7 months";
    }
    OUT MIR-CHINS-PMT-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Award payment time arrived BIT/ 5th arrival/17 years 7 months";
    }
    OUT MIR-CHINS-PMT-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Award payment time arrived BIT/ 4th arrival/14 years 7 months";
    }
    OUT MIR-CHINS-PMT-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Award payment time arrived BIT/ 3rd arrival/11 years 7 months";
    }
    OUT MIR-CHINS-PMT-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Award payment time arrived BIT/ 2nd arrival/5 years 7 months";
    }
    OUT MIR-CHINS-PMT-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Award payment time arrived BIT/ 1st arrival/3 years 7 months";
    }
    OUT MIR-CHINS-BEFOR-BTH-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Child insurance policy status BIT/ Issue before birth additional provisions invalid policy";
    }
    OUT MIR-CHINS-LUMPSUM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Child insurance status BIT/ education annuity lump sum payment ";
    }
    OUT MIR-CHINS-EDU-ANTY-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Child insurance policy status BIT/ Education annuity payment";
    }
    OUT MIR-CHINS-INFORM-BTH-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Child insurance policy status BIT/ birth reported";
    }
    OUT MIR-CHINS-ADD-PROV-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Child insurance policy status BIT/issue additional provisions before birth";
    }
    OUT MIR-CHINS-EXP-BTH-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Expected birth date";
    }
    OUT MIR-CHINS-MTHLY-PREM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Individual monthly premium";
    }
    OUT MIR-DEFR-PMT-LAST-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Last deferred year and month";
    }
    OUT MIR-DEFR-PMT-INT-CAP-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalized year and month";
    }
    OUT MIR-DEFR-PMT-ACCUM-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deferred award accumulation";
    }
    OUT MIR-DEFR-PMT-ACCUM-INT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Deferred interest accumulation";
    }
    OUT MIR-AWD-PMT-PREV-TOT-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Award payment accumulation (Excluding this time)";
    }
    OUT MIR-AWD-PMT-CURR-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "This time award payment value";
    }
    OUT MIR-AWD-PMT-INT-AMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Interest payment value";
    }
    OUT MIR-AWD-PMT-CURR-TOT-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment accumulated value";
    }
    OUT MIR-AWD-PHIST-PYCB-CD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (1)";
    }
    OUT MIR-AWD-PHIST-PYCB-AMT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back amount total (1)";
    }
    OUT MIR-AWD-PHIST-PYCB-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back date (1)";
    }
    OUT MIR-AWD-PHIST-BRCH-CD-1
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (1)";
    }
    OUT MIR-AWD-PHIST-PYCB-CD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (2)";
    }
    OUT MIR-AWD-PHIST-PYCB-AMT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back amount total (2)";
    }
    OUT MIR-AWD-PHIST-PYCB-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back date (2)";
    }
    OUT MIR-AWD-PHIST-BRCH-CD-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (2)";
    }
    OUT MIR-AWD-PHIST-PYCB-CD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (3)";
    }
    OUT MIR-AWD-PHIST-PYCB-AMT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back amount total (3)";
    }
    OUT MIR-AWD-PHIST-PYCB-DT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back date (3)";
    }
    OUT MIR-AWD-PHIST-BRCH-CD-3
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (3)";
    }
    OUT MIR-AWD-PHIST-PYCB-CD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (4)";
    }
    OUT MIR-AWD-PHIST-PYCB-AMT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back amount total (4)";
    }
    OUT MIR-AWD-PHIST-PYCB-DT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back date (4)";
    }
    OUT MIR-AWD-PHIST-BRCH-CD-4
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (4)";
    }
    OUT MIR-AWD-PHIST-PYCB-CD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment/ charge back control (5)";
    }
    OUT MIR-AWD-PHIST-PYCB-AMT-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back amount total (5)";
    }
    OUT MIR-AWD-PHIST-PYCB-DT-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment/ charge back date (5)";
    }
    OUT MIR-AWD-PHIST-BRCH-CD-5
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office (5)";
    }
    OUT MIR-SALES-2G-POL-ID-1
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Policy ID 1";
    }
    OUT MIR-SALES-2G-SMAL-TYP-1
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Small type 1";
    }
    OUT MIR-SALES-2G-POL-ID-2
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Policy ID 2";
    }
    OUT MIR-SALES-2G-SMAL-TYP-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Small type 2";
    }
    OUT MIR-SALES-2G-POL-ID-3
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Policy ID 3";
    }
    OUT MIR-SALES-2G-SMAL-TYP-3
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Small type 3";
    }
    OUT MIR-SALES-2G-POL-ID-4
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Policy ID4";
    }
    OUT MIR-SALES-2G-SMAL-TYP-4
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Small type 4";
    }
    OUT MIR-SALES-2G-POL-ID-5
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Policy ID 5";
    }
    OUT MIR-SALES-2G-SMAL-TYP-5
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Small type 5";
    }
    OUT MIR-SALES-2G-POL-ID-6
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Policy ID 6";
    }
    OUT MIR-SALES-2G-SMAL-TYP-6
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Small type 6";
    }
    OUT MIR-IPENDW-LAST-DEFR-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Last deferred date";
    }
    OUT MIR-IPENDW-INT-CAP-DT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalizaition date";
    }
    OUT MIR-IPENDW-ACUM-DEFR-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deferred amount (Accumulated)";
    }
    OUT MIR-IPENDW-ACUM-INT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Accumulated interest";
    }
    OUT MIR-IPENDW-PREV-DEFR-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Previous deferred amount";
    }
    OUT MIR-IPENDW-LAST-PMT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Last payment date";
    }
    OUT MIR-IPENDW-LAST-PMT-VALU
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Last payment deferred value";
    }
    OUT MIR-IPENDW-LAST-PMT-INT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Last payment interest";
    }
    OUT MIR-IPENDW-ACUM-PMT
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Accumulated payment premium total";
    }
    OUT MIR-IPENDW-ACUM-PMT-WINT
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Accumulated payment total (Including interest)";
    }
    OUT MIR-BEST-DFR-INT-CAP-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization year and month";
    }
    OUT MIR-BEST-DFR-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deferred amount";
    }
    OUT MIR-BEST-DFR-ACCUM-INT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Accumulated interest";
    }
    OUT MIR-BEST-DFR-PMT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment date";
    }
    OUT MIR-BEST-DFR-PMT-W-INT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Paid increase premium (including interest)";
    }
    OUT MIR-PI-RDR-ADDN-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider addition date";
    }
    OUT MIR-PI-RDR-RNW-COMM-19-1
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Renewal activities commission 19 payment year and month";
    }
    OUT MIR-PI-RDR-RNW-COMM-25-1
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Renewal activities commission 25 payment year and month";
    }
    OUT MIR-PI-RDR-ADDN-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider addition date";
    }
    OUT MIR-PI-RDR-RNW-COMM-19-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Renewal activities commission 19 payment year and month";
    }
    OUT MIR-PI-RDR-RNW-COMM-25-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Renewal activities commission 25 payment year and month";
    }
    OUT MIR-PI-RDR-ADDN-DT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider addition date";
    }
    OUT MIR-PI-RDR-RNW-COMM-19-3
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Renewal activities commission 19 payment year and month";
    }
    OUT MIR-PI-RDR-RNW-COMM-25-3
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Renewal activities commission 25 payment year and month";
    }
    OUT MIR-PI-RDR-ADDN-DT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider addition date";
    }
    OUT MIR-PI-RDR-RNW-COMM-19-4
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Renewal activities commission 19 payment year and month";
    }
    OUT MIR-PI-RDR-RNW-COMM-25-4
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Renewal activities commission 25 payment year and month";
    }
    OUT MIR-PI-RDR-ADDN-DT-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider addition date";
    }
    OUT MIR-PI-RDR-RNW-COMM-19-5
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Renewal activities commission 19 payment year and month";
    }
    OUT MIR-PI-RDR-RNW-COMM-25-5
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Renewal activities commission 25 payment year and month";
    }
    OUT MIR-SPDIV-PMT-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment code";
    }
    OUT MIR-SPDIV-PMT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment date";
    }
    OUT MIR-SPDIV-DISC-DIV-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Discount dividend year";
    }
    OUT MIR-SPDIV-CD
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Special dividend";
    }
    OUT MIR-SPDIV-PAID-ACCUM-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Paid special dividend accumulated";
    }
    OUT MIR-SPDIV-NEW-BASE-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Main/V proportion μpart payment appraisal value (new)";
    }
    OUT MIR-SPDIV-NEW-PUA-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Whole life S paid-up addition / V proportion μpart payment appraisal value (new)";
    }
    OUT MIR-SPDIV-NEW-SPL-1-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Special 1/V proportion μ part payment appraisal value (new)";
    }
    OUT MIR-SPDIV-NEW-SPL-2-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Special 2/V proportion μ part payment appraisal value (new)";
    }
    OUT MIR-SPDIV-NEW-SPL-3-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Special 3/V proportion μ part payment appraisal value (new)";
    }
    OUT MIR-SPDIV-NEW-SPL-4-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Special 4/V proportion μ part payment appraisal value (new)";
    }
    OUT MIR-SPDIV-NEW-SPL-5-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Special 5/V proportion μ part payment appraisal value (new)";
    }
    OUT MIR-SPDIV-OLD-BASE-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Main/V proportion μpart payment appraisal value (old)";
    }
    OUT MIR-SPDIV-OLD-PUA-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Whole life S paid-up addition / V proportion μpart payment appraisal value (old)";
    }
    OUT MIR-SPDIV-OLD-SPL-1-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Special 1/V proportion μ part payment appraisal value (old)";
    }
    OUT MIR-SPDIV-OLD-SPL-2-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Special 2/V proportion μ part payment appraisal value (old)";
    }
    OUT MIR-SPDIV-OLD-SPL-3-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Special 3/V proportion μ part payment appraisal value (old)";
    }
    OUT MIR-SPDIV-OLD-SPL-4-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Special 4/V proportion μ part payment appraisal value (old)";
    }
    OUT MIR-SPDIV-OLD-SPL-5-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Special 5/V proportion μ part payment appraisal value (old)";
    }
    OUT MIR-SPDIV-DFR-LST-DEF-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Last deferred date";
    }
    OUT MIR-SPDIV-DFR-INT-CAP-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest capitalization year and month";
    }
    OUT MIR-SPDIV-DFR-AC-DEF-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deferred amount (accumulated)";
    }
    OUT MIR-SPDIV-DFR-AC-INT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Accumulated interest";
    }
    OUT MIR-SPDIV-DFR-LST-PMT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deferred last payment date";
    }
    OUT MIR-PRE-ALLOC-CTL-IND-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Pre-allocation control (1)";
    }
    OUT MIR-PRE-ALLOC-DIV-YR-1
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Dividend year (1)";
    }
    OUT MIR-PRE-ALLOC-CURR-DIV-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Current dividend (1)";
    }
    OUT MIR-PRE-ALLOC-CTL-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Pre-allocation control (2)";
    }
    OUT MIR-PRE-ALLOC-DIV-YR-2
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Dividend year (2)";
    }
    OUT MIR-PRE-ALLOC-CURR-DIV-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Current dividend (2)";
    }
    OUT MIR-PRE-ALLOC-CTL-IND-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Pre-allocation control (3)";
    }
    OUT MIR-PRE-ALLOC-DIV-YR-3
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Dividend year (3)";
    }
    OUT MIR-PRE-ALLOC-CURR-DIV-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Current dividend (3)";
    }
    OUT MIR-PRE-ALLOC-CTL-IND-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Pre-allocation control (4)";
    }
    OUT MIR-PRE-ALLOC-DIV-YR-4
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Dividend year (4)";
    }
    OUT MIR-PRE-ALLOC-CURR-DIV-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Current dividend (4)";
    }
    OUT MIR-PRE-ALLOC-CTL-IND-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Pre-allocation control (5)";
    }
    OUT MIR-PRE-ALLOC-DIV-YR-5
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Dividend year (5)";
    }
    OUT MIR-PRE-ALLOC-CURR-DIV-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Current dividend (5)";
    }
    OUT MIR-PRE-ALLOC-CTL-IND-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Pre-allocation control (6)";
    }
    OUT MIR-PRE-ALLOC-DIV-YR-6
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Dividend year (6)";
    }
    OUT MIR-PRE-ALLOC-CURR-DIV-6
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Current dividend (6)";
    }
    OUT MIR-PRE-ALLOC-ACCUM-DIV
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accumulated dividend";
    }
    OUT MIR-PRE-ALLOC-ACCUM-INT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accumulated interest ";
    }
    OUT MIR-RDRUP-STAT-CTL
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Rider update status CTL";
    }
    OUT MIR-RDRUP-RPT-DAY
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Reporting day ";
    }
    OUT MIR-RDRUP-NOTI-DRAFT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Notice drafting date";
    }
    OUT MIR-RDRUP-SP-MTH-ER-PREM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Bank rider specific month earned premium after rider update";
    }
    OUT MIR-RDRUP-EMP-DISC-PREM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Employee discount earned premium after rider update";
    }
    OUT MIR-RDRUP-WRIT-AGT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Writing agent";
    }
    OUT MIR-RDRUP-CMN-WRIT-AGT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Common writing agent";
    }
    OUT MIR-RDRUP-UPDT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date updated ";
    }
    OUT MIR-RDRUP-INIT-PREM-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Initial premium deposit date";
    }
    OUT MIR-RDRUP-PREV-STAT-CTL
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Previous rider update status CTL";
    }
    OUT MIR-RDRUP-PREV-RPT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Previous reporting date";
    }
    OUT MIR-RDRUP-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Previous update date";
    }
    OUT MIR-RDRUP-PREV-INPREM-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Previous initial premium deposit date";
    }
    OUT MIR-TERM-RDR-CD
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Rider code";
    }
    OUT MIR-APP-BEN-RT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Benefit rate";
    }
    OUT MIR-APP-BEN-RT-ANTY-TERM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Benefit rate (Annuity payment term)";
    }
    OUT MIR-APP-PYMT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment date (Year, month, day)";
    }
    OUT MIR-APP-PYMT-OCCUR-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date (Year, month, day) of payment occurance";
    }
    OUT MIR-APP-CTRT-EXCL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Contracts excluded from payment post update";
    }
    OUT MIR-BAS-CHG-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date (year, month, day) of policy conditions change";
    }
    OUT MIR-BAS-CHG-CALC-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Calculation date (Year, month, day)";
    }
    OUT MIR-BAS-CHG-UPDT-CALC-T
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ For policy conditions update calculation";
    }
    OUT MIR-BAS-CHG-INFO-IND
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy information bit";
    }
    OUT MIR-BAS-CHG-SURR-CHG-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Applicable date for early surrender charge";
    }
    OUT MIR-BAS-CHG-SURR-MVMT-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Applicable movement code for early surrender charge";
    }
    OUT MIR-BAS-CHG-DP1
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ１";
    }
    OUT MIR-BAS-CHG-DP2
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ２";
    }
    OUT MIR-BAS-CHG-D2P1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "2nd ΔＰ１";
    }
    OUT MIR-BAS-CHG-D2P2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "2nd ΔＰ２";
    }
    OUT MIR-BAS-CHG-DV1
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ１";
    }
    OUT MIR-BAS-CHG-DV2
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ２";
    }
    OUT MIR-BAS-CHG-NTFR-BAL-U
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Conversion, not transferred balance (U)";
    }
    OUT MIR-BAS-CHG-RES-PER-U
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Conversion residual period (U)";
    }
    OUT MIR-BAS-CHG-NTFR-BAL-U0
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Conversion, not transferred balance (U0)";
    }
    OUT MIR-BAS-CHG-RES-PER-U0
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Conversion residual period (U0)";
    }
    OUT MIR-BAS-CHG-LIEN-RT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate ";
    }
    OUT MIR-BAS-CHG-PREPAY-DT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Prepayment completion date (year, month) at the time of conditions change";
    }
    OUT MIR-BAS-CHG-SSTD-PREM-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Substandard premium 1";
    }
    OUT MIR-BAS-CHG-SSTD-PREM-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Substandard premium 2";
    }
    OUT MIR-BAS-CHG-MED-RDR-S-RT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Medical rider S rate";
    }
    OUT MIR-RDR-CHG-PLAN-CD-1
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (1)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-1
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider G-no.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-1
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Position within the group";
    }
    OUT MIR-RDR-CHG-DP1
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ１（±）";
    }
    OUT MIR-RDR-CHG-DP2
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ２（±）";
    }
    OUT MIR-RDR-CHG-D2P1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "2nd ΔＰ１";
    }
    OUT MIR-RDR-CHG-D2P2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "2nd ΔＰ２";
    }
    OUT MIR-RDR-CHG-DV1
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ１（±）";
    }
    OUT MIR-RDR-CHG-DV2
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ２（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-1
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-1
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-1
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation";
    }
    OUT MIR-RDR-CHG-PLAN-CD-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (2)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Group -no.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "In-group position ";
    }
    OUT MIR-RDR-CHG-DP3
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ３（±）";
    }
    OUT MIR-RDR-CHG-DP4
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ４（±）";
    }
    OUT MIR-RDR-CHG-D2P3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "2nd  ΔＰ３（±）";
    }
    OUT MIR-RDR-CHG-D2P4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "2nd ΔＰ４（±）";
    }
    OUT MIR-RDR-CHG-DV3
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ３（±）";
    }
    OUT MIR-RDR-CHG-DV4
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ４（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-2
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation";
    }
    OUT MIR-RDR-CHG-PLAN-CD-3
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (3)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-3
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider G-no.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-3
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "In-group position ";
    }
    OUT MIR-RDR-CHG-DP5
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ５（±）";
    }
    OUT MIR-RDR-CHG-DP6
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ６（±）";
    }
    OUT MIR-RDR-CHG-D2P5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ５（±）";
    }
    OUT MIR-RDR-CHG-D2P6
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ６（±）";
    }
    OUT MIR-RDR-CHG-DV5
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ５（±）";
    }
    OUT MIR-RDR-CHG-DV6
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ６（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-3
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate ";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-3
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-3
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation";
    }
    OUT MIR-RDR-CHG-PLAN-CD-4
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (4)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-4
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider g-no.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-4
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "In-group position ";
    }
    OUT MIR-RDR-CHG-DP7
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ７（±）";
    }
    OUT MIR-RDR-CHG-DP8
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ８（±）";
    }
    OUT MIR-RDR-CHG-D2P7
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ７（±）";
    }
    OUT MIR-RDR-CHG-D2P8
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ８（±）";
    }
    OUT MIR-RDR-CHG-DV7
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ７（±）";
    }
    OUT MIR-RDR-CHG-DV8
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ８（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-4
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-4
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-4
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation";
    }
    OUT MIR-RDR-CHG-PLAN-CD-5
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (5)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-5
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider G-no.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-5
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "In-group position ";
    }
    OUT MIR-RDR-CHG-DP9
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ９（±）";
    }
    OUT MIR-RDR-CHG-DP10
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ１０（±）";
    }
    OUT MIR-RDR-CHG-D2P9
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ９（±）";
    }
    OUT MIR-RDR-CHG-D2P10
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ１０（±）";
    }
    OUT MIR-RDR-CHG-DV9
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ９（±）";
    }
    OUT MIR-RDR-CHG-DV10
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ１０（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-5
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-5
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-5
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation";
    }
    OUT MIR-RDR-CHG-PLAN-CD-6
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (6)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-6
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider G-No.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-6
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "In-group position";
    }
    OUT MIR-RDR-CHG-DP11
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ１１（±）";
    }
    OUT MIR-RDR-CHG-DP12
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ１２（±）";
    }
    OUT MIR-RDR-CHG-D2P11
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ１１（±）";
    }
    OUT MIR-RDR-CHG-D2P12
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ１２（±）";
    }
    OUT MIR-RDR-CHG-DV11
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ１１（±）";
    }
    OUT MIR-RDR-CHG-DV12
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ１２（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-6
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-6
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-6
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation";
    }
    OUT MIR-RDR-CHG-PLAN-CD-7
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (7)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-7
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider G-No.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-7
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "In-group position";
    }
    OUT MIR-RDR-CHG-DP13
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ１３（±）";
    }
    OUT MIR-RDR-CHG-DP14
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ１４（±）";
    }
    OUT MIR-RDR-CHG-D2P13
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ１３（±）";
    }
    OUT MIR-RDR-CHG-D2P14
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ１４（±）";
    }
    OUT MIR-RDR-CHG-DV13
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ１３（±）";
    }
    OUT MIR-RDR-CHG-DV14
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ１４（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-7
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-7
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-7
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation";
    }
    OUT MIR-RDR-CHG-PLAN-CD-8
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (8)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-8
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider G-No.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-8
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "In-group position ";
    }
    OUT MIR-RDR-CHG-DP15
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ１５（±）";
    }
    OUT MIR-RDR-CHG-DP16
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ１６（±）";
    }
    OUT MIR-RDR-CHG-D2P15
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ１５（±）";
    }
    OUT MIR-RDR-CHG-D2P16
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ１６（±）";
    }
    OUT MIR-RDR-CHG-DV15
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ１５（±）";
    }
    OUT MIR-RDR-CHG-DV16
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ１６（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-8
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-8
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-8
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation";
    }
    OUT MIR-RDR-CHG-PLAN-CD-9
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (9)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-9
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider G-No.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-9
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "In-group position";
    }
    OUT MIR-RDR-CHG-DP17
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ１７（±）";
    }
    OUT MIR-RDR-CHG-DP18
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ１８（±）";
    }
    OUT MIR-RDR-CHG-D2P17
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ１７（±）";
    }
    OUT MIR-RDR-CHG-D2P18
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ１８（±）";
    }
    OUT MIR-RDR-CHG-DV17
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ１７（±）";
    }
    OUT MIR-RDR-CHG-DV18
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ１８（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-9
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate ";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-9
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-9
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation ";
    }
    OUT MIR-RDR-CHG-PLAN-CD-10
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (10)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-10
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider G-No.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-10
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "In-group position";
    }
    OUT MIR-RDR-CHG-DP19
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ１９（±）";
    }
    OUT MIR-RDR-CHG-DP20
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ２０（±）";
    }
    OUT MIR-RDR-CHG-D2P19
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ１９（±）";
    }
    OUT MIR-RDR-CHG-D2P20
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ２０（±）";
    }
    OUT MIR-RDR-CHG-DV19
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ１９（±）";
    }
    OUT MIR-RDR-CHG-DV20
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ２０（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-10
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate ";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-10
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-10
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation";
    }
    OUT MIR-RDR-CHG-PLAN-CD-11
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (11)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-11
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider G-No.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-11
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "In-group position";
    }
    OUT MIR-RDR-CHG-DP21
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ２１（±）";
    }
    OUT MIR-RDR-CHG-DP22
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ２２（±）";
    }
    OUT MIR-RDR-CHG-D2P21
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ２１（±）";
    }
    OUT MIR-RDR-CHG-D2P22
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ２２（±）";
    }
    OUT MIR-RDR-CHG-DV21
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ２１（±）";
    }
    OUT MIR-RDR-CHG-DV22
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ２２（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-11
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-11
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-11
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation";
    }
    OUT MIR-RDR-CHG-PLAN-CD-12
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (12)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-12
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider G-No.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-12
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "In-group position";
    }
    OUT MIR-RDR-CHG-DP23
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ２３（±）";
    }
    OUT MIR-RDR-CHG-DP24
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ２４（±）";
    }
    OUT MIR-RDR-CHG-D2P23
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ２３（±）";
    }
    OUT MIR-RDR-CHG-D2P24
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ２４（±）";
    }
    OUT MIR-RDR-CHG-DV23
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ２３（±）";
    }
    OUT MIR-RDR-CHG-DV24
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ２４（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-12
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate ";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-12
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-12
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation";
    }
    OUT MIR-RDR-CHG-PLAN-CD-13
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (13)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-13
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider G-No.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-13
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "In-group position";
    }
    OUT MIR-RDR-CHG-DP25
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ２５（±）";
    }
    OUT MIR-RDR-CHG-DP26
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ２６（±）";
    }
    OUT MIR-RDR-CHG-D2P25
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ２５（±）";
    }
    OUT MIR-RDR-CHG-D2P26
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ２６（±）";
    }
    OUT MIR-RDR-CHG-DV25
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ２５（±）";
    }
    OUT MIR-RDR-CHG-DV26
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ２６（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-13
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate ";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-13
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-13
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation ";
    }
    OUT MIR-RDR-CHG-PLAN-CD-14
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (14)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-14
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider G-No.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-14
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "In-group position ";
    }
    OUT MIR-RDR-CHG-DP27
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ２７（±）";
    }
    OUT MIR-RDR-CHG-DP28
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ２８（±）";
    }
    OUT MIR-RDR-CHG-D2P27
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ２７（±）";
    }
    OUT MIR-RDR-CHG-D2P28
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ２８（±）";
    }
    OUT MIR-RDR-CHG-DV27
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ２７（±）";
    }
    OUT MIR-RDR-CHG-DV28
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ２８（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-14
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-14
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-14
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation ";
    }
    OUT MIR-RDR-CHG-PLAN-CD-15
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code (15)";
    }
    OUT MIR-RDR-CHG-GRP-NUM-15
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider G-No.";
    }
    OUT MIR-RDR-CHG-SEQ-NUM-15
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "In-group position";
    }
    OUT MIR-RDR-CHG-DP29
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ２９（±）";
    }
    OUT MIR-RDR-CHG-DP30
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＰ３０（±）";
    }
    OUT MIR-RDR-CHG-D2P29
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ２９（±）";
    }
    OUT MIR-RDR-CHG-D2P30
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Second ΔＰ３０（±）";
    }
    OUT MIR-RDR-CHG-DV29
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ２９（±）";
    }
    OUT MIR-RDR-CHG-DV30
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "ΔＶ３０（±）";
    }
    OUT MIR-RDR-CHG-LIEN-RT-15
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien rate";
    }
    OUT MIR-RDR-CHG-SSTD-PREM-15
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Substandard premium";
    }
    OUT MIR-RDR-CHG-UP-CALC-T-15
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "ｔθ for calculation";
    }
    OUT MIR-BAS-UP-DEP-CTL
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deposit CTL";
    }
    OUT MIR-BAS-UP-DEP-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deposit date (Year, month, day)";
    }
    OUT MIR-BAS-UP-S2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Base policy S2";
    }
    OUT MIR-BAS-UP-P1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Base policy P1";
    }
    OUT MIR-BAS-UP-RDR-TOT-PREM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Bank rider specific month total premium";
    }
    OUT MIR-BAS-UP-OP-RDR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Outpatient rider";
    }
    OUT MIR-BAS-UP-OP-RDR-DL-BEN
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Outpatient rider daily benefit";
    }
    OUT MIR-BAS-UP-OP-RDR-P
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Outpatient rider P";
    }
    OUT MIR-BAS-UP-INJ-RDR-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Injury rider code";
    }
    OUT MIR-BAS-UP-INJ-RDR-S
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Injury rider S";
    }
    OUT MIR-BAS-UP-INJ-RDR-P
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Injury rider P";
    }
    OUT MIR-BAS-UP-FAM-RDR-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Family medical rider code";
    }
    OUT MIR-BAS-UP-FAM-RDR-BEN
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Family medical rider daily benefit";
    }
    OUT MIR-BAS-UP-FAM-RDR-P
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Family medical rider P";
    }
    OUT MIR-BAS-UP-ACR-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Accident coverage rider code";
    }
    OUT MIR-BAS-UP-ACR-S
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accident coverage rider basic S";
    }
    OUT MIR-BAS-UP-ACR-P
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accident coverage rider P";
    }
    OUT MIR-BAS-UP-AR-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Accident rider code";
    }
    OUT MIR-BAS-UP-AR-S
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accident rider S";
    }
    OUT MIR-BAS-UP-AR-P
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accident rider P";
    }
    OUT MIR-BAS-UP-ADB-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Accidental death rider code";
    }
    OUT MIR-BAS-UP-ADB-S
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accidental death rider S";
    }
    OUT MIR-BAS-UP-ADB-P
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accidental death rider P";
    }
    OUT MIR-BAS-UP-TAR-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Traffic accident rider code";
    }
    OUT MIR-BAS-UP-TAR-S
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Traffic accident rider basic S";
    }
    OUT MIR-BAS-UP-TAR-P
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Traffic accident rider P";
    }
    OUT MIR-BAS-UP-TMR-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Total medical rider code";
    }
    OUT MIR-BAS-UP-TMR-S
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Total medical rider basic S";
    }
    OUT MIR-BAS-UP-TMR-P
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Total medical rider P";
    }
    OUT MIR-BAS-UP-ADR-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Adult disease rider code";
    }
    OUT MIR-BAS-UP-ADR-BEN
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Adult disease rider daily benefit";
    }
    OUT MIR-BAS-UP-ADR-P
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Adult diseases rider P";
    }
    OUT MIR-BAS-UP-ADH-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Adult diseases hospitalization rider code";
    }
    OUT MIR-BAS-UP-ADH-BEN
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Adult disease hospitalization rider daily benefit";
    }
    OUT MIR-BAS-UP-ADH-P
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Adult disease hospitalization rider P";
    }
    OUT MIR-BAS-UP-AHR-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Accident hospitalization rider code";
    }
    OUT MIR-BAS-UP-AHR-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accident hospitalization rider daily amount ";
    }
    OUT MIR-BAS-UP-AHR-P
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accident hospitalization rider P";
    }
    OUT MIR-ANTY-CHG-BASE-AMT-90
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Base annuity amount (90%)";
    }
    OUT MIR-ANTY-CHG-RSC-90
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Annuity resources (90%)";
    }
    OUT MIR-ANTY-CHG-DPAY-BAS-90
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Down payment base annuity amount (90%)";
    }
    OUT MIR-ANTY-CHG-DPAY-RSC-90
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Down payment annuity resources (90%)";
    }
    OUT MIR-ANTY-CHG-APU-BAS-90
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Base annuity amount after paid-up (90%)";
    }
    OUT MIR-ANTY-CHG-APU-RSC-90
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Annuity resources after paid-up (90%)";
    }
    OUT MIR-ANTY-CHG-RDR-BAS-90
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Rider base annuity amount (90%)";
    }
    OUT MIR-ANTY-CHG-RDR-RSC-90
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Rider annuity resources (90%)";
    }
    OUT MIR-ANTY-CHG-DV-90
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "ΔＶ(90%)";
    }
    OUT MIR-ANTY-CHG-CNV-BAL-U
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Base policy conversion, not transferred balance (U)";
    }
    OUT MIR-ANTY-CHG-TOT-PRE-BAL
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Total prepayment balance";
    }
    OUT MIR-ANTY-CHG-IND-PRE-BAL
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Individual annuity prepayment balance";
    }
    OUT MIR-ANTY-CHG-ACC-DOD
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Accumulated dividends on deposit";
    }
    OUT MIR-ANTY-CHG-ACC-INT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Accumulated interest on deposit ";
    }
    OUT MIR-ANTY-CHG-ACC-REG-DEP
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Accumulated destination registered deposits";
    }
    OUT MIR-ANTY-CHG-ACC-REG-INT
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Accumulated destination registered interest on deposits";
    }
    OUT MIR-ANTY-CHG-LAPS-YM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Elapsed years and months at the time of conditions change";
    }
    OUT MIR-NCB-PMT-CHGBK-CTL
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment, charge back control";
    }
    OUT MIR-NCB-PMT-CHGBK-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment (charge back) date (year, month, day)";
    }
    OUT MIR-NCB-PMT-CHBK-AMT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Payment (charge back) amount";
    }
    OUT MIR-NCB-ACCUM-OS-AMT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Accumulated outstanding amount";
    }
    OUT MIR-SBP-PMT-CHGBK-ACUAMT
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payment, charge back amount accumulation";
    }
    OUT MIR-SBP-CTL-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control (1)";
    }
    OUT MIR-SBP-PMT-CHGBK-AMT-1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payment, charge back amount total";
    }
    OUT MIR-SBP-PMT-CHGBK-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment. charge back date (Year, month, day)";
    }
    OUT MIR-SBP-PMT-BASE-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Base date (year, month, day) for payment";
    }
    OUT MIR-SBP-BRCH-CD-1
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office";
    }
    OUT MIR-SBP-CTL-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control (2)";
    }
    OUT MIR-SBP-PMT-CHGBK-AMT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payment, charge back amount total";
    }
    OUT MIR-SBP-PMT-CHGBK-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment. charge back date (Year, month, day)";
    }
    OUT MIR-SBP-PMT-BASE-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Base date (year, month, day) for payment";
    }
    OUT MIR-SBP-BRCH-CD-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office";
    }
    OUT MIR-SBP-CTL-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control (3)";
    }
    OUT MIR-SBP-PMT-CHGBK-AMT-3
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payment, charge back amount total";
    }
    OUT MIR-SBP-PMT-CHGBK-DT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment. charge back date (Year, month, day)";
    }
    OUT MIR-SBP-PMT-BASE-DT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Base date (year, month, day) for payment";
    }
    OUT MIR-SBP-BRCH-CD-3
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office";
    }
    OUT MIR-SBP-CTL-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control (4)";
    }
    OUT MIR-SBP-PMT-CHGBK-AMT-4
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payment, charge back amount total";
    }
    OUT MIR-SBP-PMT-CHGBK-DT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment. charge back date (Year, month, day)";
    }
    OUT MIR-SBP-PMT-BASE-DT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Base date (year, month, day) for payment";
    }
    OUT MIR-SBP-BRCH-CD-4
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office";
    }
    OUT MIR-SBP-CTL-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control (5)";
    }
    OUT MIR-SBP-PMT-CHGBK-AMT-5
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payment, charge back amount total";
    }
    OUT MIR-SBP-PMT-CHGBK-DT-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment. charge back date (Year, month, day)";
    }
    OUT MIR-SBP-PMT-BASE-DT-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Base date (year, month, day) for payment";
    }
    OUT MIR-SBP-BRCH-CD-5
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling branch office";
    }
    OUT MIR-BAS-UP-SOL-BRCH-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Soliciting branch office at the time of base policy update ";
    }
    OUT MIR-BAS-UP-WAGT-CD
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Writing agent at the time of base policy update";
    }
    OUT MIR-BAS-UP-CMN-WAGT-CD
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Common writing agent at the time of base policy update";
    }
    OUT MIR-BAS-UP-PREM-WV-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy date (Year, month, day) at the time of premium waiver ";
    }
    OUT MIR-BAS-UP-PREM-WV-DURYM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Elapsed years and months at the time of premium waiver";
    }
    OUT MIR-BNFT-PMT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit payment event year/month/date";
    }
    OUT MIR-XFER-BUS-CD-1
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Business Code(1) ";
    }
    OUT MIR-XFER-CTL-RFLCTD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Already reflected(1) ";
    }
    OUT MIR-XFER-CTL-REMIT-PRCES-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Remittance processing(1) ";
    }
    OUT MIR-XFER-CTL-PREV-REMIT-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Remittance already done(1) ";
    }
    OUT MIR-XFER-CTL-FA-DEFR-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Face amount deferral(1) ";
    }
    OUT MIR-XFER-CTL-FA-DEFR-PMT1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Face amount deferral payment(1) ";
    }
    OUT MIR-XFER-CTL-TRXN-INFO-IND1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Transaction information available or not(1) ";
    }
    OUT MIR-XFER-OPER-KEY-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Operator KEY(1) ";
    }
    OUT MIR-XFER-PRCES-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process year/month/date(1) ";
    }
    OUT MIR-XFER-XPRY-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Expiry Date(1) ";
    }
    OUT MIR-XFER-NET-FIN-VALU-1
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Net financial value(1) ";
    }
    OUT MIR-XFER-REMIT-SERL-NUM1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Remittance acceptance serial number(1) ";
    }
    OUT MIR-XFER-BUS-CD-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Business Code(2) ";
    }
    OUT MIR-XFER-CTL-RFLCTD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Already reflected(2) ";
    }
    OUT MIR-XFER-CTL-REMIT-PRCES-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Remittance processing(2) ";
    }
    OUT MIR-XFER-CTL-PREV-REMIT-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Remittance done(2) ";
    }
    OUT MIR-XFER-CTL-FA-DEFR-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Face amount deferral(2) ";
    }
    OUT MIR-XFER-CTL-FA-DEFR-PMT2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Face amount deferral payment(2) ";
    }
    OUT MIR-XFER-CTL-TRXN-INFO-IND2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Transaction information available or not(2) ";
    }
    OUT MIR-XFER-OPER-KEY-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Operator KEY(2) ";
    }
    OUT MIR-XFER-PRCES-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process year/month/date(2) ";
    }
    OUT MIR-XFER-XPRY-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Expiry Date(2) ";
    }
    OUT MIR-XFER-NET-FIN-VALU-2
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Net financial value(2) ";
    }
    OUT MIR-XFER-REMIT-SERL-NUM2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Remittance acceptance serial number(2) ";
    }
    OUT MIR-LOAN-ADDR-REQIR-IND-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan address not required BIT(1)";
    }
    OUT MIR-LOAN-SHR-NUM-1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Shared Number(1)";
    }
    OUT MIR-LOAN-CURR-BAL-1
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Current loan balance(1)";
    }
    OUT MIR-LOAN-XCES-SHRT-INT-1
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Excess/Short Interest(1)";
    }
    OUT MIR-LOAN-INT-RT-1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Loan interest rate(1)";
    }
    OUT MIR-LOAN-INT-EFF-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest effective year/month/date(1)";
    }
    OUT MIR-LOAN-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan date year/month/date(1)";
    }
    OUT MIR-LOAN-REPAY-DUE-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Repayment due date(1)";
    }
    OUT MIR-LOAN-INT-CALC-CAT-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interest calculation category(1)";
    }
    OUT MIR-LOAN-BUS-CD-1
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Business Code(1)";
    }
    OUT MIR-LOAN-CTL-RFLCTD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Already reflected(1)";
    }
    OUT MIR-LOAN-CTL-REMIT-PRCES-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Remittance mode(1)";
    }
    OUT MIR-LOAN-CTL-PREV-REMIT-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Remittance(1)";
    }
    OUT MIR-LOAN-OPER-KEY-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Operator KEY(1)";
    }
    OUT MIR-LOAN-PRCES-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process year/month/date(1)";
    }
    OUT MIR-LOAN-XPRY-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Expiry Date(1)";
    }
    OUT MIR-LOAN-NET-FIN-VALU-1
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Net financial value(1)";
    }
    OUT MIR-LOAN-REMIT-SERL-NUM1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Remittance acceptance serial number(1)";
    }
    OUT MIR-LOAN-ADDR-REQIR-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan address not required BIT(2) ";
    }
    OUT MIR-LOAN-SHR-NUM-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Shared Number(2) ";
    }
    OUT MIR-LOAN-CURR-BAL-2
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Current loan balance(2) ";
    }
    OUT MIR-LOAN-XCES-SHRT-INT-2
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Excess/Short Interest(2) ";
    }
    OUT MIR-LOAN-INT-RT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Loan interest rate(2) ";
    }
    OUT MIR-LOAN-INT-EFF-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest effective year/month/date(2) ";
    }
    OUT MIR-LOAN-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan year/month/date(2) ";
    }
    OUT MIR-LOAN-REPAY-DUE-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Repayment due date(2) ";
    }
    OUT MIR-LOAN-INT-CALC-CAT-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interest calculation category(2) ";
    }
    OUT MIR-LOAN-BUS-CD-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Business Code(2) ";
    }
    OUT MIR-LOAN-CTL-RFLCTD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Already reflected(2) ";
    }
    OUT MIR-LOAN-CTL-REMIT-PRCES-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Remittance mode(2) ";
    }
    OUT MIR-LOAN-CTL-PREV-REMIT-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Control/Remittance(2) ";
    }
    OUT MIR-LOAN-OPER-KEY-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Operator KEY(2) ";
    }
    OUT MIR-LOAN-PRCES-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process year/month/date(2) ";
    }
    OUT MIR-LOAN-XPRY-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Expiry Date(2) ";
    }
    OUT MIR-LOAN-NET-FIN-VALU-2
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Net financial value(2) ";
    }
    OUT MIR-LOAN-REMIT-SERL-NUM2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Remittance acceptance serial number(2) ";
    }
}	