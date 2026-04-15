#*******************************************************************************
#*  Component:   BF9C90-P.p                                                    *
#*  Description: Future request Table(FTRQ) Inquiry Process                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*  MP142F  CTS      Servivorship Benefit request screen                       *
# * MP142G  CTS      Changes for new activity type sundry amount change        *
#*  Q09514  CTS      CHANGES TO DISPLAY WARNING MESSAGE IN DELETE OPERATION    *
#*  FFF10P  CTS      NOMURA ONLINE CHANGES                                     *
#*  130665  CTS      NOMURA ONLINE CHANGES                                     *
#*  UYS025  CTS      Future dated advance payment Inquiry                      *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UY3064  CTS      Whole Life Premium Payment Completion                     *
#*  UY3095  CTS      CHANGES FOR FAMILY KATA CHANGE                            *
#*  S15287  CTS      JIRA ISSUE FOR KATA CHANGE                                *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*  UY3049  CTS      ANNUITY TRANSITION STREAM 3                               *
#*******************************************************************************

P-STEP BF9C90-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C90";
        BusinessFunctionName = "Future Dated Policy Activity Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9C90";
    }

   OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
      
#Q09514 CHANGES STARTS    
    IN MIR-DEL-MSG-IND
    {
        SType = "Hidden";
    }
#Q09514 CHANGES END
    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TFTRQ";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TFTRQ";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-PBRQ-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy billing request Effective Date";
    }
    
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
    

    OUT MIR-POL-FUT-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-FUT-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Future Bill Mode";
    }


    OUT MIR-POL-FUT-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-FUT-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Future Bill Type";
    }
    
#FFF10P CHANGES START HERE 
    OUT MIR-FUT-SCHD-ADV-PMT-DUR
    {
     Length = "3";
     CodeSource = "DataModel";
     CodeType = "SCHD-ADV-PMT-DUR";
     SType = "Selection";
     Label = "Scheduled Advanced Premium Payment Frequency";
    } 
#FFF10P CHANGES ENDS HERE    
    
#130665 CHANGES START HERE CHANGING CURRENCY CODE
    OUT MIR-PREM-CRCY-CD
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

    OUT MIR-POL-FUT-PAC-DRW-DY
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Billing Draw Day";
    }

    OUT MIR-POL-FUT-ACTV-STAT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-FUT-ACTV-STAT-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Activity Staus";
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
    
    OUT MIR-POL-MPREM-AMT
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
#FFF10P CHANGES START HERE 
    OUT MIR-SCHD-ADV-PMT-DUR
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "SCHD-ADV-PMT-DUR";
        SType = "Selection";
        Label = "Scheduled Advanced Premium Payment Frequency";
    } 
#FFF10P CHANGES ENDS HERE

    OUT MIR-DV-PAYR-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Client ID";
    }


    OUT MIR-DV-PAYR-SUB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-PAYR-SUB-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Client Relationship Type";
    }
    
    OUT MIR-DV-PAYR-ADDR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Client Address Type";
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
    
    OUT MIR-DV-LBILL-ADDR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payroll Deduction Client Address";
    }

    OUT MIR-DV-FUT-PAYR-CLI-ID
    {
        Label = "Future Payor Client ID";
        Length = "10";
        SType = "Text";
    }
    
    OUT MIR-DV-FUT-PAYR-ADDR-CD
    {
       CodeSource = "EDIT";
       CodeType = "ADTYP";
       Label = "Future Payor Client Address Type";
       Length = "51";
       SType = "Selection";
    }
    
    
    OUT MIR-DV-FUT-PAYR-SUB-CD
    {
      CodeSource = "DataModel";
      CodeType = "DV-PAYR-SUB-CD";
      Label = "Future Payor Client Relationship Type";
      Length = "40";
      SType = "Selection";
    }
    
    OUT MIR-DV-FUT-LBILL-ADDR-CD
    {
       CodeSource = "EDIT";
       CodeType = "ADTYP";
       Label = "Payroll Deduction Client Address Type";
       Length = "40";
       SType = "Selection";
    }
    
    OUT MIR-DV-FUT-LBILL-CLI-ID
    {
        Label = "Payroll Deduction Client ID";
        Length = "10";
        SType = "Text";
     }
     
     OUT MIR-DV-FUT-LBILL-CLI-NM
     {
      DisplayOnly;
      Length = "75";
      SType = "Text";
      Label = "Payroll Deduction Name";
      }  
      
#MP142F CHANGES STARTS      
      
     OUT MIR-PMT-RQST-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PMT-RQST-TYP-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Type of Payment Requested";
    }
    
    OUT MIR-PMT-RQST-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount of payment requested";
    }
#UY3064 START CHANGES HERE
    OUT MIR-SETL-OPT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Settlement Option";
    }
#UY3064 CHANGES END HERE
#S15287 CHANGES START HERE
    OUT MIR-CVG-STBL-4
    {
       CodeSource = "EDIT";
       CodeType = "STB4";
       Label = "Coverage Subtable 4 Code";
       Length = "40";
       SType = "Selection";
    }
