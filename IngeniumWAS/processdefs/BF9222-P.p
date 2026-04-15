#*******************************************************************************
#*  Component:   BF9222-P.p                                                    *
#*  Description: UL Master Claim Summary Sheet                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN000388 CTS      Initial Version                                          *
#*  EN001058 CTS      INCREAED NO. OF CLAIM NOTES TO 15 OCCURANCES             *
#*  RP211d   CTS      ADDED SUBTABLE 4 CODE                                    *
#*  RP2CLA   CTS      CHANGES FOR CANCER LUMPSUM AUTOMATION                    *
#*  ISLCLM   CTS      ADDED STEP-IN RIGHT INFORMATION FIELDS                   *
#*  MP143H   CTS      ADDED NEW FIELDS 'CI Event Date', 'CI Event Type' AND    *
#*  MP143H            'ICU Date'                                               *
#*  M176J3   CTS      CHANGES DONE FOR ARM TRANSPLANT BENEFIT                  *
#*  M253O1   CTS      ADDED NEW FIELDS FOR PAYEE INFORMATION SECTION AND       *
#*  M253O1   CTS      CANCER DIAGNOSIS SECTION AND PAYEE INFORMATION SECTION   *
#*  M281P2   CTS      CHANGES AS PART OF RETAIL CANCER                         *
#*                                                                             *
#*  M280P2  CTS      CHANGES DONE FOR ARM III                                  *
#*  Q71518  CTS      CHANGES DONE TO ADD HOME TREATMENT AND ASSOCIATED DISEASE *
#*                   SECTION                                                   *
#*  MP300C  CTS      CHANGES TO ADD NEW FIELD PRE-LCD CHECK INDICATOR FOR ETC  *
#*  MP302M  CTS      CHANGES TO ADD NEW FIELD FOR SURVIVAL BENEFIT CHARGEBACK  *
#*  CS0008  CTS      CSA IMPROVEMENTS-MEDICAL CLAIM CHANGES                    *
#*  CXT001  CTS      ADJUCICATION MESSAGES & REQUIREMENT CHANGES               *
#*  R19749  CTS      INC06199510 - FIX                                         *

#*  UY3070  CTS      STREAM 3 FA REDUCTION CHANGES                             *
#*  UY3023  CTS  MEDICAL CLAIMS - RECOVERY                                     *                           *
#*  UY323A  CTS      MEDICAL CLAIM PAYMENT                                     *
#*******************************************************************************

