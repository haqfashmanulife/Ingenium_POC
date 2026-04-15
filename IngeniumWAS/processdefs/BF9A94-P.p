# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#**********************************************************************************
#*  Component:   BF9A94-P.p                                                       *
#*  Description: Payee Update Screen               .                              *
#*                                                                                *
#**********************************************************************************
#*  Chg#    Release  Description                                                  *
#*                                                                                *
#*  IPCAPM  CTS      Intial Version                                               *
#*  IPCA02  CTS      CHANGE THE DISPLAY TAX INFORMATION FEILD FROM INDICATOR TO   *
#*  IPCA02           DROP DOWN                                                    *
#*  ABU209  CTS     FIX TO DISPLAY RELATION TO INSURED                            *
#*  M142S2  CTS      Change the label for MIR-PREM-ACUM-AMT from Total Premiun    * 
#*  M142S2           Collected - Accumulated to Taxable Premium Paid              *
#*  M245B2  CTS      Foreign Currency Formatting 			          *
#*  M245K3  CTS     CHANGE THE ACCOUNT NUMBER FIELD LENGTH FROM 7 TO 17           *
#*  Q52972  CTS      ADDED JPY BENEFIT INDICATOR                                  *
#*  Q57608  CTS      ADDED MRF INDICATOR                                          *
#*  M271C9  CTS      CHANGES AS PART OF CR4 SECOND PAYEE DETAILS                 **
#*  MP332B  CTS      XML CHANGES FOR MONEY LAUNDERING                             *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION             *
#**********************************************************************************

