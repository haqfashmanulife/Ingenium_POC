# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:16 PM EDT

#*******************************************************************************
#*  Component:   BF9C94-P.p                                                    *
#*  Description:Future request Table(FTRQ) List Process                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  M117PB  CTS      Intial Version                                            *
#*  MP142F  CTS      Servivorship Benefit request screen                       *
#   Q07081  CTS      MP142F-CHANGES TO COREECT OF "MORE" BUTTON FUNCTIONALITY  *
#*  UYS025  CTS      Future dated advance payment List fields                  *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UY3064  CTS      Whole Life Premium Payment Completion                     *
#*  S15287  CTS      Kata Change                                               *
#*  UY3049  CTS      Annuity Transition Procesisng stream 3                    *  
#*******************************************************************************

P-STEP BF9C94-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C94";
        BusinessFunctionName = "Future Dated Policy Activity List";
        BusinessFunctionType = "List";
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

    INOUT MIR-PBRQ-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TFTRQ";
        SType = "Date";
        Label = "Policy billing request Effective Date";
    }
    
    INOUT MIR-DV-POL-FUT-ACTV-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-POL-FUT-ACTV-TYP-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Activity Type";
    }

#Q07081 CHANGES STARTS     
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    } 
#Q07081 CHANGES ENDS 
    
#MP142F CHANGES STARTS    
    INOUT MIR-FTRQ-PREV-UPDT-DT
    {
        Key;
        FieldGroup = "Table1";        
        Length = "10";
        DBTableName = "TFTRQ";
        SType = "Date";
        Label = "Survivorship Benefit Request Process date";
    }
        
#MP142F CHANGES ENDS    
    OUT MIR-PBRQ-EFF-DT-T[20]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "10";
        DBTableName = "TFTRQ";
        SType = "Date";
        Label = "Policy billing request Effective Date";
    }
#UY3064 CHANGES START HERE
    INOUT MIR-SETL-OPT-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        DBTableName = "TPOL";
        Label = "Settlement Option";
    }
#UY3064 CHANGES END HERE
    
    OUT MIR-DV-POL-FUT-ACTV-TYP-CD-T[20]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-POL-FUT-ACTV-TYP-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Activity Type";
    }
    
#MP142F CHANGES STARTS
    OUT MIR-POL-ID-BASE-T[20]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "9";
        DBTableName = "TFTRQ";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }    
#MP142F CHANGES ENDS 
    
    OUT MIR-POL-FUT-ACTV-STAT-CD-T[20]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-FUT-ACTV-STAT-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Activity Status";
    }
#MP142F CHANGES STARTS    
    OUT MIR-PAYE-SUR-NM-T[20] 
    {
       DisplayOnly;
       FieldGroup = "Table1";  
       DBTableName = "TFTRQ";       
       Length = "25";
       SType = "Text";
       Label = "Payee's Last Name";
    }
    
    OUT MIR-BNK-NM-T[20] 
    {
       DisplayOnly;
       FieldGroup = "Table1";  
       DBTableName = "TFTRQ";             
       Length = "36";
       SType = "Text";
       Label = "Bank Name";
    }

    OUT MIR-BNK-BR-NM-T[20]
    {
       DisplayOnly;
       FieldGroup = "Table1";  
       DBTableName = "TFTRQ";              
       Length = "36";
       SType = "Text";
       Label = "Bank Branch Name";
    }  
    
    OUT MIR-BNK-ACCT-TYP-CD-T[20]
    {
       DisplayOnly;
       FieldGroup = "Table1";  
       DBTableName = "TFTRQ";    
       Length = "3";
       CodeSource = "EDIT";
       CodeType = "FBACC";
       SType = "Selection";
       Label = "Account Type";
    }
    
    OUT MIR-BNK-ACCT-HLDR-NM-T[20]
    {
       DisplayOnly;
       FieldGroup = "Table1";  
       DBTableName = "TFTRQ";    
       Length = "50";
       SType = "Text";
       Label = "Account Holder Name";
    }
    
    OUT MIR-BNK-ACCT-ID-T[20]
    {
       DisplayOnly;
       FieldGroup = "Table1";  
       DBTableName = "TFTRQ";           
       Length = "17";
       SType = "Text";
       Label = "Bank Account Number";
    }    
    
    OUT MIR-PMT-RQST-TYP-CD-T[20]
    {
      DisplayOnly;
      FieldGroup = "Table1";    
      Length = "1";
      CodeSource = "DataModel";
      CodeType = "PMT-RQST-TYP-CD";
      DBTableName = "Derived";      
      SType = "Selection";
      Label = "Type of Payment Requested";      
    }
    
    OUT MIR-PMT-RQST-AMT-T[20]
    {
       DisplayOnly;
       FieldGroup = "Table1";  
       DBTableName = "TFTRQ";  
       Signed;
       Length = "15";
       SType = "Currency";
       Label = "Amount of payment requested";
    }     
#MP142F CHANGES ENDS    

#UYS025 CHANGES STARTS
    OUT MIR-POL-ADV-PMT-DUR-T[20] 
    {
    
         Length = "3";
         SType = "Text";
         DBTableName = "TFTRQ";
         Label = "Advanced Payment Duration";
    
    }     
    
    OUT MIR-POL-ADV-PMT-AMT-T[20]
    {   
        Signed;
        Length = "13";
        SType = "Currency";
        DBTableName = "TFTRQ";
        Label = "Advance Payment Payment Amount";
    }     
    
    OUT MIR-POL-ADV-PMT-TYP-CD-T[20]
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ADV-PMT-TYP-CD";
        DBTableName = "TFTRQ";
        SType = "Selection";
        Label = "Advance Payment Type Code";
    }         
#UYS025 CHANGES ENDS
#UYS133 CHANGES START
    OUT MIR-PD-GR-TYP-CD-T[20]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END
#S15287 CHANGES START
    OUT MIR-CVG-STBL-4-CD-T[20]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Selection";
        Label = "Coverage Subtable 4 code";
    }
#S15287 CHANGES END

#UY3049 - CHANGES START HERE

    OUT MIR-RQST-REC-PRCS-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Request reception Processing date";
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



