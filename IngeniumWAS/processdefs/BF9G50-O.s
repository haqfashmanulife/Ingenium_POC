# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:01 PM EDT

#*******************************************************************************
#*  Component:   BF9G50-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  MP270I  26JUN17  CHANGES FOR EPOS MGA                                      *
#*  M27028  16OCT17  CTS    CHANGES DONE TO INCLUDE INDICATOR FOR              *
#*  M27028                  EXCLUSION FIELDS AS PART OF CR 28         	       *
#*  M27029  17OCT17  CTS    CHANGES DONE TO INCLUDE INDICATOR FOR     	       *
#*  M27029                  INSURED DATA FLAG FIELDS                  	       *
#*  M27044  19OCT17  CTS    CHANGES DONE FOR U/W RESULT SECTION FIELDS	       *
#*  M27044                  AS PART OF CR44                           	       *
#*  M27058  19OCT17  CTS    CHANGES DONE FOR MEDICAL EXCLUSION  FIELDS	       *
#*  M27058                  AS PART OF CR58                           	       *
#*  Q92099  02APR18  CTS    FIX FOR COVERAGE DETAIL ARRAY                      *
#*  018396  15MAY19  CTS    CHANGES FOR AIS SCREEN - EPOS                      *
#*  115953  13DEC19  CTS    CHANGES FOR POL UWGDECN FLD DSCRPTION IN AIS       *
#*  115953                  SCREEN & NUWRN EXTRACT                             * 
#*  CD200A  13JAN25  CTS    CERBERUS NEW BUSINESS EPOS CHANGES                 *
#*  NVCN04  09APR25  CTS    ONTARIO EPOS CHANGES                               *
#*******************************************************************************

S-STEP BF9G50-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Inquiry";
        Type = "INput";
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
        Length = "09";
        SType = "Text";
        Label = "Policy Id";
    }
    
    IN MIR-POL-ID-SFX
    {
        DisplayOnly;    
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }
        
    IN MIR-INSRD-STCKR-ID
    { 
        DisplayOnly;    
        Length = "11";
        SType = "Text";
        Label = "Insured Sticker Number";
    } 

    IN MIR-CLI-ID
    { 
        DisplayOnly;    
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    } 
    
    IN MIR-INSRD-KANA-NM
    {
        DisplayOnly;    
        Length = "75";
        SType = "Text";
        Label = "Insured Kana Name";
    }     

    IN MIR-UW-TYP-CD
    {
        DisplayOnly;    
        Length = "01";
        CodeSource = "DataModel";
        DBTableName = "TCLIU";
        CodeType = "UW-TYP-CD";
        SType = "Text";
        Label = "Selection Method";  
    }
    
    IN MIR-SELF-DSCLSRE-DT
    {
        DisplayOnly;   
        Length = "10";
        SType = "Date";
        Label = "SD form date";  
    } 
    
#  Q92099 START HERE    
#   IN MIR-POL-ID-BASE-T[20]    
    IN MIR-POL-ID-BASE-T[30]    
#  Q92099 END   HERE    
    {
        DisplayOnly;           
        Length = "9";
        FieldGroup = "Table05";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";        
    } 

#  Q92099 START HERE    
#   IN MIR-CVG-NUM-T[20]    
    IN MIR-CVG-NUM-T[30]    
#  Q92099 END   HERE      
    {
        DisplayOnly;     
        Length = "2";
        FieldGroup = "Table05";        
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";        
    } 
    
#  Q92099 START HERE    
#   IN MIR-PLAN-ID-T[20]    
    IN MIR-PLAN-ID-T[30]    
#  Q92099 END   HERE
    {
        DisplayOnly; 
        Length = "40";
        FieldGroup = "Table05";
        CodeSource = "EDIT";
        CodeType = "PLAN";      
        SType = "Text";
        Label = "Plan Name";
        Index = "1";        
    }    
    