P-STEP BF9A94-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A94";
        BusinessFunctionName = "PayeeList";
        BusinessFunctionType = "Inquire";
        MirName = "CCWM9A90";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


        IN MIR-DV-PRCES-STATE-CD
        {
            Length = "1";
            DBTableName = "Derived";
            SType = "Hidden";
            Label = "process code";
        }
        
        OUT MIR-CLM-STAT-CD
        {
            Length = "40";
            CodeSource = "DataModel";
            CodeType = "CLM-STAT-CD";
            DBTableName = "TDCLM";
            SType = "Text";
            Label = "Death Master Claim Status";
        }

        OUT MIR-POL-ID
        {
            Length = "10";
            DBTableName = "TDCLM";
            SType = "Text";
            Label = "Policy ID";
        }

        INOUT MIR-CLM-ID
        {
            Key;
            Length = "8";
            DBTableName = "TDCLM";
            SType = "Text";
            Label = "Death Master Claim ID";
        }

        OUT MIR-INSRD-CLI-ID
        {
            Length = "10";
            DBTableName = "TDCLM";
            SType = "Text";
            Label = "Insured Client ID";
        }

        OUT MIR-DV-INS-CLI-NM

        {
            DisplayOnly;
            Length = "75";
            DBTableName = "Derived";
            SType = "Text";
            Label = "Insured Name";
        }
       
        OUT MIR-BNFY-SEQ-NUM-T[30]
        {
            Length = "3";
            FieldGroup = "Table1";
            DBTableName = "TBENE";
            SType = "Text";
            Label = "Sequence Number";
            Index = "1";
        }

        OUT MIR-BENE-INSRD-CLI-ID-T[30]
        {
            Length = "10";
            FieldGroup = "Table1";
            DBTableName = "TBENE";
            SType = "Text";
            Label = "Client Number";
            Index = "1";
        }

        OUT MIR-BENE-BNFY-NM-T[30]
        {
            #TLB041 CHANGES START HERE
            #Length = "54";
            Length = "100";
            #TLB041 CHANGES END HERE
            FieldGroup = "Table1";
            DBTableName = "TBENE";
            SType = "Text";
            Label = "Beneficiary Name";
            Index = "1";
        }

        OUT MIR-BNFY-TYP-CD-T[30]
        {
            Length = "1";
            FieldGroup = "Table1";
            DBTableName = "TBENE";
            CodeSource = "DataModel";
            CodeType   = "BNFY-TYP-CD";
            SType = "Text";
            Label = "Beneficiary Type Code";
            Index = "1";
        }

        OUT MIR-BNFY-DESGNT-CD-T[30]
        {
            Length = "1";
            FieldGroup = "Table1";
            DBTableName = "TBENE";
            CodeSource = "DataModel";
            CodeType   = "BNFY-DESGNT-CD";
            SType = "Text";
            Label = "Beneficiary Designation Code";
            Index = "1";
        }
        OUT MIR-BNFY-REL-INSRD-CD-T[30]
        {
            Length = "5";
            FieldGroup = "Table1";
            DBTableName = "TBENE";
#ABU209 CHANGES START HERE       
            CodeSource = "EDIT";
            CodeType   = "BTOI";  
#ABU209 CHANGES END HERE                    
            SType = "Text";
            Label = "Relation to the Insured";
            Index = "1";
        }

        OUT MIR-BNFY-PRCDS-PCT-T[30]
        {
            Length = "3";
            FieldGroup = "Table1";
            DBTableName = "TBENE";
            SType = "Number";
            Label = "Percentage";
            Index = "1";
        }

        OUT MIR-BNFY-MINR-IND-T[30]
        {
            Length = "1";
            FieldGroup = "Table1";
            DBTableName = "TBENE";
            CodeSource = "DataModel";
            CodeType   = "BNFY-MINR-IND";
            SType = "Indicator";
            Label = "Beneficiary is a Minor";
            Index = "1";
        }
         OUT MIR-DCRL-SEQ-NUM-T[30]
        {
            Length = "3";
            FieldGroup = "Table2";
            DBTableName = "TDCRL";
            SType = "Text";
            Label = "Sequence Number";
            Index = "1";
        }        	        
        OUT MIR-PAYEE-NM-TXT-T[30]
        {
            Length = "30";
            FieldGroup = "Table2";
            KeyColumn;
            DBTableName = "Derived";
            SType = "Text";
            Label = "Payee Name(Kanji)";
            Index = "1";
        }

        OUT MIR-BNK-NM-T[30]
        {
            Length = "36";
            FieldGroup = "Table2";
            DBTableName = "TBNKB";
            SType = "Text";
            Label = "Current Bank Name";
        }

        OUT MIR-BNK-BR-NM-T[30]
        {
            Length = "36";
            FieldGroup = "Table2";
            DBTableName = "TBNKB";
            SType = "Text";
            Label = "Current Branch Name";
        }


        OUT MIR-ACCT-TYP-CD-T[30]
        {
            Length = "3"; 
            FieldGroup = "Table2"; 
            DBTableName = "TDCRL"; 
            CodeSource = "EDIT"; 
            CodeType = "FBACC";              
            SType = "Text"; 
            Label = "Account Type"; 
        }
        OUT MIR-DCRL-BNK-ACCT-ID-T[30]
        {
#* M245K3 CHANGES STARTS HERE
#*          Length = "7";
            Length = "17"; 
#* M245K3 CHANGES ENDS HERE
            FieldGroup = "Table2"; 
            DBTableName = "TDCRL"; 
            Mandatory; 
            SType = "Text"; 
            Label = "Account Number"; 
        }

        OUT MIR-DCRL-ACCT-HLDR-NM-T[30]
        {
            Length = "50";
            FieldGroup = "Table2";
            DBTableName = "TDCRL";
            Mandatory;
            SType = "Text";
            Label = "Account Holder Name";
        }
        OUT MIR-DCRL-KJ-ADDR-TXT-T[30]
        {
            Length = "50";
            FieldGroup = "Table2";
            DBTableName = "TDCRL";
            SType = "Text";
            Label = "Address";
        }

        OUT MIR-DCRL-SAMAKATA-BU-TXT-T[30]
        {
            MixedCase;
            Length = "72";
            SType = "Text";
            Label = "Samakata-bu";
            DBTableName = "TDCRL";
        }

        OUT MIR-DCRL-SEND-PMT-NOTI-IND-T[30]
        {
            Length = "1";
            FieldGroup = "Table1";
            DBTableName = "TDCRL";
            SType = "Indicator";
            Label = "Send Notice";
            Index = "1";
        }

        OUT MIR-DCRL-INSRD-REL-CD-T[30]
        {
            Length = "40";
            FieldGroup = "Table1";
            CodeSource = "EDIT";
            CodeType = "CLMRL";
            DBTableName = "TDCRL";
            SType = "Selection";
            Label = "Relation to Beneficiary";
            Index = "1";
        }

        OUT MIR-DCRL-PAYE-STAT-CD-T[30]
        {
            Length = "1";
            FieldGroup = "Table2";
            CodeSource = "DataModel";
            CodeType = "DCRL-PAYE-STAT-CD";
            DBTableName = "TDCRL";
            SType = "Text";
            Label = "Payee Status";
            Index = "1";
        }