#S15287 CHANGES END HERE

#UY3064 START CHANGES HERE
    OUT MIR-ACUM-DIV-AMT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Accum Dividend";
    }
    OUT MIR-INCR-SURV-BNFT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Increase purchase of Survival benfit";
    }
   OUT MIR-VEST-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "vesting";
    }
    OUT MIR-HLTH-BNFT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "health benefit";
    }
   OUT MIR-XCES-PREM-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Excees Premium";
    }
#UY3064 CHANGES END HERE
    
    OUT MIR-PAYE-GIV-NM 
    {
        Length = "25";
        DBTableName = "CLNM";
        SType = "Text";
        Label = "Payee's First Name";
    }

    OUT MIR-PAYE-SUR-NM 
    {
       Length = "25";
        DBTableName = "CLNM";
       SType = "Text";
       Label = "Payee's Last Name";
    }

    OUT MIR-PAYE-CO-NM 
    {
       Length = "50";
        DBTableName = "CLNC";
       SType = "Text";
       Label = "Company Name";
    }

    OUT MIR-CLI-ADDR-LOC-CD 
    {
       Length = "8";
        DBTableName = "CLIA";
       SType = "Text";
       Label = "Address Code";
    }

    OUT MIR-CLI-PSTL-CD 
    {
       Length = "9";
        DBTableName = "CLIA";
       SType = "Text";
       Label = "Postal Code";
    }

    OUT MIR-CLI-ADDR-ADDL-TXT
    {
       Length = "60";
        DBTableName = "CLIA";
       SType = "Text";
       Label = "Samakata-bu";
    }

    OUT MIR-DV-CLI-ADDR 
    {
       Length = "50";
        DBTableName = "Derived";
       SType = "Text";
       Label = "Kanji Address";
    }

    OUT MIR-BNK-NM        
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Bank Name";
    }

    OUT MIR-BNK-BR-NM     
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Bank Branch Name";
    }
    
    OUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank ID";
    }

    OUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Branch ID";
    }

    OUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank Account Number";
    }

    OUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Holder Name";
    }

    OUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TBNKA";
        SType = "Selection";
        Label = "Account Type";
    }    

#MP142F CHANGES END      
#MP142G CHANGES STARTS
    OUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        DBTableName = "TPOL";
        Label = "Current Sundry Amount";
    }        
        
    OUT MIR-DV-NEW-COI
    {
        Signed;
        Length = "15";
        SType = "Currency";
        DBTableName = "TPOL";
        Label = "New COI";
    }

    OUT MIR-NEW-SNDRY-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        DBTableName = "TPOL";
        Label = "New Sundry Amount";
    }        
#MP142G CHANGES ENDS

#UYS025 CHANGES STARTS
    OUT MIR-POL-ADV-PMT-DUR 
    {
    
         Length = "3";
         SType = "Text";
         DBTableName = "TFTRQ";
         Label = "Advanced Payment Duration";
    
    }
    
    OUT MIR-POL-ADV-PMT-TYP-CD 
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ADV-PMT-TYP-CD";
        DBTableName = "TFTRQ";
        SType = "Selection";
        Label = "Advance Payment Type Code";
    } 
    
    OUT MIR-POL-ADV-PMT-AMT 
    {   
        Signed;
        Length = "15";
        SType = "Currency";
        DBTableName = "TFTRQ";
        Label = "Advance Payment Payment Amount";
    }   
    
       
      
#UYS025 CHANGES ENDS
#UYS133 CHANGES START
    OUT MIR-PD-GR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END
#UY3095 CHANGES START
    
#S15287    OUT MIR-CVG-NO-T[99]
    OUT MIR-CVG-NO-T[20]
    {
        Length = "2";
        FieldGroup = "Table99";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage No";
        Index = "1";
    }

#S15287    OUT MIR-PLAN-ID-T[99]
    OUT MIR-PLAN-ID-T[20]
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
    
    
#S15287    OUT MIR-CVG-STBL-4-CD-T[99]
    OUT MIR-CVG-STBL-4-CD-T[20]
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";   
#S15287        Index = "1";
        SType = "Text";
        Label = "Sub-table 4";
    }
    
    

#UY3095 CHANGES END


#27549A - CHANGES START HERE
    OUT MIR-ATO-NOT-APPL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
    }
#27549A- CHANGES ENDS HERE

#UY3049 - CHANGES START HERE
 
    OUT MIR-RQST-REC-PRCS-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Request reception Processinte";
    }

    OUT MIR-ANTY-FREQ-CRNT-YR
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

    OUT MIR-ANTY-FREQ-NXT-YR	
    {
        CodeSource = "DataModel";
        CodeType = "ANTY-FREQ-CRNT-YR";
        DBTableName = "TDMAD";
        DefaultConstant = "12";
        Length = "2";
        SType = "Selection";
        Label = "No.of installments(Next year)";
    }

    OUT MIR-MRF-ACC-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF";
    }

#UY3049 - CHANGES ENDS HERE
}    