#  Q92099 START HERE    
#   IN MIR-CVG-FACE-AMT-T[20]    
    IN MIR-CVG-FACE-AMT-T[30]    
#  Q92099 END   HERE 
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;     
        Length = "16";
        FieldGroup = "Table05";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }
    
#  Q92099 START HERE    
#   IN MIR-CVG-RT-AGE-T[20]    
    IN MIR-CVG-RT-AGE-T[30]    
#  Q92099 END   HERE 
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table05";
        SType = "Number";
        Label = "Age";
        Index = "1";
    }
    
#  Q92099 START HERE    
#   IN MIR-CVG-STBL-1-CD-T[20]    
    IN MIR-CVG-STBL-1-CD-T[30]    
#  Q92099 END   HERE 
    {
        DisplayOnly;    
        Length = "40";
        FieldGroup = "Table05";
        CodeSource = "EDIT";
        CodeType = "STB1";              
        SType = "Text";
        Label = "Sub-table 1";
        Index = "1"; 
    }
    
#  Q92099 START HERE    
#   IN MIR-CVG-STBL-3-CD-T[20]    
    IN MIR-CVG-STBL-3-CD-T[30]    
#  Q92099 END   HERE 
    {
        DisplayOnly;    
        Length = "40";
        FieldGroup = "Table05";
        CodeSource = "EDIT";
        CodeType = "STB3";              
        SType = "Text";
        Label = "Sub-table 3";
        Index = "1"; 
    } 
        
#  NVCN04 START HERE       
    IN MIR-CVG-WP-TYP-CD-T[30]     
    {
	DisplayOnly;
        Length = "40";
        FieldGroup = "Table05";
        CodeSource = "EDIT";
        CodeType = "WPIND";              
        SType = "Text";
        Label = "WoP Type";
        Index = "1"; 
    } 	
#  NVCN04 END   HERE 

#  Q92099 START HERE    
#   IN MIR-CVG-WP-IND-T[20]    
    IN MIR-CVG-WP-IND-T[30]    
#  Q92099 END   HERE 
    {
        DisplayOnly;     
        Length = "01";
        FieldGroup = "Table05";        
        SType = "Indicator";
        Label = "3DD";
        Index = "1";
    }   
    
    IN MIR-AIS-UWGDECN-CD
    {
        DisplayOnly;   
        Length = "05";
        CodeSource = "DataModel";
        CodeType = "AIS-UWGDECN-CD";        
        SType = "Text";
        Label = "Underwriting Result";  
    }    

    IN MIR-AIS-UW-DECN-TYP-CD
    {
        DisplayOnly;       
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        SType = "Text";
#       Label = "Decision Type";
#018396 CHANGES START HERE        
        Label = "Client Decision Type";
#018396 CHANGES END HERE        
    } 
    
#018396 CHANGES START HERE

    IN MIR-POL-UWGDECN-TYP-CD
    {
        DisplayOnly;   
        Length = "20";
        CodeSource = "EDIT";
#       CodeType = "PLDEC";
#115953 CHANGES START HERE
        CodeType = "CLDEC";
#115953 CHANGES END HERE
        
        SType = "Text";
        Label = "Policy Decision Type";  
    }  
#018396 CHANGES END HERE
    
    IN MIR-DTH-ME-FCT
    {
        DisplayOnly;           
        Length = "03";
        SType = "Text";
        Label = "Death Premium Loading";      
    } 

    IN MIR-MED-ME-FCT
    {
        DisplayOnly;           
        Length = "03";
        SType = "Text";
        Label = "Medical Premium Loading";      
    }    
 
    IN MIR-CVG-LIEN-DUR
    {
        DisplayOnly;   
        Length = "01";
        SType = "Text";
        Label = "Lien";  
    }  
   