#* M271C9 CHANGES STARTS HERE
        OUT MIR-BNK-NM-1-T[30]
        {
            Length = "36";
            FieldGroup = "Table2";
            DBTableName = "TBNKB";
            SType = "Text";
            Label = "Second Bank Name";
        }

        OUT MIR-BNK-BR-NM-1-T[30]
        {
            Length = "36";
            FieldGroup = "Table2";
            DBTableName = "TBNKB";
            SType = "Text";
            Label = "Second Branch Name";
        }


        OUT MIR-ACCT-TYP-CD-1-T[30]
        {
            Length = "3"; 
            FieldGroup = "Table2"; 
            DBTableName = "TDCRL"; 
            CodeSource = "EDIT"; 
            CodeType = "FBACC";              
            SType = "Text"; 
            Label = "Second Account Type"; 
        }
        OUT MIR-DCRL-BNK-ACCT-ID-1-T[30]
        {
            Length = "17"; 
            FieldGroup = "Table2"; 
            DBTableName = "TDCRL"; 
            Mandatory; 
            SType = "Text"; 
            Label = "Second Account Number"; 
        }

        OUT MIR-DCRL-ACCT-HLDR-NM-1-T[30]
        {
            Length = "50";
            FieldGroup = "Table2";
            DBTableName = "TDCRL";
            Mandatory;
            SType = "Text";
            Label = "Second ID Account Holder Name";
        }

#* M271C9 CHANGES ENDS HERE        
        OUT MIR-KJ-PAYEE-NM-TXT-T[30]
        {
            Length = "50";
            FieldGroup = "Table3";
            DBTableName = "Derived";
            SType = "Text";
            Label = "Payee";
            Index = "1";
        }
        
#IPCA02 CHANGES START HERE
        
        OUT MIR-TAX-TYP-CD-T[30]
        {
            Length = "2";
            FieldGroup = "Table3";
            CodeSource = "DataModel";
            CodeType = "PAYE-TAX-TYP-CD";
            DBTableName = "TDCRL";
            SType = "Text";
            Label = "Display Tax Information";
            Index = "1";
            
        }

#IPCA02 CHANGES END HERE

        OUT MIR-PREM-ACUM-AMT-T[30]
        {
            Length = "1";
            FieldGroup = "Table3";
            DBTableName = "TDCRL";
            SType = "Currency";
            Label = "Taxable Premium Paid";
            Index = "1";
        }
        OUT MIR-EXPL-RMRK-TXT-T[30]
        {
            Length = "120";
            FieldGroup = "Table3";
            DBTableName = "TDCRL";
            SType = "Text";
            Label = "Explanatory Remarks";
            Index = "1";
        }
#M245B2 CHANGES START HERE        
        INOUT MIR-POL-CRCY-CD
        {    
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
        }
#M245B2 CHANGES END HERE
#Q52972 CHANGES START HERE
        INOUT MIR-PAYO-JPY-BNFT-CD
        {     
            Length = "1";
            SType = "Hidden";
            Label = "JPY benefit indicator";
        }
        INOUT MIR-PREV-PAYO-JPY-BNFT-CD
        {     
            Length = "1";
            SType = "Hidden";
            Label = "Previous JPY benefit indicator";
        }
#Q52972 CHANGES END HERE
#Q57608 CHANGES START HERE
        INOUT MIR-MRF-IND
        {     
                Length = "1";
                SType = "Hidden";
                Label = "MRF Indicator";
        }
        INOUT MIR-PREV-MRF-IND
        {     
                Length = "1";
                SType = "Hidden";
                Label = "Previous MRF Indicator";
        }
#Q57608 CHANGES END HERE
#* MP332B Changes Start Here

    OUT MIR-BNFY-KA-NM-T[12]
    {
        #TLB041 CHANGES START HERE
        #Length = "50";
        Length = "100";
        #TLB041 CHANGES END HERE
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Beneficiary's Kana Name";
        Index = "1";
    }
        
    OUT MIR-BNFY-SEX-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "BNFY-SEX-CD";
        SType = "Text";
        Label = "Beneficiary's Sex Code";
        Index = "1";

    }
       
    OUT MIR-BNFY-BTH-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Beneficiary's Date Of Birth";
        Index = "1";
    }
    
#* MP332B Changes End Here

}
