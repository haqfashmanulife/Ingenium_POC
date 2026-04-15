
#*******************************************************************************
#*  Component:   BF9C91-P.p                                                    *
#*  Description: Future request Table(FTRQ) Create Process                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*  MP142F  CTS      Servivorship Benefit request screen                       *
# * MP142G  CTS      Changes for new activity type sundry amount change        *
# *  M142U2  CTS      Rider Switch Enhancements                                *
#*  FFF10P   CTS      NOMURA ONLINE CHANGES                                    *
#*  130665   CTS      NOMURA ONLINE CHANGES                                    *
#*  130870   CTS      FIX FOR DB VALUE (SCH ADV PAYMENT)                       *
#*  UYS025  CTS      Future dated advance payment changes                      *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UY3064  CTS      Whole Life Premium Payment Completion                     *
#*  UY3095  CTS      FAMILY KATA CHANGES                                       *
#*  S15287  CTS      JIRA FIX FOR KATA CHANGE                                  *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*  UY3049  CTS      ANNUITY TRANSITION PROCESSING STREAM 3                    *
#*******************************************************************************

P-STEP BF9C91-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C91";
        BusinessFunctionName = "Future Dated Policy Activity Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9C90";
    }

   OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TFTRQ";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TFTRQ";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

#MP142F CHANGES STARTS    
    INOUT MIR-PBRQ-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy billing request Effective Date";
    }
#MP142F CHANGES STARTS    
    
    IN MIR-DV-POL-FUT-ACTV-TYP-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-POL-FUT-ACTV-TYP-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Activity Type";
    }
    

    INOUT MIR-POL-FUT-BILL-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Policy Future Bill Mode";
    }


    INOUT MIR-POL-FUT-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Policy Future Bill Type";
    }
    
#FFF10P CHANGES START HERE 
    INOUT MIR-FUT-SCHD-ADV-PMT-DUR
    {
     Length = "3";
     CodeSource = "DataModel";
     CodeType = "SCHD-ADV-PMT-DUR";
     SType = "Selection";
     Label = "Scheduled Advanced Premium Payment Frequency";
    } 
#FFF10P CHANGES ENDS HERE    
    
#130870 CHANGES STARTS HERE 
    INOUT MIR-SCHD-ADV-PMT-DUR
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "SCHD-ADV-PMT-DUR";
        SType = "Selection";
        Label = "Scheduled Advanced Premium Payment Frequency";
    } 
#130870 CHANGES ENDS HERE

    INOUT MIR-POL-FUT-PAC-DRW-DY
    {
        Length = "10";
        DBTableName = "TFTRQ";
        SType = "Day";
        Label = "Future Deposit Day";
    }    


    INOUT MIR-POL-FUT-ACTV-STAT-CD
    {
        Length = "1";
        SType = "Text";
        Label = "Activity Status";
    }
    
    INOUT MIR-DV-FUT-PAYR-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Future Payor Client ID";
    }

    INOUT MIR-DV-FUT-PAYR-ADDR-CD
    {
        Length = "51";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Future Payor Client Address Type";
    }

    INOUT MIR-DV-FUT-PAYR-SUB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-PAYR-SUB-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Future Payor Client Relationship Type";
    }
    
    INOUT MIR-DV-FUT-LBILL-ADDR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Payroll Deduction Client Address Type";
    }

    INOUT MIR-DV-FUT-LBILL-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payroll Deduction Client ID";
    }
    
    OUT MIR-DV-FUT-LBILL-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payroll Deduction Name";
    }    

    OUT MIR-DV-PAYR-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Client ID";
    }

    OUT MIR-DV-PAYR-ADDR-CD
    {
        Length = "51";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Payor Client Address Type";
    }

    OUT MIR-DV-PAYR-SUB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-PAYR-SUB-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Payor Client Relationship Type";
    }
    
    OUT MIR-DV-LBILL-ADDR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Payroll Deduction Client Address Type";
    }

    OUT MIR-DV-LBILL-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payroll Deduction Client ID";
    }
    
    OUT MIR-DV-LBILL-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payroll Deduction Name";
    }
 
#130665 CHANGES START HERE CHANGING CURRENCY CODE
    INOUT MIR-PREM-CRCY-CD
    {               
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
#130665 CHANGES END HERE

    OUT MIR-POL-FUT-MPREM-AMT
    {
#130665 CHANGES START HERE CHANGING CURRENCY CODE
        CurrencyCode = "MIR-PREM-CRCY-CD";
#130665 CHANGES END HERE
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "New Modal Premium";
    }

    
    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Bill Mode";
    }

    OUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Bill Type";
    }
    
    OUT MIR-POL-PAC-DRW-DY
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Billing Draw Day";
    }
#MP142G CHANGES START    
#    OUT MIR-POL-MPREM-AMT
     INOUT MIR-POL-MPREM-AMT
#MP142G CHANGES END     
    {
#130665 CHANGES START HERE CHANGING CURRENCY CODE
        CurrencyCode = "MIR-PREM-CRCY-CD";
#130665 CHANGES END HERE
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Current Modal Premium";
    }
    
#MP142F CHANGES STARTS    
     INOUT MIR-PMT-RQST-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PMT-RQST-TYP-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Type of Payment Requested";
    }
#M142U2 CHANGES START     
#    INOUT MIR-PMT-RQST-AMT
    IN MIR-PMT-RQST-AMT
