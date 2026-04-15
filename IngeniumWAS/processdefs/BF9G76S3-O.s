# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF9G76S3-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYSD28     CTS      INITIAL VERSION OF UISYS POLICY INQUIRY SCREEN FOR     *
#*                      STREAM 3                                               *
#*******************************************************************************

S-STEP BF9G76S3-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
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

    IN MIR-POL-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DBTableName = "TU3P1";
        SType = "Text";
        Label = "Policy ID";
    }



    IN MIR-POL-IDENT-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "POL-IDENT-TYP-CD";
        SType = "Text";		
        Label = "Policy Identification Code";
    }
    
    IN MIR-SMAL-TYP
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Small Type Code";
    }
    
    IN MIR-LARG-TYP
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Large Type Code";
    }    
    IN MIR-POL-ISSU-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    }
    IN MIR-BILL-MODE
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Bill Mode";
    }
    IN MIR-DEALNG
    { 
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dealing";
    }
    IN MIR-NOTIC-DIV
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Notic Div";
    }
    IN MIR-LATST-PMT-MO-YR
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Latest Payment Month Year";
    }
    IN MIR-DURATION
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Duration";
    }
    IN MIR-LTST-PMT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Latest Payment Date";
    }
    IN MIR-INSRD-BTH-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Insured Birth Date";
    }

    IN MIR-ISSU-AGE
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "X1 (Insured's issue age)";
    }
    IN MIR-FLD-X2 
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "X2";
    }
    IN MIR-INSRD-SEX-CD 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "(Insured) SEX";
    }
    IN MIR-FLD-TYP 
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Type";
    }
    IN MIR-FLD-N 
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Ｎ";
    }
    IN MIR-EXP-AGE 
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Ｍ";
    }
    IN MIR-FACE-AMT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "S1 (Face amount)";
    }
    IN MIR-FLD-S2 
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "S2";
    }
    IN MIR-MOD-PREM-AMT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "P1 (modal premium)";
    }
    IN MIR-FLD-P2 
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "P2";
    }
    IN MIR-MED-SEL-CD-1 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Medical Selection Code (1)";
    }
    IN MIR-DIV-PAYO-CD 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Payout Code";
    }
    IN MIR-DEALNG-BR 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Dealing Branch";
    }
    IN MIR-DEALNG-AGT 
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Dealing Agent";
    }
    IN MIR-SALES-BR 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sales Branch";
    }
    IN MIR-WRT-AGT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Writing Agent";
    }
    IN MIR-JT-SHR-AGT
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Joing Sharing Agent";
    }
    IN MIR-AREA-BR-CANV
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Area Branch at Canvassing";
    }
    IN MIR-DEPT-CANV 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department at Canvassing";
    }
    IN MIR-TRXN-CD  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Transaction Code";
    }
    IN MIR-CHNG-DT       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Change Date";
    }
    IN MIR-OWNR-BTH-DT        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "(Policy ) Date of Birth";
    }
    IN MIR-TYP-DIV         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Type Division";
    }
    IN MIR-ADDR-CD         
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Address Code";
    }
    IN MIR-DIFF-PREM         
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Differential Premium";
    }
    IN MIR-ACC-PD-PREM        
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Accumulated Paid Premium";
    }
    IN MIR-OVR-DUE-MTH        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Overdue Month";
    }
    IN MIR-SAVNG-TYP         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Saving Type";
    }
    IN MIR-DLY-PMT-MNTHS         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Delayed Payment Number of Months";
    }
    IN MIR-OWNR-SEX-CD         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "(Policy) SEX";
    }
    IN MIR-MED-SEL-CD-2          
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Medical Selection Code (2)";
    }
    IN MIR-CHNG-DEAL-BR          
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Dealing Branch";
    }
    IN MIR-INSRD-NM        
    {
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "The Insured Name";
    }
    IN MIR-FLD-203          
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Advance Payment Unallocated Dividend Rate Change Year and Monthe";
    }
    IN MIR-FLD-204          
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Annuity Rider Type";
    }
    IN MIR-FLD-205          
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Annuity Rider Deferral Period";
    }
    IN MIR-FLD-206          
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Annuity Rider Payment Period";
    }
    IN MIR-FLD-207          
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Death Ｓ at Extension";
    }
    IN MIR-FLD-208          
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Conversion after SalesＳ";
    }
    IN MIR-STEP-PRD           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "SteｐPeriod";
    }
    IN MIR-MED-INS-TYP          
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Care・Medical Insurance　Type";
    }
    IN MIR-FLD-211           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "New Conversion Unallocated Dividend Rate";
    }
    IN MIR-CNVR-CNT           
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Number of Conversion";
    }
    IN MIR-INIT-PMT-RECV-DT          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Initial Payment Received Date";
    }
    IN MIR-FLD-215           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Policy Provision Change Division";
    }
    IN MIR-FLD-216           
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "S after Paid-up Whole Life Deletion";
    }
    IN MIR-SURR-ELPSD-MTH       
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Elapsed Month at Surrender";
    }
    IN MIR-SD-DT      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Self Disclosure Date";
    }
    IN MIR-OWNR-NM          
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Policy Owner’s Name";
    }
    IN MIR-ADDR-KA       
    {
        DisplayOnly;
        Length = "72";
        SType = "Text";
        Label = "Address G";
    }
    IN MIR-OWNR-PH-NUM       
    {
        DisplayOnly;
        Length = "13";
        SType = "Text";
        Label = "Policyholder Phone Number G/Policyholder Phone Number";
    }
    IN MIR-DSASTR-CD       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Disaster Handling Code";
    }
    IN MIR-DSASTR-CNTRCT-CD  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Disaster handling timing contract situation BIT/installation payment";
    }
    IN MIR-DSASTR-CNTRCT-DT  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Disaster handling timing contract situation BIT/1-8";
    }
    IN MIR-DSASTR-LAPS-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Disaster laspe year month date";
    }
    IN MIR-MAT-NOTI-CRE-MTH
    {
        DisplayOnly;
        Length = "2";
        SType  = "Text";
        Label  = "Maturity notice creation month";
     }
    IN MIR-POLM-RSRV  
    {
        DisplayOnly;
        Length = "65";
        SType = "Text";
        Label = "Reserve Area";
    }
    IN MIR-IND-600-606-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Under the Procedure of Transaction (1)";
    }
    IN MIR-IND-600-606-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Transaction Reported (1)";
    }
    IN MIR-IND-600-606-FLD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Under the procedure of Loan (1)";
    }
    IN MIR-IND-600-606-FLD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan Reported (1)";
    }
    IN MIR-IND-600-606-FLD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Under the procedure of Loan (2)";
    }
    IN MIR-IND-600-606-FLD-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan Reported (2)";
    }
    IN MIR-IND-600-606-FLD-7
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Undetermined Policy";
    }
    IN MIR-LAPS-POL 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Division 1/Lapse Policy";
    }
    IN MIR-IND-608-622-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Division 1/608-622";
    }
    IN MIR-IND-608-622-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reinsurance Policy";
    }
    IN MIR-IND-608-622-FLD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Unpaid Benefit Policy";
    }
    IN MIR-IND-608-622-FLD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "”Hotoku” Applicable Exclusion Policy";
    }
    IN MIR-IND-608-622-FLD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Fund Policy";
    }
    IN MIR-IND-608-622-FLD-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Statute of Limitations Policy";
    }
    IN MIR-IND-608-622-FLD-7
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reserve Calculated Policy";
    }
    IN MIR-IND-608-622-FLD-8
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Uncertain Dealer Policy";
    }
    IN MIR-IND-608-622-FLD-9
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Loan Unneeded Capitalization";
    }
    IN MIR-IND-608-622-FLD-10
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan History Policy";
    }
    IN MIR-IND-608-622-FLD-11
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Special Revival Policy";
    }
    IN MIR-IND-608-622-FLD-12
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Second Year Dividend Payment Policy";
    }
    IN MIR-IND-608-622-FLD-13
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Rider Deletion Policy";
    }
    IN MIR-IND-608-622-FLD-14
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Internal Deposit Assignment Policy";
    }
    IN MIR-IND-608-622-FLD-15
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Renewal Denial Policy";
    }
    IN MIR-AUT-LOAN-REJ  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Division 1/Auto Loan Reject Policy";
    }
    IN MIR-IND-624-627-FLD-1  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Division 1/624-627";
    }
    IN MIR-IND-624-627-FLD-2  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Agent Policy";
    }
    IN MIR-IND-624-627-FLD-3  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Under the Payout Procedure Policy";
    }
    IN MIR-IND-624-627-FLD-4  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Certificate Reissued Policy";
    }
    IN MIR-DIFF-PYMNT-POL   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Division 1/Different Number of Payment Policy 1";
    }
    IN MIR-IND-629-635-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Division 1/629-635";
    }
    IN MIR-IND-629-635-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Under the Procedure of Conversion";
    }
    IN MIR-IND-629-635-FLD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion Policy";
    }
    IN MIR-IND-629-635-FLD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Serious Disability Unpaid Policy";
    }
    IN MIR-IND-629-635-FLD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Saving Second Assured Death";
    }
    IN MIR-IND-629-635-FLD-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Employee Insurance Policy";
    }
    IN MIR-IND-629-635-FLD-7
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Robbery Policy";
    }
    IN MIR-SPCL-TRTMT 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Premium Special Treatment Policy";
    }
    IN MIR-PAID-POL 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Paid Policy";
    }
    IN MIR-EXT-POL 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Extension Policy";
    }
    IN MIR-WAIV-POL     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Waiver of Premium Policy";
    }
    IN MIR-ANTY-PYMNT     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Annuity Payment Policy";
    }
    IN MIR-WT-ADV-PREM      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Whole Term Advance Premium Policy";
    }
    IN MIR-LUM-SUM-PMT    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Lump Sum Payment Policy";
    }
    IN MIR-GT-MIS   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Group Treatment Missing Policy";
    }
    IN MIR-PMT-EXP   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 2/Payment Expiration Policy";
    }
    IN MIR-ADD1-1-3   
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Additional Indicator 1/Name Indicator";
    }
    IN MIR-ADDR-G 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Additional Indicator 1/Address G";
    }
    IN MIR-ADD1-5-36-FLD-1   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Additional Indicator 1/5-36";
    }
    IN MIR-ADD1-5-36-FLD-2    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Rider G ";
    }
    IN MIR-ADD1-5-36-FLD-3   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Extra Rider G";
    }
    IN MIR-ADD1-5-36-FLD-4    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Traffic Accidental Rider G";
    }
    IN MIR-ADD1-5-36-FLD-5   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Comprehensive Medical Coverage Rider G";
    }
    IN MIR-ADD1-5-36-FLD-6    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Adult Disease Rider G";
    }
    IN MIR-ADD1-5-36-FLD-7   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interm Additional Amount Term Insurance Rider G  (1)";
    }
    IN MIR-ADD1-5-36-FLD-8    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interm Additional Amount Term Insurance Rider G  (2)";
    }
    IN MIR-ADD1-5-36-FLD-9  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interm Additional Amount Term Insurance Rider G  (3)";
    }
    IN MIR-ADD1-5-36-FLD-10
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Family Medical Rider Bases G";
    }
    IN MIR-ADD1-5-36-FLD-11   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Sickness Hospitalization Rider G";
    }
    IN MIR-ADD1-5-36-FLD-12    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Hospitalization Rider G";
    }
    IN MIR-ADD1-5-36-FLD-13   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Term Insurance Rider G";
    }
    IN MIR-ADD1-5-36-FLD-14   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dummy1";
    }
    IN MIR-ADD1-5-36-FLD-15   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Additional Survivor Benefit G";
    }
    IN MIR-ADD1-5-36-FLD-16
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Allocation Dividend G";
    }
    IN MIR-ADD1-5-36-FLD-17   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Offset G";
    }
    IN MIR-ADD1-5-36-FLD-18    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deposit Dividend G";
    }
    IN MIR-ADD1-5-36-FLD-19   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accumulation G";
    }
    IN MIR-ADD1-5-36-FLD-20    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Vesting G";
    }
    IN MIR-ADD1-5-36-FLD-21   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Congratulatory Benefit for Entrance of School";
    }
    IN MIR-ADD1-5-36-FLD-22    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Substandard G";
    }
    IN MIR-ADD1-5-36-FLD-23   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Hospitalization Injury G";
    }
    IN MIR-ADD1-5-36-FLD-24    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Term Insurance G";
    }
    IN MIR-ADD1-5-36-FLD-25   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reinsurance G";
    }
    IN MIR-ADD1-5-36-FLD-26    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion D1 G";
    }
    IN MIR-ADD1-5-36-FLD-27   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion D2 G";
    }
    IN MIR-ADD1-5-36-FLD-28    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion C G";
    }
    IN MIR-ADD1-5-36-FLD-29   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity (1) G";
    }
    IN MIR-ADD1-5-36-FLD-30    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Credits G";
    }
    IN MIR-ADD1-5-36-FLD-31  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Medical Insurance G";
    }
    IN MIR-ADD1-5-36-FLD-32
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dummy2";
    }
    IN MIR-ADD2-0-35-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Change Part (1)";
    }
    IN MIR-ADD2-0-35-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Old Content Part";
    }
    IN MIR-ADD2-0-35-FLD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan Part (1)";
    }
    IN MIR-ADD2-0-35-FLD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan Part (2)";
    }
    IN MIR-ADD2-0-35-FLD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dummy";
    }
    IN MIR-ADD2-0-35-FLD-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan Bases G";
    }
    IN MIR-ADD2-0-35-FLD-7
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan History (A) G";
    }
    IN MIR-ADD2-0-35-FLD-8
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan History (B) G";
    }
    IN MIR-ADD2-0-35-FLD-9
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lapse Revival G";
    }
    IN MIR-ADD2-0-35-FLD-10
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Paid-up G";
    }
    IN MIR-ADD2-0-35-FLD-11
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Extension G";
    }
    IN MIR-ADD2-0-35-FLD-12
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Policy Loan G";
    }
    IN MIR-ADD2-0-35-FLD-13
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Advance Premium Fixed G";
    }
    IN MIR-ADD2-0-35-FLD-14
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Change Administrative Agent G";
    }
    IN MIR-ADD2-0-35-FLD-15
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bank Transfer G";
    }
    IN MIR-ADD2-0-35-FLD-16
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dantai G";
    }
    IN MIR-ADD2-0-35-FLD-17
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Employee Insurance G";
    }
    IN MIR-ADD2-0-35-FLD-18
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Soft Product G";
    }
    IN MIR-ADD2-0-35-FLD-19
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "F type Benefit Payout G";
    }
    IN MIR-ADD2-0-35-FLD-20
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Living Advance Premium G";
    }
    IN MIR-ADD2-0-35-FLD-21
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Saving Advance Premium G";
    }
    IN MIR-ADD2-0-35-FLD-22
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion A1 G";
    }
    IN MIR-ADD2-0-35-FLD-23
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion A2 G";
    }
    IN MIR-ADD2-0-35-FLD-24
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion B1 G";
    }
    IN MIR-ADD2-0-35-FLD-25
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion B2 G";
    }
    IN MIR-ADD2-0-35-FLD-26
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Living Advance Premium G";
    }
    IN MIR-ADD2-0-35-FLD-27
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reinstatement (B) G";
    }
    IN MIR-ADD2-0-35-FLD-28
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Extended Interest G";
    }
    IN MIR-ADD2-0-35-FLD-29
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Change Part (2)";
    }
    IN MIR-ADD2-0-35-FLD-30
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Congratulatory Recovery Benefit G";
    }
    IN MIR-ADD2-0-35-FLD-31
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Smoking Information G";
    }
    IN MIR-ADD2-0-35-FLD-32
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan History G";
    }
    IN MIR-ADD2-0-35-FLD-33
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Family Medical Rider History G";
    }
    IN MIR-ADD2-0-35-FLD-34
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Amount History G";
    }
    IN MIR-ADD2-0-35-FLD-35
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Benefit Amount History G";
    }
    IN MIR-ADD2-0-35-FLD-36
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deposit History G";
    }
    IN MIR-IND-800-805-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Overlapped Policy";
    }
    IN MIR-IND-800-805-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Foreigners’ Policy";
    }
    IN MIR-IND-800-805-FLD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Employee Policy";
    }
    IN MIR-IND-800-805-FLD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Loan Policy";
    }
    IN MIR-IND-800-805-FLD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity Certain Policy";
    }
    IN MIR-IND-800-805-FLD-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Non-loan Policy";
    }
    IN MIR-INDIV-GRP-POL   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 3/Individual Group Policy";
    }
    IN MIR-IND-809-810-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 3/809-810";
    }
    IN MIR-IND-809-810-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity Rider Policy";
    }
    IN MIR-ASGNMNT-POL   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 3/Assignment Policy";
    }
    IN MIR-IND-812-817-FLD-1     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 3/812-817";
    }
    IN MIR-IND-812-817-FLD-2     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reported Change Procedure (2)";
    }
    IN MIR-IND-812-817-FLD-3     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Increasing Premium Policy";
    }
    IN MIR-IND-812-817-FLD-4     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Eligible Rider Policy";
    }
    IN MIR-IND-812-817-FLD-5     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Non-Automatic-renewal Policy";
    }
    IN MIR-IND-812-817-FLD-6     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Non-Automatic-renewal Processed";
    }
    IN MIR-IND-812-817-FLD-7     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Premium-based Benefit Policy";
    }
    IN MIR-IND-812-817-FLD-8     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferred Payout Policy";
    }
    IN MIR-ADD3-0-35-FLD-1    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reissued Policy Certification  G";
    }
    IN MIR-ADD3-0-35-FLD-2    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Change of Dividend Payment Method G";
    }
    IN MIR-ADD3-0-35-FLD-3    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Health Congratulatory Benefit Accumulation G";
    }
    IN MIR-ADD3-0-35-FLD-4    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Health Congratulatory Benefit Payment G";
    }
    IN MIR-ADD3-0-35-FLD-5    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Health Congratulatory Benefit Payment History G";
    }
    IN MIR-ADD3-0-35-FLD-6   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Vesting G";
    }
    IN MIR-ADD3-0-35-FLD-7    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Conditions G";
    }
    IN MIR-ADD3-0-35-FLD-8    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Set Policy Sales G";
    }
    IN MIR-ADD3-0-35-FLD-9    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Extended Account G";
    }
    IN MIR-ADD3-0-35-FLD-10    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bank Rider G";
    }
    IN MIR-ADD3-0-35-FLD-11   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Injury Ride G";
    }
    IN MIR-ADD3-0-35-FLD-12    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New General Medical Rider Bases G";
    }
    IN MIR-ADD3-0-35-FLD-13    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Family Medical Rider Bases G";
    }
    IN MIR-ADD3-0-35-FLD-14    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Adult Disease Rider G";
    }
    IN MIR-ADD3-0-35-FLD-15    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Sickness Hospitalization Rider G";
    }
    IN MIR-ADD3-0-35-FLD-16    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Accidental Hospitalization Rider G";
    }
    IN MIR-ADD3-0-35-FLD-17    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Traffic Accidental Ride G";
    }
    IN MIR-ADD3-0-35-FLD-18    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Serious Injury Annuity Rider G";
    }
    IN MIR-ADD3-0-35-FLD-19    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bank Transfer Change G";
    }
    IN MIR-ADD3-0-35-FLD-20    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Group Dividend Notice G";
    }
    IN MIR-ADD3-0-35-FLD-21    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Partial Exclusion G ";
    }
    IN MIR-ADD3-0-35-FLD-22    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Change Information G";
    }
    IN MIR-ADD3-0-35-FLD-23    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "ABC Rider G";
    }
    IN MIR-ADD3-0-35-FLD-24    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Whole Life Rider G";
    }
    IN MIR-ADD3-0-35-FLD-25    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Endowment Rider G";
    }
    IN MIR-ADD3-0-35-FLD-26    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Eligible Rider Payout Accumulation G";
    }
    IN MIR-ADD3-0-35-FLD-27    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion E1 G";
    }
    IN MIR-ADD3-0-35-FLD-28    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Detail Registration G";
    }
    IN MIR-ADD3-0-35-FLD-29    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferral Benefit Bases G";
    }
    IN MIR-ADD3-0-35-FLD-30    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferral Benefit History G";
    }
    IN MIR-ADD3-0-35-FLD-31    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Taxation of Tax Withheld G";
    }
    IN MIR-ADD3-0-35-FLD-32    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity Care Shift G";
    }
    IN MIR-ADD3-0-35-FLD-33    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "21th Century Saving Bases G";
    }
    IN MIR-ADD3-0-35-FLD-34    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Term Insurance Rider G";
    }
    IN MIR-ADD3-0-35-FLD-35    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Vesting Whole Life Benefit  G";
    }
    IN MIR-ADD3-0-35-FLD-36   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deposit History 2G";
    }
    IN MIR-IND-0-1-FLD-1    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Conversion Deposit History G";
    }
    IN MIR-IND-0-1-FLD-2    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New ConversionSpecial Dividend PaymentＧ";
    }
    IN MIR-ADB-RIDER    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Additional Indicator 4/New Accidental Add. Oatment RiderＧ";
    }
    IN MIR-IND-3-35-FLD-1    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Trail CommissionＧ";
    }
    IN MIR-IND-3-35-FLD-2    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Whole Life Payment MaturityＧ";
    }
    IN MIR-IND-3-35-FLD-3    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Whole Life Special DividendＧ";
    }
    IN MIR-IND-3-35-FLD-4    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Tax Certificate Advance Payment PremiumＧ";
    }
    IN MIR-IND-3-35-FLD-5    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Tax Certificate Change PremiumＧ";
    }
    IN MIR-IND-3-35-FLD-6    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferral Premium InterestＧ";
    }
    IN MIR-IND-3-35-FLD-7    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Term Life Rider with Survivor Benefit Ｇ";
    }
    IN MIR-IND-3-35-FLD-8    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferral Survior Benefit DeferralＧ";
    }
    IN MIR-IND-3-35-FLD-9    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "SurvivorBenefit PaymentＧ";
    }
    IN MIR-IND-3-35-FLD-10    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Survivor Benefit Payment HistoryＧ";
    }
    IN MIR-IND-3-35-FLD-11    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Children Insurance BasicＧ";
    }
    IN MIR-IND-3-35-FLD-12    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferral Congratulatory MoneyＧ";
    }
    IN MIR-IND-3-35-FLD-13    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Congratulatory Money PaymentＧ";
    }
    IN MIR-IND-3-35-FLD-14   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Congratulatory Money Payment HistoryＧ";
    }
    IN MIR-IND-3-35-FLD-15    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion Adjustment DividendＧ";
    }
    IN MIR-IND-3-35-FLD-16    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Advance Payment Unallocated Dividend RateHistoryＧ";
    }
    IN MIR-IND-3-35-FLD-17    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Set Sales 2G";
    }
    IN MIR-IND-3-35-FLD-18    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Injury Rider Family HistoryＧ";
    }
    IN MIR-IND-3-35-FLD-19    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accdental Hospitalization Rider Family HistoryＧ";
    }
    IN MIR-IND-3-35-FLD-20    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Sickness Hospitalization Rider Family HistoryＧ";
    }
    IN MIR-IND-3-35-FLD-21    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Outpatient Rider Family HistoryＧ";
    }
    IN MIR-IND-3-35-FLD-22    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Term Life RiderＧ";
    }
    IN MIR-IND-3-35-FLD-23    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Family Term Life RiderSpouse TypeＧ";
    }
    IN MIR-IND-3-35-FLD-24    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Family term Life RiderChild TypeＧ";
    }
    IN MIR-IND-3-35-FLD-25    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Injury RiderＧ";
    }
    IN MIR-IND-3-35-FLD-26    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Hospitalization RiderＧ";
    }
    IN MIR-IND-3-35-FLD-27    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Sicknes Hospitalization RiderＧ";
    }
    IN MIR-IND-3-35-FLD-28    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Outpatient RiderＧ";
    }
    IN MIR-IND-3-35-FLD-29    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Whole Life RIderＧ";
    }
    IN MIR-IND-3-35-FLD-30    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Endowment RiderＧ";
    }
    IN MIR-IND-3-35-FLD-31    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Family Medical Rider BasicＧ";
    }
    IN MIR-IND-3-35-FLD-32    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Adult Desease RiderＧ";
    }
    IN MIR-IND-3-35-FLD-33    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Living Needs PaymentＧ";
    }
    IN MIR-IND-1410-11-FLD-1      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "1991 New Conversion Policy";
    }
    IN MIR-IND-1410-11-FLD-2      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Step Payment Surrender";
    }
    IN MIR-LIVNG-NEED-RID      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Living Needs Rider Addition Policy";
    }
    IN MIR-IND-1413-17-FLD-1       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Excluding Sickness・Hosp.Rider with Child Policy";
    }
    IN MIR-IND-1413-17-FLD-2       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "P Base Policy New Business Policy";
    }
    IN MIR-IND-1413-17-FLD-3       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy which rider payment term is longer than Base policy payment term";
    }
    IN MIR-IND-1413-17-FLD-4       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Rider Updating Processing１";
    }
    IN MIR-IND-1413-17-FLD-5       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Rider Updating Processing２";
    }
    IN MIR-DIST-MEMBRS       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Distributor Members";
    }
    IN MIR-OWNR-DTH      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Policy Owner Death";
    }
    IN MIR-NYOSE-NT-ALWD       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Bank Account ‘Nayose’ not allowed";
    }
    IN MIR-IND-1421-31-FLD-1       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Financial Reinsurance";
    }
    IN MIR-IND-1421-31-FLD-2       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Initial Payment Bank Account Policy";
    }
    IN MIR-IND-1421-31-FLD-3       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Coverage Renewal Reserve";
    }
    IN MIR-IND-1421-31-FLD-4       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Coverage Renewal Settlement";
    }
    IN MIR-IND-1421-31-FLD-5       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bank AccountExpiraration Policy";
    }
    IN MIR-IND-1421-31-FLD-6       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Automatic Sending Money Policy";
    }
    IN MIR-IND-1421-31-FLD-7       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Provision Change Policy";
    }
    IN MIR-IND-1421-31-FLD-8       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Customer Identification not Created";
    }
    IN MIR-IND-1421-31-FLD-9       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Customer Identification Created after Policy Issue";
    }
    IN MIR-IND-1421-31-FLD-10       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "UI Products Type Change Policy";
    }
    IN MIR-IND-1421-31-FLD-11       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Universal Change Plan Policy";
    }
    IN MIR-MGA-POL       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/MGA Policy";
    }
    IN MIR-BULK-APP-POL       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Bulk Application Policy";
    }
    IN MIR-IND-1434-35-FLD-1       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Type Change from Preferred Products";
    }
    IN MIR-IND-1434-35-FLD-2      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Master Reorganization Processed";
    }
    IN MIR-LOW-CSV-IND       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Low-CSV Provision";
    }
    IN MIR-FID-POL       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/FID Policy";
    }
    IN MIR-SLF-EMPLR-POL       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Self Employer Policy";
    }
    IN MIR-MED-SEL-IND       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Medical Selection Bit";
    }
    IN MIR-UEPREM-REF-APP        
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Unearned Premium Refund Applied";
    }
    IN MIR-STEP-IN-RT-APP       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Step-in Right Applied Policy";
    }
    IN MIR-DFRNT-PAYMNT-POL-2      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Different Number of Payment Policy 2";
    }
    IN MIR-DFRNT-PAYMNT-POL-3    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/Different Number of Payment Policy 3";
    }
    IN MIR-CASHLESS-2P       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/2P Cashless Bit";
    }
    IN MIR-FLD-1445      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Division 4/ManuMate Joint Solicitation";
    }
    IN MIR-ADD5-0-35-FLD-1       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Change Proxess Info.Ｇ";
    }
    IN MIR-ADD5-0-35-FLD-2       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Using Bonus Payment Basic G";
    }
    IN MIR-ADD5-0-35-FLD-3       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bank Rider Using Bonus Payment";
    }
    IN MIR-ADD5-0-35-FLD-4       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Term LifeRider Using Bonus PaymentＧ";
    }
    IN MIR-ADD5-0-35-FLD-5      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Female Sickness Hospitalization Ride Ｇ";
    }
    IN MIR-ADD5-0-35-FLD-6      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity Benefit RiderＧ";
    }
    IN MIR-ADD5-0-35-FLD-7       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Additional Survivor Benefit DeferralＧ";
    }
    IN MIR-ADD5-0-35-FLD-8       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferral VestingＧ";
    }
    IN MIR-ADD5-0-35-FLD-9       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Trail Commission for Interm AddiionＧ";
    }
    IN MIR-ADD5-0-35-FLD-10       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Term Life Special Dividend AmountＧ";
    }
    IN MIR-ADD5-0-35-FLD-11       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deferral Special Dividend Ｇ";
    }
    IN MIR-ADD5-0-35-FLD-12       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Advance Payment Management AcceptＧ";
    }
    IN MIR-ADD5-0-35-FLD-13      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Performance ２Ｇ";
    }
    IN MIR-ADD5-0-35-FLD-14       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Conversion NewＥ１Ｇ";
    }
    IN MIR-ADD5-0-35-FLD-15       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Income Guaranteed RiderＧ";
    }
    IN MIR-ADD5-0-35-FLD-16       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Long Term Hospitalization RiderＧ";
    }
    IN MIR-ADD5-0-35-FLD-17       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "LongTermHospitalization Family HistoryＧ";
    }
    IN MIR-ADD5-0-35-FLD-18       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Leaving Hospital RiderＧ";
    }
    IN MIR-ADD5-0-35-FLD-19       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Leaving Hospital Rider Family HistoryＧ";
    }
    IN MIR-ADD5-0-35-FLD-20       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Allocation G:";
    }
    IN MIR-ADD5-0-35-FLD-21       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Rider Update Info.Ｇ";
    }
    IN MIR-ADD5-0-35-FLD-22       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lapse・Surrender Info.Ｇ";
    }
    IN MIR-ADD5-0-35-FLD-23       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Application Form Management Ｇ";
    }
    IN MIR-ADD5-0-35-FLD-24       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Payment AccountＧ";
    }
    IN MIR-ADD5-0-35-FLD-25       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Special Sickness Coverage RiderＧ";
    }
    IN MIR-ADD5-0-35-FLD-26       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Outpatient RiderＧ";
    }
    IN MIR-ADD5-0-35-FLD-27       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Outpatient Rider Family HistoryＧ";
    }
    IN MIR-ADD5-0-35-FLD-28       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Cancer Check-up Lump Sum maountＧ";
    }
    IN MIR-ADD5-0-35-FLD-29       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Duplication Ｇ";
    }
    IN MIR-ADD5-0-35-FLD-30       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity Payment Term Life RiderＧ";
    }
    IN MIR-ADD5-0-35-FLD-31       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Saving RiderＧ";
    }
    IN MIR-ADD5-0-35-FLD-32       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Provision Change BasicＧ";
    }
    IN MIR-ADD5-0-35-FLD-33       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Provision Change RiderＧ";
    }
    IN MIR-ADD5-0-35-FLD-34       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Base Policy Info at UpdateＧ";
    }
    IN MIR-ADD5-0-35-FLD-35       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Provision Change AnnuityＧ";
    }
    IN MIR-ADD5-0-35-FLD-36
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New Accidental Outpatient RiderＧ";
    }
    IN MIR-ADD6-0-24-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "No-Accident Benefit Payment G";
    }
    IN MIR-ADD6-0-24-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Dealth Benefit G";
    }
    IN MIR-ADD6-0-24-FLD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Adult Disease Rider G";
    }
    IN MIR-ADD6-0-24-FLD-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Sickness Hospitalization Rider G";
    }
    IN MIR-ADD6-0-24-FLD-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accidental Hospitalization Rider G";
    }
    IN MIR-ADD6-0-24-FLD-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Injury RiderG";
    }
    IN MIR-ADD6-0-24-FLD-7
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Term Insurance with Survivor Benefit  Rider G";
    }
    IN MIR-ADD6-0-24-FLD-8
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Outpatient Rider G";
    }
    IN MIR-ADD6-0-24-FLD-9
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Female Sickness Hospitalization Rider G";
    }
    IN MIR-ADD6-0-24-FLD-10
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Long-Term Hospitalization Rider G";
    }
    IN MIR-ADD6-0-24-FLD-11
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Discharge Hospital Rider G";
    }
    IN MIR-ADD6-0-24-FLD-12
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Living Benefit Payout History G";
    }
    IN MIR-ADD6-0-24-FLD-13
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Cancer Insurance G";
    }
    IN MIR-ADD6-0-24-FLD-14
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bulk Wire Transfer G";
    }
    IN MIR-ADD6-0-24-FLD-15
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Distributer Agent Information G";
    }
    IN MIR-ADD6-0-24-FLD-16
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Exclusion for Certain Disability G";
    }
    IN MIR-ADD6-0-24-FLD-17
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Proxy Beneficiary Provision G";
    }
    IN MIR-ADD6-0-24-FLD-18
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "FID Bank Agent Information G";
    }
    IN MIR-ADD6-0-24-FLD-19
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policyholder Phone Number G";
    }
    IN MIR-ADD6-0-24-FLD-20
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Initial Payment Deposit G";
    }
    IN MIR-ADD6-0-24-FLD-21
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Dummy1";
    }
    IN MIR-ADD6-0-24-FLD-22
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Tax Certificate Change Premium2Ｇ";
    }
    IN MIR-ADD6-0-24-FLD-23
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Base Policy Information at Renewal G";
    }
    IN MIR-INS-3DD-G
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Additional Indicator 6/3DD Insurance G";
    }
    IN MIR-ADD6-26-35-FLD-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "ALD Rider G";
    }
    IN MIR-ADD6-26-35-FLD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "異動情報２Ｇ";
    }
    IN MIR-ADD6-26-35-FLD-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "災害対応情報";
    }
    IN MIR-ADD6-26-35-FLD-4
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "ダミー２";
    }
    IN MIR-SUB-STD-DED 
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard G/Deduction due to Substandard ";
    }
    IN MIR-SUB-STD-AGE  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard G/Age Addition due to Substandard";
    }
    IN MIR-SUB-STD-SPR-RT   
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard G/Substandard Special Premium Rate for Base Policy";
    }
    IN MIR-SUB-STD-TL-SPR-RT   
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Substandard G/Term Life Type Substandard Special Premium Rate";
    }
    IN MIR-TINS-GSC  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Group Scale Code";
    }
    IN MIR-TINS-BP-PREM   
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Update Base Policy Premium";
    }
    IN MIR-TINS-RID-PREM   
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Update Rider Premium Total";
    }
    IN MIR-TINS-NO-IND   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "New/Old Indicator";
    }
    IN MIR-TINS-UPDT-X1   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Update X1";
    }
    IN MIR-TINS-UPDT-X2  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Update X2";
    }
    IN MIR-TINS-UPDT-SYOS    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Update 'Syosyu'";
    }
    IN MIR-TINS-UPDT-M    
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Update M";
    }
    IN MIR-TINS-UPDT-NUM 
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Update";
    }
    IN MIR-TINS-NPOL-ISS-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "New Policy Issue Date";
    }
    IN MIR-REINS-NUM
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Reinsurance Number";
    }
    IN MIR-REINS-CED-PCT    
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Ceding Percentage";
    }
    IN MIR-REINS-CED-FA   
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Death of Cedant S";
    }
    IN MIR-REINS-CED-AMT  
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Ceding Amount at New Business(A)";
    }
    IN MIR-REINS-MORT-RT 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Insured Mortality Rate (MR)";
    }
    IN MIR-REINS-TERM-CD   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reinsurance Validation Termination Code";
    }
    IN MIR-PERFOR-SUM-IND
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Performance Summing Up Indicator";
    }
    IN MIR-PERFOR-3DD-PREM   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "3DD Rider Premium at New Business";
    }
    IN MIR-PERFOR-RA-CD
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Rider Agency Code";
    }
    IN MIR-PERFOR-SC-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Share Contract Indicator";
    }
    IN MIR-PERFOR-VW-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Variable Writing Indicator";
    }
    IN MIR-LOAN-UADDR-IND  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Address Unnecessary Bit";
    }
    IN  MIR-LOAN-SHR-NUM   
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Shared Number";
    }
    IN MIR-LOAN-LOAN-AMT 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Current Loan Amount";
    }
    IN MIR-LOAN-INT-DIFF 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest Excessiveness and Difficiency";
    }
    IN MIR-LOAN-INT  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Loan Interest";
    }
    IN MIR-LOAN-INT-DT    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Interest Valid Date";
    }
    IN MIR-LOAN-DT  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date of Loan";
    }
    IN MIR-LOAN-DUE-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Due Date of Policy Payment";
    }
    IN MIR-LOAN-INT-CALC
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interest Calculation Division";
    }
    IN MIR-LR-PROV-LAPS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Provision Lapse Bit";
    }
    IN MIR-LR-STAT-LAPS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Statics Lapse Bit";
    }
    IN MIR-LR-PROV-REIN-IND   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Provision Reinstatement Bit";
    }
    IN MIR-LR-STAT-REIN-IND  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Statics Reinstatement Bit";
    }
    IN MIR-LR-REIN-SD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reinstatement Self Disclosure Bit";
    }
    IN MIR-LR-REIN-UW-IND   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reinstatement Underwriting Bit";
    }
    IN MIR-LR-REIN-REJ-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reinstatement Rejection Bit";
    }
    IN MIR-LR-PROV-LAPS-DT  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Provision Lapse Date";
    }
    IN MIR-LR-STAT-EXP-YR     
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Statics Expiraration Year";
    }
    IN MIR-LR-PROV-REIN-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Provision Reinstatement Date";
    }
    IN MIR-PAID-UP-AUT-IND  
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Automatic Paid Up Bit";
    }
    IN MIR-PAID-UP-CAP-AMT 
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Paid Up Capital";
    }
    IN MIR-PAID-UP-DTH-CLM-AMT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Paid Up Death Claim";
    }
    IN MIR-PAID-UP-COMM-DT   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Paid Up Commence Date";
    }
    IN MIR-APL-PRV-AMT-INT 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Previous APL Amount and Interest";
    }
    IN MIR-APL-CURR-AMT  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "APL Amount for this time";
    }
    IN MIR-APL-CURR-MNTHS
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of APL Month";
    }
    IN MIR-APL-YR-MNTHS  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Number of APL Year and Month";
    }
    IN MIR-APL-ACCU-AMT 
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Accumulated APL Amount";
    }
    IN MIR-APL-ACCU-YR-MO  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Accumulated APL Year and Month";
    }
    IN MIR-FAP-ADV-PMT-MNTH  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Advanced Payment Fix Month";
    }
    IN MIR-FAP-ADV-PMT-MO-CNT  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Advanced Payment Fix Months";
    }
    IN MIR-AAC-XFER-CTL 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Transfer CTL";
    }
    IN MIR-AAC-PRV-DEAL-BR  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Former Dealing Branch";
    }
    IN MIR-AAC-PRV-DEAL-EMPL
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Former Dealing Employee";
    }
    IN MIR-AAC-PRV-GRP-CD
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Former Group Code";
    }
    IN MIR-AAC-PRV-DIST-CD
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Former Dstributor Code";
    }
    IN MIR-AAC-XFER-IN-DT  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date of Moving in(Transfer)";
    }
    IN MIR-AAC-XFER-OUT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date of Moving out(Trasfer)";
    }
    IN MIR-PAC-BT-SUSP-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bank Transfer Suspense Bit";
    }
    IN MIR-PAC-BT-XFER-DT  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Bank Transfer Date";
    }
    IN MIR-PAC-CODE-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Code Indicator";
    }
    IN MIR-PAC-DIST
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Distributor or Group";
    }
    IN MIR-PAC-ACCT-NUM      
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Account Number";
    }
    IN MIR-PAC-BNK-CD  
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Code";
    }
    IN MIR-PAC-BRCH-CD 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Branch Code";
    }
    IN MIR-PAC-DEP-TYP   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Deposit Type";
    }
    IN MIR-PAC-XFER-DAY   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Transfer Date";
    }
    IN MIR-PAC-FRST-XFER-MNTH     
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "The First Transfer Deduction Month";
    }
    IN MIR-PAC-ACC-HLDR-NM   
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Account Holder Name";
    }
    IN MIR-GROUP-BUS-VOL-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Business Vouluntary Bit";
    }
    IN MIR-GROUP-AGNCY    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Agency";
    }
    IN MIR-GROUP-DEPT-CD
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Departmental(belonging) Code";
    }
    IN MIR-GROUP-GRP-CD     
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Group Code";
    }
    IN MIR-GROUP-DIST-CD
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Distributor Code";
    }
    IN MIR-GROUP-EMP-CD  
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Employee Code";
    }
    IN MIR-REINST-MED-UW-IND     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Medical UW Completion Bit";
    }
    IN MIR-REINST-TYP-IN-BRCH    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Typein Branch";
    }
    IN MIR-REINST-DECL-DT     
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Declaration Date";
    }
    IN MIR-REINST-WAIT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Waiting Date of Reinstatement";
    }
    IN MIR-OVRDUE-INT-ADJ-DT   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Adjustment Date of Overdue Interest";
    }
    IN MIR-OVRDUE-INT-EXT-INT     
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Necessary extension of Interest";
    }
    IN MIR-OVRDUE-INT-ADJ-AMT     
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Adjustment Amount of Overdue Interest";
    }
    IN MIR-LH-PREV-INT-EFF-DT    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Previous Effective Interest Date";
    }
    IN MIR-LH-LOAN-AMT      
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Loan Amount";
    }
    IN MIR-LH-HNDL-BRCH-1  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling Branch (Moving-in Branch)(1)";
    }

    IN MIR-LH-CHNG-DEPT-1  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department, dealing with the change to Individual(1)";
    }

    IN MIR-LH-JRNL-DT-1    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date(1)";
    }

    IN MIR-LH-STRT-DT-1    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan History G/Start Date(1)";
    }

    IN MIR-LH-TRXN-CD-1    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Transaction Code(1)";
    }

    IN MIR-LH-INT-1        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest (uncollect+ unearned -  )(1)";
    }

    IN MIR-LH-LOAN-REPAY-1 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan (Repayment)(1)";
    }

    IN MIR-LH-LOAN-BAL-1   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Amount(1)";
    }
    IN MIR-LH-HNDL-BRCH-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling Branch (Moving-in Branch)(2)";
    }

    IN MIR-LH-CHNG-DEPT-2  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department, dealing with the change to Individual(2)";
    }

    IN MIR-LH-JRNL-DT-2    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date(2)";
    }

    IN MIR-LH-STRT-DT-2    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan History G/Start Date(2)";
    }

    IN MIR-LH-TRXN-CD-2    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Transaction Code(2)";
    }

    IN MIR-LH-INT-2        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest (uncollect+ unearned -  )(2)";
    }

    IN MIR-LH-LOAN-REPAY-2 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan (Repayment)(2)";
    }

    IN MIR-LH-LOAN-BAL-2   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Amount(2)";
    }
    IN MIR-LH-HNDL-BRCH-3 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling Branch (Moving-in Branch)(3)";
    }

    IN MIR-LH-CHNG-DEPT-3  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department, dealing with the change to Individual(3)";
    }

    IN MIR-LH-JRNL-DT-3    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date(3)";
    }

    IN MIR-LH-STRT-DT-3    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan History G/Start Date(3)";
    }

    IN MIR-LH-TRXN-CD-3    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Transaction Code(3)";
    }

    IN MIR-LH-INT-3        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest (uncollect+ unearned -  )(3)";
    }

    IN MIR-LH-LOAN-REPAY-3 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan (Repayment)(3)";
    }

    IN MIR-LH-LOAN-BAL-3   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Amount(3)";
    }
    IN MIR-LH-HNDL-BRCH-4  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling Branch (Moving-in Branch)(4)";
    }

    IN MIR-LH-CHNG-DEPT-4  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department, dealing with the change to Individual(4)";
    }

    IN MIR-LH-JRNL-DT-4    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date(4)";
    }

    IN MIR-LH-STRT-DT-4    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan History G/Start Date(4)";
    }

    IN MIR-LH-TRXN-CD-4    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Transaction Code(4)";
    }

    IN MIR-LH-INT-4        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest (uncollect+ unearned -  )(4)";
    }

    IN MIR-LH-LOAN-REPAY-4 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan (Repayment)(4)";
    }

    IN MIR-LH-LOAN-BAL-4   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Amount(4)";
    }
    IN MIR-LH-HNDL-BRCH-5  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling Branch (Moving-in Branch)(5)";
    }

    IN MIR-LH-CHNG-DEPT-5  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department, dealing with the change to Individual(5)";
    }

    IN MIR-LH-JRNL-DT-5    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date(5)";
    }

    IN MIR-LH-STRT-DT-5    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan History G/Start Date(5)";
    }

    IN MIR-LH-TRXN-CD-5    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Transaction Code(5)";
    }

    IN MIR-LH-INT-5        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest (uncollect+ unearned -  )(5)";
    }

    IN MIR-LH-LOAN-REPAY-5 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan (Repayment)(5)";
    }

    IN MIR-LH-LOAN-BAL-5   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Amount(5)";
    }

    IN MIR-LH-HNDL-BRCH-6  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Handling Branch (Moving-in Branch)(6)";
    }

    IN MIR-LH-CHNG-DEPT-6  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department, dealing with the change to Individual(6)";
    }

    IN MIR-LH-JRNL-DT-6    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date(6)";
    }

    IN MIR-LH-STRT-DT-6    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan History G/Start Date(6)";
    }

    IN MIR-LH-TRXN-CD-6    
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Transaction Code(6)";
    }

    IN MIR-LH-INT-6        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Interest (uncollect+ unearned -  )(6)";
    }

    IN MIR-LH-LOAN-REPAY-6 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan (Repayment)(6)";
    }

    IN MIR-LH-LOAN-BAL-6   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Loan Amount(6)";
    }

    IN MIR-BNFT-HIST-TXN-CD-1
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Benefit History Transaction Code(1)";
    }
    IN MIR-BNFT-HIST-TXN-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Transaction Date(1)";
    }
    IN MIR-BNFT-HIST-VAL-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Valid Date(1)";
    }
    IN MIR-BNFT-HIST-S1-1    
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S1(1)";
    }
    IN MIR-BNFT-HIST-S2-1   
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S2(1)";
    } 

    IN MIR-BNFT-HIST-TXN-CD-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Benefit History Transaction Code(2)";
    }
    IN MIR-BNFT-HIST-TXN-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Transaction Date(2)";
    }
    IN MIR-BNFT-HIST-VAL-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Valid Date(2)";
    }
    IN MIR-BNFT-HIST-S1-2    
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S1(2)";
    }
    IN MIR-BNFT-HIST-S2-2   
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S2(2)";
    } 

    IN MIR-BNFT-HIST-TXN-CD-3
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Benefit History Transaction Code(3)";
    }
    IN MIR-BNFT-HIST-TXN-DT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Transaction Date(3)";
    }
    IN MIR-BNFT-HIST-VAL-DT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Valid Date(3)";
    }
    IN MIR-BNFT-HIST-S1-3    
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S1(3)";
    }
    IN MIR-BNFT-HIST-S2-3   
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S2(3)";
    } 

    IN MIR-BNFT-HIST-TXN-CD-4
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Benefit History Transaction Code(4)";
    }
    IN MIR-BNFT-HIST-TXN-DT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Transaction Date(4)";
    }
    IN MIR-BNFT-HIST-VAL-DT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Valid Date(4)";
    }
    IN MIR-BNFT-HIST-S1-4    
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S1(4)";
    }
    IN MIR-BNFT-HIST-S2-4   
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S2(4)";
    } 

    IN MIR-BNFT-HIST-TXN-CD-5
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Benefit History Transaction Code(5)";
    }
    IN MIR-BNFT-HIST-TXN-DT-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Transaction Date(5)";
    }
    IN MIR-BNFT-HIST-VAL-DT-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Valid Date(5)";
    }
    IN MIR-BNFT-HIST-S1-5    
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S1(5)";
    }
    IN MIR-BNFT-HIST-S2-5   
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S2(5)";
    } 
    IN MIR-BNFT-HIST-TXN-CD-6
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Benefit History Transaction Code(6)";
    }
    IN MIR-BNFT-HIST-TXN-DT-6
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Transaction Date(6)";
    }
    IN MIR-BNFT-HIST-VAL-DT-6
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Benefit History Valid Date(6)";
    }
    IN MIR-BNFT-HIST-S1-6    
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S1(6)";
    }
    IN MIR-BNFT-HIST-S2-6   
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Benefit history S2(6)";
    } 

    IN MIR-DEP-HIST-PREM-DEP-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Premium Deposit(1)";
    } 
    IN MIR-DEP-HIST-DIV-PAYO-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Payout (Chargeback)(1)";
    } 
    IN MIR-DEP-HIST-AMT-ADJ-1 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Over/short Amount Adjustment(1)";
    } 
    IN MIR-DEP-HIST-LOAN-RPY-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Loan Repayment(1)";
    } 
    IN MIR-DEP-HIST-INT-DEP-1 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Overdue Interest Deposit (1)";
    } 
    IN MIR-DEP-HIST-PREM-REF-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Premium Refund (1)";
    } 
    IN MIR-DEP-HIST-DEP-CNT-1 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department History Department Count (1)";
    } 
    IN MIR-DEP-HIST-DEALR-1   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Department History Dealer (1)";
    } 
    IN MIR-DEP-HIST-PAYO-DT-1 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department History Payout Date (1)";
    } 


    IN MIR-DEP-HIST-PREM-DEP-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Premium Deposit(2)";
    } 
    IN MIR-DEP-HIST-DIV-PAYO-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Payout (Chargeback)(2)";
    } 
    IN MIR-DEP-HIST-AMT-ADJ-2 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Over/short Amount Adjustment(2)";
    } 
    IN MIR-DEP-HIST-LOAN-RPY-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Loan Repayment(2)";
    } 
    IN MIR-DEP-HIST-INT-DEP-2 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Overdue Interest Deposit (2)";
    } 
    IN MIR-DEP-HIST-PREM-REF-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Premium Refund (2)";
    } 
    IN MIR-DEP-HIST-DEP-CNT-2 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department History Department Count (2)";
    } 
    IN MIR-DEP-HIST-DEALR-2   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Department History Dealer (2)";
    } 
    IN MIR-DEP-HIST-PAYO-DT-2 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department History Payout Date (2)";
    } 


    IN MIR-DEP-HIST-PREM-DEP-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Premium Deposit(3)";
    } 
    IN MIR-DEP-HIST-DIV-PAYO-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Payout (Chargeback)(3)";
    } 
    IN MIR-DEP-HIST-AMT-ADJ-3 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Over/short Amount Adjustment(3)";
    } 
    IN MIR-DEP-HIST-LOAN-RPY-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Loan Repayment(3)";
    } 
    IN MIR-DEP-HIST-INT-DEP-3 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Overdue Interest Deposit (3)";
    } 
    IN MIR-DEP-HIST-PREM-REF-3
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Premium Refund (3)";
    } 
    IN MIR-DEP-HIST-DEP-CNT-3 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department History Department Count (3)";
    } 
    IN MIR-DEP-HIST-DEALR-3   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Department History Dealer (3)";
    } 
    IN MIR-DEP-HIST-PAYO-DT-3 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department History Payout Date (3)";
    } 

    IN MIR-DEP-HIST-PREM-DEP-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Premium Deposit(4)";
    } 
    IN MIR-DEP-HIST-DIV-PAYO-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Payout (Chargeback)(4)";
    } 
    IN MIR-DEP-HIST-AMT-ADJ-4 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Over/short Amount Adjustment(4)";
    } 
    IN MIR-DEP-HIST-LOAN-RPY-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Loan Repayment(4)";
    } 
    IN MIR-DEP-HIST-INT-DEP-4 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Overdue Interest Deposit (4)";
    } 
    IN MIR-DEP-HIST-PREM-REF-4
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Premium Refund (4)";
    } 
    IN MIR-DEP-HIST-DEP-CNT-4 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department History Department Count (4)";
    } 
    IN MIR-DEP-HIST-DEALR-4   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Department History Dealer (4)";
    } 
    IN MIR-DEP-HIST-PAYO-DT-4 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department History Payout Date (4)";
    } 

    IN MIR-DEP-HIST-PREM-DEP-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Premium Deposit(5)";
    } 
    IN MIR-DEP-HIST-DIV-PAYO-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Payout (Chargeback)(5)";
    } 
    IN MIR-DEP-HIST-AMT-ADJ-5 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Over/short Amount Adjustment(5)";
    } 
    IN MIR-DEP-HIST-LOAN-RPY-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Loan Repayment(5)";
    } 
    IN MIR-DEP-HIST-INT-DEP-5 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Overdue Interest Deposit (5)";
    } 
    IN MIR-DEP-HIST-PREM-REF-5
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Premium Refund (5)";
    } 
    IN MIR-DEP-HIST-DEP-CNT-5 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department History Department Count (5)";
    } 
    IN MIR-DEP-HIST-DEALR-5   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Department History Dealer (5)";
    } 
    IN MIR-DEP-HIST-PAYO-DT-5 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department History Payout Date (5)";
    } 


    IN MIR-DEP-HIST-PREM-DEP-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Premium Deposit(6)";
    } 
    IN MIR-DEP-HIST-DIV-PAYO-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Dividend Payout (Chargeback)(6)";
    } 
    IN MIR-DEP-HIST-AMT-ADJ-6 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Over/short Amount Adjustment(6)";
    } 
    IN MIR-DEP-HIST-LOAN-RPY-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Auto Loan Repayment(6)";
    } 
    IN MIR-DEP-HIST-INT-DEP-6 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Overdue Interest Deposit (6)";
    } 
    IN MIR-DEP-HIST-PREM-REF-6
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Department History Premium Refund (6)";
    } 
    IN MIR-DEP-HIST-DEP-CNT-6 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Department History Department Count (6)";
    } 
    IN MIR-DEP-HIST-DEALR-6   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Department History Dealer (6)";
    } 
    IN MIR-DEP-HIST-PAYO-DT-6 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department History Payout Date (6)";
    } 

    IN MIR-DEP-HIST-SP-YRMO  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Amount of Months of special payment";
    } 
    IN MIR-REISU-POL-FREQ  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Frequency of the Reissued Policy";
    } 
    IN MIR-REISU-POL-DT                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date of the Reissued Policy";
    } 
    IN MIR-PC1-SELF-COL             
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy of Self-Collection";
    } 
    IN MIR-PC1-UDED-CERT          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Unnecessary Deduction Certification Policy";
    } 
    IN MIR-PC1-BNKRPT        
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bankrupt Policy";
    }      
    IN MIR-PC1-CLM-ATCH           
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Claim Attachment Policy";
    } 
    IN MIR-PC1-MISING             
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Missing policy";
    } 
    IN MIR-PC1-EYE-DISAB          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Eyesight Disability Policy";
    } 
    IN MIR-PC1-15PR-TAX           
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "15% Taxation Policy";
    } 
    IN MIR-PC1-20PR-TAX           
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "20% Taxation Policy";
    } 
    IN MIR-PC1-S-REQ              
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Under S Requirement Policy";
    } 
    IN MIR-PC1-SP-REQ             
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "under SP Requirement Policy";
    } 
    IN MIR-PC1-CAUT               
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Caution Needed Policy";
    } 
    IN MIR-PC1-RE-CONVRT          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Re-conversional Policy";
    } 
    IN MIR-PC1-NLOAN-SET          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "National Loan Set Policy";
    } 
    IN MIR-PC1-VAR-INS            
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Variable Insurance Policy";
    } 
    IN MIR-PC1-GEN-INFO-NO        
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "General Information Unneeded Policy";
    } 
    IN MIR-PC1-OWNR-WRTNG         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "PolicyHolders Writing Policy";
    } 
    IN MIR-PC1-P-REQ              
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "P Requirement Policy before the conversion Policy";
    } 
    IN MIR-PC1-PAYO-CNF           
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Confirmation Required at Benefit Payout";
    } 
    IN MIR-PC2-UNSENT-POL-STMT    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "unsent Policy Statement Policy";
    } 
    IN MIR-PC2-SMKATA             
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Samakata Policy";
    } 
    IN MIR-PC2-AGT-BEN-PMT        
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Authorized Agent benefit Payment";
    } 
    IN MIR-PC2-SELF-PRD           
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Self Produced Policy";
    } 
    IN MIR-PC2-FAM-PRD            
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Family Produced Policy";
    } 
    IN MIR-PC2-REF-FAIL-IND       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Maturity or surrender Refund Failed Bit";
    } 
    IN MIR-PC2-BEN-CAUTN          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Health Congratulatory or Survivor Benefit caution Needed";
    } 
    IN MIR-PC2-AUT-LAPS-SURR      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Automatic Post Lapse Surrender Applied";
    } 
    IN MIR-PC2-ASGN-TERM          
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Assignment Terminated";
    } 
    IN MIR-PC2-FA-RED-HIST        
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "FA Reduction History exists";
    } 
    IN MIR-PC2-TAX-CERT-IND       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Tax Certificate not Created Bit";
    } 
    IN MIR-PC2-DUMMY                  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Dummy";
    } 
    IN MIR-PC2-V-PER-LNCH             
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "V Percentage Launch Policy";
    } 
    IN MIR-PC2-INSRD-OCC-CD           
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "(insured) Occupation Code";
    } 
    IN MIR-PC2-SPCL-RECOG-CD          
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Special Recognition Code";
    } 
    IN MIR-MTHLY-PREM-P1              
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Net Premium Amount Per Month (P1)";
    } 
    IN MIR-MTHLY-PREM-P2              
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Net Premium Amount Per Month (P2)";
    } 
    IN MIR-MTHLY-CNVR-PREM            
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Net Conversion Premium Amount per Month";
    } 
    IN MIR-BT-APP-REG-DT              
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Bank Transfer Application Reg Date";
    } 
    IN MIR-BT-APP-DEAL-BR             
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Bank Transfer Application Dealing Branch";
    } 
    IN MIR-BT-EFF-DT                  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "bank Transfer Effective Date";
    } 
    IN MIR-BT-OLD-DLNG                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "old Dealing";
    } 
    IN MIR-BT-OLD-BNK-CD              
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Old Bank code";
    } 
    IN MIR-BT-OLD-BRCH-CD             
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Old Branch Code";
    } 
    IN MIR-BT-DLNG-DIV1 
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Dealing Division";
    } 
    IN MIR-BT-IP-BRCH1  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Input Branch";
    } 
    IN MIR-BT-IP-AGCY1  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Input Agency";
    } 
    IN MIR-BT-IP-DEP1   
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Input Department";
    } 

    IN MIR-BT-DLNG-DIV2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Dealing Division";
    } 
    IN MIR-BT-IP-BRCH2  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Input Branch";
    } 
    IN MIR-BT-IP-AGCY2  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Input Agency";
    } 
    IN MIR-BT-IP-DEP2   
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Input Department";
    } 
    IN MIR-BT-DLNG-DIV3
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Dealing Division";
    } 
    IN MIR-BT-IP-BRCH3 
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Input Branch";
    } 
    IN MIR-BT-IP-AGCY3  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Input Agency";
    } 
    IN MIR-BT-IP-DEP3  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Input Department";
    } 
    IN MIR-ADDR-CHNG-DT                 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date of Address Change";
    } 
    IN MIR-LOAN-APPL-REC-DT             
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date of the loan application recieved";
    } 
    IN MIR-NON-TRTMNT-DT                
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Effective Date of nontreatment";
    } 
    IN MIR-UNPAID-RSN-MAT               
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reason of unpaid at the Maturity";
    } 
    IN MIR-UNPAID-RSN-MAT-DT            
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Confirmed Date of the Reason of unpaid at the Maturity";
    } 
    IN MIR-POL-DTL-REG-DT               
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Date of Registration";
    } 
    IN MIR-POL-DTL-REG-PART-NO          
    {
        DisplayOnly;
        Length = "12";
        SType = "Text";
        Label = "Participation Number";
    } 
    IN MIR-DFRL-DT                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Defferal Date";
    } 
    IN MIR-DFRL-END-DT                  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deffereal Ending Date";
    } 
    IN MIR-DFRL-AMT                     
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Defferal Amount";
    } 
    IN MIR-DFRL-LATST-PD-DT             
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Latest Paid Date";
    } 
    IN MIR-DFRL-LATST-DFRL-AMT          
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Latest Defferal Amount";
    } 
    IN MIR-DFRL-TOT-PAID-INT            
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Total Paid Interest";
    } 
    IN MIR-DFRL-TRXN-DT                 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Defferal Transaction Date";
    } 
    IN MIR-BDH-DEAL-BRCH-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Dealing Branch";
    } 
    IN MIR-BDH-JRNL-DT-1  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date";
    } 
    IN MIR-BDH-STRT-DT-1  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Start Date";
    } 
    IN MIR-BDH-DFRD-PMT-1 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deffered Paymment (only Principal)";
    } 
    IN MIR-BDH-PMT-INT-1  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment Interest";
    } 
    IN MIR-BDH-DEAL-BRCH-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Dealing Branch";
    } 
    IN MIR-BDH-JRNL-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date";
    } 
    IN MIR-BDH-STRT-DT-2  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Start Date";
    } 
    IN MIR-BDH-DFRD-PMT-2 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deffered Paymment (only Principal)";
    } 
    IN MIR-BDH-PMT-INT-2  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment Interest";
    } 
    IN MIR-BDH-DEAL-BRCH-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Dealing Branch";
    } 
    IN MIR-BDH-JRNL-DT-3  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date";
    } 
    IN MIR-BDH-STRT-DT-3  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Start Date";
    } 
    IN MIR-BDH-DFRD-PMT-3 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deffered Paymment (only Principal)";
    } 
    IN MIR-BDH-PMT-INT-3  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment Interest";
    } 

    IN MIR-BDH-DEAL-BRCH-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Dealing Branch";
    } 
    IN MIR-BDH-JRNL-DT-4 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date";
    } 
    IN MIR-BDH-STRT-DT-4  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Start Date";
    } 
    IN MIR-BDH-DFRD-PMT-4 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deffered Paymment (only Principal)";
    } 
    IN MIR-BDH-PMT-INT-4  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment Interest";
    } 

    IN MIR-BDH-DEAL-BRCH-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Dealing Branch";
    } 
    IN MIR-BDH-JRNL-DT-5 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date";
    } 
    IN MIR-BDH-STRT-DT-5  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Start Date";
    } 
    IN MIR-BDH-DFRD-PMT-5 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deffered Paymment (only Principal)";
    } 
    IN MIR-BDH-PMT-INT-5 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment Interest";
    } 
    IN MIR-BDH-DEAL-BRCH-6
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Dealing Branch";
    } 
    IN MIR-BDH-JRNL-DT-6  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Journal Date";
    } 
    IN MIR-BDH-STRT-DT-6  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Start Date";
    } 
    IN MIR-BDH-DFRD-PMT-6 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Deffered Paymment (only Principal)";
    } 
    IN MIR-BDH-PMT-INT-6  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment Interest";
    } 

    IN MIR-PMHS-BR-JRNL-DT-1 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Branch Journal Date";
    } 
    IN MIR-PMHS-DEP-JRNL-DT-1
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department Journal Date";
    } 
    IN MIR-PMHS-RECPT-DT-1   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Receipt Date";
    } 
    IN MIR-PMHS-FM-DT-1      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "FM Date";
    } 

    IN MIR-PMHS-BR-JRNL-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Branch Journal Date";
    } 
    IN MIR-PMHS-DEP-JRNL-DT-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department Journal Date";
    } 
    IN MIR-PMHS-RECPT-DT-2   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Receipt Date";
    } 
    IN MIR-PMHS-FM-DT-2      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "FM Date";
    } 
    IN MIR-PMHS-BR-JRNL-DT-3 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Branch Journal Date";
    } 
    IN MIR-PMHS-DEP-JRNL-DT-3
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department Journal Date";
    } 
    IN MIR-PMHS-RECPT-DT-3   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Receipt Date";
    } 
    IN MIR-PMHS-FM-DT-3      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "FM Date";
    } 

    IN MIR-PMHS-BR-JRNL-DT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Branch Journal Date";
    } 
    IN MIR-PMHS-DEP-JRNL-DT-4
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department Journal Date";
    } 
    IN MIR-PMHS-RECPT-DT-4   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Receipt Date";
    } 
    IN MIR-PMHS-FM-DT-4      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "FM Date";
    } 

    IN MIR-PMHS-BR-JRNL-DT-5 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Branch Journal Date";
    } 
    IN MIR-PMHS-DEP-JRNL-DT-5
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department Journal Date";
    } 
    IN MIR-PMHS-RECPT-DT-5   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Receipt Date";
    } 
    IN MIR-PMHS-FM-DT-5      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "FM Date";
    } 
    IN MIR-PMHS-BR-JRNL-DT-6 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Branch Journal Date";
    } 
    IN MIR-PMHS-DEP-JRNL-DT-6
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Department Journal Date";
    } 
    IN MIR-PMHS-RECPT-DT-6   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Receipt Date";
    } 
    IN MIR-PMHS-FM-DT-6     
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "FM Date";
    } 

    IN MIR-ADB-RIDER-CD                    
    {                                      
        DisplayOnly;                       
        Length = "3";                      
        SType = "Text";                    
        Label = "Rider code";                 
    }                                      
    IN MIR-ADB-TRXN-IND                    
    {                                      
        DisplayOnly;                       
        Length = "3";                      
        SType = "Text";                    
        Label = "Transaction Indicator";                 
    }                                      
    IN MIR-ADB-ISSU-DT                     
    {                                      
        DisplayOnly;                       
        Length = "8";                      
        SType = "Text";                    
        Label = "Issuee Date";                 
    }                                      
    IN MIR-ADB-ADD-DT                      
    {                                      
        DisplayOnly;                       
        Length = "8";                      
        SType = "Text";                    
        Label = "Rider Addition Date";                 
    }                                      
    IN MIR-ADB-CHNG-DT                     
    {                                      
        DisplayOnly;                       
        Length = "8";                      
        SType = "Text";                    
        Label = "Rider Change Date";                 
    }                                      
    IN MIR-ADB-AGE-AT-ADTN                 
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Age at the Rider Addition Date";                 
    }                                      
    IN MIR-ADB-CVG-PRD                     
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Rider Coverage Period";                 
    }                                      
    IN MIR-ADB-FA                          
    {                                      
        DisplayOnly;                       
        Length = "8";                      
        SType = "Text";                    
        Label = "Rider Face Amount";                 
    }                                      
    IN MIR-ADB-PREM                        
    {                                      
        DisplayOnly;                       
        Length = "8";                      
        SType = "Text";                    
        Label = "Rider Premium";                 
    }                                      
    IN MIR-ADB-SSTD-RED-YR                 
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Substandard Reduction Amount";                 
    }                                      
    IN MIR-ADB-SSTD-PRM-INCR               
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Substandard Senor Policy Premium Increase";                 
    }                                      
    IN MIR-ADB-SP-SSTD-PRM-PCT             
    {                                      
        DisplayOnly;                       
        Length = "4";                      
        SType = "Text";                    
        Label = "Percentage of special substandard premiumz";                 
    }                                      
    IN MIR-ADB-RSRV-ITEM                   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reserve Item";
    } 

    IN MIR-APC-STRT-DT-1         
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Start Date of Advance Premium";
    } 
    IN MIR-APC-ADV-PMT-CNT-1    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Number of D Advance Premium";
    } 
    IN MIR-APC-GNRL-ADV-AMT-1       
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "General Advance Premium Amount";
    } 
    IN MIR-APC-ANTY-ADV-AMT-1       
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Advance Premium Amount for Annuity";
    } 
    IN MIR-APC-ADV-PMT-MODE-1   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode at the Advance Payment";
    } 

    IN MIR-APC-STRT-DT-2         
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Start Date of Advance Premium";
    } 
    IN MIR-APC-ADV-PMT-CNT-2    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Number of D Advance Premium";
    } 
    IN MIR-APC-GNRL-ADV-AMT-2       
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "General Advance Premium Amount";
    } 
    IN MIR-APC-ANTY-ADV-AMT-2       
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Advance Premium Amount for Annuity";
    } 
    IN MIR-APC-ADV-PMT-MODE-2  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode at the Advance Payment";
    } 

    IN MIR-APC-LMSM-YR       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode at the Advance Payment";
    } 
    IN MIR-APC-LMSM-JAN        
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Jan";
    } 
    IN MIR-APC-LMSM-FEB    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Feb";
    } 
    IN MIR-APC-LMSM-MAR    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Mar";
    } 
    IN MIR-APC-LMSM-APR    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Apr";
    } 
    IN MIR-APC-LMSM-MAY    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - May";
    } 
    IN MIR-APC-LMSM-JUN    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Jun";
    } 
    IN MIR-APC-LMSM-JUL    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Jul";
    } 
    IN MIR-APC-LMSM-AUG    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Aug";
    } 
    IN MIR-APC-LMSM-SEP    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Sep";
    } 
    IN MIR-APC-LMSM-OCT    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Oct";
    } 
    IN MIR-APC-LMSM-NOV    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Nov";
    } 
    IN MIR-APC-LMSM-DEC    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lump Sum Applicable Month - Dec";
    } 
    IN MIR-APC-TOT-GNRL-LS-PRM   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "General Total Lump Sum Premium";
    } 
    IN MIR-APC-TOT-ANTY-LS-PRM 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Annuity Total Lump Sum Premium";
    } 
    IN MIR-APC-NXT-YR-LMSM-MTS  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Lump Sum Months in the Next Fiscal Year";
    } 
    IN MIR-APC-NXYR-GNR-LS-PRM   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "General Total Lump Sum Premium for the next Fiscal Year";
    } 
    IN MIR-APC-NXYR-ANT-LS-PRM   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Annuity Total Lump Sum Premium for the next Fiscal Year";
    } 
    IN MIR-PPCC-CHG-MO-YR-1         
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Changing Month and Year of Premium";
    } 
    IN MIR-PPCC-TOT-PRM-GNRL-1      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "General Total Premium";
    } 
    IN MIR-PPCC-TOT-PRM-ANTY-1      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Total Premium for Annuity";
    } 
    IN MIR-PPCC-PRV-MOD-1         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode before the conversion";
    } 
    IN MIR-PPCC-CHG-MO-YR-2        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Changing Month and Year of Premium";
    } 
    IN MIR-PPCC-TOT-PRM-GNRL-2      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "General Total Premium";
    } 
    IN MIR-PPCC-TOT-PRM-ANTY-2      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Total Premium for Annuity";
    } 
    IN MIR-PPCC-PRV-MOD-2         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode before the conversion";
    } 

    IN MIR-PPCC-CHG-MO-YR-3         
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Changing Month and Year of Premium";
    } 
    IN MIR-PPCC-TOT-PRM-GNRL-3     
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "General Total Premium";
    } 
    IN MIR-PPCC-TOT-PRM-ANTY-3      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Total Premium for Annuity";
    } 
    IN MIR-PPCC-PRV-MOD-3        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode before the conversion";
    } 

    IN MIR-PPCC-CHG-MO-YR-4         
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Changing Month and Year of Premium";
    } 
    IN MIR-PPCC-TOT-PRM-GNRL-4      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "General Total Premium";
    } 
    IN MIR-PPCC-TOT-PRM-ANTY-4      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Total Premium for Annuity";
    } 
    IN MIR-PPCC-PRV-MOD-4         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode before the conversion";
    } 

    IN MIR-PPCC-CHG-MO-YR-5         
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Changing Month and Year of Premium";
    } 
    IN MIR-PPCC-TOT-PRM-GNRL-5     
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "General Total Premium";
    } 
    IN MIR-PPCC-TOT-PRM-ANTY-5      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Total Premium for Annuity";
    } 
    IN MIR-PPCC-PRV-MOD-5        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Mode before the conversion";
    } 

    IN MIR-DBI-CURR-ACUM-INT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accumulated Interest this Time";
    } 
    IN MIR-DBI-RSRV-ACUM-INT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Accumulated Interest of Actual Reserve";
    } 
    IN MIR-DBI-PR-ACC-INT
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Principal and Accrued Interest";
    } 
    IN MIR-DBI-LTST-ACUM-DT 
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Latest Accumulation Date";
    } 
    IN MIR-ACH-END-YR-MO-1
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Advance Payment End Year and Month";
    } 
    IN MIR-ACH-DISC-RT-1  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Rate of Discount";
    } 
    IN MIR-ACH-END-YR-MO-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Advance Payment End Year and Month";
    } 
    IN MIR-ACH-DISC-RT-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Rate of Discount";
    } 
    IN MIR-ACH-END-YR-MO-3
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Advance Payment End Year and Month";
    } 
    IN MIR-ACH-DISC-RT-3  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Rate of Discount";
    } 
    IN MIR-ACH-END-YR-MO-4
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Advance Payment End Year and Month";
    } 
    IN MIR-ACH-DISC-RT-4  
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Rate of Discount";
    } 
    IN MIR-ACH-END-YR-MO-5
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Advance Payment End Year and Month";
    } 
    IN MIR-ACH-DISC-RT-5 
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Rate of Discount";
    } 
    IN MIR-ACH-END-YR-MO-6
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Advance Payment End Year and Month";
    } 
    IN MIR-ACH-DISC-RT-6 
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Rate of Discount";
    } 
    IN MIR-LIVND-SP-BENFT-AMT      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Specififed Benefit Amount";
    } 
    IN MIR-LIVND-CALC-STRT-DT  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Calculation Start Date";
    } 
    IN MIR-LIVND-PMT-DT      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Payment Date";
    } 
    IN MIR-APM-LMSM-BOX-AMT    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Lump Sum Box";
    } 
    IN MIR-APM-ERND-INT     
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Earned Interest";
    } 
    IN MIR-APM-UA-INT-DIV-YM     
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Interest Unallocated Dividend Year and Month";
    } 
    IN MIR-APM-PRCES-CD-1       
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process Code";
    } 
    IN MIR-APM-PRCES-DT-1          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process Date";
    } 
    IN MIR-APM-UA-DIV-YM-1          
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Unallocated Dividend Allotment Year and Month";
    } 
    IN MIR-APM-BAL-AMT-1       
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Balance Amount";
    } 
    IN MIR-APM-RET-MTH-BAL-1               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Retrospective Method Balance";        
    }                                      
    IN MIR-APM-PRO-MTH-BAL-1               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Prospective Method Balance";        
    }                                      
    IN MIR-APM-USED-BAL-1                  
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "used Balance";        
    }                                      
    IN MIR-APM-UNALC-DIV-MTH-1             
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unallocated Dividend Month ";        
    }                                      
    IN MIR-APM-UNERND-MTHS-1               
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unearned Month";        
    }                                      
    IN MIR-APM-ADV-PMTS-1                  
    {                                      
        DisplayOnly;                       
        Length = "6";                      
        SType = "Text";                    
        Label = "Number of Advance Payment";        
    }                                      
    IN MIR-APM-NXT-ALOT-YRMO-1             
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next Allotment Year and Month";
    } 
    IN MIR-APM-PRCES-CD-2       
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process Code";
    } 
    IN MIR-APM-PRCES-DT-2          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process Date";
    } 
    IN MIR-APM-UA-DIV-YM-2      
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Unallocated Dividend Allotment Year and Month";
    } 
    IN MIR-APM-BAL-AMT-2       
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Balance Amount";
    } 
    IN MIR-APM-RET-MTH-BAL-2               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Retrospective Method Balance";        
    }                                      
    IN MIR-APM-PRO-MTH-BAL-2               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Prospective Method Balance";        
    }                                      
    IN MIR-APM-USED-BAL-2                  
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "used Balance";        
    }                                      
    IN MIR-APM-UNALC-DIV-MTH-2             
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unallocated Dividend Month ";        
    }                                      
    IN MIR-APM-UNERND-MTHS-2               
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unearned Month";        
    }                                      
    IN MIR-APM-ADV-PMTS-2                 
    {                                      
        DisplayOnly;                       
        Length = "6";                      
        SType = "Text";                    
        Label = "Number of Advance Payment";        
    }                                      
    IN MIR-APM-NXT-ALOT-YRMO-2           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next Allotment Year and Month";
    } 

    IN MIR-APM-PRCES-CD-3       
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process Code";
    } 
    IN MIR-APM-PRCES-DT-3          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process Date";
    } 
    IN MIR-APM-UA-DIV-YM-3          
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Unallocated Dividend Allotment Year and Month";
    } 
    IN MIR-APM-BAL-AMT-3       
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Balance Amount";
    } 
    IN MIR-APM-RET-MTH-BAL-3               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Retrospective Method Balance";        
    }                                      
    IN MIR-APM-PRO-MTH-BAL-3               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Prospective Method Balance";        
    }                                      
    IN MIR-APM-USED-BAL-3                  
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "used Balance";        
    }                                      
    IN MIR-APM-UNALC-DIV-MTH-3            
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unallocated Dividend Month ";        
    }                                      
    IN MIR-APM-UNERND-MTHS-3               
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unearned Month";        
    }                                      
    IN MIR-APM-ADV-PMTS-3                  
    {                                      
        DisplayOnly;                       
        Length = "6";                      
        SType = "Text";                    
        Label = "Number of Advance Payment";        
    }                                      
    IN MIR-APM-NXT-ALOT-YRMO-3           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next Allotment Year and Month";
    } 

    IN MIR-APM-PRCES-CD-4       
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process Code";
    } 
    IN MIR-APM-PRCES-DT-4          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process Date";
    } 
    IN MIR-APM-UA-DIV-YM-4          
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Unallocated Dividend Allotment Year and Month";
    } 
    IN MIR-APM-BAL-AMT-4       
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Balance Amount";
    } 
    IN MIR-APM-RET-MTH-BAL-4               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Retrospective Method Balance";        
    }                                      
    IN MIR-APM-PRO-MTH-BAL-4               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Prospective Method Balance";        
    }                                      
    IN MIR-APM-USED-BAL-4                  
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "used Balance";        
    }                                      
    IN MIR-APM-UNALC-DIV-MTH-4            
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unallocated Dividend Month ";        
    }                                      
    IN MIR-APM-UNERND-MTHS-4               
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unearned Month";        
    }                                      
    IN MIR-APM-ADV-PMTS-4                  
    {                                      
        DisplayOnly;                       
        Length = "6";                      
        SType = "Text";                    
        Label = "Number of Advance Payment";        
    }                                      
    IN MIR-APM-NXT-ALOT-YRMO-4            
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next Allotment Year and Month";
    } 
    IN MIR-APM-PRCES-CD-5       
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Process Code";
    } 
    IN MIR-APM-PRCES-DT-5          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process Date";
    } 
    IN MIR-APM-UA-DIV-YM-5          
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Unallocated Dividend Allotment Year and Month";
    } 
    IN MIR-APM-BAL-AMT-5       
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Balance Amount";
    } 
    IN MIR-APM-RET-MTH-BAL-5               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Retrospective Method Balance";        
    }                                      
    IN MIR-APM-PRO-MTH-BAL-5               
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "Prospective Method Balance";        
    }                                      
    IN MIR-APM-USED-BAL-5                  
    {                                      
        DisplayOnly;                       
        Length = "9";                      
        SType = "Text";                    
        Label = "used Balance";        
    }                                      
    IN MIR-APM-UNALC-DIV-MTH-5             
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unallocated Dividend Month ";        
    }                                      
    IN MIR-APM-UNERND-MTHS-5               
    {                                      
        DisplayOnly;                       
        Length = "2";                      
        SType = "Text";                    
        Label = "Number of Unearned Month";        
    }                                      
    IN MIR-APM-ADV-PMTS-5                  
    {                                      
        DisplayOnly;                       
        Length = "6";                      
        SType = "Text";                    
        Label = "Number of Advance Payment";        
    }                                      
    IN MIR-APM-NXT-ALOT-YRMO-5             
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next Allotment Year and Month";
    } 
    IN MIR-PER-2-CALC-MOD-AMT                  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Acutual Calculation Modification S";
    } 
    IN MIR-PER-2-POL-MOD-AMT                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Modification after conversion S";
    } 
    IN MIR-PER-2-CNVR-SETL-AMT                 
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Conversion Settlement S";
    } 
    IN MIR-PER-2-NB-AFYC                       
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "New Business AFYC";
    } 
    IN MIR-PER-2-CALC-AFYC                     
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Actual Calculation AFYC";
    } 
    IN MIR-APP-FORM-NUM-1                      
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Application Form Number (1)";
    } 
    IN MIR-APP-FORM-NUM-2                      
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Application Form Number (2)";
    } 
    IN MIR-APP-FORM-NUM-3                      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Application Form Number (3)";
    } 
    IN MIR-APP-RPT-CND-NUM                     
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Reporting Condition Number";
    } 
    IN MIR-APP-SETL-DUR                        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Duration of Settlement Process";
    } 
    IN MIR-APP-NB-YR-MO                        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Duration of New Bussiness Agency Work Year and Month";
    } 
    IN MIR-APP-NB-FM-DT                        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "New Business FM Date";
    } 
    IN MIR-APP-APP-ENTRY-DT                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Application Entry Date";
    } 
    IN MIR-PMT-ACC-BNK-CD                      
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Code";
    } 
    IN MIR-PMT-ACC-BR-CD                       
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Branch Code";
    } 
    IN MIR-PMT-ACC-REG-DT                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Account registration Date";
    } 
    IN MIR-PMT-DEP-TYP                         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Deposit Type";
    } 
    IN MIR-PMT-ACC-NUM                         
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Account Number";
    } 
    IN MIR-PMT-ACC-HLDR-NM                     
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Account Holder's Name";
    } 
    IN MIR-R3DD-RID-CD-1        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    IN MIR-R3DD-DEL-IND-1     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    IN MIR-R3DD-CHG-CD-1      
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    IN MIR-R3DD-POL-ISS-DT-1    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    IN MIR-R3DD-RID-ADD-DT-1    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    IN MIR-R3DD-RECV-DT-1       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    IN MIR-R3DD-CHG-DT-1       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    IN MIR-R3DD-AGE-1       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    IN MIR-R3DD-BNFT-PRD-1       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit period";
    } 
    IN MIR-R3DD-BEN-FA-1        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    IN MIR-R3DD-RID-PREM-1   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    IN MIR-R3DD-AGT-EMP-1
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    IN MIR-R3DD-SHR-AGT-EMP-1        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    IN MIR-R3DD-SSTD-DED-1        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    IN MIR-R3DD-SSTD-AGE-ADD-1         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    IN MIR-R3DD-SSTD-SP-RT-1        
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    IN MIR-R3DD-DEP-DIV-PRT-1         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "The Part of Deposit Division";
    } 

 
    IN MIR-R3DD-RID-CD-2        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    IN MIR-R3DD-DEL-IND-2     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    IN MIR-R3DD-CHG-CD-2      
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    IN MIR-R3DD-POL-ISS-DT-2    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    IN MIR-R3DD-RID-ADD-DT-2    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    IN MIR-R3DD-RECV-DT-2       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    IN MIR-R3DD-CHG-DT-2       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    IN MIR-R3DD-AGE-2       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    IN MIR-R3DD-BNFT-PRD-2       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit period";
    } 
    IN MIR-R3DD-BEN-FA-2        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    IN MIR-R3DD-RID-PREM-2   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    IN MIR-R3DD-AGT-EMP-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    IN MIR-R3DD-SHR-AGT-EMP-2        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    IN MIR-R3DD-SSTD-DED-2        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    IN MIR-R3DD-SSTD-AGE-ADD-2         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    IN MIR-R3DD-SSTD-SP-RT-2        
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    IN MIR-R3DD-DEP-DIV-PRT-2         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "The Part of Deposit Division";
    } 

 
    IN MIR-R3DD-RID-CD-3        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    IN MIR-R3DD-DEL-IND-3     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    IN MIR-R3DD-CHG-CD-3      
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    IN MIR-R3DD-POL-ISS-DT-3    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    IN MIR-R3DD-RID-ADD-DT-3    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    IN MIR-R3DD-RECV-DT-3       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    IN MIR-R3DD-CHG-DT-3       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    IN MIR-R3DD-AGE-3       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    IN MIR-R3DD-BNFT-PRD-3       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit period";
    } 
    IN MIR-R3DD-BEN-FA-3        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    IN MIR-R3DD-RID-PREM-3   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    IN MIR-R3DD-AGT-EMP-3
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    IN MIR-R3DD-SHR-AGT-EMP-3        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    IN MIR-R3DD-SSTD-DED-3        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    IN MIR-R3DD-SSTD-AGE-ADD-3         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    IN MIR-R3DD-SSTD-SP-RT-3        
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    IN MIR-R3DD-DEP-DIV-PRT-3         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "The Part of Deposit Division";
    } 
 
    IN MIR-R3DD-RID-CD-4        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    IN MIR-R3DD-DEL-IND-4     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    IN MIR-R3DD-CHG-CD-4      
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    IN MIR-R3DD-POL-ISS-DT-4    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    IN MIR-R3DD-RID-ADD-DT-4    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    IN MIR-R3DD-RECV-DT-4       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    IN MIR-R3DD-CHG-DT-4       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    IN MIR-R3DD-AGE-4       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    IN MIR-R3DD-BNFT-PRD-4       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit period";
    } 
    IN MIR-R3DD-BEN-FA-4        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    IN MIR-R3DD-RID-PREM-4   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    IN MIR-R3DD-AGT-EMP-4
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    IN MIR-R3DD-SHR-AGT-EMP-4        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    IN MIR-R3DD-SSTD-DED-4        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    IN MIR-R3DD-SSTD-AGE-ADD-4         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    IN MIR-R3DD-SSTD-SP-RT-4        
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    IN MIR-R3DD-DEP-DIV-PRT-4         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "The Part of Deposit Division";
    } 
 
    IN MIR-R3DD-RID-CD-5        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    IN MIR-R3DD-DEL-IND-5     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    IN MIR-R3DD-CHG-CD-5      
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    IN MIR-R3DD-POL-ISS-DT-5    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    IN MIR-R3DD-RID-ADD-DT-5    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    IN MIR-R3DD-RECV-DT-5       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    IN MIR-R3DD-CHG-DT-5       
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    IN MIR-R3DD-AGE-5       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    IN MIR-R3DD-BNFT-PRD-5       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit period";
    } 
    IN MIR-R3DD-BEN-FA-5        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    IN MIR-R3DD-RID-PREM-5   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    IN MIR-R3DD-AGT-EMP-5
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    IN MIR-R3DD-SHR-AGT-EMP-5        
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    IN MIR-R3DD-SSTD-DED-5        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    IN MIR-R3DD-SSTD-AGE-ADD-5         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    IN MIR-R3DD-SSTD-SP-RT-5        
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    IN MIR-R3DD-DEP-DIV-PRT-5         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "The Part of Deposit Division";
    } 

    IN MIR-DUPL-DED-CHG-FL-DT                  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Failure of Deduction Change Date";
    } 
    IN MIR-DUPL-DED-CHG-FL-CD                  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Failure of Deduction Change Code";
    } 
    IN MIR-DUPL-DED-FL-COM-AMT                 
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Failure of Deduction Chargeback Amount(Commission)";
    } 
    IN MIR-DUPL-NB-COM-MX-AMT                  
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "limit Amount for New Business(commission)";
    } 
    IN MIR-DUPL-NB-MX-AMT-SN-1                 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "NB Limit Amount Sign 1";
    } 
    IN MIR-DUPL-INT-POL-SIGN                   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interm Addition policy sign";
    } 
    IN MIR-DUPL-NB-MX-AMT-SN-2                 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "NB Limit Amount Sign 2";
    } 
    IN MIR-DUPL-DED-FL-CB-AMT                  
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "failure of Deduction ChargeBack Amount(ExchangedP)";
    } 
    IN MIR-DUPL-NB-MAX-AMT                     
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Limit Amount for New Business (Exchanged P)";
    } 
    IN MIR-AER-RID-CD-1                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    IN MIR-AER-DEL-IND-1                       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    IN MIR-AER-CHG-CD-1                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    IN MIR-AER-POL-ISS-DT-1                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    IN MIR-AER-RID-ADD-DT-1                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    IN MIR-AER-RECVD-DT-1                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    IN MIR-AER-RID-CHG-DT-1                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    IN MIR-AER-AGE-1                           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    IN MIR-AER-BNFT-PRD-1                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit Period";
    } 
    IN MIR-AER-FA-1                            
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    IN MIR-AER-PREM-1                          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    IN MIR-AER-AGT-1                           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    IN MIR-AER-SHR-AGT-1                       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    IN MIR-AER-SSTD-DED-1                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    IN MIR-AER-SSTD-AGE-1                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    IN MIR-AER-SSTD-SRT-1                      
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    IN MIR-AER-RID-CD-2                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    IN MIR-AER-DEL-IND-2                       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    IN MIR-AER-CHG-CD-2                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    IN MIR-AER-POL-ISS-DT-2                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    IN MIR-AER-RID-ADD-DT-2                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    IN MIR-AER-RECVD-DT-2                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    IN MIR-AER-RID-CHG-DT-2                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    IN MIR-AER-AGE-2                           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    IN MIR-AER-BNFT-PRD-2                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit Period";
    } 
    IN MIR-AER-FA-2                            
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    IN MIR-AER-PREM-2                          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    IN MIR-AER-AGT-2                           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    IN MIR-AER-SHR-AGT-2                       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    IN MIR-AER-SSTD-DED-2                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    IN MIR-AER-SSTD-AGE-2                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    IN MIR-AER-SSTD-SRT-2                      
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 

    IN MIR-AER-RID-CD-3                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    IN MIR-AER-DEL-IND-3                       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    IN MIR-AER-CHG-CD-3                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    IN MIR-AER-POL-ISS-DT-3                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    IN MIR-AER-RID-ADD-DT-3                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    IN MIR-AER-RECVD-DT-3                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    IN MIR-AER-RID-CHG-DT-3                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    IN MIR-AER-AGE-3                           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    IN MIR-AER-BNFT-PRD-3                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit Period";
    } 
    IN MIR-AER-FA-3                            
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    IN MIR-AER-PREM-3                          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    IN MIR-AER-AGT-3                           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    IN MIR-AER-SHR-AGT-3                       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    IN MIR-AER-SSTD-DED-3                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    IN MIR-AER-SSTD-AGE-3                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    IN MIR-AER-SSTD-SRT-3                      
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    IN MIR-AER-RID-CD-4                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    IN MIR-AER-DEL-IND-4                       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    IN MIR-AER-CHG-CD-4                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    IN MIR-AER-POL-ISS-DT-4                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    IN MIR-AER-RID-ADD-DT-4                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    IN MIR-AER-RECVD-DT-4                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    IN MIR-AER-RID-CHG-DT-4                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    IN MIR-AER-AGE-4                           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    IN MIR-AER-BNFT-PRD-4                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit Period";
    } 
    IN MIR-AER-FA-4                            
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    IN MIR-AER-PREM-4                          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    IN MIR-AER-AGT-4                           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    IN MIR-AER-SHR-AGT-4                       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    IN MIR-AER-SSTD-DED-4                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    IN MIR-AER-SSTD-AGE-4                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    IN MIR-AER-SSTD-SRT-4                      
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 

    IN MIR-AER-RID-CD-5                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider code";
    } 
    IN MIR-AER-DEL-IND-5                       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    IN MIR-AER-CHG-CD-5                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change Code";
    } 
    IN MIR-AER-POL-ISS-DT-5                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    IN MIR-AER-RID-ADD-DT-5                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    IN MIR-AER-RECVD-DT-5                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    IN MIR-AER-RID-CHG-DT-5                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    IN MIR-AER-AGE-5                           
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    IN MIR-AER-BNFT-PRD-5                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit Period";
    } 
    IN MIR-AER-FA-5                            
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider benefit FA";
    } 
    IN MIR-AER-PREM-5                          
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    IN MIR-AER-AGT-5                           
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    IN MIR-AER-SHR-AGT-5                       
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    IN MIR-AER-SSTD-DED-5                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Deduction";
    } 
    IN MIR-AER-SSTD-AGE-5                      
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Substandard Age Addition";
    } 
    IN MIR-AER-SSTD-SRT-5                      
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Substandard Special Rates";
    } 
    IN MIR-CNCR-HSP-DLY-AMT                    
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Cancer hospitalization Daily Benefit Amount";
    } 
    IN MIR-CNCR-CDB-CTM-BNFT                   
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Cancer Diagnosis Benefit Amount or Cancer Treatment Monthly Amount";
    } 
    IN MIR-CNCR-HOSP-PAYO                      
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Accumulated Number of Payout for Cancer Hospitalization benfit";
    } 
    IN MIR-CNCR-CSB-PAYO                       
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Accumulated Number of Payout for Cancer surgery Benefit";
    } 
    IN MIR-CNCR-CTM-CDB-PAYO                   
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Accumulated number of payout for cancer diagnosis benefit or Cancer treatment monthly benefit";
    } 
    IN MIR-CNCR-LST-BEN-P-DT                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Last Benefit Payout Date";
    } 
    IN MIR-CNCR-DIAG-EFF-DT                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Cancer diagnosis Effective Date or cancer Treatment Effective date";
    } 
    IN MIR-CNCR-BENE-DESIG                     
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Beneficiary Designation CTL";
    } 
    IN MIR-CNCR-DTH-TERM                       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Terminated Due to Cancer Death";
    } 
    IN MIR-CNCR-INIT-PAYO-NUM                  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Cancer Treatment Monthly benefit:Number of Initial Payout";
    } 
    IN MIR-CNCR-LST-PAYO-DT                    
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit:Last Payout Effective Date";
    } 
    IN MIR-CNCR-TRT-BNFT-TYP                   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Cancer Treatment Benefit Type";
    } 
    IN MIR-BULK-WIR-XFR-NUM                    
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Bulk Wire Transfer Number";
    } 
    IN MIR-BULK-WIR-XFR-SP-CTL                 
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bulk Wire Transfer Suspension CTL";
    } 
    IN MIR-BULK-WIR-XFR-EFF-DT                 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Bulk Wire Transfer Effective Date";
    } 
    IN MIR-DSTR-AGT-REG-NUM                    
    {
        DisplayOnly;
        Length = "13";
        SType = "Text";
        Label = "Distributer Agent Registration Number";
    } 
    IN MIR-DSTR-CO-AGT-REG-NUM                 
    {
        DisplayOnly;
        Length = "13";
        SType = "Text";
        Label = "Co-Distributer Agent Registration Number";
    } 
    IN MIR-DIS-EXCL-BLIND                      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Blindness Exclusion";
    } 
    IN MIR-DIS-EXCL-DEAF                       
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deafness Exclusion";
    } 
    IN MIR-PROXY-BENE-IND                      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Proxy Beneficiary Indicator";
    } 
    IN MIR-PROXY-BENE-UPDT-DT                  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Proxy Beneficiary Update Date";
    } 
    IN MIR-PROXY-BENE-PAYO-DT                  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Proxy Beneficiary ";
    } 
    IN MIR-PROXY-BENE-PAYO-CD                  
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Proxy Beneficiary Payout Movement code";
    } 
    IN MIR-FID-BNK-BR-CD                       
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Branch code";
    } 
    IN MIR-FIDHANDLR-CD                        
    {
        DisplayOnly;
        Length = "12";
        SType = "Text";
        Label = "Handler Code";
    } 
    IN MIR-FID-CLI-ID                          
    {
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Client Id for Bank";
    } 
    IN MIR-INIT-PMT-TYP-APP                    
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Initial Payment Type at Application";
    } 
    IN MIR-INIT-PMT-TYP-ROUT                   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Initial Payment Route";
    } 
    IN MIR-CPT-CHG-YR-MO-1                     
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Premium Changed Year Month";
    } 
    IN MIR-CPT-GRS-GNR-PREM-1                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "General Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-ANT-PREM-1                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Annuity Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-LTC-PREM-1                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Long Term Care Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-OTR-PREM-1                  
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Other Gross Premium Amount";
    } 
    IN MIR-CPT-PRV-BILL-MOD-1                  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Billing Mode Before change";
    } 
    IN MIR-CPT-CHG-YR-MO-2                     
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Premium Changed Year Month";
    } 
    IN MIR-CPT-GRS-GNR-PREM-2                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "General Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-ANT-PREM-2                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Annuity Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-LTC-PREM-2                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Long Term Care Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-OTR-PREM-2                  
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Other Gross Premium Amount";
    } 
    IN MIR-CPT-PRV-BILL-MOD-2                  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Billing Mode Before change";
    } 

    IN MIR-CPT-CHG-YR-MO-3                     
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Premium Changed Year Month";
    } 
    IN MIR-CPT-GRS-GNR-PREM-3                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "General Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-ANT-PREM-3                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Annuity Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-LTC-PREM-3                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Long Term Care Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-OTR-PREM-3                  
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Other Gross Premium Amount";
    } 
    IN MIR-CPT-PRV-BILL-MOD-3                  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Billing Mode Before change";
    } 

    IN MIR-CPT-CHG-YR-MO-4                     
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Premium Changed Year Month";
    } 
    IN MIR-CPT-GRS-GNR-PREM-4                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "General Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-ANT-PREM-4                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Annuity Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-LTC-PREM-4                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Long Term Care Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-OTR-PREM-4                  
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Other Gross Premium Amount";
    } 
    IN MIR-CPT-PRV-BILL-MOD-4                  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Billing Mode Before change";
    } 

    IN MIR-CPT-CHG-YR-MO-5                     
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Premium Changed Year Month";
    } 
    IN MIR-CPT-GRS-GNR-PREM-5                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "General Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-ANT-PREM-5                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Annuity Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-LTC-PREM-5                  
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Long Term Care Gross Premium Amount";
    } 
    IN MIR-CPT-GRS-OTR-PREM-5                  
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Other Gross Premium Amount";
    } 
    IN MIR-CPT-PRV-BILL-MOD-5                  
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Billing Mode Before change";
    } 

    IN MIR-INS-3DD-BENE-CTL                    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "3DD Beneficiary CTL";
    } 
    IN MIR-INS-3DD-DTH-BNFT                    
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "3DD Benefit Payout at Insured's Death";
    } 
    IN MIR-ALD-RIDER-CD                        
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider Code";
    } 
    IN MIR-ALD-DEL-IND                         
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Deletion Indicator";
    } 
    IN MIR-ALD-CHG-CD                          
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Change code";
    } 
    IN MIR-ALD-POL-ISSU-DT                     
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Policy Issue Date";
    } 
    IN MIR-ALD-RID-ADD-DT                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Addition Date";
    } 
    IN MIR-ALD-RECV-DT                         
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Received Date";
    } 
    IN MIR-ALD-RID-CHG-DT                      
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Change Date";
    } 
    IN MIR-ALD-ADD-AGE                         
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Age at Addition";
    } 
    IN MIR-ALD-BNFT-PRD                        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider Benefit Period";
    } 
    IN MIR-ALD-FACE-AMT                        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Benefit FA";
    } 
    IN MIR-ALD-PREM-AMT                        
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Premium";
    } 
    IN MIR-ALD-AGT-ID                          
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent Employee";
    } 
    IN MIR-ALD-SHR-AGT-ID                      
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Shared Agent Employee";
    } 
    IN MIR-ALD-SSTD-PREM-FCT                   
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Substandard Premium Factor(MR)";
    } 
    IN MIR-ALD-LIEN-DUR                        
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Lien Duration";
    } 
    IN MIR-ALD-DISAB-EXCL                      
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Disability Exclusion (Blindness)";
    } 
    IN MIR-ALD-ORIG-FACE-AMT                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Rider Benefit FA at New Business";
    } 
    IN MIR-MIGR-POL-IND
    {    
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Migrated Policy";
    }

    IN MIR-POL-CHG-MVT-STRT-DT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Movement calculation base date";
    }
}