#M27028 CHANGES START HERE       
#    IN MIR-EXCL-PART-NUM-T[20]
#    {
#        DisplayOnly;
#        CodeSource = "EDIT";
#        CodeType = "TEXT"; 
#        Length = "05";
#        FieldGroup = "Table21";         
#        SType = "Text";
#        Label = "Exclusion Part Number"; 
#        Index = "1";          
#    } 
#    
#    IN MIR-EXCL-TERM-DUR-T[20]
#    {
#        DisplayOnly;   
#        Length = "10";
#        FieldGroup = "Table21";        
#        SType = "Text";
#        Label = "Exclusion Part Duration"; 
#        Index = "1";          
#    }    

    IN  MIR-RSK-EXCL-IND
    {
        DisplayOnly;
        Length = "01";
        SType = "Indicator";
        Label = "Exclusion";
        Index = "1";        
    } 

#M27028 CHANGES ENDS HERE    
  
    IN  MIR-SPCL-DISAB-EXCL-IND
    {
        DisplayOnly;         
#M27028 changes starts here
#        Length = "05";
#        CodeSource = "EDIT";
#        CodeType = "FLAG";          
#        SType = "Text";
        Length = "01";
        SType = "Indicator";
#M27028 changes ends here
        Label = "Special Disbility of Exclusion";
        Index = "1";        
    } 
    
    IN MIR-SELCT-TYP-CD
    {
        DisplayOnly; 
#M27029 changes starts here        
#        CodeSource = "EDIT";
#        CodeType = "UWTYP";        
#        Length = "05";
#        SType = "Text";
        Length = "01";
        SType = "Indicator";
#M27029 changes end here         
        Label = "Select Type";  
    }  
    
    IN MIR-UW-AMT-IND
    {
        DisplayOnly;  
#M27029 changes starts here 
#        CodeSource = "EDIT";
#        CodeType = "FLAG";          
#        Length = "05";
#        SType = "Text";
        Length = "01";
        SType = "Indicator";
#M27029 changes end here          
        Label = "UW Amount flag";  
    } 
    
    IN MIR-MR-OVR-FLAG
    {
        DisplayOnly;  
#M27029 changes starts here         
#        CodeSource = "EDIT";
#        CodeType = "FLAG";          
#        Length = "05";
#        SType = "Text";
        Length = "01";
        SType = "Indicator";
#M27029 changes end here          
        Label = "MR over 175 flag"; 
    }    
          
    IN MIR-SCV-INFO-IND
    {
        DisplayOnly; 
#M27029 changes starts here         
#        CodeSource = "EDIT";
#        CodeType = "FLAG";          
#        Length = "05";
#        SType = "Text";
        Length = "01";
        SType = "Indicator";
#M27029 changes end here          
        Label = "SCV Information Flag";  
    } 
    
    IN MIR-NON-MED-INFO-IND
    {
        DisplayOnly; 
#M27029 changes starts here         
#        CodeSource = "EDIT";
#        CodeType = "FLAG";          
#        Length = "05";
#        SType = "Text";
        Length = "01";
        SType = "Indicator";
#M27029 changes end here          
        Label = "NM Information Flag";  
    }  
    
#018396 CHANGES START HERE
    
    IN MIR-AIS-DISPLAY-IND
    {
            DisplayOnly; 
            Length = "01";
            SType = "Indicator";         
            Label = "HIDE AIS RESULT";  
    } 
    
    IN MIR-CVG-DCLN-IND
    {
            DisplayOnly; 
            Length = "01";
            SType = "Indicator";         
            Label = "Declined Rider Indicator";  
    } 
      

    IN MIR-CVG-DCLN-INFO-T[10]
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";           
        FieldGroup = "Table26";
        SType = "Text";
        Label = "Declined Riders";
        Index = "1";
    }        
        
