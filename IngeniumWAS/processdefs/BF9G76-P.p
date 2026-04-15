# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF9G76-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYSD11   CTS      INITIAL VERSION OF UNISYS POLICY INQUIRY SCREEN        *
#*  UYDM28   CTS      INITIAL VERSION OF UNISYS POLICY INQUIRY SCREEN          *
#*******************************************************************************

P-STEP BF9G76-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9G76";
        BusinessFunctionName = "Unisys Policy Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9G76";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TUSPM";
        SType = "Text";
        Label = "Policy Id";
    }

##UYDM28 Changes starts
    INOUT MIR-POL-IDENT-CD
    {
      Length = "1";
      CodeSource = "DataModel";
      CodeType = "POL-IDENT-TYP-CD";
      SType = "Selection";
      Label = "Policy Identification Code";
    } 

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }
##UYDM28 Changes ends
    OUT MIR-SMAL-TYP
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Small Type Code";
    }
#UYDM28    OUT MIR-LARG-TYP
    INOUT MIR-LARG-TYP
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Large Type Code";
    }    
    OUT MIR-POL-ISSU-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    }
    OUT MIR-BILL-MODE
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Bill Mode";
    }
    OUT MIR-NOTIC-DIV
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Notic Div";
    }
    OUT MIR-DEALNG
    { 
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dealing";
    }
    OUT MIR-LATST-PMT-MO-YR
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Latest Payment Month Year";
    }
    OUT MIR-DURATION
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Duration";
    }
    OUT MIR-LTST-PMT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Latest Payment Date";
    }
    OUT MIR-INSRD-BTH-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Insured Birth Date";
    }

    OUT MIR-ISSU-AGE
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "X1 (Insured's issue age)";
    }
    OUT MIR-FLD-X2 
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "X2";
    }
    OUT MIR-INSRD-SEX-CD 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "(Insured) SEX";
    }
    OUT MIR-FLD-TYP 
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Type";
    }
    OUT MIR-FLD-N 
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Ｎ";
    }
    OUT MIR-EXP-AGE 
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Ｍ";
    }
    OUT MIR-FACE-AMT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "S1 (Face amount)";
    }
    OUT MIR-FLD-S2 
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "S2";
    }
    OUT MIR-MOD-PREM-AMT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "P1 (modal premium)";
    }
    OUT MIR-FLD-P2 
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "P2";
    }
    OUT MIR-MED-SEL-CD-1 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Medical Selection Code (1)";
    }
    OUT MIR-DIV-PAYO-CD 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Payout Code";
    }
    OUT MIR-DEALNG-BR 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Dealing Branch";
    }
    OUT MIR-DEALNG-AGT 
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Dealing Agent";
    }
    OUT MIR-SALES-BR 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sales Branch";
    }
    OUT MIR-WRT-AGT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Writing Agent";
    }
    OUT MIR-JT-SHR-AGT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Joing Sharing Agent";
    }
    OUT MIR-AREA-BR-CANV
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Area Branch at Canvassing";
    }
    OUT MIR-DEPT-CANV 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department at Canvassing";
    }
    OUT MIR-TRXN-CD  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Transaction Code";
    }
    OUT MIR-CHNG-DT       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Change Date";
    }
    OUT MIR-OWNR-BTH-DT        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "(Policy ) Date of Birth";
    }
    OUT MIR-TYP-DIV         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Type Division";
    }
    OUT MIR-ADDR-CD         
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Address Code";
    }
    OUT MIR-DIFF-PREM         
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Differential Premium";
    }
    OUT MIR-ACC-PD-PREM        
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Accumulated Paid Premium";
    }
    OUT MIR-OVR-DUE-MTH        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Overdue Month";
    }
    OUT MIR-SAVNG-TYP         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Saving Type";
    }
    OUT MIR-DLY-PMT-MNTHS         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Delayed Payment Number of Months";
    }
    OUT MIR-OWNR-SEX-CD         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "(Policy) SEX";
    }
    OUT MIR-MED-SEL-CD-2          
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Medical Selection Code (2)";
    }
    OUT MIR-CHNG-DEAL-BR          
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Dealing Branch";
    }
    OUT MIR-INSRD-NM        
    {
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "The Insured Name";
    }
    OUT MIR-FLD-203          
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Advance Payment Unallocated Dividend Rate Change Year and Monthe";
    }
    OUT MIR-FLD-204          
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Annuity Rider Type";
    }
    OUT MIR-FLD-205          
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Annuity Rider Deferral Period";
    }
    OUT MIR-FLD-206          
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Annuity Rider Payment Period";
    }
    OUT MIR-FLD-207          
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Death Ｓ at Extension";
    }
    OUT MIR-FLD-208          
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Conversion after SalesＳ";
    }
    OUT MIR-STEP-PRD           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "SteｐPeriod";
    }
    OUT MIR-MED-INS-TYP          
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Care・Medical Insurance　Type";
    }
    OUT MIR-FLD-211           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "New Conversion Unallocated Dividend Rate";
    }
    OUT MIR-CNVR-CNT           
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Number of Conversion";
    }
    OUT MIR-INIT-PMT-RECV-DT          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Initial Payment Received Date";
    }
    OUT MIR-FLD-215           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Policy Provision Change Division";
    }
    OUT MIR-FLD-216           
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "S after Paid-up Whole Life Deletion";
    }
    OUT MIR-SURR-ELPSD-MTH       
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Elapsed Month at Surrender";
    }
    OUT MIR-SD-DT      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Self Disclosure Date";
    }
    OUT MIR-OWNR-NM          
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Policy Owner’s Name";
    }
    OUT MIR-ADDR-KA       
    {
        DisplayOnly;
        Length = "72";
        SType = "Text";
        Label = "Address G";
    }
    OUT MIR-OWNR-PH-NUM       
    {
        DisplayOnly;
        Length = "13";
        SType = "Text";
        Label = "Policyholder Phone Number G/Policyholder Phone Number";
    }
    OUT MIR-DSASTR-CD       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Disaster Handling Code";
    }
    OUT MIR-DSASTR-CNTRCT-CD  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Disaster handling timing contract situation BIT/installation payment";
    }
    OUT MIR-DSASTR-CNTRCT-DT  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Disaster handling timing contract situation BIT/1-8";
    }
    OUT MIR-DSASTR-LAPS-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Disaster laspe year month date";
    }
#UYDM28 Changes starts
    OUT MIR-MAT-NOTI-CRE-MTH
    {
        DisplayOnly;
        Length = "2";
        SType  = "Text";
        Label  = "Maturity notice creation month";
     }