#M142U2 CHANGES ENDS 
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount of payment requested";
    }
#UY3064 START CHANGES HERE
    INOUT MIR-ACUM-DIV-AMT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Accum Dividend";
    }
    INOUT MIR-INCR-SURV-BNFT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Increase purchase of Survival benfit";
    }
   INOUT MIR-VEST-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "vesting";
    }
    INOUT MIR-HLTH-BNFT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "health benefit";
    }
   INOUT MIR-XCES-PREM-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Excees Premium";
    }
#UY3064 CHANGES END HERE
        
    
    INOUT MIR-PAYE-GIV-NM 
    {
        Length = "25";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Payee's First Name";
    }

    INOUT MIR-PAYE-SUR-NM 
    {
       Length = "25";
        DBTableName = "TCLNM";
       SType = "Text";
       Label = "Payee's Last Name";
    }

    INOUT MIR-PAYE-CO-NM 
    {
       Length = "50";
        DBTableName = "TCLNC";
       SType = "Text";
       Label = "Company Name";
    }

    INOUT MIR-CLI-ADDR-LOC-CD 
    {
       Length = "8";
        DBTableName = "TCLIA";
       SType = "Text";
       Label = "Address Code";
    }

    INOUT MIR-CLI-PSTL-CD 
    {
       Length = "9";
        DBTableName = "TCLIA";
       SType = "Text";
       Label = "Postal Code";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
       Length = "60";
        DBTableName = "TCLIA";
       SType = "Text";
       Label = "Samakata-bu";
    }

    INOUT MIR-DV-CLI-ADDR 
    {
       Length = "50";
       DBTableName = "Derived";
       SType = "Text";
       Label = "Kanji Address";
    }

    INOUT MIR-BNK-NM        
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Bank Name";
    }

    INOUT MIR-BNK-BR-NM     
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Bank Branch Name";
    }
    
    INOUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Branch ID";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        DBTableName = "TCLIB";
        SType = "Selection";
        Label = "Account Type";
    }    
#MP142F CHANGES ENDS
#MP142G CHANGES STARTS
    INOUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        DBTableName = "TPOL";
        Label = "Current Sundry Amount";
    }        
        
     INOUT MIR-DV-NEW-COI
    {
        Signed;
        Length = "15";
        SType = "Currency";
        DBTableName = "TPOL";
        Label = "New COI";
    }
    
    INOUT MIR-NEW-SNDRY-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        DBTableName = "TPOL";
        Label = "New Sundry Amount";
    }        
#MP142G CHANGES ENDS

#UYS025 CHANGES STARTS

    INOUT MIR-POL-ADV-PMT-DUR 
    {
    
         Length = "3";
         SType = "Text";
         DBTableName = "TFTRQ";
         Label = "Advanced Payment Duration";
    
    }
    
    INOUT MIR-POL-ADV-PMT-TYP-CD 
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ADV-PMT-TYP-CD";
        DBTableName = "TFTRQ";
        SType = "Selection";
        Label = "Advance Payment Type Code";
    }    
    
    INOUT MIR-POL-ADV-PMT-AMT 
    {   
        Signed;
        Length = "15";
        SType = "Currency";
        DBTableName = "TFTRQ";
        Label = "Advance Payment Payment Amount";
    }   
    
#UYS025 CHANGES ENDS
#UYS133 CHANGES START
    INOUT MIR-PD-GR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END
#UY3095 CHANGES START
    
#S15287    INOUT MIR-CVG-NO-T[99]
    INOUT MIR-CVG-NO-T[20]
    {
        Length = "2";
        FieldGroup = "Table99";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage No";
        Index = "1";
    }

#S15287    INOUT MIR-PLAN-ID-T[99]
    INOUT MIR-PLAN-ID-T[20]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }
    
    
#S15287    INOUT MIR-CVG-STBL-4-CD-T[99]
    INOUT MIR-CVG-STBL-4-CD-T[20]
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        Index = "1";        
        SType = "Selection";
        Label = "Sub-table 4";
    }
    
    

#UY3095 CHANGES END

#27549A - CHANGES START HERE
    IN MIR-ATO-NOT-APPL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
    }
#27549A- CHANGES ENDS HERE 

#UY3049 - CHANGES START HERE

    INOUT MIR-RQST-REC-PRCS-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Request reception Processing date";
    }

    INOUT MIR-ANTY-FREQ-CRNT-YR
    {
        Mandatory;
        CodeSource = "DataModel";
        CodeType = "ANTY-FREQ-CRNT-YR";
        DBTableName = "TDMAD";
        DefaultConstant = "12";
        Length="2";
        SType="Selection";
        Label="No.of installments(This year)";
    }

    INOUT MIR-ANTY-FREQ-NXT-YR
    {
        CodeSource = "DataModel";
        CodeType = "ANTY-FREQ-CRNT-YR";
        DBTableName = "TDMAD";
        DefaultConstant = "12";
        Length = "2";
        SType = "Selection";
        Label = "No.of installments(Next year)";
    }

    INOUT MIR-MRF-ACC-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF";
    }
    INOUT MIR-WEB-SERV-CALL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Web Service Indicator";
    }
    INOUT MIR-WEB-POST-ACD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Post ACD Indicator";
    }
    INOUT MIR-CLM-FNL-CO-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Company Recieved Date";
    }
    
   
#UY3049 - CHANGES ENDS HERE
}