#018396 CHANGES END HERE 

    IN MIR-REASN-1-CD
    {
        DisplayOnly;   
        Length = "03";        
        SType = "Text";
        Label = "Code1"; 
    }
    
    IN MIR-REASN-2-CD
    {
        DisplayOnly;   
        Length = "03";      
        SType = "Text";
        Label = "Code 2";      
    }  
    
    IN MIR-DFCT-1-CD-T[08]
    {
        DisplayOnly;   
        Length = "07";
        FieldGroup = "Table25";        
        SType = "Text";
        Label = "Defect Code1"; 
        Index = "1";        
    } 
    
    IN MIR-DFCT-2-CD-T[08]
    {
        DisplayOnly;       
        Length = "06";
        FieldGroup = "Table25";        
        SType = "Text";
        Label = "Defect Code2"; 
        Index = "1";         
    }  
    
    IN MIR-ELAPS-YRS-DUR-T[08]
    {
        DisplayOnly;       
        Length = "02";
        FieldGroup = "Table25";        
        SType = "Text";
        Label = "Elapsed Year"; 
        Index = "1";        
    } 
    
    IN MIR-SURGY-1-CD-T[08]
    {
        DisplayOnly;       
        Length = "02";
        FieldGroup = "Table25";        
        SType = "Text";
        Label = "Surgery1";
        Index = "1";        
    } 

    IN MIR-SURGY-2-CD-T[08]
    {
        DisplayOnly;    
        Length = "02";
        FieldGroup = "Table25";        
        SType = "Text";
        Label = "Surgery2";
        Index = "1";        
    }

    IN MIR-ADDL-INFO-TXT-T[08]
    {
        DisplayOnly;        
        Length = "20";
        FieldGroup = "Table25";        
        SType = "Text";
        Label = "Additional Information";
        Index = "1";        
    }     
        
    IN MIR-DIS-NM-T[20]
    {
        DisplayOnly;    
        Length = "200";
        FieldGroup = "Table10";        
        SType = "Text";
        Label = "Disease Name";
        Index = "1";        
    }    
    
    IN MIR-DIS-DECID-TYP-CD-T[20]
    {
        DisplayOnly;       
        Length = "7";
        FieldGroup = "Table10";        
        SType = "Text";
        Label = "Disease Decision Type";
        Index = "1";        
    }  

   IN MIR-LIFE-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3";
        FieldGroup = "Table10";         
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-LIFE-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1"; 
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-LIFE-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly; 
#M27044 CHANGES START HERE        
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        Length = "5";
#        FieldGroup = "Table10";        
#        SType = "Text";
        Length = "01";
        SType = "Indicator";
        FieldGroup = "Table10"; 
#M27044 CHANGES END HERE           
        Index = "1";        
    } 
    
    IN MIR-LIFE-DIS-DCLN-IND-T[10]
    {    
        DisplayOnly;  
#M27044 CHANGES START HERE         
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#         Length = "5"; 
#        FieldGroup = "Table10";        
#        SType = "Text";
        Length = "01";
        SType = "Indicator"; 
        FieldGroup = "Table10"; 
#M27044 CHANGES END HERE 
        Index = "1"; 
    }    
   
    IN MIR-MED-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3"; 
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here              
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-MED-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1";
        DBTableName = "TUDSR";
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-MED-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly;  
#M27044 CHANGES START HERE            
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        Length = "5";        
#        SType = "Text";
        Length = "01";
        SType = "Indicator"; 
#M27044 CHANGES end HERE           
        Index = "1";        
    } 
    
    IN MIR-MED-DIS-DCLN-IND-T[10]
    {
        DisplayOnly; 
#M27044 CHANGES START HERE            
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#        Length = "5"; 
#        FieldGroup = "Table10";        
#        SType = "Text";         
        Length = "01";
        SType = "Indicator"; 
        FieldGroup = "Table15";
#M27044 CHANGES end HERE           
        Index = "1";        
    } 
    
    IN MIR-AMT-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3"; 
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here     
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-AMT-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1";
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here        
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-AMT-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly; 
#M27044 CHANGES START HERE            
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        Length = "5"; 
#        FieldGroup = "Table10";        
#        SType = "Text";
        Length = "01";
        SType = "Indicator"; 
        FieldGroup = "Table15";  