P-STEP BF9222-P
{
      ATTRIBUTES
      {
             BusinessFunctionId = "9222";
             BusinessFunctionName = "UL Medical Claim Summary Sheet";
             BusinessFunctionType = "Retrieve";
             MirName = "CCWM9222";
      }

      OUT LSIR-RETURN-CD;

      OUT MIR-RETRN-CD;

      INOUT MIR-CLM-ID 
      {
             Key;
             Mandatory;
             Length = "8";
             DBTableName = "TCLMA";
             DefaultSession = "MIR-CLM-ID";
             SType = "Text";
             Label = "Master Claim ID";
      }

      OUT MIR-CLMA-ASSOC-CLM-ID
      {
             Length = "8";
             DBTableName = "TCLMA";
             SType = "Text";
             Label = "Associated Master Claim ID";
 
      }

      OUT MIR-CLMA-INSRD-CLI-ID
      { 
             Length = "10";
             DBTableName = "TCLMA";
             SType = "Text";
             Label = "Insured Client ID";

      }



      OUT MIR-DV-INS-CLI-NM
      {
             Length = "75";
             MixedCase;
             DBTableName = "Derived";
             SType = "Text";
             Label = "Insured Name";

      }



      OUT MIR-CLI-BTH-DT
      {
             Length = "10";
             DBTableName = "TCLI";
             SType = "Date";
             Label = "Birth Date";     
  
      }



      OUT MIR-CLI-SEX-CD
      {
             Length = "1";
             CodeSource = "DataModel";
             CodeType = "CLI-SEX-CD";
             DBTableName = "TCLI";
             SType = "Text";
             Label = "Gender";
   
      }

#*ISLCLM CHANGE START
      OUT MIR-CO-RECV-DT
      {
             Length = "10";
             DBTableName = "TCLBN";
             SType = "Date";
             Label = "Company Received Date";

      }
#*ISLCLM CHANGE END    

      OUT MIR-CLMA-HO-ACPT-DT
      {
             Length = "10";
             DBTableName = "TCLMA";
             SType = "Date";
             Label = "HO Acceptance Date";

      }

      OUT MIR-BR-ID
      {
             Length = "5";
             CodeSource = "XTAB";
             CodeType = "BRCH";
             DBTableName = "TCLMA";
             SType = "Text";
             Label = "RO Code";

      }

      OUT MIR-SO-ID
      {
             Length = "5";
             CodeSource = "XTAB";
             CodeType = "SALE";
             DBTableName = "TCLMA";
             SType = "Text";
             Label = "SO Code";

      }

      OUT MIR-ADJ-USER-ID
      {
             Length = "8";
             DBTableName = "TCLMA";
             SType = "Text";
             Label = "Adjudicator ID";
  
      }     

      OUT MIR-POL-ID-T[50]
      {
             Length = "10";
             DBTableName = "TPOL";
             SType = "Text";
             Label = "Policy Id";  
             FieldGroup = "Table2";
      }

      OUT MIR-CVG-NUM-T[50]
      {
             Length = "2";
             DBTableName = "TCVG";
             SType = "Text";
             Label = "Coverage Number";
             FieldGroup = "Table2";
      }
#*UY3070 CHANGE START 
      OUT MIR-PLAN-CD-T[50] 
          {
            DBTableName = "TETAB";
            FieldGroup = "Table2";
            Label = "Plan Code";
            Length = "3";
            SType = "Text";
      }
#*UY3070 CHANGE END
      OUT MIR-PLAN-ID-T[50] 
      {
             Length = "6";
             CodeSource = "EDIT";
             CodeType = "PLAN";
             DBTableName = "TCVG";
             SType = "Text";
             Label = "Plan";            
             FieldGroup = "Table2";
      }


      OUT MIR-CVG-FACE-AMT-T[50]
      {
             Signed;
             Length = "16";
             DBTableName = "TCVG";
             SType = "Currency";
             Label = "Face Amount";          
             FieldGroup = "Table2";
      }


      OUT MIR-CVG-ISS-EFF-DT-T[50]
      {
             Length = "10";
             DBTableName = "TCVG";
             SType = "Date";
             Label = "Issue Date";          
             FieldGroup = "Table2";
      } 

      OUT MIR-CVG-CSTAT-CD-T[50]
      {
             Length = "3";
             CodeSource = "DataModel";
             CodeType = "CVG-CSTAT-CD";
             DBTableName = "TCVG";
             SType = "Text";
             Label = "Coverage Status";            
             FieldGroup = "Table2";
      }

      OUT MIR-CVG-STBL-2-CD-T[50]
      {
             Length = "3";
             CodeSource = "EDIT";
             CodeType = "STB2";
             DBTableName = "TCVG";
             SType = "Text";
             Label = "Sub-table 2";          
             FieldGroup = "Table2";
      }

      OUT MIR-CVG-STBL-4-CD-T[50]
      {
             Length = "2";
             CodeSource = "EDIT";
             CodeType = "STB4";
             DBTableName = "TCVG";
             SType = "Text";
             Label = "Sub-table 4";          
             FieldGroup = "Table2";
      }
# M280P2 CHANGES STARTS HERE
       OUT MIR-3DD-WP-IND-T[50]
      {
             Length = "40";
             CodeSource = "EDIT";
             CodeType = "3DDW";  
             DBTableName = "TCVG";
             SType = "Text";
             Label = "3DD Waiver of Premium";
             Index = "1";
             FieldGroup = "Table2";             
       }
# M280P2 CHANGES ENDS HERE        
#   ISLCLM - Changes start here     
      OUT MIR-SURR-FORM-ACPT-DT
      { 
             DisplayOnly;
             Length = "10";
             DBTableName = "TPOL";        
             SType = "Date";
             Label = "Surrender Request Form Acceptance Date";
      }
          
      OUT MIR-ASIGN-SURR-EFF-DT
      { 
             DisplayOnly;
             Length = "10";
             DBTableName = "TPOL";                
             SType = "Date";
             Label = "Assigned Surrender Effective Date for Policy with Assignee";
      }
          
      OUT MIR-POL-STEP-IN-RIGHT-IND
      { 
             DisplayOnly;
             Length = "1";
             DBTableName = "TPOL";                
             SType = "Text";
             Label = "Policy with Step-In Right";
      }    
#   ISLCLM - Changes end here

      OUT MIR-CLMA-INCID-TYP
      {
             Length = "1";
             DBTableName = "TCLMA";
	     CodeSource = "DataModel";
	     CodeType = "INCID-TYP-CD";
             SType = "Text";
             Label = "Incident Type";
   
      }

      OUT MIR-CLMA-INCID-DT
      {
             Length = "10";
             DBTableName = "TCLMA";
             SType = "Date";
             Label = "Incident Date";

      }

      OUT MIR-DIS-MAJ-CD-T[5] 
      {
             Length = "10";
             DBTableName = "TCLEV";
             SType = "Text";
             Label = "Major Disease Code";
             FieldGroup = "Table4";
      }

      OUT MIR-DV-CLMA-DIS-CAUS-DESC-T[5]
      {
             Length = "60";                  
             MixedCase;
             DBTableName = "Derived";
             SType = "Text";            
             Label = "Kanji Description";
             FieldGroup = "Table4";
      }

      OUT MIR-HOSP-STRT-DT-T[10] 
      {
             Length = "10";
             DBTableName = "TCLEV";
             SType = "Date";          
             Label = "Hosp. Start Date";
             FieldGroup = "Table5";
      }

      OUT MIR-HOSP-END-DT-T[10] 
      {
             Length = "10";
             DBTableName = "TCLEV";
             SType = "Date";          
             Label = "Hosp. End Date";
             FieldGroup = "Table5";
      }


      OUT MIR-DV-TOT-BEFORE-AGGR-QTY-T[10]
      {
             Signed;
             Length = "10";
             DBTableName = "Derived";
             SType = "Text";            
             Label ="Total Before Aggregation";
             FieldGroup = "Table5";
      }

      OUT MIR-HOSP-STAT-CD-T[10]
      {
             Length = "01";
             CodeSource = "DataModel";
             CodeType = "CLEV-HOSP-STAT-CD";
             DBTableName = "TCLEV";
             SType = "Text";
             Label = "Discharge Status";
             FieldGroup = "Table5";
      }
#M280P2 CHANGES STARTS HERE      
#     OUT MIR-SURGY-STRT-DT-T[10] 
       OUT MIR-SURGY-STRT-DT-T[30]
#M280P2 CHANGES ENDS HERE       
      {
             Length = "10";
             DBTableName = "TCLEV";
             SType = "Date";
             Label = "Surgeries Start Date";            
             FieldGroup = "Table6";
      }
#M280P2 CHANGES STARTS HERE      
#     OUT MIR-DV-SURGY-MINR-DESC-T[10]
       OUT MIR-DV-SURGY-MINR-DESC-T[30]
#M280P2 CHANGES ENDS HERE       
      {
             Length = "60";                 
             MixedCase;
             DBTableName = "Derived";
             SType = "Text";
             Label = "Kanji Description";            
             FieldGroup = "Table6";
      }

      OUT MIR-OUTP-STRT-DT
      {
             Length = "10";
             DBTableName = "TCLEV";
             SType = "Date";
             Label = "Outpatient Start Date";
   
      }

      OUT MIR-OUTP-END-DT
      {
             Length = "10";
             DBTableName = "TCLEV";
             SType = "Date";
             Label = "Outpatient End Date";

      }

      OUT MIR-DV-TOT-OUTP-DYS
      {
             Length = "3";
             DBTableName = "Derived";
             SType = "Text";
             Label = "Total";

      }   
 #*M253O1 CHANGES START
      OUT MIR-CANCER-DIAGNS-DT
      {
             Length = "10";
             DBTableName = "TCLMA";
             SType = "Date";
             Label = "Diagnosed Date";
             FieldGroup = "Table14";             
      }
    
      OUT MIR-CANCER-TYP-CD
      {
             Length = "1";
             CodeSource = "EDIT";
             CodeType = "CATYP";
             DBTableName = "TCLMA";
             Label = "Cancer Type";
             FieldGroup = "Table14";             
      }
#*M281P2 CHANGES START
      OUT MIR-CANCER-STAGE-CD
      {
             Length = "5";
             CodeSource = "EDIT";
             CodeType = "CASTG";
             DBTableName = "TCLMA";
             Label = "Cancer Stage";
             FieldGroup = "Table14";             
      }
#*M281P2 CHANGES END      
      OUT MIR-CANCER-OUTCM-CD
      {
             Length = "5";
             CodeSource = "EDIT";
             CodeType = "CAOCM";
             DBTableName = "TCLMA";
             Label = "Outcome of Cancer";
             FieldGroup = "Table14";             
      }
#*M253O1 CHANGES END       

 #*M281P2 CHANGES START     
      OUT MIR-PALLIATIVE-STRT-DT-T[20] 
      {
             Length = "10";
             DBTableName = "TCLEV";
             SType = "Date";          
             Label = "Palliative Start Date";
             FieldGroup = "Table5";
      }

      OUT MIR-PALLIATIVE-END-DT-T[20] 
      {
             Length = "10";
             DBTableName = "TCLEV";
             SType = "Date";          
             Label = "Palliative End Date";
             FieldGroup = "Table5";
      }
#*M281P2 CHANGES END  

#*MP143H CHANGES START
#*M176J3 CHANGES START 
#*Label name "CI Event Date" is changed as "CI/Transplant Benefit Event Date"
#*Label name "CI Event Type" is changed as "CI/Transplant Benefit Event Type"
      OUT MIR-CI-DIAGNS-DT
      {
             Length = "10";
             DBTableName = "TCLMA";
             SType = "Date";
             Label = "CI/Transplant Benefit Event Date";
      }
     OUT MIR-CI-EVNT-TYP-CD
      {
             Length = "2";
    	     CodeSource = "EDIT";
             CodeType = "CITYP";
             DBTableName = "TCLMA";
             SType = "Text";
             Label = "CI/ Transplant Benefit Event Type";
      }  
#*M176J3 CHANGES END      
     OUT MIR-ICU-DT
      {
             Length = "10";
             DBTableName = "TCLMA";
             SType = "Date";
             Label = "ICU Date";
      }      
#*MP143H CHANGES END       
      
      OUT MIR-POL-ID1-T[50]
      {
             Length = "10";
             DBTableName = "TPOL";
             SType = "Text";
             Label = "Policy Id";  
             FieldGroup = "Table8";
      }

      OUT MIR-CVG-NUM1-T[50]
      {
             Length = "2";
             DBTableName = "TCVG";
             SType = "Text";
             Label = "Coverage Number";
             FieldGroup = "Table8";
      }
#*UY3070 CHANGES START
      OUT MIR-PLAN-CD1-T[50]
       {
             Length = "3";
             DBTableName = "TETAB";
             SType = "Text";
             Label = "Plan Code";
             FieldGroup = "Table8";
      }
#*UY3070 CHANGES END
      OUT MIR-PLAN-ID1-T[50]
      {
             Length = "6";
             CodeSource = "EDIT";
             CodeType = "PLAN";
             DBTableName = "TCVG";
             SType = "Text";
             Label = "Plan";            
             FieldGroup = "Table8";
      }


      OUT MIR-CVG-FACE-AMT1-T[50]
      {
             Signed;
             Length = "16";
             DBTableName = "TCVG";
             SType = "Currency";
             Label = "Face Amount";          
             FieldGroup = "Table8";
      }


      OUT MIR-BNFT-NM-ID-T[50] 
      {
             Length = "05";
             MixedCase;
             CodeSource = "EDIT";
             CodeType = "BENNM";
             DBTableName = "TCLBN";
             SType = "Text";
             Label = "Benefit Name";
             FieldGroup = "Table8";       
      }

      OUT MIR-DV-BNFT-MULTR-FCT-T[50]
      {
#*RP2CLA-Changed Decimals ="1"      
#UY3023-CHANGES STARTS
             Signed;
#UY3023-CHANGES ENDS
             Length = "6";
             Decimals = "1";
             DBTableName = "Derived";
             SType = "Number";
             Label = "Multiplier";
             FieldGroup = "Table8";
             
      }

      OUT MIR-DV-BNFT-PAYBL-AMT-T[50]
      {
             Signed;
             Length = "16";
             DBTableName = "Derived";
             SType = "Currency";
             Label = "Payment Amount";            
             FieldGroup = "Table8";
      }


      OUT MIR-BNFT-DECSN-CD-T[50] 
      {
             Length = "2";  
             CodeSource = "DataModel";
             CodeType = "CLBN-BNFT-DECSN-CD";
             DBTableName = "TCLBN";
             SType = "Text";
             Label = "Decision";
             FieldGroup = "Table8";      
      }
#* CS0008 CHANGES STARTS HERE
      OUT MIR-NON-PMT-REASN-TXT-T[50] 
      {
             Length = "08";  
             CodeSource = "DataModel";
             CodeType = "NON-PMT-REASN-TXT";
             DBTableName = "TCLBD";
             SType = "Text";
             Label = "Non-payment reason code";
             FieldGroup = "Table8";      
      }
#* CS0008 CHANGES END HERE
      OUT MIR-DV-FACE-AMT-TOT
      {
             Signed;
             Length = "16";
             DBTableName = "Derived";
             SType = "Currency";
             Label = "Face Amount Total";
      }
#* MP302M CHANGES STARTS HERE
     OUT MIR-SRVBEN-CHRGBCK-AMT
     {
             Signed;
             Length = "15";
             DBTableName = "Derived";
             SType = "Currency";
#* UY323A CHANGES STARTS
#             Label = "Survival Benefit Chargeback Amount";
             Label = "Benefit Chargeback Amount";
#* UY323A CHANGES ENDS
     }
#* MP302M CHANGES ENDS HERE
#* M253O1 CHANGES STARTS HERE
    OUT MIR-SEND-PMT-NOTI-IND-T[10]
    {
             Length = "1";
             FieldGroup = "Table13";
             DBTableName = "TCLRL";
             SType = "Indicator";
             Label = "Send Notice";
             Index = "1";
    }
    OUT MIR-KJ-PREFCT-TXT-T[10] 
    {
             FieldGroup = "Table13";
             Length = "11";
             SType = "Text";
             Label = "Prefecture";
             Index = "1";
    }
    OUT MIR-KJ-CITY-TXT-T[10] 
    {
             FieldGroup = "Table13";
             Length = "30";
             SType = "Text";
             Label = "City";
             Index = "1";
    }
    OUT MIR-KJ-NGHBRHD-TXT-T[10] 
    {
             FieldGroup = "Table13";
             Length = "30";
             SType = "Text";
             Label = "Neighbourhood";
             Index = "1";
    }
    OUT MIR-CLRL-SAMAKATA-BU-TXT-T[10] 
    {
             DisplayOnly;
             Length = "72";
             FieldGroup = "Table13";
             Index = "1";
             SType = "Text";
             Label = "Samakata-bu";
    }
    OUT MIR-PAYEE-NM-TXT-6-T[10]
    {
             Length = "50";
             FieldGroup = "Table13";
             DBTableName = "Derived";
             SType = "Text";
             Label = "Payee Name";
             Index = "1";
    }
    OUT MIR-PAYEE-PREV-UPDT-DT-T[10] 
    {
             Length = "10";
             FieldGroup = "Table13";
             DBTableName = "TCLRL";
             SType = "Date";
             Label = "Previous Update Date";
             Index = "1";
    }    
    OUT MIR-PAYEE-PREV-UPDT-USER-ID-T[10] 
    {
             Length = "8";
             FieldGroup = "Table13";
             DBTableName = "TCLRL";
             SType = "Text";
             Label = "Previous Update User ID";
             Index = "1";
    }
      
#* M253O1 CHANGES ENDS HERE	
      OUT MIR-BNK-ID-T[5]
      {
             Length = "4";
             DBTableName = "TPDRW";
             SType = "Text";
             Label = "Bank Code";             
             FieldGroup = "Table9";
      } 

      OUT MIR-BNK-NM-T[5]
      {
             Length = "36";
             MixedCase;
             DBTableName = "TBNKB";
             SType = "Text";
             Label = "Bank Name";            
             FieldGroup = "Table9";
      }

      OUT MIR-BNK-BR-ID-T[5]
      {
             Length = "5";
             DBTableName = "TPDRW";       
             SType = "Text";
             Label = "Branch Code";
             FieldGroup = "Table9";
      }

      OUT MIR-BNK-BR-NM-T[5]
      {
             Length = "36";
             MixedCase;
             DBTableName = "TBNKB";
             SType = "Text";
             Label = "Branch Name";             
             FieldGroup = "Table9";
      }

      OUT MIR-PAYEE-ACCT-TYP-CD-T[5]
      {
             Length = "3";
             CodeSource = "EDIT";
             CodeType = "FBACC";
             DBTableName = "TCLRL";
             SType = "Text";
             Label = "Account Type";             
             FieldGroup = "Table9";
      }

      OUT MIR-PAYEE-BNK-ACCT-ID-T[5]
      {
             Length = "17";
             DBTableName = "TCLRL";
             SType = "Text";
             Label = "Account Number";             
             FieldGroup = "Table9";
      }

      OUT MIR-PAYEE-ACCT-HLDR-NM-T[5]
      {
             Length = "50";
             MixedCase;
             DBTableName = "TCLRL";
             SType = "Text";
             Label = "Account Nominee Name";             
             FieldGroup = "Table9";
      }

      OUT MIR-POL-BILL-TYP-CD-IND-T[5]
      {
             Length = "1";
             CodeSource = "DataModel";
             CodeType = "POL-BILL-TYP-CD";
             DBTableName = "TPOL";
             SType = "Indicator";
             Label = "Bank Transfer";
             FieldGroup = "Table9";             
      }

      OUT MIR-DV-ACCT-CHK-IND-T[5]
      {
             Length = "1";
             DBTableName = "Derived";
             SType = "Indicator";
             Label = "Transfer account";
             FieldGroup = "Table9";             
      }

      OUT MIR-MSG-TXT-T[30]
      {
             Length = "120";
             DBTableName = "TCLKO";
             SType = "Text";
             Label = "Message";            
             FieldGroup = "Table10";
      }

      OUT MIR-AMEX-POL-ID-T[10]
      {
            Length = "9";
            DBTableName = "TAMEX";
            SType = "Text";        
            Label = "";
            FieldGroup = "Table11";
      }

      OUT MIR-AMEX-COMNT-INFO-T[10]
      {
             Length = "79";
             DBTableName = "TAMEX";
             SType = "Text";   
             Label = "";         
             FieldGroup = "Table11";
      }

#EN1058      OUT MIR-PREV-UPDT-USER-ID-T[5]
      OUT MIR-PREV-UPDT-USER-ID-T[15]
      {
             Length = "8";
             DBTableName = "TFTXT";
             SType = "Text";
             Label = "User";
             FieldGroup = "Table12";          
      }

#EN1058      OUT MIR-PREV-UPDT-DT-T[5]
      OUT MIR-PREV-UPDT-DT-T[15]
      {
             Length = "10";
             DBTableName = "TFTXT";
             SType = "Date";
             Label = "Creation Day";
             FieldGroup = "Table12";
      }

#EN1058      OUT MIR-FTXT-CMNT-INFO-T[5]
      OUT MIR-FTXT-CMNT-INFO-T[15]
      {
             Length = "500";
             DBTableName = "TFTXT";
             SType = "Text";
             Label = "Claim Note";
             FieldGroup = "Table12";
      }
      OUT MIR-INFO
      {
             Length = "90";
             SType = "Text";

      }
#Q71518 CHANGES STARTS HERE

        OUT MIR-HOME-TRTMNT-STRT-DT-T[20]
        {
        Length = "10";
        FieldGroup = "Table7";
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Home Treatment Start Date";
        }

        OUT MIR-HOME-TRTMNT-END-DT-T[20]
       {
        Length = "10";
        FieldGroup = "Table7";
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Home Treatment End Date";
       } 
 
        OUT MIR-ASSOC-DIS-MAJ-CD-T[10]
        {
        Length = "10";                  
        FieldGroup = "Table15";
        DBTableName = "TCLEV";
        SType = "Text";
        Label = "Major Disease Code";
        }
        OUT MIR-ASSOC-DIS-MINR-CD-T[10]
        {
        Length = "10";                        
        FieldGroup = "Table15";
        DBTableName = "TCLEV";
        SType = "Text";
        Label = "Minor Disease Code";
        }
        
        OUT MIR-ASSOC-DIS-MINR-DESC-TXT-T[10]
        {
        Length = "60";                
        FieldGroup = "Table4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Minor Associated Disease Code Description";
        }
        
        OUT MIR-ASSOC-DIS-STRT-DT-T[10]     
        {
        Length = "10";
        FieldGroup = "Table15";
        KeyColumn;
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Associated Disease Start Date";
        }
  
        OUT MIR-ASSOC-DIS-END-DT-T[10]     
        {
        Length = "10";
        FieldGroup = "Table15";
        DBTableName = "TCLEV";
        SType = "Date";
        Label = "Associated Disease End Date";
        }               
#Q71518 CHANGES ENDS HERE
#MP300C CHANGES START HERE 
      OUT MIR-POL-ID2-T[50]
      {
             Length = "10";
             DBTableName = "TPOL";
             SType = "Text";
             Label = "Policy Id";  
             FieldGroup = "Table3";
      }

        OUT MIR-PRE-LCD-CHK-IND-T[50]
        {
        Length = "01";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "PRE-LCD-CHK-IND";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Pre-LCD Check";
        } 
        
#CXT001 CHANGES START        
	OUT MIR-CLIM-MORAL-RISK-CD 
	{
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "MORAL";
		SType = "Text";
		Label = "Moral Risk Category";
	}	
	
	OUT MIR-FTXT-MORAL-CMNT-INFO
	{
		Length = "500";
		SType = "Text";
		Label = "Moral Risk Note";
	}
#CXT001 CHANGES END 
#MP300C CHANGES END HERE
#R19749 CHANGES START HERE 
   INOUT MIR-POL-CRCY-CD-T[50]
        {
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        }
#R19749 CHANGES END HERE
        
}