#UYDM28 Changes Ends
    OUT MIR-POLM-RSRV  
    {
        DisplayOnly;
        Length = "65";
        SType = "Text";
        Label = "Reserve Area";
    }
    OUT MIR-IND-600-606-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Under the Procedure of Transaction (1)";
    }
    OUT MIR-IND-600-606-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Transaction Reported (1)";
    }
    OUT MIR-IND-600-606-FLD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Under the procedure of Loan (1)";
    }
    OUT MIR-IND-600-606-FLD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan Reported (1)";
    }
    OUT MIR-IND-600-606-FLD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Under the procedure of Loan (2)";
    }
    OUT MIR-IND-600-606-FLD-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan Reported (2)";
    }
    OUT MIR-IND-600-606-FLD-7
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Undetermined Policy";
    }
    OUT MIR-LAPS-POL 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Division 1/Lapse Policy";
    }
    OUT MIR-IND-608-622-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Division 1/608-622";
    }
    OUT MIR-IND-608-622-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reinsurance Policy";
    }
    OUT MIR-IND-608-622-FLD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Unpaid Benefit Policy";
    }
    OUT MIR-IND-608-622-FLD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "”Hotoku” Applicable Exclusion Policy";
    }
    OUT MIR-IND-608-622-FLD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Fund Policy";
    }
    OUT MIR-IND-608-622-FLD-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Statute of Limitations Policy";
    }
    OUT MIR-IND-608-622-FLD-7
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reserve Calculated Policy";
    }
    OUT MIR-IND-608-622-FLD-8
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Uncertain Dealer Policy";
    }
    OUT MIR-IND-608-622-FLD-9
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Loan Unneeded Capitalization";
    }
    OUT MIR-IND-608-622-FLD-10
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan History Policy";
    }
    OUT MIR-IND-608-622-FLD-11
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Special Revival Policy";
    }
    OUT MIR-IND-608-622-FLD-12
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Second Year Dividend Payment Policy";
    }
    OUT MIR-IND-608-622-FLD-13
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Rider Deletion Policy";
    }
    OUT MIR-IND-608-622-FLD-14
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Internal Deposit Assignment Policy";
    }
    OUT MIR-IND-608-622-FLD-15
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Renewal Denial Policy";
    }
    OUT MIR-AUT-LOAN-REJ  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Division 1/Auto Loan Reject Policy";
    }
    OUT MIR-IND-624-627-FLD-1  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Division 1/624-627";
    }
    OUT MIR-IND-624-627-FLD-2  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Agent Policy";
    }
    OUT MIR-IND-624-627-FLD-3  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Under the Payout Procedure Policy";
    }
    OUT MIR-IND-624-627-FLD-4  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Certificate Reissued Policy";
    }
    OUT MIR-DIFF-PYMNT-POL   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Division 1/Different Number of Payment Policy 1";
    }
    OUT MIR-IND-629-635-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Division 1/629-635";
    }
    OUT MIR-IND-629-635-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Under the Procedure of Conversion";
    }
    OUT MIR-IND-629-635-FLD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion Policy";
    }
    OUT MIR-IND-629-635-FLD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Serious Disability Unpaid Policy";
    }
    OUT MIR-IND-629-635-FLD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Saving Second Assured Death";
    }
    OUT MIR-IND-629-635-FLD-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Employee Insurance Policy";
    }
    OUT MIR-IND-629-635-FLD-7
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Robbery Policy";
    }
    OUT MIR-SPCL-TRTMT 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Premium Special Treatment Policy";
    }
    OUT MIR-PAID-POL 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Paid Policy";
    }
    OUT MIR-EXT-POL 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Extension Policy";
    }
    OUT MIR-WAIV-POL     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Waiver of Premium Policy";
    }
    OUT MIR-ANTY-PYMNT     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Annuity Payment Policy";
    }
    OUT MIR-WT-ADV-PREM      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Whole Term Advance Premium Policy";
    }
    OUT MIR-LUM-SUM-PMT    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Lump Sum Payment Policy";
    }
    OUT MIR-GT-MIS   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Group Treatment Missing Policy";
    }
    OUT MIR-PMT-EXP   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Payment Expiration Policy";
    }
    OUT MIR-ADD1-1-3   
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Additional Indicator 1/Name Indicator";
    }
    OUT MIR-ADDR-G 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Additional Indicator 1/Address G";
    }
    OUT MIR-ADD1-5-36-FLD-1   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Additional Indicator 1/5-36";
    }
    OUT MIR-ADD1-5-36-FLD-2    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Rider G ";
    }
    OUT MIR-ADD1-5-36-FLD-3   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Extra Rider G";
    }
    OUT MIR-ADD1-5-36-FLD-4    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Traffic Accidental Rider G";
    }
    OUT MIR-ADD1-5-36-FLD-5   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Comprehensive Medical Coverage Rider G";
    }
    OUT MIR-ADD1-5-36-FLD-6    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Adult Disease Rider G";
    }
    OUT MIR-ADD1-5-36-FLD-7   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interm Additional Amount Term Insurance Rider G  (1)";
    }
    OUT MIR-ADD1-5-36-FLD-8    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interm Additional Amount Term Insurance Rider G  (2)";
    }
    OUT MIR-ADD1-5-36-FLD-9  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interm Additional Amount Term Insurance Rider G  (3)";
    }
    OUT MIR-ADD1-5-36-FLD-10
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Family Medical Rider Bases G";
    }
    OUT MIR-ADD1-5-36-FLD-11   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Sickness Hospitalization Rider G";
    }
    OUT MIR-ADD1-5-36-FLD-12    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Hospitalization Rider G";
    }
    OUT MIR-ADD1-5-36-FLD-13   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Term Insurance Rider G";
    }
    OUT MIR-ADD1-5-36-FLD-14   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dummy1";
    }
    OUT MIR-ADD1-5-36-FLD-15   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Additional Survivor Benefit G";
    }
    OUT MIR-ADD1-5-36-FLD-16
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Allocation Dividend G";
    }
    OUT MIR-ADD1-5-36-FLD-17   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Offset G";
    }
    OUT MIR-ADD1-5-36-FLD-18    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deposit Dividend G";
    }
    OUT MIR-ADD1-5-36-FLD-19   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accumulation G";
    }
    OUT MIR-ADD1-5-36-FLD-20    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Vesting G";
    }
    OUT MIR-ADD1-5-36-FLD-21   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Congratulatory Benefit for Entrance of School";
    }
    OUT MIR-ADD1-5-36-FLD-22    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Substandard G";
    }
    OUT MIR-ADD1-5-36-FLD-23   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Hospitalization Injury G";
    }
    OUT MIR-ADD1-5-36-FLD-24    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Term Insurance G";
    }
    OUT MIR-ADD1-5-36-FLD-25   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reinsurance G";
    }
    OUT MIR-ADD1-5-36-FLD-26    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion D1 G";
    }
    OUT MIR-ADD1-5-36-FLD-27   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion D2 G";
    }
    OUT MIR-ADD1-5-36-FLD-28    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion C G";
    }
    OUT MIR-ADD1-5-36-FLD-29   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity (1) G";
    }
    OUT MIR-ADD1-5-36-FLD-30    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Credits G";
    }
    OUT MIR-ADD1-5-36-FLD-31  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Medical Insurance G";
    }
    OUT MIR-ADD1-5-36-FLD-32
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dummy2";
    }
    OUT MIR-ADD2-0-35-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Change Part (1)";
    }
    OUT MIR-ADD2-0-35-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Old Content Part";
    }
    OUT MIR-ADD2-0-35-FLD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan Part (1)";
    }
    OUT MIR-ADD2-0-35-FLD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan Part (2)";
    }
    OUT MIR-ADD2-0-35-FLD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dummy";
    }
    OUT MIR-ADD2-0-35-FLD-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan Bases G";
    }
    OUT MIR-ADD2-0-35-FLD-7
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan History (A) G";
    }
    OUT MIR-ADD2-0-35-FLD-8
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan History (B) G";
    }
    OUT MIR-ADD2-0-35-FLD-9
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lapse Revival G";
    }
    OUT MIR-ADD2-0-35-FLD-10
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Paid-up G";
    }
    OUT MIR-ADD2-0-35-FLD-11
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Extension G";
    }
    OUT MIR-ADD2-0-35-FLD-12
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Policy Loan G";
    }
    OUT MIR-ADD2-0-35-FLD-13
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Advance Premium Fixed G";
    }
    OUT MIR-ADD2-0-35-FLD-14
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Change Administrative Agent G";
    }
    OUT MIR-ADD2-0-35-FLD-15
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bank Transfer G";
    }
    OUT MIR-ADD2-0-35-FLD-16
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dantai G";
    }
    OUT MIR-ADD2-0-35-FLD-17
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Employee Insurance G";
    }
    OUT MIR-ADD2-0-35-FLD-18
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Soft Product G";
    }
    OUT MIR-ADD2-0-35-FLD-19
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "F type Benefit Payout G";
    }
    OUT MIR-ADD2-0-35-FLD-20
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Living Advance Premium G";
    }
    OUT MIR-ADD2-0-35-FLD-21
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Saving Advance Premium G";
    }
    OUT MIR-ADD2-0-35-FLD-22
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion A1 G";
    }
    OUT MIR-ADD2-0-35-FLD-23
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion A2 G";
    }
    OUT MIR-ADD2-0-35-FLD-24
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion B1 G";
    }
    OUT MIR-ADD2-0-35-FLD-25
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion B2 G";
    }
    OUT MIR-ADD2-0-35-FLD-26
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Living Advance Premium G";
    }
    OUT MIR-ADD2-0-35-FLD-27
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reinstatement (B) G";
    }
    OUT MIR-ADD2-0-35-FLD-28
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Extended Interest G";
    }
    OUT MIR-ADD2-0-35-FLD-29
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Change Part (2)";
    }
    OUT MIR-ADD2-0-35-FLD-30
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Congratulatory Recovery Benefit G";
    }
    OUT MIR-ADD2-0-35-FLD-31
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Smoking Information G";
    }
    OUT MIR-ADD2-0-35-FLD-32
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan History G";
    }
    OUT MIR-ADD2-0-35-FLD-33
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Family Medical Rider History G";
    }
    OUT MIR-ADD2-0-35-FLD-34
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Amount History G";
    }
    OUT MIR-ADD2-0-35-FLD-35
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefit Amount History G";
    }
    OUT MIR-ADD2-0-35-FLD-36
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deposit History G";
    }
    OUT MIR-IND-800-805-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Overlapped Policy";
    }
    OUT MIR-IND-800-805-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Foreigners’ Policy";
    }
    OUT MIR-IND-800-805-FLD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Employee Policy";
    }
    OUT MIR-IND-800-805-FLD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan Policy";
    }
    OUT MIR-IND-800-805-FLD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity Certain Policy";
    }
    OUT MIR-IND-800-805-FLD-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Non-loan Policy";
    }
    OUT MIR-INDIV-GRP-POL   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 3/Individual Group Policy";
    }
    OUT MIR-IND-809-810-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 3/809-810";
    }
    OUT MIR-IND-809-810-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity Rider Policy";
    }
    OUT MIR-ASGNMNT-POL   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 3/Assignment Policy";
    }
    OUT MIR-IND-812-817-FLD-1     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 3/812-817";
    }
    OUT MIR-IND-812-817-FLD-2     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reported Change Procedure (2)";
    }
    OUT MIR-IND-812-817-FLD-3     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Increasing Premium Policy";
    }
    OUT MIR-IND-812-817-FLD-4     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Eligible Rider Policy";
    }
    OUT MIR-IND-812-817-FLD-5     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Non-Automatic-renewal Policy";
    }
    OUT MIR-IND-812-817-FLD-6     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Non-Automatic-renewal Processed";
    }
    OUT MIR-IND-812-817-FLD-7     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Premium-based Benefit Policy";
    }
    OUT MIR-IND-812-817-FLD-8     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferred Payout Policy";
    }
    OUT MIR-ADD3-0-35-FLD-1    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reissued Policy Certification  G";
    }
    OUT MIR-ADD3-0-35-FLD-2    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Change of Dividend Payment Method G";
    }
    OUT MIR-ADD3-0-35-FLD-3    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Health Congratulatory Benefit Accumulation G";
    }
    OUT MIR-ADD3-0-35-FLD-4    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Health Congratulatory Benefit Payment G";
    }
    OUT MIR-ADD3-0-35-FLD-5    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Health Congratulatory Benefit Payment History G";
    }
    OUT MIR-ADD3-0-35-FLD-6   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Vesting G";
    }
    OUT MIR-ADD3-0-35-FLD-7    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Conditions G";
    }
    OUT MIR-ADD3-0-35-FLD-8    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Set Policy Sales G";
    }
    OUT MIR-ADD3-0-35-FLD-9    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Extended Account G";
    }
    OUT MIR-ADD3-0-35-FLD-10    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bank Rider G";
    }
    OUT MIR-ADD3-0-35-FLD-11   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Injury Ride G";
    }
    OUT MIR-ADD3-0-35-FLD-12    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New General Medical Rider Bases G";
    }
    OUT MIR-ADD3-0-35-FLD-13    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Family Medical Rider Bases G";
    }
    OUT MIR-ADD3-0-35-FLD-14    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Adult Disease Rider G";
    }
    OUT MIR-ADD3-0-35-FLD-15    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Sickness Hospitalization Rider G";
    }
    OUT MIR-ADD3-0-35-FLD-16    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Accidental Hospitalization Rider G";
    }
    OUT MIR-ADD3-0-35-FLD-17    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Traffic Accidental Ride G";
    }
    OUT MIR-ADD3-0-35-FLD-18    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Serious Injury Annuity Rider G";
    }
    OUT MIR-ADD3-0-35-FLD-19    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bank Transfer Change G";
    }
    OUT MIR-ADD3-0-35-FLD-20    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Group Dividend Notice G";
    }
    OUT MIR-ADD3-0-35-FLD-21    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Partial Exclusion G ";
    }
    OUT MIR-ADD3-0-35-FLD-22    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Change Information G";
    }
    OUT MIR-ADD3-0-35-FLD-23    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "ABC Rider G";
    }
    OUT MIR-ADD3-0-35-FLD-24    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Whole Life Rider G";
    }
    OUT MIR-ADD3-0-35-FLD-25    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Endowment Rider G";
    }
    OUT MIR-ADD3-0-35-FLD-26    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Eligible Rider Payout Accumulation G";
    }
    OUT MIR-ADD3-0-35-FLD-27    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion E1 G";
    }
    OUT MIR-ADD3-0-35-FLD-28    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Detail Registration G";
    }
    OUT MIR-ADD3-0-35-FLD-29    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferral Benefit Bases G";
    }
    OUT MIR-ADD3-0-35-FLD-30    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferral Benefit History G";
    }
    OUT MIR-ADD3-0-35-FLD-31    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Taxation of Tax Withheld G";
    }
    OUT MIR-ADD3-0-35-FLD-32    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity Care Shift G";
    }
    OUT MIR-ADD3-0-35-FLD-33    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "21th Century Saving Bases G";
    }
    OUT MIR-ADD3-0-35-FLD-34    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Term Insurance Rider G";
    }
    OUT MIR-ADD3-0-35-FLD-35    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Vesting Whole Life Benefit  G";
    }
    OUT MIR-ADD3-0-35-FLD-36   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deposit History 2G";
    }
    OUT MIR-IND-0-1-FLD-1    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Conversion Deposit History G";
    }
    OUT MIR-IND-0-1-FLD-2    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New ConversionSpecial Dividend PaymentＧ";
    }
    OUT MIR-ADB-RIDER    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Additional Indicator 4/New Accidental Add. Oatment RiderＧ";
    }
    OUT MIR-IND-3-35-FLD-1    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Trail CommissionＧ";
    }
    OUT MIR-IND-3-35-FLD-2    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Whole Life Payment MaturityＧ";
    }
    OUT MIR-IND-3-35-FLD-3    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Whole Life Special DividendＧ";
    }
    OUT MIR-IND-3-35-FLD-4    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Tax Certificate Advance Payment PremiumＧ";
    }
    OUT MIR-IND-3-35-FLD-5    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Tax Certificate Change PremiumＧ";
    }
    OUT MIR-IND-3-35-FLD-6    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferral Premium InterestＧ";
    }
    OUT MIR-IND-3-35-FLD-7    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Term Life Rider with Survivor Benefit Ｇ";
    }
    OUT MIR-IND-3-35-FLD-8    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferral Survior Benefit DeferralＧ";
    }
    OUT MIR-IND-3-35-FLD-9    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "SurvivorBenefit PaymentＧ";
    }
    OUT MIR-IND-3-35-FLD-10    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Survivor Benefit Payment HistoryＧ";
    }
    OUT MIR-IND-3-35-FLD-11    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Children Insurance BasicＧ";
    }
    OUT MIR-IND-3-35-FLD-12    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferral Congratulatory MoneyＧ";
    }
    OUT MIR-IND-3-35-FLD-13    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Congratulatory Money PaymentＧ";
    }
    OUT MIR-IND-3-35-FLD-14   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Congratulatory Money Payment HistoryＧ";
    }
    OUT MIR-IND-3-35-FLD-15    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion Adjustment DividendＧ";
    }
    OUT MIR-IND-3-35-FLD-16    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Advance Payment Unallocated Dividend RateHistoryＧ";
    }
    OUT MIR-IND-3-35-FLD-17    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Set Sales 2G";
    }
    OUT MIR-IND-3-35-FLD-18    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Injury Rider Family HistoryＧ";
    }
    OUT MIR-IND-3-35-FLD-19    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accdental Hospitalization Rider Family HistoryＧ";
    }
    OUT MIR-IND-3-35-FLD-20    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Sickness Hospitalization Rider Family HistoryＧ";
    }
    OUT MIR-IND-3-35-FLD-21    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Outpatient Rider Family HistoryＧ";
    }
    OUT MIR-IND-3-35-FLD-22    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Term Life RiderＧ";
    }
    OUT MIR-IND-3-35-FLD-23    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Family Term Life RiderSpouse TypeＧ";
    }
    OUT MIR-IND-3-35-FLD-24    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Family term Life RiderChild TypeＧ";
    }
    OUT MIR-IND-3-35-FLD-25    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Injury RiderＧ";
    }
    OUT MIR-IND-3-35-FLD-26    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Hospitalization RiderＧ";
    }
    OUT MIR-IND-3-35-FLD-27    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Sicknes Hospitalization RiderＧ";
    }
    OUT MIR-IND-3-35-FLD-28    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Outpatient RiderＧ";
    }
    OUT MIR-IND-3-35-FLD-29    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Whole Life RIderＧ";
    }
    OUT MIR-IND-3-35-FLD-30    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Endowment RiderＧ";
    }
    OUT MIR-IND-3-35-FLD-31    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Family Medical Rider BasicＧ";
    }
    OUT MIR-IND-3-35-FLD-32    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Adult Desease RiderＧ";
    }
    OUT MIR-IND-3-35-FLD-33    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Living Needs PaymentＧ";
    }
    OUT MIR-IND-1410-11-FLD-1      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "1991 New Conversion Policy";
    }
    OUT MIR-IND-1410-11-FLD-2      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Step Payment Surrender";
    }
    OUT MIR-LIVNG-NEED-RID      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Living Needs Rider Addition Policy";
    }
    OUT MIR-IND-1413-17-FLD-1       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Excluding Sickness・Hosp.Rider with Child Policy";
    }
    OUT MIR-IND-1413-17-FLD-2       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "P Base Policy New Business Policy";
    }
    OUT MIR-IND-1413-17-FLD-3       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy which rider payment term is longer than Base policy payment term";
    }
    OUT MIR-IND-1413-17-FLD-4       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Rider Updating Processing１";
    }
    OUT MIR-IND-1413-17-FLD-5       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Rider Updating Processing２";
    }
    OUT MIR-DIST-MEMBRS       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Distributor Members";
    }
    OUT MIR-OWNR-DTH      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Policy Owner Death";
    }
    OUT MIR-NYOSE-NT-ALWD       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Bank Account ‘Nayose’ not allowed";
    }
    OUT MIR-IND-1421-31-FLD-1       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Financial Reinsurance";
    }
    OUT MIR-IND-1421-31-FLD-2       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Initial Payment Bank Account Policy";
    }
    OUT MIR-IND-1421-31-FLD-3       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Coverage Renewal Reserve";
    }
    OUT MIR-IND-1421-31-FLD-4       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Coverage Renewal Settlement";
    }
    OUT MIR-IND-1421-31-FLD-5       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bank AccountExpiraration Policy";
    }
    OUT MIR-IND-1421-31-FLD-6       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Automatic Sending Money Policy";
    }
    OUT MIR-IND-1421-31-FLD-7       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Provision Change Policy";
    }
    OUT MIR-IND-1421-31-FLD-8       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Customer Identification not Created";
    }
    OUT MIR-IND-1421-31-FLD-9       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Customer Identification Created after Policy Issue";
    }
    OUT MIR-IND-1421-31-FLD-10       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "UI Products Type Change Policy";
    }
    OUT MIR-IND-1421-31-FLD-11       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Universal Change Plan Policy";
    }
    OUT MIR-MGA-POL       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/MGA Policy";
    }
    OUT MIR-BULK-APP-POL       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Bulk Application Policy";
    }
    OUT MIR-IND-1434-35-FLD-1       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Type Change from Preferred Products";
    }
    OUT MIR-IND-1434-35-FLD-2      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Master Reorganization Processed";
    }
    OUT MIR-LOW-CSV-IND       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Low-CSV Provision";
    }
    OUT MIR-FID-POL       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/FID Policy";
    }
    OUT MIR-SLF-EMPLR-POL       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Self Employer Policy";
    }
    OUT MIR-MED-SEL-IND       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Medical Selection Bit";
    }
    OUT MIR-UEPREM-REF-APP        
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Unearned Premium Refund Applied";
    }
    OUT MIR-STEP-IN-RT-APP       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Step-in Right Applied Policy";
    }
    OUT MIR-DFRNT-PAYMNT-POL-2      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Different Number of Payment Policy 2";
    }
    OUT MIR-DFRNT-PAYMNT-POL-3    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Different Number of Payment Policy 3";
    }
    OUT MIR-CASHLESS-2P       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/2P Cashless Bit";
    }
    OUT MIR-FLD-1445      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/ManuMate Joint Solicitation";
    }
    OUT MIR-ADD5-0-35-FLD-1       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Change Proxess Info.Ｇ";
    }
    OUT MIR-ADD5-0-35-FLD-2       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Using Bonus Payment Basic G";
    }
    OUT MIR-ADD5-0-35-FLD-3       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bank Rider Using Bonus Payment";
    }
    OUT MIR-ADD5-0-35-FLD-4       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Term LifeRider Using Bonus PaymentＧ";
    }
    OUT MIR-ADD5-0-35-FLD-5      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Female Sickness Hospitalization Ride Ｇ";
    }
    OUT MIR-ADD5-0-35-FLD-6      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity Benefit RiderＧ";
    }
    OUT MIR-ADD5-0-35-FLD-7       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Additional Survivor Benefit DeferralＧ";
    }
    OUT MIR-ADD5-0-35-FLD-8       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferral VestingＧ";
    }
    OUT MIR-ADD5-0-35-FLD-9       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Trail Commission for Interm AddiionＧ";
    }
    OUT MIR-ADD5-0-35-FLD-10       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Term Life Special Dividend AmountＧ";
    }
    OUT MIR-ADD5-0-35-FLD-11       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferral Special Dividend Ｇ";
    }
    OUT MIR-ADD5-0-35-FLD-12       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Advance Payment Management AcceptＧ";
    }
    OUT MIR-ADD5-0-35-FLD-13      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Performance ２Ｇ";
    }
    OUT MIR-ADD5-0-35-FLD-14       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion NewＥ１Ｇ";
    }
    OUT MIR-ADD5-0-35-FLD-15       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Income Guaranteed RiderＧ";
    }
    OUT MIR-ADD5-0-35-FLD-16       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Long Term Hospitalization RiderＧ";
    }
    OUT MIR-ADD5-0-35-FLD-17       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "LongTermHospitalization Family HistoryＧ";
    }
    OUT MIR-ADD5-0-35-FLD-18       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Leaving Hospital RiderＧ";
    }
    OUT MIR-ADD5-0-35-FLD-19       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Leaving Hospital Rider Family HistoryＧ";
    }
    OUT MIR-ADD5-0-35-FLD-20       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Allocation G:";
    }
    OUT MIR-ADD5-0-35-FLD-21       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Rider Update Info.Ｇ";
    }
    OUT MIR-ADD5-0-35-FLD-22       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lapse・Surrender Info.Ｇ";
    }
    OUT MIR-ADD5-0-35-FLD-23       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Application Form Management Ｇ";
    }
    OUT MIR-ADD5-0-35-FLD-24       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment AccountＧ";
    }
    OUT MIR-ADD5-0-35-FLD-25       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Special Sickness Coverage RiderＧ";
    }
    OUT MIR-ADD5-0-35-FLD-26       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Outpatient RiderＧ";
    }
    OUT MIR-ADD5-0-35-FLD-27       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Outpatient Rider Family HistoryＧ";
    }
    OUT MIR-ADD5-0-35-FLD-28       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Cancer Check-up Lump Sum maountＧ";
    }
    OUT MIR-ADD5-0-35-FLD-29       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Duplication Ｇ";
    }
    OUT MIR-ADD5-0-35-FLD-30       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity Payment Term Life RiderＧ";
    }
    OUT MIR-ADD5-0-35-FLD-31       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Saving RiderＧ";
    }
    OUT MIR-ADD5-0-35-FLD-32       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Provision Change BasicＧ";
    }
    OUT MIR-ADD5-0-35-FLD-33       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Provision Change RiderＧ";
    }
    OUT MIR-ADD5-0-35-FLD-34       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Base Policy Info at UpdateＧ";
    }
    OUT MIR-ADD5-0-35-FLD-35       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Provision Change AnnuityＧ";
    }
    OUT MIR-ADD5-0-35-FLD-36
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Accidental Outpatient RiderＧ";
    }
    OUT MIR-ADD6-0-24-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "No-Accident Benefit Payment G";
    }
    OUT MIR-ADD6-0-24-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Dealth Benefit G";
    }
    OUT MIR-ADD6-0-24-FLD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Adult Disease Rider G";
    }
    OUT MIR-ADD6-0-24-FLD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Sickness Hospitalization Rider G";
    }
    OUT MIR-ADD6-0-24-FLD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Hospitalization Rider G";
    }
    OUT MIR-ADD6-0-24-FLD-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Injury RiderG";
    }
    OUT MIR-ADD6-0-24-FLD-7
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Term Insurance with Survivor Benefit  Rider G";
    }
    OUT MIR-ADD6-0-24-FLD-8
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Outpatient Rider G";
    }
    OUT MIR-ADD6-0-24-FLD-9
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Female Sickness Hospitalization Rider G";
    }
    OUT MIR-ADD6-0-24-FLD-10
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Long-Term Hospitalization Rider G";
    }
    OUT MIR-ADD6-0-24-FLD-11
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Discharge Hospital Rider G";
    }
    OUT MIR-ADD6-0-24-FLD-12
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Living Benefit Payout History G";
    }
    OUT MIR-ADD6-0-24-FLD-13
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Cancer Insurance G";
    }
    OUT MIR-ADD6-0-24-FLD-14
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bulk Wire Transfer G";
    }
    OUT MIR-ADD6-0-24-FLD-15
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Distributer Agent Information G";
    }
    OUT MIR-ADD6-0-24-FLD-16
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Exclusion for Certain Disability G";
    }
    OUT MIR-ADD6-0-24-FLD-17
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Proxy Beneficiary Provision G";
    }
    OUT MIR-ADD6-0-24-FLD-18
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "FID Bank Agent Information G";
    }
    OUT MIR-ADD6-0-24-FLD-19
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policyholder Phone Number G";
    }
    OUT MIR-ADD6-0-24-FLD-20
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Initial Payment Deposit G";
    }
    OUT MIR-ADD6-0-24-FLD-21
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Dummy1";
    }
    OUT MIR-ADD6-0-24-FLD-22
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Tax Certificate Change Premium2Ｇ";
    }
    OUT MIR-ADD6-0-24-FLD-23
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Base Policy Information at Renewal G";
    }
    OUT MIR-INS-3DD-G
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Additional Indicator 6/3DD Insurance G";
    }
    OUT MIR-ADD6-26-35-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "ALD Rider G";
    }
    OUT MIR-ADD6-26-35-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "異動情報２Ｇ";
    }
    OUT MIR-ADD6-26-35-FLD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "災害対応情報";
    }
    OUT MIR-ADD6-26-35-FLD-4
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "ダミー２";
    }
    OUT MIR-SUB-STD-DED 
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard G/Deduction due to Substandard ";
    }
    OUT MIR-SUB-STD-AGE  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard G/Age Addition due to Substandard";
    }
    OUT MIR-SUB-STD-SPR-RT   
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard G/Substandard Special Premium Rate for Base Policy";
    }
    OUT MIR-SUB-STD-TL-SPR-RT   
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Substandard G/Term Life Type Substandard Special Premium Rate";
    }
    OUT MIR-TINS-GSC  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Group Scale Code";
    }
    OUT MIR-TINS-BP-PREM   
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Update Base Policy Premium";
    }
    OUT MIR-TINS-RID-PREM   
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Update Rider Premium Total";
    }
    OUT MIR-TINS-NO-IND   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New/Old Indicator";
    }
    OUT MIR-TINS-UPDT-X1   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Update X1";
    }
    OUT MIR-TINS-UPDT-X2  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Update X2";
    }
    OUT MIR-TINS-UPDT-SYOS    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Update 'Syosyu'";
    }
    OUT MIR-TINS-UPDT-M    
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Update M";
    }
    OUT MIR-TINS-UPDT-NUM 
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Update";
    }
    OUT MIR-TINS-NPOL-ISS-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "New Policy Issue Date";
    }
    OUT MIR-REINS-NUM
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Reinsurance Number";
    }
    OUT MIR-REINS-CED-PCT    
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Ceding Percentage";
    }
    OUT MIR-REINS-CED-FA   
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Death of Cedant S";
    }
    OUT MIR-REINS-CED-AMT  
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Ceding Amount at New Business(A)";
    }
    OUT MIR-REINS-MORT-RT 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Insured Mortality Rate (MR)";
    }
    OUT MIR-REINS-TERM-CD   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reinsurance Validation Termination Code";
    }
    OUT MIR-PERFOR-SUM-IND
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Performance Summing Up Indicator";
    }
    OUT MIR-PERFOR-3DD-PREM   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "3DD Rider Premium at New Business";
    }
    OUT MIR-PERFOR-RA-CD
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Rider Agency Code";
    }
    OUT MIR-PERFOR-SC-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Share Contract Indicator";
    }
    OUT MIR-PERFOR-VW-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Variable Writing Indicator";
    }
    OUT MIR-LOAN-UADDR-IND  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Address Unnecessary Bit";
    }
    OUT  MIR-LOAN-SHR-NUM   
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Shared Number";
    }
    OUT MIR-LOAN-LOAN-AMT 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Current Loan Amount";
    }
    OUT MIR-LOAN-INT-DIFF 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest Excessiveness and Difficiency";
    }
    OUT MIR-LOAN-INT  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Loan Interest";
    }
    OUT MIR-LOAN-INT-DT    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Interest Valid Date";
    }
    OUT MIR-LOAN-DT  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date of Loan";
    }
    OUT MIR-LOAN-DUE-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Due Date of Policy Payment";
    }
    OUT MIR-LOAN-INT-CALC
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interest Calculation Division";
    }
    OUT MIR-LR-PROV-LAPS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Provision Lapse Bit";
    }
    OUT MIR-LR-STAT-LAPS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Statics Lapse Bit";
    }
    OUT MIR-LR-PROV-REIN-IND   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Provision Reinstatement Bit";
    }
    OUT MIR-LR-STAT-REIN-IND  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Statics Reinstatement Bit";
    }
    OUT MIR-LR-REIN-SD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reinstatement Self Disclosure Bit";
    }
    OUT MIR-LR-REIN-UW-IND   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reinstatement Underwriting Bit";
    }
    OUT MIR-LR-REIN-REJ-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reinstatement Rejection Bit";
    }
    OUT MIR-LR-PROV-LAPS-DT  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Provision Lapse Date";
    }
    OUT MIR-LR-STAT-EXP-YR     
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Statics Expiraration Year";
    }
    OUT MIR-LR-PROV-REIN-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Provision Reinstatement Date";
    }
    OUT MIR-PAID-UP-AUT-IND  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Automatic Paid Up Bit";
    }
    OUT MIR-PAID-UP-CAP-AMT 
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Paid Up Capital";
    }
    OUT MIR-PAID-UP-DTH-CLM-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Paid Up Death Claim";
    }
    OUT MIR-PAID-UP-COMM-DT   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Paid Up Commence Date";
    }
    OUT MIR-APL-PRV-AMT-INT 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Previous APL Amount and Interest";
    }
    OUT MIR-APL-CURR-AMT  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "APL Amount for this time";
    }
    OUT MIR-APL-CURR-MNTHS
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of APL Month";
    }
    OUT MIR-APL-YR-MNTHS  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Number of APL Year and Month";
    }
    OUT MIR-APL-ACCU-AMT 
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Accumulated APL Amount";
    }
    OUT MIR-APL-ACCU-YR-MO  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Accumulated APL Year and Month";
    }
    OUT MIR-FAP-ADV-PMT-MNTH  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Advanced Payment Fix Month";
    }
    OUT MIR-FAP-ADV-PMT-MO-CNT  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Advanced Payment Fix Months";
    }
    OUT MIR-AAC-XFER-CTL 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Transfer CTL";
    }
    OUT MIR-AAC-PRV-DEAL-BR  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Former Dealing Branch";
    }
    OUT MIR-AAC-PRV-DEAL-EMPL
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Former Dealing Employee";
    }
    OUT MIR-AAC-PRV-GRP-CD
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Former Group Code";
    }
    OUT MIR-AAC-PRV-DIST-CD
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Former Dstributor Code";
    }
    OUT MIR-AAC-XFER-IN-DT  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date of Moving in(Transfer)";
    }
    OUT MIR-AAC-XFER-OUT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date of Moving out(Trasfer)";
    }
    OUT MIR-PAC-BT-SUSP-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bank Transfer Suspense Bit";
    }
    OUT MIR-PAC-BT-XFER-DT  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Bank Transfer Date";
    }
    OUT MIR-PAC-CODE-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Code Indicator";
    }
    OUT MIR-PAC-DIST
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Distributor or Group";
    }
    OUT MIR-PAC-ACCT-NUM      
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Account Number";
    }
    OUT MIR-PAC-BNK-CD  
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Code";
    }
    OUT MIR-PAC-BRCH-CD 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Branch Code";
    }
    OUT MIR-PAC-DEP-TYP   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Deposit Type";
    }
    OUT MIR-PAC-XFER-DAY   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Transfer Date";
    }
    OUT MIR-PAC-FRST-XFER-MNTH     
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "The First Transfer Deduction Month";
    }
    OUT MIR-PAC-ACC-HLDR-NM   
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Account Holder Name";
    }
    OUT MIR-GROUP-BUS-VOL-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Business Vouluntary Bit";
    }
    OUT MIR-GROUP-AGNCY    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Agency";
    }
    OUT MIR-GROUP-DEPT-CD
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Departmental(belonging) Code";
    }
    OUT MIR-GROUP-GRP-CD     
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Group Code";
    }
    OUT MIR-GROUP-DIST-CD
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Distributor Code";
    }
    OUT MIR-GROUP-EMP-CD  
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Employee Code";
    }
    OUT MIR-REINST-MED-UW-IND     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Medical UW Completion Bit";
    }
    OUT MIR-REINST-TYP-IN-BRCH    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Typein Branch";
    }
    OUT MIR-REINST-DECL-DT     
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Declaration Date";
    }
    OUT MIR-REINST-WAIT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Waiting Date of Reinstatement";
    }
    OUT MIR-OVRDUE-INT-ADJ-DT   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Adjustment Date of Overdue Interest";
    }
    OUT MIR-OVRDUE-INT-EXT-INT     
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Necessary extension of Interest";
    }
    OUT MIR-OVRDUE-INT-ADJ-AMT     
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Adjustment Amount of Overdue Interest";
    }
    OUT MIR-LH-PREV-INT-EFF-DT    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Previous Effective Interest Date";
    }
    OUT MIR-LH-LOAN-AMT      
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Loan Amount";
    }
    OUT MIR-LH-HNDL-BRCH-1  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling Branch (Moving-in Branch)(1)";
    }

    OUT MIR-LH-CHNG-DEPT-1  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department, dealing with the change to Individual(1)";
    }

    OUT MIR-LH-JRNL-DT-1    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date(1)";
    }

    OUT MIR-LH-STRT-DT-1    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan History G/Start Date(1)";
    }

    OUT MIR-LH-TRXN-CD-1    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Transaction Code(1)";
    }

    OUT MIR-LH-INT-1        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest (uncollect+ unearned -  )(1)";
    }

    OUT MIR-LH-LOAN-REPAY-1 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan (Repayment)(1)";
    }

    OUT MIR-LH-LOAN-BAL-1   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Amount(1)";
    }
    OUT MIR-LH-HNDL-BRCH-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling Branch (Moving-in Branch)(2)";
    }

    OUT MIR-LH-CHNG-DEPT-2  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department, dealing with the change to Individual(2)";
    }

    OUT MIR-LH-JRNL-DT-2    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date(2)";
    }

    OUT MIR-LH-STRT-DT-2    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan History G/Start Date(2)";
    }

    OUT MIR-LH-TRXN-CD-2    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Transaction Code(2)";
    }

    OUT MIR-LH-INT-2        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest (uncollect+ unearned -  )(2)";
    }

    OUT MIR-LH-LOAN-REPAY-2 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan (Repayment)(2)";
    }

    OUT MIR-LH-LOAN-BAL-2   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Amount(2)";
    }
    OUT MIR-LH-HNDL-BRCH-3 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling Branch (Moving-in Branch)(3)";
    }

    OUT MIR-LH-CHNG-DEPT-3  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department, dealing with the change to Individual(3)";
    }

    OUT MIR-LH-JRNL-DT-3    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date(3)";
    }

    OUT MIR-LH-STRT-DT-3    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan History G/Start Date(3)";
    }

    OUT MIR-LH-TRXN-CD-3    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Transaction Code(3)";
    }

    OUT MIR-LH-INT-3        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest (uncollect+ unearned -  )(3)";
    }

    OUT MIR-LH-LOAN-REPAY-3 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan (Repayment)(3)";
    }

    OUT MIR-LH-LOAN-BAL-3   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Amount(3)";
    }
    OUT MIR-LH-HNDL-BRCH-4  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling Branch (Moving-in Branch)(4)";
    }

    OUT MIR-LH-CHNG-DEPT-4  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department, dealing with the change to Individual(4)";
    }

    OUT MIR-LH-JRNL-DT-4    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date(4)";
    }

    OUT MIR-LH-STRT-DT-4    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan History G/Start Date(4)";
    }

    OUT MIR-LH-TRXN-CD-4    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Transaction Code(4)";
    }

    OUT MIR-LH-INT-4        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest (uncollect+ unearned -  )(4)";
    }

    OUT MIR-LH-LOAN-REPAY-4 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan (Repayment)(4)";
    }

    OUT MIR-LH-LOAN-BAL-4   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Amount(4)";
    }
    OUT MIR-LH-HNDL-BRCH-5  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling Branch (Moving-in Branch)(5)";
    }

    OUT MIR-LH-CHNG-DEPT-5  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department, dealing with the change to Individual(5)";
    }

    OUT MIR-LH-JRNL-DT-5    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date(5)";
    }

    OUT MIR-LH-STRT-DT-5    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan History G/Start Date(5)";
    }

    OUT MIR-LH-TRXN-CD-5    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Transaction Code(5)";
    }

    OUT MIR-LH-INT-5        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest (uncollect+ unearned -  )(5)";
    }

    OUT MIR-LH-LOAN-REPAY-5 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan (Repayment)(5)";
    }

    OUT MIR-LH-LOAN-BAL-5   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Amount(5)";
    }

    OUT MIR-LH-HNDL-BRCH-6  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling Branch (Moving-in Branch)(6)";
    }

    OUT MIR-LH-CHNG-DEPT-6  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department, dealing with the change to Individual(6)";
    }

    OUT MIR-LH-JRNL-DT-6    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date(6)";
    }

    OUT MIR-LH-STRT-DT-6    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan History G/Start Date(6)";
    }

    OUT MIR-LH-TRXN-CD-6    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Transaction Code(6)";
    }

    OUT MIR-LH-INT-6        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest (uncollect+ unearned -  )(6)";
    }

    OUT MIR-LH-LOAN-REPAY-6 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan (Repayment)(6)";
    }

    OUT MIR-LH-LOAN-BAL-6   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Amount(6)";
    }

    OUT MIR-BNFT-HIST-TXN-CD-1
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Benefit History Transaction Code(1)";
    }
    OUT MIR-BNFT-HIST-TXN-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Transaction Date(1)";
    }
    OUT MIR-BNFT-HIST-VAL-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Valid Date(1)";
    }
    OUT MIR-BNFT-HIST-S1-1    
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S1(1)";
    }
    OUT MIR-BNFT-HIST-S2-1   
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S2(1)";
    } 

    OUT MIR-BNFT-HIST-TXN-CD-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Benefit History Transaction Code(2)";
    }
    OUT MIR-BNFT-HIST-TXN-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Transaction Date(2)";
    }
    OUT MIR-BNFT-HIST-VAL-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Valid Date(2)";
    }
    OUT MIR-BNFT-HIST-S1-2    
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S1(2)";
    }
    OUT MIR-BNFT-HIST-S2-2   
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S2(2)";
    } 

    OUT MIR-BNFT-HIST-TXN-CD-3
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Benefit History Transaction Code(3)";
    }
    OUT MIR-BNFT-HIST-TXN-DT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Transaction Date(3)";
    }
    OUT MIR-BNFT-HIST-VAL-DT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Valid Date(3)";
    }
    OUT MIR-BNFT-HIST-S1-3    
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S1(3)";
    }
    OUT MIR-BNFT-HIST-S2-3   
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S2(3)";
    } 

    OUT MIR-BNFT-HIST-TXN-CD-4
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Benefit History Transaction Code(4)";
    }
    OUT MIR-BNFT-HIST-TXN-DT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Transaction Date(4)";
    }
    OUT MIR-BNFT-HIST-VAL-DT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Valid Date(4)";
    }
    OUT MIR-BNFT-HIST-S1-4    
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S1(4)";
    }
    OUT MIR-BNFT-HIST-S2-4   
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S2(4)";
    } 

    OUT MIR-BNFT-HIST-TXN-CD-5
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Benefit History Transaction Code(5)";
    }
    OUT MIR-BNFT-HIST-TXN-DT-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Transaction Date(5)";
    }
    OUT MIR-BNFT-HIST-VAL-DT-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Valid Date(5)";
    }
    OUT MIR-BNFT-HIST-S1-5    
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S1(5)";
    }
    OUT MIR-BNFT-HIST-S2-5   
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S2(5)";
    } 
    OUT MIR-BNFT-HIST-TXN-CD-6
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Benefit History Transaction Code(6)";
    }
    OUT MIR-BNFT-HIST-TXN-DT-6
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Transaction Date(6)";
    }
    OUT MIR-BNFT-HIST-VAL-DT-6
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Valid Date(6)";
    }
    OUT MIR-BNFT-HIST-S1-6    
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S1(6)";
    }
    OUT MIR-BNFT-HIST-S2-6   
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S2(6)";
    } 

    OUT MIR-DEP-HIST-PREM-DEP-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Premium Deposit(1)";
    } 
    OUT MIR-DEP-HIST-DIV-PAYO-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Payout (Chargeback)(1)";
    } 
    OUT MIR-DEP-HIST-AMT-ADJ-1 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Over/short Amount Adjustment(1)";
    } 
    OUT MIR-DEP-HIST-LOAN-RPY-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Loan Repayment(1)";
    } 
    OUT MIR-DEP-HIST-INT-DEP-1 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Overdue Interest Deposit (1)";
    } 
    OUT MIR-DEP-HIST-PREM-REF-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Premium Refund (1)";
    } 
    OUT MIR-DEP-HIST-DEP-CNT-1 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department History Department Count (1)";
    } 
    OUT MIR-DEP-HIST-DEALR-1   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Department History Dealer (1)";
    } 
    OUT MIR-DEP-HIST-PAYO-DT-1 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department History Payout Date (1)";
    } 


    OUT MIR-DEP-HIST-PREM-DEP-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Premium Deposit(2)";
    } 
    OUT MIR-DEP-HIST-DIV-PAYO-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Payout (Chargeback)(2)";
    } 
    OUT MIR-DEP-HIST-AMT-ADJ-2 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Over/short Amount Adjustment(2)";
    } 
    OUT MIR-DEP-HIST-LOAN-RPY-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Loan Repayment(2)";
    } 
    OUT MIR-DEP-HIST-INT-DEP-2 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Overdue Interest Deposit (2)";
    } 
    OUT MIR-DEP-HIST-PREM-REF-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Premium Refund (2)";
    } 
    OUT MIR-DEP-HIST-DEP-CNT-2 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department History Department Count (2)";
    } 
    OUT MIR-DEP-HIST-DEALR-2   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Department History Dealer (2)";
    } 
    OUT MIR-DEP-HIST-PAYO-DT-2 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department History Payout Date (2)";
    } 


    OUT MIR-DEP-HIST-PREM-DEP-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Premium Deposit(3)";
    } 
    OUT MIR-DEP-HIST-DIV-PAYO-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Payout (Chargeback)(3)";
    } 
    OUT MIR-DEP-HIST-AMT-ADJ-3 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Over/short Amount Adjustment(3)";
    } 
    OUT MIR-DEP-HIST-LOAN-RPY-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Loan Repayment(3)";
    } 
    OUT MIR-DEP-HIST-INT-DEP-3 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Overdue Interest Deposit (3)";
    } 
    OUT MIR-DEP-HIST-PREM-REF-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Premium Refund (3)";
    } 
    OUT MIR-DEP-HIST-DEP-CNT-3 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department History Department Count (3)";
    } 
    OUT MIR-DEP-HIST-DEALR-3   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Department History Dealer (3)";
    } 
    OUT MIR-DEP-HIST-PAYO-DT-3 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department History Payout Date (3)";
    } 

    OUT MIR-DEP-HIST-PREM-DEP-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Premium Deposit(4)";
    } 
    OUT MIR-DEP-HIST-DIV-PAYO-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Payout (Chargeback)(4)";
    } 
    OUT MIR-DEP-HIST-AMT-ADJ-4 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Over/short Amount Adjustment(4)";
    } 
    OUT MIR-DEP-HIST-LOAN-RPY-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Loan Repayment(4)";
    } 
    OUT MIR-DEP-HIST-INT-DEP-4 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Overdue Interest Deposit (4)";
    } 
    OUT MIR-DEP-HIST-PREM-REF-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Premium Refund (4)";
    } 
    OUT MIR-DEP-HIST-DEP-CNT-4 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department History Department Count (4)";
    } 
    OUT MIR-DEP-HIST-DEALR-4   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Department History Dealer (4)";
    } 
    OUT MIR-DEP-HIST-PAYO-DT-4 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department History Payout Date (4)";
    } 

    OUT MIR-DEP-HIST-PREM-DEP-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Premium Deposit(5)";
    } 
    OUT MIR-DEP-HIST-DIV-PAYO-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Payout (Chargeback)(5)";
    } 
    OUT MIR-DEP-HIST-AMT-ADJ-5 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Over/short Amount Adjustment(5)";
    } 
    OUT MIR-DEP-HIST-LOAN-RPY-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Loan Repayment(5)";
    } 
    OUT MIR-DEP-HIST-INT-DEP-5 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Overdue Interest Deposit (5)";
    } 
    OUT MIR-DEP-HIST-PREM-REF-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Premium Refund (5)";
    } 
    OUT MIR-DEP-HIST-DEP-CNT-5 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department History Department Count (5)";
    } 
    OUT MIR-DEP-HIST-DEALR-5   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Department History Dealer (5)";
    } 
    OUT MIR-DEP-HIST-PAYO-DT-5 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department History Payout Date (5)";
    } 


    OUT MIR-DEP-HIST-PREM-DEP-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Premium Deposit(6)";
    } 
    OUT MIR-DEP-HIST-DIV-PAYO-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Payout (Chargeback)(6)";
    } 
    OUT MIR-DEP-HIST-AMT-ADJ-6 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Over/short Amount Adjustment(6)";
    } 
    OUT MIR-DEP-HIST-LOAN-RPY-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Loan Repayment(6)";
    } 
    OUT MIR-DEP-HIST-INT-DEP-6 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Overdue Interest Deposit (6)";
    } 
    OUT MIR-DEP-HIST-PREM-REF-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Premium Refund (6)";
    } 
    OUT MIR-DEP-HIST-DEP-CNT-6 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department History Department Count (6)";
    } 
    OUT MIR-DEP-HIST-DEALR-6   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Department History Dealer (6)";
    } 
    OUT MIR-DEP-HIST-PAYO-DT-6 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department History Payout Date (6)";
    } 

    OUT MIR-DEP-HIST-SP-YRMO  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Amount of Months of special payment";
    } 
    OUT MIR-REISU-POL-FREQ  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Frequency of the Reissued Policy";
    } 
    OUT MIR-REISU-POL-DT                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date of the Reissued Policy";
    } 
    OUT MIR-PC1-SELF-COL             
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy of Self-Collection";
    } 
    OUT MIR-PC1-UDED-CERT          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Unnecessary Deduction Certification Policy";
    } 
    OUT MIR-PC1-BNKRPT        
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bankrupt Policy";
    }      
    OUT MIR-PC1-CLM-ATCH           
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Claim Attachment Policy";
    } 
    OUT MIR-PC1-MISING             
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Missing policy";
    } 
    OUT MIR-PC1-EYE-DISAB          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Eyesight Disability Policy";
    } 
    OUT MIR-PC1-15PR-TAX           
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "15% Taxation Policy";
    } 
    OUT MIR-PC1-20PR-TAX           
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "20% Taxation Policy";
    } 
    OUT MIR-PC1-S-REQ              
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Under S Requirement Policy";
    } 
    OUT MIR-PC1-SP-REQ             
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "under SP Requirement Policy";
    } 
    OUT MIR-PC1-CAUT               
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Caution Needed Policy";
    } 
    OUT MIR-PC1-RE-CONVRT          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Re-conversional Policy";
    } 
    OUT MIR-PC1-NLOAN-SET          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "National Loan Set Policy";
    } 
    OUT MIR-PC1-VAR-INS            
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Variable Insurance Policy";
    } 
    OUT MIR-PC1-GEN-INFO-NO        
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "General Information Unneeded Policy";
    } 
    OUT MIR-PC1-OWNR-WRTNG         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "PolicyHolders Writing Policy";
    } 
    OUT MIR-PC1-P-REQ              
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "P Requirement Policy before the conversion Policy";
    } 
    OUT MIR-PC1-PAYO-CNF           
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Confirmation Required at Benefit Payout";
    } 
    OUT MIR-PC2-UNSENT-POL-STMT    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "unsent Policy Statement Policy";
    } 
    OUT MIR-PC2-SMKATA             
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Samakata Policy";
    } 
    OUT MIR-PC2-AGT-BEN-PMT        
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Authorized Agent benefit Payment";
    } 
    OUT MIR-PC2-SELF-PRD           
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Self Produced Policy";
    } 
    OUT MIR-PC2-FAM-PRD            
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Family Produced Policy";
    } 
    OUT MIR-PC2-REF-FAIL-IND       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Maturity or surrender Refund Failed Bit";
    } 
    OUT MIR-PC2-BEN-CAUTN          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Health Congratulatory or Survivor Benefit caution Needed";
    } 
    OUT MIR-PC2-AUT-LAPS-SURR      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Automatic Post Lapse Surrender Applied";
    } 
    OUT MIR-PC2-ASGN-TERM          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Assignment Terminated";
    } 
    OUT MIR-PC2-FA-RED-HIST        
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "FA Reduction History exists";
    } 
    OUT MIR-PC2-TAX-CERT-IND       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Tax Certificate not Created Bit";
    } 
    OUT MIR-PC2-DUMMY                  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Dummy";
    } 
    OUT MIR-PC2-V-PER-LNCH             
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "V Percentage Launch Policy";
    } 
    OUT MIR-PC2-INSRD-OCC-CD           
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "(insured) Occupation Code";
    } 
    OUT MIR-PC2-SPCL-RECOG-CD          
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Special Recognition Code";
    } 
    OUT MIR-MTHLY-PREM-P1              
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Net Premium Amount Per Month (P1)";
    } 
    OUT MIR-MTHLY-PREM-P2              
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Net Premium Amount Per Month (P2)";
    } 
    OUT MIR-MTHLY-CNVR-PREM            
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Net Conversion Premium Amount per Month";
    } 
    OUT MIR-BT-APP-REG-DT              
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Bank Transfer Application Reg Date";
    } 
    OUT MIR-BT-APP-DEAL-BR             
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Bank Transfer Application Dealing Branch";
    } 
    OUT MIR-BT-EFF-DT                  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "bank Transfer Effective Date";
    } 
    OUT MIR-BT-OLD-DLNG                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "old Dealing";
    } 
    OUT MIR-BT-OLD-BNK-CD              
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Old Bank code";
    } 
    OUT MIR-BT-OLD-BRCH-CD             
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Old Branch Code";
    } 
    OUT MIR-BT-DLNG-DIV1 
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Dealing Division";
    } 
    OUT MIR-BT-IP-BRCH1  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Input Branch";
    } 
    OUT MIR-BT-IP-AGCY1  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Input Agency";
    } 
    OUT MIR-BT-IP-DEP1   
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Input Department";
    } 

    OUT MIR-BT-DLNG-DIV2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Dealing Division";
    } 
    OUT MIR-BT-IP-BRCH2  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Input Branch";
    } 
    OUT MIR-BT-IP-AGCY2  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Input Agency";
    } 
    OUT MIR-BT-IP-DEP2   
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Input Department";
    } 
    OUT MIR-BT-DLNG-DIV3
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Dealing Division";
    } 
    OUT MIR-BT-IP-BRCH3 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Input Branch";
    } 
    OUT MIR-BT-IP-AGCY3  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Input Agency";
    } 
    OUT MIR-BT-IP-DEP3  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Input Department";
    } 
    OUT MIR-ADDR-CHNG-DT                 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date of Address Change";
    } 
    OUT MIR-LOAN-APPL-REC-DT             
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date of the loan application recieved";
    } 
    OUT MIR-NON-TRTMNT-DT                
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Effective Date of nontreatment";
    } 
    OUT MIR-UNPAID-RSN-MAT               
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reason of unpaid at the Maturity";
    } 
    OUT MIR-UNPAID-RSN-MAT-DT            
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Confirmed Date of the Reason of unpaid at the Maturity";
    } 
    OUT MIR-POL-DTL-REG-DT               
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date of Registration";
    } 
    OUT MIR-POL-DTL-REG-PART-NO          
    {
        DisplayOnly;
        Length = "12";
        SType = "Text";
        Label = "Participation Number";
    } 
    OUT MIR-DFRL-DT                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Defferal Date";
    } 
    OUT MIR-DFRL-END-DT                  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deffereal Ending Date";
    } 
    OUT MIR-DFRL-AMT                     
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Defferal Amount";
    } 
    OUT MIR-DFRL-LATST-PD-DT             
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Latest Paid Date";
    } 
    OUT MIR-DFRL-LATST-DFRL-AMT          
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Latest Defferal Amount";
    } 
    OUT MIR-DFRL-TOT-PAID-INT            
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Total Paid Interest";
    } 
    OUT MIR-DFRL-TRXN-DT                 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Defferal Transaction Date";
    } 
    OUT MIR-BDH-DEAL-BRCH-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Dealing Branch";
    } 
    OUT MIR-BDH-JRNL-DT-1  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date";
    } 
    OUT MIR-BDH-STRT-DT-1  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Start Date";
    } 
    OUT MIR-BDH-DFRD-PMT-1 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deffered Paymment (only Principal)";
    } 
    OUT MIR-BDH-PMT-INT-1  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment Interest";
    } 
    OUT MIR-BDH-DEAL-BRCH-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Dealing Branch";
    } 
    OUT MIR-BDH-JRNL-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date";
    } 
    OUT MIR-BDH-STRT-DT-2  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Start Date";
    } 
    OUT MIR-BDH-DFRD-PMT-2 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deffered Paymment (only Principal)";
    } 
    OUT MIR-BDH-PMT-INT-2  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment Interest";
    } 
    OUT MIR-BDH-DEAL-BRCH-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Dealing Branch";
    } 
    OUT MIR-BDH-JRNL-DT-3  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date";
    } 
    OUT MIR-BDH-STRT-DT-3  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Start Date";
    } 
    OUT MIR-BDH-DFRD-PMT-3 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deffered Paymment (only Principal)";
    } 
    OUT MIR-BDH-PMT-INT-3  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment Interest";
    } 

    OUT MIR-BDH-DEAL-BRCH-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Dealing Branch";
    } 
    OUT MIR-BDH-JRNL-DT-4 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date";
    } 
    OUT MIR-BDH-STRT-DT-4  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Start Date";
    } 
    OUT MIR-BDH-DFRD-PMT-4 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deffered Paymment (only Principal)";
    } 
    OUT MIR-BDH-PMT-INT-4  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment Interest";
    } 

    OUT MIR-BDH-DEAL-BRCH-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Dealing Branch";
    } 
    OUT MIR-BDH-JRNL-DT-5 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date";
    } 
    OUT MIR-BDH-STRT-DT-5  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Start Date";
    } 
    OUT MIR-BDH-DFRD-PMT-5 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deffered Paymment (only Principal)";
    } 
    OUT MIR-BDH-PMT-INT-5 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment Interest";
    } 
    OUT MIR-BDH-DEAL-BRCH-6
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Dealing Branch";
    } 
    OUT MIR-BDH-JRNL-DT-6  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date";
    } 
    OUT MIR-BDH-STRT-DT-6  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Start Date";
    } 
    OUT MIR-BDH-DFRD-PMT-6 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deffered Paymment (only Principal)";
    } 
    OUT MIR-BDH-PMT-INT-6  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment Interest";
    } 

    OUT MIR-PMHS-BR-JRNL-DT-1 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Branch Journal Date";
    } 
    OUT MIR-PMHS-DEP-JRNL-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department Journal Date";
    } 
    OUT MIR-PMHS-RECPT-DT-1   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Receipt Date";
    } 
    OUT MIR-PMHS-FM-DT-1      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "FM Date";
    } 

    OUT MIR-PMHS-BR-JRNL-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Branch Journal Date";
    } 
    OUT MIR-PMHS-DEP-JRNL-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department Journal Date";
    } 
    OUT MIR-PMHS-RECPT-DT-2   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Receipt Date";
    } 
    OUT MIR-PMHS-FM-DT-2      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "FM Date";
    } 
    OUT MIR-PMHS-BR-JRNL-DT-3 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Branch Journal Date";
    } 
    OUT MIR-PMHS-DEP-JRNL-DT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department Journal Date";
    } 
    OUT MIR-PMHS-RECPT-DT-3   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Receipt Date";
    } 
    OUT MIR-PMHS-FM-DT-3      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "FM Date";
    } 

    OUT MIR-PMHS-BR-JRNL-DT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Branch Journal Date";
    } 
    OUT MIR-PMHS-DEP-JRNL-DT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department Journal Date";
    } 
    OUT MIR-PMHS-RECPT-DT-4   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Receipt Date";
    } 
    OUT MIR-PMHS-FM-DT-4      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "FM Date";
    } 

    OUT MIR-PMHS-BR-JRNL-DT-5 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Branch Journal Date";
    } 
    OUT MIR-PMHS-DEP-JRNL-DT-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department Journal Date";
    } 
    OUT MIR-PMHS-RECPT-DT-5   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Receipt Date";
    } 
    OUT MIR-PMHS-FM-DT-5      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "FM Date";
    } 
    OUT MIR-PMHS-BR-JRNL-DT-6 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Branch Journal Date";
    } 
    OUT MIR-PMHS-DEP-JRNL-DT-6
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department Journal Date";
    } 
    OUT MIR-PMHS-RECPT-DT-6   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Receipt Date";
    } 
    OUT MIR-PMHS-FM-DT-6     
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "FM Date";
    } 

    OUT MIR-ADB-RIDER-CD                    
    {                                      
        DisplayOnly;                       
        Length = "3";                      
        SType = "Text";                    
        Label = "Rider code";                 
    }                                      
    OUT MIR-ADB-TRXN-IND                    
    {                                      
        DisplayOnly;                       
        Length = "3";                      
        SType = "Text";                    
        Label = "Transaction Indicator";                 
    }                                      
    OUT MIR-ADB-ISSU-DT                     
    {                                      
        DisplayOnly;                       
        Length = "8";                      
        SType = "Text";                    
        Label = "Issuee Date";                 
    }                                      
    OUT MIR-ADB-ADD-DT                      
    {                                      
        DisplayOnly;                       
        Length = "8";                      
        SType = "Text";                    
        Label = "Rider Addition Date";                 
    }                                      
    OUT MIR-ADB-CHNG-DT                     
    {                                      
        DisplayOnly;                       
        Length = "8";                      
        SType = "Text";                    
        Label = "Rider Change Date";                 
    }                                      
    OUT MIR-ADB-AGE-AT-ADTN                 
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Age at the Rider Addition Date";                 
    }                                      
    OUT MIR-ADB-CVG-PRD                     
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Rider Coverage Period";                 
    }                                      
    OUT MIR-ADB-FA                          
    {                                      
        DisplayOnly;                       
        Length = "8";                      
        SType = "Text";                    
        Label = "Rider Face Amount";                 
    }                                      
    OUT MIR-ADB-PREM                        
    {                                      
        DisplayOnly;                       
        Length = "8";                      
        SType = "Text";                    
        Label = "Rider Premium";                 
    }                                      
    OUT MIR-ADB-SSTD-RED-YR                 
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Substandard Reduction Amount";                 
    }                                      
    OUT MIR-ADB-SSTD-PRM-INCR               
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Substandard Senor Policy Premium Increase";                 
    }                                      
    OUT MIR-ADB-SP-SSTD-PRM-PCT             
    {                                      
        DisplayOnly;                       
        Length = "4";                      
        SType = "Text";                    
        Label = "Percentage of special substandard premiumz";                 
    }                                      
    OUT MIR-ADB-RSRV-ITEM                   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reserve Item";
    } 

    OUT MIR-APC-STRT-DT-1         
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Start Date of Advance Premium";
    } 
    OUT MIR-APC-ADV-PMT-CNT-1    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Number of D Advance Premium";
    } 
    OUT MIR-APC-GNRL-ADV-AMT-1       
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "General Advance Premium Amount";
    } 
    OUT MIR-APC-ANTY-ADV-AMT-1       
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Advance Premium Amount for Annuity";
    } 
    OUT MIR-APC-ADV-PMT-MODE-1   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode at the Advance Payment";
    } 

    OUT MIR-APC-STRT-DT-2         
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Start Date of Advance Premium";
    } 
    OUT MIR-APC-ADV-PMT-CNT-2    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Number of D Advance Premium";
    } 
    OUT MIR-APC-GNRL-ADV-AMT-2       
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "General Advance Premium Amount";
    } 
    OUT MIR-APC-ANTY-ADV-AMT-2       
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Advance Premium Amount for Annuity";
    } 
    OUT MIR-APC-ADV-PMT-MODE-2  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode at the Advance Payment";
    } 

    OUT MIR-APC-LMSM-YR       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode at the Advance Payment";
    } 
    OUT MIR-APC-LMSM-JAN        
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Jan";
    } 
    OUT MIR-APC-LMSM-FEB    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Feb";
    } 
    OUT MIR-APC-LMSM-MAR    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Mar";
    } 
    OUT MIR-APC-LMSM-APR    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Apr";
    } 
    OUT MIR-APC-LMSM-MAY    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - May";
    } 
    OUT MIR-APC-LMSM-JUN    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Jun";
    } 
    OUT MIR-APC-LMSM-JUL    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Jul";
    } 
    OUT MIR-APC-LMSM-AUG    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Aug";
    } 
    OUT MIR-APC-LMSM-SEP    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Sep";
    } 
    OUT MIR-APC-LMSM-OCT    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Oct";
    } 
    OUT MIR-APC-LMSM-NOV    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Nov";
    } 
    OUT MIR-APC-LMSM-DEC    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Dec";
    } 
    OUT MIR-APC-TOT-GNRL-LS-PRM   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "General Total Lump Sum Premium";
    } 
    OUT MIR-APC-TOT-ANTY-LS-PRM 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Annuity Total Lump Sum Premium";
    } 
    OUT MIR-APC-NXT-YR-LMSM-MTS  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Lump Sum Months OUT the Next Fiscal Year";
    } 
    OUT MIR-APC-NXYR-GNR-LS-PRM   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "General Total Lump Sum Premium for the next Fiscal Year";
    } 
    OUT MIR-APC-NXYR-ANT-LS-PRM   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Annuity Total Lump Sum Premium for the next Fiscal Year";
    } 
    OUT MIR-PPCC-CHG-MO-YR-1         
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Changing Month and Year of Premium";
    } 
    OUT MIR-PPCC-TOT-PRM-GNRL-1      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "General Total Premium";
    } 
    OUT MIR-PPCC-TOT-PRM-ANTY-1      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Total Premium for Annuity";
    } 
    OUT MIR-PPCC-PRV-MOD-1         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode before the conversion";
    } 
    OUT MIR-PPCC-CHG-MO-YR-2        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Changing Month and Year of Premium";
    } 
    OUT MIR-PPCC-TOT-PRM-GNRL-2      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "General Total Premium";
    } 
    OUT MIR-PPCC-TOT-PRM-ANTY-2      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Total Premium for Annuity";
    } 
    OUT MIR-PPCC-PRV-MOD-2         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode before the conversion";
    } 

    OUT MIR-PPCC-CHG-MO-YR-3         
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Changing Month and Year of Premium";
    } 
    OUT MIR-PPCC-TOT-PRM-GNRL-3     
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "General Total Premium";
    } 
    OUT MIR-PPCC-TOT-PRM-ANTY-3      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Total Premium for Annuity";
    } 
    OUT MIR-PPCC-PRV-MOD-3        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode before the conversion";
    } 

    OUT MIR-PPCC-CHG-MO-YR-4         
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Changing Month and Year of Premium";
    } 
    OUT MIR-PPCC-TOT-PRM-GNRL-4      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "General Total Premium";
    } 
    OUT MIR-PPCC-TOT-PRM-ANTY-4      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Total Premium for Annuity";
    } 
    OUT MIR-PPCC-PRV-MOD-4         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode before the conversion";
    } 

    OUT MIR-PPCC-CHG-MO-YR-5         
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Changing Month and Year of Premium";
    } 
    OUT MIR-PPCC-TOT-PRM-GNRL-5     
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "General Total Premium";
    } 
    OUT MIR-PPCC-TOT-PRM-ANTY-5      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Total Premium for Annuity";
    } 
    OUT MIR-PPCC-PRV-MOD-5        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode before the conversion";
    } 

    OUT MIR-DBI-CURR-ACUM-INT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accumulated Interest this Time";
    } 
    OUT MIR-DBI-RSRV-ACUM-INT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accumulated Interest of Actual Reserve";
    } 
    OUT MIR-DBI-PR-ACC-INT
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Principal and Accrued Interest";
    } 
    OUT MIR-DBI-LTST-ACUM-DT 
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Latest Accumulation Date";
    } 
    OUT MIR-ACH-END-YR-MO-1
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Advance Payment End Year and Month";
    } 
    OUT MIR-ACH-DISC-RT-1  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Rate of Discount";
    } 
    OUT MIR-ACH-END-YR-MO-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Advance Payment End Year and Month";
    } 
    OUT MIR-ACH-DISC-RT-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Rate of Discount";
    } 
    OUT MIR-ACH-END-YR-MO-3
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Advance Payment End Year and Month";
    } 
    OUT MIR-ACH-DISC-RT-3  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Rate of Discount";
    } 
    OUT MIR-ACH-END-YR-MO-4
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Advance Payment End Year and Month";
    } 
    OUT MIR-ACH-DISC-RT-4  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Rate of Discount";
    } 
    OUT MIR-ACH-END-YR-MO-5
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Advance Payment End Year and Month";
    } 
    OUT MIR-ACH-DISC-RT-5 
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Rate of Discount";
    } 
    OUT MIR-ACH-END-YR-MO-6
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Advance Payment End Year and Month";
    } 
    OUT MIR-ACH-DISC-RT-6 
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Rate of Discount";
    } 
    OUT MIR-LIVND-SP-BENFT-AMT      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Specififed Benefit Amount";
    } 
    OUT MIR-LIVND-CALC-STRT-DT  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Calculation Start Date";
    } 
    OUT MIR-LIVND-PMT-DT      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment Date";
    } 
    OUT MIR-APM-LMSM-BOX-AMT    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Lump Sum Box";
    } 
    OUT MIR-APM-ERND-INT     
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Earned Interest";
    } 
    OUT MIR-APM-UA-INT-DIV-YM     
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest Unallocated Dividend Year and Month";
    } 
    OUT MIR-APM-PRCES-CD-1       
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process Code";
    } 
    OUT MIR-APM-PRCES-DT-1          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process Date";
    } 
    OUT MIR-APM-UA-DIV-YM-1          
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Unallocated Dividend Allotment Year and Month";
    } 
    OUT MIR-APM-BAL-AMT-1       
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Balance Amount";
    } 
    OUT MIR-APM-RET-MTH-BAL-1               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Retrospective Method Balance";        
    }                                      
    OUT MIR-APM-PRO-MTH-BAL-1               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Prospective Method Balance";        
    }                                      
    OUT MIR-APM-USED-BAL-1                  
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "used Balance";        
    }                                      
    OUT MIR-APM-UNALC-DIV-MTH-1             
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unallocated Dividend Month ";        
    }                                      
    OUT MIR-APM-UNERND-MTHS-1               
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unearned Month";        
    }                                      
    OUT MIR-APM-ADV-PMTS-1                  
    {                                      
        DisplayOnly;                       
        Length = "6";                      
        SType = "Text";                    
        Label = "Number of Advance Payment";        
    }                                      
    OUT MIR-APM-NXT-ALOT-YRMO-1             
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next Allotment Year and Month";
    } 
    OUT MIR-APM-PRCES-CD-2       
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process Code";
    } 
    OUT MIR-APM-PRCES-DT-2          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process Date";
    } 
    OUT MIR-APM-UA-DIV-YM-2      
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Unallocated Dividend Allotment Year and Month";
    } 
    OUT MIR-APM-BAL-AMT-2       
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Balance Amount";
    } 
    OUT MIR-APM-RET-MTH-BAL-2               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Retrospective Method Balance";        
    }                                      
    OUT MIR-APM-PRO-MTH-BAL-2               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Prospective Method Balance";        
    }                                      
    OUT MIR-APM-USED-BAL-2                  
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "used Balance";        
    }                                      
    OUT MIR-APM-UNALC-DIV-MTH-2             
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unallocated Dividend Month ";        
    }                                      
    OUT MIR-APM-UNERND-MTHS-2               
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unearned Month";        
    }                                      
    OUT MIR-APM-ADV-PMTS-2                 
    {                                      
        DisplayOnly;                       
        Length = "6";                      
        SType = "Text";                    
        Label = "Number of Advance Payment";        
    }                                      
    OUT MIR-APM-NXT-ALOT-YRMO-2           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next Allotment Year and Month";
    } 

    OUT MIR-APM-PRCES-CD-3       
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process Code";
    } 
    OUT MIR-APM-PRCES-DT-3          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process Date";
    } 
    OUT MIR-APM-UA-DIV-YM-3          
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Unallocated Dividend Allotment Year and Month";
    } 
    OUT MIR-APM-BAL-AMT-3       
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Balance Amount";
    } 
    OUT MIR-APM-RET-MTH-BAL-3               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Retrospective Method Balance";        
    }                                      
    OUT MIR-APM-PRO-MTH-BAL-3               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Prospective Method Balance";        
    }                                      
    OUT MIR-APM-USED-BAL-3                  
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "used Balance";        
    }                                      
    OUT MIR-APM-UNALC-DIV-MTH-3            
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unallocated Dividend Month ";        
    }                                      
    OUT MIR-APM-UNERND-MTHS-3               
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unearned Month";        
    }                                      
    OUT MIR-APM-ADV-PMTS-3                  
    {                                      
        DisplayOnly;                       
        Length = "6";                      
        SType = "Text";                    
        Label = "Number of Advance Payment";        
    }                                      
    OUT MIR-APM-NXT-ALOT-YRMO-3           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next Allotment Year and Month";
    } 

    OUT MIR-APM-PRCES-CD-4       
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process Code";
    } 
    OUT MIR-APM-PRCES-DT-4          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process Date";
    } 
    OUT MIR-APM-UA-DIV-YM-4          
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Unallocated Dividend Allotment Year and Month";
    } 
    OUT MIR-APM-BAL-AMT-4       
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Balance Amount";
    } 
    OUT MIR-APM-RET-MTH-BAL-4               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Retrospective Method Balance";        
    }                                      
    OUT MIR-APM-PRO-MTH-BAL-4               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Prospective Method Balance";        
    }                                      
    OUT MIR-APM-USED-BAL-4                  
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "used Balance";        
    }                                      
    OUT MIR-APM-UNALC-DIV-MTH-4            
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unallocated Dividend Month ";        
    }                                      
    OUT MIR-APM-UNERND-MTHS-4               
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unearned Month";        
    }                                      
    OUT MIR-APM-ADV-PMTS-4                  
    {                                      
        DisplayOnly;                       
        Length = "6";                      
        SType = "Text";                    
        Label = "Number of Advance Payment";        
    }                                      
    OUT MIR-APM-NXT-ALOT-YRMO-4            
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next Allotment Year and Month";
    } 
    OUT MIR-APM-PRCES-CD-5       
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process Code";
    } 
    OUT MIR-APM-PRCES-DT-5          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process Date";
    } 
    OUT MIR-APM-UA-DIV-YM-5          
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Unallocated Dividend Allotment Year and Month";
    } 
    OUT MIR-APM-BAL-AMT-5       
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Balance Amount";
    } 
    OUT MIR-APM-RET-MTH-BAL-5               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Retrospective Method Balance";        
    }                                      
    OUT MIR-APM-PRO-MTH-BAL-5               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Prospective Method Balance";        
    }                                      
    OUT MIR-APM-USED-BAL-5                  
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "used Balance";        
    }                                      
    OUT MIR-APM-UNALC-DIV-MTH-5             
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unallocated Dividend Month ";        
    }                                      
    OUT MIR-APM-UNERND-MTHS-5               
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unearned Month";        
    }                                      
    OUT MIR-APM-ADV-PMTS-5                  
    {                                      
        DisplayOnly;                       
        Length = "6";                      
        SType = "Text";                    
        Label = "Number of Advance Payment";        
    }                                      
    OUT MIR-APM-NXT-ALOT-YRMO-5             
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next Allotment Year and Month";
    } 
    OUT MIR-PER-2-CALC-MOD-AMT                  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Acutual Calculation Modification S";
    } 
    OUT MIR-PER-2-POL-MOD-AMT                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Modification after conversion S";
    } 
    OUT MIR-PER-2-CNVR-SETL-AMT                 
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Conversion Settlement S";
    } 
    OUT MIR-PER-2-NB-AFYC                       
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "New Business AFYC";
    } 
    OUT MIR-PER-2-CALC-AFYC                     
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Actual Calculation AFYC";
    } 
    OUT MIR-APP-FORM-NUM-1                      
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Application Form Number (1)";
    } 
    OUT MIR-APP-FORM-NUM-2                      
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Application Form Number (2)";
    } 
    OUT MIR-APP-FORM-NUM-3                      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Application Form Number (3)";
    } 
    OUT MIR-APP-RPT-CND-NUM                     
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Reporting Condition Number";
    } 
    OUT MIR-APP-SETL-DUR                        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Duration of Settlement Process";
    } 
    OUT MIR-APP-NB-YR-MO                        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Duration of New Bussiness Agency Work Year and Month";
    } 
    OUT MIR-APP-NB-FM-DT                        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "New Business FM Date";
    } 
    OUT MIR-APP-APP-ENTRY-DT                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Application Entry Date";
    } 
    OUT MIR-PMT-ACC-BNK-CD                      
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Code";
    } 
    OUT MIR-PMT-ACC-BR-CD                       
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Branch Code";
    } 
    OUT MIR-PMT-ACC-REG-DT                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Account registration Date";
    } 
    OUT MIR-PMT-DEP-TYP                         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Deposit Type";
    } 
    OUT MIR-PMT-ACC-NUM                         
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Account Number";
    } 
    OUT MIR-PMT-ACC-HLDR-NM                     
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Account Holder's Name";
    } 
    OUT MIR-R3DD-RID-CD-1        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    OUT MIR-R3DD-DEL-IND-1     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    OUT MIR-R3DD-CHG-CD-1      
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    OUT MIR-R3DD-POL-ISS-DT-1    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    OUT MIR-R3DD-RID-ADD-DT-1    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    OUT MIR-R3DD-RECV-DT-1       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    OUT MIR-R3DD-CHG-DT-1       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    OUT MIR-R3DD-AGE-1       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    OUT MIR-R3DD-BNFT-PRD-1       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit period";
    } 
    OUT MIR-R3DD-BEN-FA-1        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    OUT MIR-R3DD-RID-PREM-1   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    OUT MIR-R3DD-AGT-EMP-1
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    OUT MIR-R3DD-SHR-AGT-EMP-1        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    OUT MIR-R3DD-SSTD-DED-1        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    OUT MIR-R3DD-SSTD-AGE-ADD-1         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    OUT MIR-R3DD-SSTD-SP-RT-1        
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    OUT MIR-R3DD-DEP-DIV-PRT-1         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "The Part of Deposit Division";
    } 

 
    OUT MIR-R3DD-RID-CD-2        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    OUT MIR-R3DD-DEL-IND-2     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    OUT MIR-R3DD-CHG-CD-2      
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    OUT MIR-R3DD-POL-ISS-DT-2    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    OUT MIR-R3DD-RID-ADD-DT-2    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    OUT MIR-R3DD-RECV-DT-2       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    OUT MIR-R3DD-CHG-DT-2       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    OUT MIR-R3DD-AGE-2       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    OUT MIR-R3DD-BNFT-PRD-2       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit period";
    } 
    OUT MIR-R3DD-BEN-FA-2        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    OUT MIR-R3DD-RID-PREM-2   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    OUT MIR-R3DD-AGT-EMP-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    OUT MIR-R3DD-SHR-AGT-EMP-2        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    OUT MIR-R3DD-SSTD-DED-2        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    OUT MIR-R3DD-SSTD-AGE-ADD-2         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    OUT MIR-R3DD-SSTD-SP-RT-2        
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    OUT MIR-R3DD-DEP-DIV-PRT-2         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "The Part of Deposit Division";
    } 

 
    OUT MIR-R3DD-RID-CD-3        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    OUT MIR-R3DD-DEL-IND-3     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    OUT MIR-R3DD-CHG-CD-3      
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    OUT MIR-R3DD-POL-ISS-DT-3    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    OUT MIR-R3DD-RID-ADD-DT-3    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    OUT MIR-R3DD-RECV-DT-3       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    OUT MIR-R3DD-CHG-DT-3       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    OUT MIR-R3DD-AGE-3       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    OUT MIR-R3DD-BNFT-PRD-3       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit period";
    } 
    OUT MIR-R3DD-BEN-FA-3        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    OUT MIR-R3DD-RID-PREM-3   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    OUT MIR-R3DD-AGT-EMP-3
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    OUT MIR-R3DD-SHR-AGT-EMP-3        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    OUT MIR-R3DD-SSTD-DED-3        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    OUT MIR-R3DD-SSTD-AGE-ADD-3         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    OUT MIR-R3DD-SSTD-SP-RT-3        
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    OUT MIR-R3DD-DEP-DIV-PRT-3         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "The Part of Deposit Division";
    } 
 
    OUT MIR-R3DD-RID-CD-4        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    OUT MIR-R3DD-DEL-IND-4     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    OUT MIR-R3DD-CHG-CD-4      
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    OUT MIR-R3DD-POL-ISS-DT-4    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    OUT MIR-R3DD-RID-ADD-DT-4    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    OUT MIR-R3DD-RECV-DT-4       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    OUT MIR-R3DD-CHG-DT-4       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    OUT MIR-R3DD-AGE-4       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    OUT MIR-R3DD-BNFT-PRD-4       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit period";
    } 
    OUT MIR-R3DD-BEN-FA-4        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    OUT MIR-R3DD-RID-PREM-4   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    OUT MIR-R3DD-AGT-EMP-4
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    OUT MIR-R3DD-SHR-AGT-EMP-4        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    OUT MIR-R3DD-SSTD-DED-4        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    OUT MIR-R3DD-SSTD-AGE-ADD-4         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    OUT MIR-R3DD-SSTD-SP-RT-4        
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    OUT MIR-R3DD-DEP-DIV-PRT-4         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "The Part of Deposit Division";
    } 
 
    OUT MIR-R3DD-RID-CD-5        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    OUT MIR-R3DD-DEL-IND-5     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    OUT MIR-R3DD-CHG-CD-5      
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    OUT MIR-R3DD-POL-ISS-DT-5    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    OUT MIR-R3DD-RID-ADD-DT-5    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    OUT MIR-R3DD-RECV-DT-5       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    OUT MIR-R3DD-CHG-DT-5       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    OUT MIR-R3DD-AGE-5       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    OUT MIR-R3DD-BNFT-PRD-5       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit period";
    } 
    OUT MIR-R3DD-BEN-FA-5        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    OUT MIR-R3DD-RID-PREM-5   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    OUT MIR-R3DD-AGT-EMP-5
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    OUT MIR-R3DD-SHR-AGT-EMP-5        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    OUT MIR-R3DD-SSTD-DED-5        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    OUT MIR-R3DD-SSTD-AGE-ADD-5         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    OUT MIR-R3DD-SSTD-SP-RT-5        
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    OUT MIR-R3DD-DEP-DIV-PRT-5         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "The Part of Deposit Division";
    } 

    OUT MIR-DUPL-DED-CHG-FL-DT                  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Failure of Deduction Change Date";
    } 
    OUT MIR-DUPL-DED-CHG-FL-CD                  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Failure of Deduction Change Code";
    } 
    OUT MIR-DUPL-DED-FL-COM-AMT                 
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Failure of Deduction Chargeback Amount(Commission)";
    } 
    OUT MIR-DUPL-NB-COM-MX-AMT                  
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "limit Amount for New Business(commission)";
    } 
    OUT MIR-DUPL-NB-MX-AMT-SN-1                 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "NB Limit Amount Sign 1";
    } 
    OUT MIR-DUPL-INT-POL-SIGN                   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interm Addition policy sign";
    } 
    OUT MIR-DUPL-NB-MX-AMT-SN-2                 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "NB Limit Amount Sign 2";
    } 
    OUT MIR-DUPL-DED-FL-CB-AMT                  
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "failure of Deduction ChargeBack Amount(ExchangedP)";
    } 
    OUT MIR-DUPL-NB-MAX-AMT                     
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Limit Amount for New Business (Exchanged P)";
    } 
    OUT MIR-AER-RID-CD-1                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    OUT MIR-AER-DEL-IND-1                       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    OUT MIR-AER-CHG-CD-1                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    OUT MIR-AER-POL-ISS-DT-1                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    OUT MIR-AER-RID-ADD-DT-1                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    OUT MIR-AER-RECVD-DT-1                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    OUT MIR-AER-RID-CHG-DT-1                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    OUT MIR-AER-AGE-1                           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    OUT MIR-AER-BNFT-PRD-1                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit Period";
    } 
    OUT MIR-AER-FA-1                            
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    OUT MIR-AER-PREM-1                          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    OUT MIR-AER-AGT-1                           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    OUT MIR-AER-SHR-AGT-1                       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    OUT MIR-AER-SSTD-DED-1                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    OUT MIR-AER-SSTD-AGE-1                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    OUT MIR-AER-SSTD-SRT-1                      
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    OUT MIR-AER-RID-CD-2                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    OUT MIR-AER-DEL-IND-2                       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    OUT MIR-AER-CHG-CD-2                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    OUT MIR-AER-POL-ISS-DT-2                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    OUT MIR-AER-RID-ADD-DT-2                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    OUT MIR-AER-RECVD-DT-2                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    OUT MIR-AER-RID-CHG-DT-2                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    OUT MIR-AER-AGE-2                           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    OUT MIR-AER-BNFT-PRD-2                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit Period";
    } 
    OUT MIR-AER-FA-2                            
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    OUT MIR-AER-PREM-2                          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    OUT MIR-AER-AGT-2                           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    OUT MIR-AER-SHR-AGT-2                       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    OUT MIR-AER-SSTD-DED-2                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    OUT MIR-AER-SSTD-AGE-2                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    OUT MIR-AER-SSTD-SRT-2                      
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 

    OUT MIR-AER-RID-CD-3                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    OUT MIR-AER-DEL-IND-3                       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    OUT MIR-AER-CHG-CD-3                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    OUT MIR-AER-POL-ISS-DT-3                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    OUT MIR-AER-RID-ADD-DT-3                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    OUT MIR-AER-RECVD-DT-3                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    OUT MIR-AER-RID-CHG-DT-3                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    OUT MIR-AER-AGE-3                           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    OUT MIR-AER-BNFT-PRD-3                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit Period";
    } 
    OUT MIR-AER-FA-3                            
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    OUT MIR-AER-PREM-3                          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    OUT MIR-AER-AGT-3                           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    OUT MIR-AER-SHR-AGT-3                       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    OUT MIR-AER-SSTD-DED-3                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    OUT MIR-AER-SSTD-AGE-3                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    OUT MIR-AER-SSTD-SRT-3                      
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    OUT MIR-AER-RID-CD-4                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    OUT MIR-AER-DEL-IND-4                       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    OUT MIR-AER-CHG-CD-4                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    OUT MIR-AER-POL-ISS-DT-4                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    OUT MIR-AER-RID-ADD-DT-4                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    OUT MIR-AER-RECVD-DT-4                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    OUT MIR-AER-RID-CHG-DT-4                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    OUT MIR-AER-AGE-4                           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    OUT MIR-AER-BNFT-PRD-4                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit Period";
    } 
    OUT MIR-AER-FA-4                            
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    OUT MIR-AER-PREM-4                          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    OUT MIR-AER-AGT-4                           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    OUT MIR-AER-SHR-AGT-4                       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    OUT MIR-AER-SSTD-DED-4                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    OUT MIR-AER-SSTD-AGE-4                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    OUT MIR-AER-SSTD-SRT-4                      
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 

    OUT MIR-AER-RID-CD-5                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    OUT MIR-AER-DEL-IND-5                       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    OUT MIR-AER-CHG-CD-5                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    OUT MIR-AER-POL-ISS-DT-5                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    OUT MIR-AER-RID-ADD-DT-5                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    OUT MIR-AER-RECVD-DT-5                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    OUT MIR-AER-RID-CHG-DT-5                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    OUT MIR-AER-AGE-5                           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    OUT MIR-AER-BNFT-PRD-5                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit Period";
    } 
    OUT MIR-AER-FA-5                            
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    OUT MIR-AER-PREM-5                          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    OUT MIR-AER-AGT-5                           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    OUT MIR-AER-SHR-AGT-5                       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    OUT MIR-AER-SSTD-DED-5                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    OUT MIR-AER-SSTD-AGE-5                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    OUT MIR-AER-SSTD-SRT-5                      
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    OUT MIR-CNCR-HSP-DLY-AMT                    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Cancer hospitalization Daily Benefit Amount";
    } 
    OUT MIR-CNCR-CDB-CTM-BNFT                   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Cancer Diagnosis Benefit Amount or Cancer Treatment Monthly Amount";
    } 
    OUT MIR-CNCR-HOSP-PAYO                      
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Accumulated Number of Payout for Cancer Hospitalization benfit";
    } 
    OUT MIR-CNCR-CSB-PAYO                       
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Accumulated Number of Payout for Cancer surgery Benefit";
    } 
    OUT MIR-CNCR-CTM-CDB-PAYO                   
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Accumulated number of payout for cancer diagnosis benefit or Cancer treatment monthly benefit";
    } 
    OUT MIR-CNCR-LST-BEN-P-DT                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Last Benefit Payout Date";
    } 
    OUT MIR-CNCR-DIAG-EFF-DT                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Cancer diagnosis Effective Date or cancer Treatment Effective date";
    } 
    OUT MIR-CNCR-BENE-DESIG                     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Beneficiary Designation CTL";
    } 
    OUT MIR-CNCR-DTH-TERM                       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Terminated Due to Cancer Death";
    } 
    OUT MIR-CNCR-INIT-PAYO-NUM                  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Cancer Treatment Monthly benefit:Number of Initial Payout";
    } 
    OUT MIR-CNCR-LST-PAYO-DT                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit:Last Payout Effective Date";
    } 
    OUT MIR-CNCR-TRT-BNFT-TYP                   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Cancer Treatment Benefit Type";
    } 
    OUT MIR-BULK-WIR-XFR-NUM                    
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Bulk Wire Transfer Number";
    } 
    OUT MIR-BULK-WIR-XFR-SP-CTL                 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bulk Wire Transfer Suspension CTL";
    } 
    OUT MIR-BULK-WIR-XFR-EFF-DT                 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Bulk Wire Transfer Effective Date";
    } 
    OUT MIR-DSTR-AGT-REG-NUM                    
    {
        DisplayOnly;
        Length = "13";
        SType = "Text";
        Label = "Distributer Agent Registration Number";
    } 
    OUT MIR-DSTR-CO-AGT-REG-NUM                 
    {
        DisplayOnly;
        Length = "13";
        SType = "Text";
        Label = "Co-Distributer Agent Registration Number";
    } 
    OUT MIR-DIS-EXCL-BLIND                      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Blindness Exclusion";
    } 
    OUT MIR-DIS-EXCL-DEAF                       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deafness Exclusion";
    } 
    OUT MIR-PROXY-BENE-IND                      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Proxy Beneficiary Indicator";
    } 
    OUT MIR-PROXY-BENE-UPDT-DT                  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Proxy Beneficiary Update Date";
    } 
    OUT MIR-PROXY-BENE-PAYO-DT                  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Proxy Beneficiary ";
    } 
    OUT MIR-PROXY-BENE-PAYO-CD                  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Proxy Beneficiary Payout Movement code";
    } 
    OUT MIR-FID-BNK-BR-CD                       
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Branch code";
    } 
    OUT MIR-FIDHANDLR-CD                        
    {
        DisplayOnly;
        Length = "12";
        SType = "Text";
        Label = "Handler Code";
    } 
    OUT MIR-FID-CLI-ID                          
    {
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Client Id for Bank";
    } 
    OUT MIR-INIT-PMT-TYP-APP                    
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Initial Payment Type at Application";
    } 
    OUT MIR-INIT-PMT-TYP-ROUT                   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Initial Payment Route";
    } 
    OUT MIR-CPT-CHG-YR-MO-1                     
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Premium Changed Year Month";
    } 
    OUT MIR-CPT-GRS-GNR-PREM-1                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "General Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-ANT-PREM-1                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Annuity Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-LTC-PREM-1                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Long Term Care Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-OTR-PREM-1                  
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Other Gross Premium Amount";
    } 
    OUT MIR-CPT-PRV-BILL-MOD-1                  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Billing Mode Before change";
    } 
    OUT MIR-CPT-CHG-YR-MO-2                     
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Premium Changed Year Month";
    } 
    OUT MIR-CPT-GRS-GNR-PREM-2                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "General Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-ANT-PREM-2                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Annuity Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-LTC-PREM-2                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Long Term Care Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-OTR-PREM-2                  
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Other Gross Premium Amount";
    } 
    OUT MIR-CPT-PRV-BILL-MOD-2                  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Billing Mode Before change";
    } 

    OUT MIR-CPT-CHG-YR-MO-3                     
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Premium Changed Year Month";
    } 
    OUT MIR-CPT-GRS-GNR-PREM-3                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "General Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-ANT-PREM-3                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Annuity Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-LTC-PREM-3                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Long Term Care Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-OTR-PREM-3                  
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Other Gross Premium Amount";
    } 
    OUT MIR-CPT-PRV-BILL-MOD-3                  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Billing Mode Before change";
    } 

    OUT MIR-CPT-CHG-YR-MO-4                     
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Premium Changed Year Month";
    } 
    OUT MIR-CPT-GRS-GNR-PREM-4                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "General Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-ANT-PREM-4                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Annuity Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-LTC-PREM-4                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Long Term Care Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-OTR-PREM-4                  
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Other Gross Premium Amount";
    } 
    OUT MIR-CPT-PRV-BILL-MOD-4                  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Billing Mode Before change";
    } 

    OUT MIR-CPT-CHG-YR-MO-5                     
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Premium Changed Year Month";
    } 
    OUT MIR-CPT-GRS-GNR-PREM-5                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "General Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-ANT-PREM-5                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Annuity Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-LTC-PREM-5                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Long Term Care Gross Premium Amount";
    } 
    OUT MIR-CPT-GRS-OTR-PREM-5                  
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Other Gross Premium Amount";
    } 
    OUT MIR-CPT-PRV-BILL-MOD-5                  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Billing Mode Before change";
    } 

    OUT MIR-INS-3DD-BENE-CTL                    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "3DD Beneficiary CTL";
    } 
    OUT MIR-INS-3DD-DTH-BNFT                    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "3DD Benefit Payout at Insured's Death";
    } 
    OUT MIR-ALD-RIDER-CD                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider Code";
    } 
    OUT MIR-ALD-DEL-IND                         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    OUT MIR-ALD-CHG-CD                          
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change code";
    } 
    OUT MIR-ALD-POL-ISSU-DT                     
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    OUT MIR-ALD-RID-ADD-DT                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    OUT MIR-ALD-RECV-DT                         
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    OUT MIR-ALD-RID-CHG-DT                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    OUT MIR-ALD-ADD-AGE                         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    OUT MIR-ALD-BNFT-PRD                        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit Period";
    } 
    OUT MIR-ALD-FACE-AMT                        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Benefit FA";
    } 
    OUT MIR-ALD-PREM-AMT                        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    OUT MIR-ALD-AGT-ID                          
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    OUT MIR-ALD-SHR-AGT-ID                      
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    OUT MIR-ALD-SSTD-PREM-FCT                   
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Substandard Premium Factor(MR)";
    } 
    OUT MIR-ALD-LIEN-DUR                        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien Duration";
    } 
    OUT MIR-ALD-DISAB-EXCL                      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Disability Exclusion (Blindness)";
    } 
    OUT MIR-ALD-ORIG-FACE-AMT                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Benefit FA at New Business";
    } 
    OUT MIR-MIGR-POL-IND
    {    
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Migrated Policy";
    }
    OUT MIR-POL-CHG-MVT-STRT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Movement calculation base date";
    }
##UYDM28 Changes starts
    INOUT MIR-POL-CTR
    {
        Length = "02";
        SType = "number";
        Label = "Policy Count";
    }    

    INOUT MIR-POL-ID-T[5]
    {
        Length = "08";
        SType = "Text";
        FieldGroup = "Table05";
        Label = "Policy ID";
        Index = "1";
    }

    INOUT MIR-LARG-TYP-T[5]
    {
        Length = "03";
        SType = "Text";
        FieldGroup = "Table05";
        Label = "Large Type Code";
        Index = "1";
    }

    INOUT MIR-SMAL-TYP-CD-T[5]
    {
        Length = "03";
        SType = "Text";
        FieldGroup = "Table05";
        Label = "Small Type Code";
        Index = "1";
    }
##UYDM28 Changes Ends
}