#M27044 CHANGES end HERE            
        Index = "1";        
    } 
    
    IN MIR-AMT-DIS-DCLN-IND-T[10]
    {
        DisplayOnly;
#M27044 CHANGES START HERE            
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#        Length = "5"; 
#        FieldGroup = "Table10";        
#        SType = "Text";
        Length = "01";
        SType = "Indicator"; 
        FieldGroup = "Table15"; 
#M27044 CHANGES end HERE            
        Index = "1";        
    }  
    
    IN MIR-MED2-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3";
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here    
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-MED2-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1";
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here   
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-MED2-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly;  
#M27044 CHANGES START HERE            
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        Length = "5";
#        FieldGroup = "Table10";        
#        SType = "Text";
        Length = "01";
        SType = "Indicator"; 
        FieldGroup = "Table15";
#M27044 CHANGES end HERE            
        Index = "1";        
    } 
    
    IN MIR-MED2-DIS-DCLN-IND-T[10]
    {
        DisplayOnly; 
#M27044 CHANGES START HERE            
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#        Length = "5";
#        FieldGroup = "Table10";        
#        SType = "Text";
        Length = "01";
        SType = "Indicator";   
        FieldGroup = "Table15";
# M27044 CHANGES END HERE         
        Index = "1";        
    } 
    
    IN MIR-AD-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3"; 
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-AD-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-AD-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly;  
#M27044 changes start here            
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        Length = "5";
#        FieldGroup = "Table10";        
#        SType = "Text";    
        Length = "01";
        SType = "Indicator"; 
        FieldGroup = "Table10"; 
#M27044 changes end here            
        Index = "1";        
    } 
    
    IN MIR-AD-DIS-DCLN-IND-T[10]
    {
        DisplayOnly; 
#M27044 changes start here         
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#        Length = "5";
#        FieldGroup = "Table10";        
#        SType = "Text";    
        Length = "01";
        SType = "Indicator"; 
        FieldGroup = "Table10"; 
#M27044 changes end here            
        Index = "1";         
    }   
    
    IN MIR-DD-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-DD-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-DD-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly;
#M27044 CHANGES START HERE            
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        Length = "5";
#        FieldGroup = "Table10";        
#        SType = "Text";
        Length = "01";
        SType = "Indicator"; 
#M27044 CHANGES end HERE            
        Index = "1";        
    } 
    
    IN MIR-DD-DIS-DCLN-IND-T[10]
    {
        DisplayOnly;  
#M27044 CHANGES START HERE            
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#        Length = "5"; 
#        FieldGroup = "Table10";        
#        SType = "Text";
        Length = "01";
        SType = "Indicator"; 
#M27044 CHANGES end HERE            
        Index = "1";        
    } 
    
    IN MIR-FD-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3";
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here        
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-FD-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1";
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here        
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-FD-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly;
#M27044 CHANGES START HERE            
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        Length = "5";
#        FieldGroup = "Table10";        
#        SType = "Text";
        Length = "01";
        SType = "Indicator"; 
        FieldGroup = "Table15";
#M27044 CHANGES end HERE            
        Index = "1";        
    } 
    
    IN MIR-FD-DIS-DCLN-IND-T[10]
    {
        DisplayOnly;  
#M27044 CHANGES START HERE        
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#        Length = "5"; 
#        FieldGroup = "Table10";        
#        SType = "Text";
        Length = "01";
        SType = "Indicator"; 
        FieldGroup = "Table15";
#M27044 CHANGES end HERE        
        Index = "1";        
    }   
    
    IN MIR-CI-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-CI-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-CI-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly;
#M27044 CHANGES START HERE            
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        Length = "5";
#        FieldGroup = "Table10";        
#        SType = "Text";
        Length = "01";
        SType = "Indicator"; 
#M27044 CHANGES end HERE            
        Index = "1";        
    } 
    
    IN MIR-CI-DIS-DCLN-IND-T[10]
    {
        DisplayOnly;  
#M27044 CHANGES START HERE            
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#        Length = "5"; 
#        FieldGroup = "Table10";        
#        SType = "Text";
        Length = "01";
        SType = "Indicator"; 
#M27044 CHANGES end HERE            
        Index = "1";        
    }       
    
#M27044 CHANGES START HERE  

#CD200A changes start here

    IN MIR-3CI-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "03";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-3CI-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "01";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-3CI-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly;
        Length = "01";
        SType = "Indicator";             
        Index = "1";        
    } 
    
    IN MIR-3CI-DIS-DCLN-IND-T[10]
    {
        DisplayOnly;  
        Length = "01";
        SType = "Indicator";             
        Index = "1";        
    }

    INOUT MIR-POL-CRCY-CD
       {
           Length = "2";           
           SType = "Hidden";
           Label = "Currency";
       }
#CD200A changes end here

    IN MIR-IJ-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-IJ-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-IJ-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly;
        Length = "01";
        FieldGroup = "Table10"; 
        SType = "Indicator";          
        Index = "1";        
    } 
    
    IN MIR-IJ-DIS-DCLN-IND-T[10]
    {
        DisplayOnly;  
        Length = "01";
        FieldGroup = "Table10"; 
        SType = "Indicator";         
        Index = "1";        
    }       
    IN MIR-SPWL-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-SPWL-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-SPWL-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly;
        Length = "01";
        FieldGroup = "Table10"; 
        SType = "Indicator";          
        Index = "1";        
    } 
    
    IN MIR-SPWL-DIS-DCLN-IND-T[10]
    {
        DisplayOnly;  
        Length = "01";
        SType = "Indicator";         
        Index = "1";        
    }       
    
    IN MIR-LTC-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-LTC-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-LTC-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly;
        Length = "01";
        FieldGroup = "Table10"; 
        SType = "Indicator";          
        Index = "1";        
    } 
    
    IN MIR-LTC-DIS-DCLN-IND-T[10]
    {
        DisplayOnly;  
        Length = "01";
        FieldGroup = "Table10"; 
        SType = "Indicator";         
        Index = "1";        
    }       
    
    IN MIR-TVI-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-TVI-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-TVI-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly;
        Length = "01";
        SType = "Indicator";  
        FieldGroup = "Table10"; 
        Index = "1";        
    } 
    
    IN MIR-TVI-DIS-DCLN-IND-T[10]
    {
        DisplayOnly;  
        Length = "01";
        SType = "Indicator"; 
        FieldGroup = "Table10"; 
        Index = "1";        
    }       
       
    IN MIR-LD-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3";
        FieldGroup = "Table15";
        Index = "1";        
    }  

    IN MIR-LD-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1";
        FieldGroup = "Table15";        
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-LD-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly;
        Length = "01";
        SType = "Indicator";  
        FieldGroup = "Table15";           
        Index = "1";        
    } 
    
    IN MIR-LD-DIS-DCLN-IND-T[10]
    {
        DisplayOnly;  
        Length = "01";
        SType = "Indicator";   
        FieldGroup = "Table15";           
        Index = "1";        
    }         
    
    IN MIR-FR-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3";
        FieldGroup = "Table15";        
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-FR-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1";
        FieldGroup = "Table15";        
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-FR-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly;
        Length = "01";
        SType = "Indicator";    
        FieldGroup = "Table15";           
        Index = "1";        
    } 
    
    IN MIR-FR-DIS-DCLN-IND-T[10]
    {
        DisplayOnly;  
        Length = "01";
        SType = "Indicator";     
        FieldGroup = "Table15";           
        Index = "1";        
    }       
    
    IN MIR-CA-DIS-ME-FCT-T[10]
    {
        DisplayOnly;     
        Length = "3";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    }  

    IN MIR-CA-DIS-LIEN-DUR-T[10]
    {
        DisplayOnly;     
        Length = "1";
        FieldGroup = "Table10";        
        SType = "Text";
        Index = "1";        
    } 
    
    IN MIR-CA-DIS-MANL-UW-IND-T[10]
    {
        DisplayOnly;
        Length = "01";
        SType = "Indicator";          
        Index = "1";        
    } 
    
    IN MIR-CA-DIS-DCLN-IND-T[10]
    {
        DisplayOnly;  
        Length = "01";
        SType = "Indicator";         
        Index = "1";        
    }       
    
#M27044 CHANGES end HERE   

    IN MIR-DIS-EXCL-NM-T[50]
    {
        DisplayOnly;   
        Length = "200";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Name";
        Index = "1";        
    } 

    IN MIR-DIS-EXCL-DECID-TYP-CD-T[50]
    {
        DisplayOnly;      
        Length = "7";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Decision Type";
        Index = "1";        
    }     
    
#M27058 CHANGES START HERE   

    IN MIR-LIFE-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    IN MIR-LIFE-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }     

    IN MIR-AD-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    IN MIR-AD-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }     
    

    IN MIR-IJ-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    IN MIR-IJ-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }   

    IN MIR-SPWL-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    IN MIR-SPWL-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }     

    IN MIR-LTC-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    IN MIR-LTC-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }     

    IN MIR-TVI-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    IN MIR-TVI-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }         
    
#M27058 CHANGES END HERE        
        
#M27044 CHANGES START HERE
#        
#    IN MIR-LIFE-EXCL-PART-NUM-T[50]
#    {
#        DisplayOnly;      
#        Length = "4";
#        FieldGroup = "Table20";        
#        SType = "Text";
#        Label = "Disease Exclusion Part No";
#        Index = "1";        
#    }  
#    
#    IN MIR-LIFE-EXCL-TERM-DUR-T[50]
#    {
#        DisplayOnly;     
#        Length = "6";
#        FieldGroup = "Table20";        
#        SType = "Text";
#        Label = "Disease Exclusion Part Term";
#        Index = "1";        
#    }   
#M27044 CHANGES END HERE   
    
    IN MIR-MED-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    IN MIR-MED-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }     
    
    IN MIR-AMT-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";       
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    IN MIR-AMT-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }  
    
    IN MIR-MED2-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    IN MIR-MED2-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }   
#M27044 CHANGES START HERE       
#    IN MIR-AD-EXCL-PART-NUM-T[50]
#    {
#        DisplayOnly;     
#        Length = "4";
#        FieldGroup = "Table20";  
#        SType = "Text";
#        Label = "Disease Exclusion Part No";
#        Index = "1";        
#    }  
#    
#    IN MIR-AD-EXCL-TERM-DUR-T[50]
#    {
#        DisplayOnly;     
#        Length = "6";
#        FieldGroup = "Table20";  
#        SType = "Text";
#        Label = "Disease Exclusion Part Term";
#        Index = "1";        
#    } 
#M27044 CHANGES END HERE     
    
    IN MIR-DD-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    IN MIR-DD-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    } 
    IN MIR-FD-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    IN MIR-FD-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }        
    IN MIR-CI-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    IN MIR-CI-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }  
#M27044 CHANGES START HERE    
    
    IN MIR-LD-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }  
    
    IN MIR-LD-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    IN MIR-CA-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }  
    
    IN MIR-CA-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }    
    
    IN MIR-FR-EXCL-TERM-DUR-T[50]
    {
        DisplayOnly;     
        Length = "6";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }  
    
    IN MIR-FR-EXCL-PART-NUM-T[50]
    {
        DisplayOnly;     
        Length = "4";
        FieldGroup = "Table20";        
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }      
    
#M27044 CHANGES END HERE     

}

