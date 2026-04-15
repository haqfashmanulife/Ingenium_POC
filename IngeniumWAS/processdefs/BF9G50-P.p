# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF9G50-P.p                                                    *
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
#*  018396  15MAY19  CTS    CHANGES FOR DECLINED RIDER -EPOS                   *  
#*  115953  13DEC19  CTS    CHANGES FOR POL UWGDECN FLD DSCRPTION IN AIS       *
#*  115953                  SCREEN & NUWRN EXTRACT                             *
#*  CD200A  13JAN25  CTS    CERBERUS NEW BUSINESS EPOS CHANGES                 *  
#*  NVCN04  09APR25  CTS    ONTARIO EPOS CHANGES                               *  
#*******************************************************************************

P-STEP BF9G50-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9G50";
        BusinessFunctionName = "AIS Underwriting Result Inquiry";
        BusinessFunctionType = "Inquiry";
        MirName = "NCWM9G50";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    INOUT MIR-POL-ID-BASE
    {  
        Key;
        Mandatory;    
        Length = "09";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    } 
    
    INOUT MIR-POL-ID-SFX
    {   
        Length = "01";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }    

    INOUT MIR-INSRD-STCKR-ID
    {   
        Length = "11";
        DBTableName = "TCLIU";
        SType = "Text";
        Label = "Insured Sticker Number";
    }     

    INOUT MIR-CLI-ID
    {   
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client ID";
    }

    OUT MIR-UW-TYP-CD
    {
        Length = "01";    
        CodeSource = "DataModel";
        CodeType = "UW-TYP-CD";
        DBTableName = "TCLIU";
        Label = "Selection Method";  
    }    
        
    OUT MIR-INSRD-KANA-NM
    {
        Length = "75";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Kana Name";
    }     
    
    OUT MIR-SELF-DSCLSRE-DT
    {
        Length = "10";
        DBTableName = "TAPPV";
        SType = "Date";
        Label = "SD form date";  
    }
    
#  Q92099 START HERE    
#   OUT MIR-POL-ID-BASE-T[20]    
    OUT MIR-POL-ID-BASE-T[30]    
#  Q92099 END   HERE      
    {
        Length = "9";
        FieldGroup = "Table05";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";        
    }     
 
#  Q92099 START HERE    
#   OUT MIR-CVG-NUM-T[20]    
    OUT MIR-CVG-NUM-T[30]    
#  Q92099 END   HERE 
    {
        Length = "2";
        FieldGroup = "Table05";
        DBTableName = "TCVG";
        SType = "Text";
        Index = "1";
        Label = "Coverage Number";
    } 
    
#  Q92099 START HERE    
#   OUT MIR-PLAN-ID-T[20]    
    OUT MIR-PLAN-ID-T[30]    
#  Q92099 END   HERE
    {
        Length = "40";
        FieldGroup = "Table05";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan Name";
        Index = "1";
    }    
    
#  Q92099 START HERE    
#   OUT MIR-CVG-FACE-AMT-T[20]    
    OUT MIR-CVG-FACE-AMT-T[30]    
#  Q92099 END   HERE 
    {    
        Signed;
        Length = "16";
        FieldGroup = "Table05";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    } 
    
#  Q92099 START HERE    
#   OUT MIR-CVG-STBL-1-CD-T[20]    
    OUT MIR-CVG-STBL-1-CD-T[30]    
#  Q92099 END   HERE
    {
        Length = "40";
        FieldGroup = "Table05";
        CodeSource = "EDIT";
        CodeType = "STB1";              
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 1";
        Index = "1"; 
    }
    
#  Q92099 START HERE    
#   OUT MIR-CVG-STBL-3-CD-T[20]    
    OUT MIR-CVG-STBL-3-CD-T[30]    
#  Q92099 END   HERE 
    {
        Length = "40";
        FieldGroup = "Table05";
        CodeSource = "EDIT";
        CodeType = "STB3";              
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 3";
        Index = "1"; 
    }    
#  NVCN04 START HERE       
    OUT MIR-CVG-WP-TYP-CD-T[30]     
    {
        Length = "40";
        FieldGroup = "Table05";
        CodeSource = "EDIT";
        CodeType = "WPIND";  
        DBTableName = "TCVG";        
        SType = "Text";
        Label = "WoP Type";
        Index = "1"; 
    } 	
#  NVCN04 END   HERE 
    
#  Q92099 START HERE    
#   OUT MIR-CVG-RT-AGE-T[20]    
    OUT MIR-CVG-RT-AGE-T[30]    
#  Q92099 END   HERE 
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table05";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Age";
        Index = "1";
    }
               
#  Q92099 START HERE    
#   OUT MIR-CVG-WP-IND-T[20]    
    OUT MIR-CVG-WP-IND-T[30]    
#  Q92099 END   HERE 
    {
        Length = "1";
        FieldGroup = "Table05";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "3DD";
        Index = "1"; 
    } 
    
    OUT MIR-AIS-UWGDECN-CD
    {
        Length = "05";
        DBTableName = "TUUWR";
        CodeSource = "DataModel";
        CodeType = "AIS-UWGDECN-CD";            
        SType = "Text";
        Label = "Underwriting Result"; 
        Index = "1";        
    }    

    OUT MIR-AIS-UW-DECN-TYP-CD
    {
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        DBTableName = "TCLI";
        SType = "Text";
#       Label = "Decision Type";
#018396 CHANGES START HERE        
        Label = "Client Decision Type";
#018396 CHANGES END HERE        
    }         
    
#018396 CHANGES START HERE

    OUT MIR-POL-UWGDECN-TYP-CD
    {
        Length = "20";
        CodeSource = "EDIT";
#       CodeType = "PLDEC";
#115953 CHANGES START HERE
        CodeType = "CLDEC";
#115953 CHANGES END HERE
        DBTableName = "TCLIU";
        SType = "Text";
        Label = "Policy Decision Type";  
    } 
    
#018396 CHANGES END HERE
        
    OUT MIR-DTH-ME-FCT
    {
        Length = "03";
        DBTableName = "TUCVR";
        SType = "Text";
        Label = "Death Premium Loading";
        Index = "1";        
    } 
    
    OUT MIR-MED-ME-FCT
    {
        Length = "03";
        DBTableName = "TUCVR";
        SType = "Text";
        Label = "Medical Premium Loading";
        Index = "1";        
    }    
    
    OUT MIR-CVG-LIEN-DUR
    {
        Length = "01";
        DBTableName = "TUCVR";
        SType = "Text";
        Label = "Lien";
        Index = "1";        
    }  
   
#M27028 CHANGES START HERE      
    OUT MIR-RSK-EXCL-IND
    {
        Length = "01";
        SType = "Indicator";
        Label = "Exclusions"; 
        Index = "1";
    }     
  
#    OUT MIR-EXCL-PART-NUM-T[20]
#    {
#        CodeSource = "EDIT";
#        CodeType = "TEXT"; 
#        Length = "05";
#        Length = "02";
#        FieldGroup = "Table21";               
#        DBTableName = "TUAMX";
#        SType = "Text";
#        Label = "Exclusion Part Number";
#        Index = "1";        
#    }  

#   OUT MIR-EXCL-TERM-DUR-T[20]
#   {
#       Length = "10";
#       FieldGroup = "Table21";               
#       DBTableName = "TUAMX";
#       SType = "Text";
#       Label = "Exclusion Part Duration";
#       Index = "1";        
#   }    
#M27028 CHANGES END HERE   
  
    OUT MIR-SPCL-DISAB-EXCL-IND
    {
#M27028 changes starts here
#        Length = "05";
#        CodeSource = "EDIT";
#        CodeType = "FLAG";         
#        DBTableName = "TUAMX";       
#        SType = "Text";
        DBTableName = "TUAMX"; 
        Length = "01";
        SType = "Indicator";  
#M27028 changes ends here        
        Label = "Special Disbility of Exclusion";
        Index = "1";        
    } 
    
    OUT MIR-SELCT-TYP-CD
    {
#M27029 changes start here    
#        Length = "05";
#        CodeSource = "EDIT";
#        CodeType = "UWTYP";                 
#        DBTableName = "TUUWR";
#        SType = "Text";
        Length ="01";
        SType = "Indicator";
#M27029 changes end here            
        Label = "Select Type";
        Index = "1";        
    }  
    
    OUT MIR-UW-AMT-IND
    {
#M27029 changes start here      
#        Length = "05";
#        CodeSource = "EDIT";
#        CodeType = "FLAG";         
#        DBTableName = "TUUWR";        
#        SType = "Text";
        Length ="01";
        SType = "Indicator";
#M27029 changes end here                
        Label = "UW Amount flag";
        Index = "1";        
    }
    
    OUT MIR-MR-OVR-FLAG
#M27029 changes start here      
    {
#        Length = "05";
#        CodeSource = "EDIT";
#        CodeType = "FLAG";         
#        DBTableName = "TUUWR";
#        SType = "Text";
        Length ="01";
        SType = "Indicator";
#M27029 changes end here                
        Label = "MR over 175 flag"; 
        Index = "1";
    }     

    OUT MIR-SCV-INFO-IND
    {
#M27029 changes start here      
#        Length = "05";
#        CodeSource = "EDIT";
#        CodeType = "FLAG";         
#        DBTableName = "TUUWR";
#        SType = "Text";
        Length ="01";
        SType = "Indicator";
#M27029 changes end here                
        Label = "SCV Information Flag"; 
        Index = "1";
    }    

    OUT MIR-NON-MED-INFO-IND
    {
#M27029 changes start here      
#        Length = "05";
#        CodeSource = "EDIT";
#        CodeType = "FLAG";         
#        DBTableName = "TUUWR";
#        SType = "Text";
        Length ="01";
        SType = "Indicator";
#M27029 changes end here                
        Label = "NM Information Flag";
        Index = "1";
    }  
    
#018396 CHANGES START HERE
    
    OUT MIR-AIS-DISPLAY-IND
    {
            Length = "01";
            SType = "Indicator";         
            Label = "Hide AIS Result";
    } 
    
    OUT MIR-CVG-DCLN-IND
    {
            Length = "01";
            SType = "Indicator";         
            Label = "Declined Rider Indicator"; 
            Index = "1";
    } 
    
    OUT MIR-CVG-DCLN-INFO-T[10]
    {
            Length = "40";
            FieldGroup = "Table26";
            CodeSource = "EDIT";
            CodeType = "PLAN";    
            DBTableName = "TUCVR";
            SType = "Text";
            Label = "Declined Riders";         
            Index = "1";       
    }     
    
#018396 CHANGES END HERE    
      
    OUT MIR-REASN-1-CD
    {
        Length = "03";          
        DBTableName = "TUUWR";
        SType = "Text";
        Label = "Code1";
        Index = "1";
    }
    
    OUT MIR-REASN-2-CD
    {
        Length = "03";     
        DBTableName = "TUUWR";
        SType = "Text";
        Label = "Code 2"; 
        Index = "1";        
    }  
    
    OUT MIR-DFCT-1-CD-T[08]
    {
        Length = "07";
        FieldGroup = "Table25";        
        DBTableName = "TUDIS";
        SType = "Text";
        Label = "Defect Code1"; 
        Index = "1";        
    } 
    
    OUT MIR-DFCT-2-CD-T[08]
    {
        Length = "06";
        FieldGroup = "Table25";        
        DBTableName = "TUDIS";
        SType = "Text";
        Label = "Defect Code2";
        Index = "1";        
    }  
    
    OUT MIR-ELAPS-YRS-DUR-T[08]
    {
        Length = "02";
        FieldGroup = "Table25";        
        DBTableName = "TUDIS";
        SType = "Text";
        Label = "Elapsed Year";
        Index = "1";        
    } 
    
    OUT MIR-SURGY-1-CD-T[08]
    {
        Length = "02";
        FieldGroup = "Table25";        
        DBTableName = "TUDIS";
        SType = "Text";
        Label = "Surgery1";
        Index = "1";        
    } 
    
    OUT MIR-SURGY-2-CD-T[08]
    {
        Length = "02";
        FieldGroup = "Table25";        
        DBTableName = "TUDIS";
        SType = "Text";
        Label = "Surgery2";
        Index = "1";        
    }

    OUT MIR-ADDL-INFO-TXT-T[08]
    {
        Length = "20";
        FieldGroup = "Table25";        
        DBTableName = "TUDIS";
        SType = "Text";
        Label = "Additional Information";
        Index = "1";        
    }    
     
    OUT MIR-DIS-NM-T[20]
    {
        Length = "200";
        FieldGroup = "Table10";        
        DBTableName = "TUDSD";
        SType = "Text";
        Label = "Disease Name";
        Index = "1";        
    }    
    
    OUT MIR-DIS-DECID-TYP-CD-T[20]
    {
        Length = "7";
        FieldGroup = "Table10";        
        DBTableName = "TUDSD";
        SType = "Text";
        Label = "Disease Decision Type";
        Index = "1";        
    }  
            
    OUT MIR-LIFE-DIS-ME-FCT-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";         
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-LIFE-DIS-LIEN-DUR-T[10]
    {
        Length = "1"; 
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-LIFE-DIS-MANL-UW-IND-T[10]
    {
#M27044 changes start here    
#        Length = "5";
#        FieldGroup = "Table10"; 
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        DBTableName = "TUDSR";
#        SType = "Text";  
        Length="01";
        SType = "Indicator";
#M27044 changes end here   
        FieldGroup = "Table10";  
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-LIFE-DIS-DCLN-IND-T[10]
    {
#M27044 changes start here        
#        Length = "5"; 
#        FieldGroup = "Table10";
#        CodeSource = "EDIT";
#        CodeType = "DDI";        
#        DBTableName = "TUDSR";
#        SType = "Text";
        Length="01";
        SType = "Indicator";
#M27044 changes end here      
        FieldGroup = "Table10";
        Label = "DDI";
        Index = "1";        
    }    
   
    OUT MIR-MED-DIS-ME-FCT-T[10]
    {
        Length = "3"; 
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here             
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-MED-DIS-LIEN-DUR-T[10]
    {
        Length = "1";
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here                
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-MED-DIS-MANL-UW-IND-T[10]
    {
#M27044 changes start here        
#        Length = "5"; 
#        FieldGroup = "Table10"; 
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        DBTableName = "TUDSR";
#        SType = "Text"; 
        Length="01";
        SType = "Indicator";     
        FieldGroup = "Table15";
#M27044 changes end here         
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-MED-DIS-DCLN-IND-T[10]
    {
#M27044 changes start here        
#        Length = "5"; 
#        FieldGroup = "Table10";  
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#        DBTableName = "TUDSR";
#        SType = "Text"; 
        Length="01";
        SType = "Indicator";
        FieldGroup = "Table15";
#M27044 changes end here 
        Label = "DDI";
        Index = "1";        
    } 
    
    OUT MIR-AMT-DIS-ME-FCT-T[10]
    {
        Length = "3"; 
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here                  
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-AMT-DIS-LIEN-DUR-T[10]
    {
        Length = "1";
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here                  
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-AMT-DIS-MANL-UW-IND-T[10]
    {
#M27044 changes start here     
#        Length = "5"; 
#        FieldGroup = "Table10";
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        DBTableName = "TUDSR";
#        SType = "Text";    
        Length="01";
        SType = "Indicator";
        FieldGroup = "Table15";        
#M27044 changes end here         
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-AMT-DIS-DCLN-IND-T[10]
    {
#M27044 changes start here     
#        Length = "5"; 
#        FieldGroup = "Table10"; 
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#        DBTableName = "TUDSR";
#        SType = "Text"; 
        Length="01";
        SType = "Indicator";
        FieldGroup = "Table15";        
#M27044 changes end here         
        Label = "DDI";
        Index = "1";        
    }  
    
    OUT MIR-MED2-DIS-ME-FCT-T[10]
    {
        Length = "3";
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here                  
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-MED2-DIS-LIEN-DUR-T[10]
    {
        Length = "1";
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here                 
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-MED2-DIS-MANL-UW-IND-T[10]
    {
#M27044 changes start here     
#        Length = "5";
#        FieldGroup = "Table10"; 
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        DBTableName = "TUDSR";
#        SType = "Text";
        Length="01";
        SType = "Indicator";
        FieldGroup = "Table15";        
#M27044 changes end here    
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-MED2-DIS-DCLN-IND-T[10]
    {
#M27044 changes start here     
#        Length = "5";
#        FieldGroup = "Table10";  
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#        DBTableName = "TUDSR";
#        SType = "Text"; 
        Length="01";
        SType = "Indicator";
        FieldGroup = "Table15";        
#M27044 changes end here    
        Label = "DDI";
        Index = "1";        
    } 
    
    OUT MIR-AD-DIS-ME-FCT-T[10]
    {
        Length = "3"; 
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-AD-DIS-LIEN-DUR-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-AD-DIS-MANL-UW-IND-T[10]
    {
#M27044 changes start here   
#        Length = "5";
#        FieldGroup = "Table10";
#        CodeSource = "EDIT";
#        CodeType = "DMU";    
#        DBTableName = "TUDSR";
#        SType = "Text";
       	Length = "01";
       	SType = "Indicator";
       	FieldGroup = "Table10"; 
#M27044 changes END here          	
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-AD-DIS-DCLN-IND-T[10]
    {
#M27044 changes start here 
#        Length = "5";
#        FieldGroup = "Table10"; 
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#        DBTableName = "TUDSR";
#        SType = "Text";
       	Length = "01";
       	SType = "Indicator";
#M27044 changes end here  
        FieldGroup = "Table10";
        Label = "DDI";
        Index = "1";        
    }   
    
    OUT MIR-DD-DIS-ME-FCT-T[10]
    {
        Length = "3";
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table30";
#M27044 changes end here        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-DD-DIS-LIEN-DUR-T[10]
    {
        Length = "1";
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table30";
#M27044 changes end here         
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-DD-DIS-MANL-UW-IND-T[10]
    {
#M27044 changes start here     
#        Length = "5";
#        FieldGroup = "Table10";
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        DBTableName = "TUDSR";
#        SType = "Text";
        Length="01";
        SType = "Indicator";
        FieldGroup = "Table30";        
#M27044 changes end here        
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-DD-DIS-DCLN-IND-T[10]
    {
#M27044 changes start here     
#        Length = "5"; 
#        FieldGroup = "Table10";  
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#        DBTableName = "TUDSR";
#        SType = "Text";
        Length="01";
        SType = "Indicator";
        FieldGroup = "Table30";        
#M27044 changes end here        
        Label = "DDI";
        Index = "1";        
    }   
    
    OUT MIR-FD-DIS-ME-FCT-T[10]
    {
        Length = "3";
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here     
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-FD-DIS-LIEN-DUR-T[10]
    {
        Length = "1";
#M27044 changes start here         
#        FieldGroup = "Table10";     
        FieldGroup = "Table15";
#M27044 changes end here     
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-FD-DIS-MANL-UW-IND-T[10]
    {
#M27044 changes start here     
#        Length = "5";
#        FieldGroup = "Table10";
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        DBTableName = "TUDSR";
#        SType = "Text";   
        Length="01";
        SType = "Indicator";
#M27044 changes end here        
        FieldGroup = "Table15";
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-FD-DIS-DCLN-IND-T[10]
    {
#M27044 changes start here     
#        Length = "5"; 
#        FieldGroup = "Table10";  
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#        DBTableName = "TUDSR";
#        SType = "Text";
        Length="01";
        SType = "Indicator";
#M27044 changes end here        
        FieldGroup = "Table15";
        Label = "DDI";
        Index = "1";        
    }   
    
    OUT MIR-CI-DIS-ME-FCT-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-CI-DIS-LIEN-DUR-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-CI-DIS-MANL-UW-IND-T[10]
    {
#M27044 changes start here 
#        Length = "5";
#        FieldGroup = "Table10";
#        CodeSource = "EDIT";
#        CodeType = "DMU";          
#        DBTableName = "TUDSR";
#        SType = "Text";    
        Length="01";
        SType = "Indicator";
#M27044 changes end here       
        FieldGroup = "Table10";
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-CI-DIS-DCLN-IND-T[10]
    {
#M27044 changes start here     
#        Length = "5"; 
#        FieldGroup = "Table10";  
#        CodeSource = "EDIT";
#        CodeType = "DDI";          
#        DBTableName = "TUDSR";
#        SType = "Text";  
        Length="01";
        SType = "Indicator";
#M27044 changes end here        
        FieldGroup = "Table10";
        Label = "DDI";
        Index = "1";        
    }    

#CD200A changes start here

    OUT MIR-3CI-DIS-ME-FCT-T[10]
    {
        Length = "03";
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-3CI-DIS-LIEN-DUR-T[10]
    {
        Length = "01";
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-3CI-DIS-MANL-UW-IND-T[10]
    {    
        Length="01";
        SType = "Indicator";      
        FieldGroup = "Table10";
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-3CI-DIS-DCLN-IND-T[10]
    {  
        Length="01";
        SType = "Indicator";       
        FieldGroup = "Table10";
        Label = "DDI";
        Index = "1";        
    }


    INOUT MIR-POL-CRCY-CD
       {
          Length = "2";           
          SType = "Hidden";
          Label = "Currency";
       }
#CD200A changes end here
        
#M27044 changes start here  

    OUT MIR-IJ-DIS-ME-FCT-T[10]
    {
        Length = "03";
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-IJ-DIS-LIEN-DUR-T[10]
    {
        Length = "01";
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-IJ-DIS-MANL-UW-IND-T[10]
    {
        Length="01";
        FieldGroup = "Table10";          
        DBTableName = "TUDSR";
        SType = "Indicator";
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-IJ-DIS-DCLN-IND-T[10]
    {
        Length="01";
        FieldGroup = "Table10";          
        SType = "Indicator";
        Label = "DDI";
        Index = "1";        
    }   
    OUT MIR-SPWL-DIS-ME-FCT-T[10]
    {
        Length = "03";
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-SPWL-DIS-LIEN-DUR-T[10]
    {
        Length = "01";
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-SPWL-DIS-MANL-UW-IND-T[10]
    {
        Length="01";
        FieldGroup = "Table10";          
        SType = "Indicator";
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-SPWL-DIS-DCLN-IND-T[10]
    {
        Length="01";
        FieldGroup = "Table10";          
        SType = "Indicator";
        Label = "DDI";
        Index = "1";        
    }   
    OUT MIR-LTC-DIS-ME-FCT-T[10]
    {
        Length = "03";
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-LTC-DIS-LIEN-DUR-T[10]
    {
        Length = "01";
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-LTC-DIS-MANL-UW-IND-T[10]
    {
        Length="01";
        FieldGroup = "Table10";          
        SType = "Indicator";
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-LTC-DIS-DCLN-IND-T[10]
    {
        Length="01";
        FieldGroup = "Table10";          
        SType = "Indicator";
        Label = "DDI";
        Index = "1";        
    }   
    
    OUT MIR-TVI-DIS-ME-FCT-T[10]
    {
        Length = "03";
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-TVI-DIS-LIEN-DUR-T[10]
    {
        Length = "01";
        FieldGroup = "Table10";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-TVI-DIS-MANL-UW-IND-T[10]
    {
        Length="01";
        FieldGroup = "Table10";          
        SType = "Indicator";
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-TVI-DIS-DCLN-IND-T[10]
    {
        Length="01";
        FieldGroup = "Table10";          
        SType = "Indicator";
        Label = "DDI";
        Index = "1";        
    }   
    
    OUT MIR-LD-DIS-ME-FCT-T[10]
    {
        Length = "03";
        FieldGroup = "Table15";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-LD-DIS-LIEN-DUR-T[10]
    {
        Length = "01";
        FieldGroup = "Table15";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-LD-DIS-MANL-UW-IND-T[10]
    {
        Length="01";
        FieldGroup = "Table15";          
        SType = "Indicator";
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-LD-DIS-DCLN-IND-T[10]
    {
        Length="01";
        FieldGroup = "Table15";          
        SType = "Indicator";
        Label = "DDI";
        Index = "1";        
    }   
    
    OUT MIR-FR-DIS-ME-FCT-T[10]
    {
        Length = "03";
        FieldGroup = "Table15";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-FR-DIS-LIEN-DUR-T[10]
    {
        Length = "01";
        FieldGroup = "Table15";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-FR-DIS-MANL-UW-IND-T[10]
    {
        Length="01";
        FieldGroup = "Table15";         
        SType = "Indicator";
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-FR-DIS-DCLN-IND-T[10]
    {
        Length="01";
        FieldGroup = "Table15";          
        SType = "Indicator";
        Label = "DDI";
        Index = "1";        
    }   
    
    OUT MIR-CA-DIS-ME-FCT-T[10]
    {
        Length = "03";
        FieldGroup = "Table30";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DPL";
        Index = "1";        
    }  

    OUT MIR-CA-DIS-LIEN-DUR-T[10]
    {
        Length = "01";
        FieldGroup = "Table30";        
        DBTableName = "TUDSR";
        SType = "Text";
        Label = "DL";
        Index = "1";        
    } 
    
    OUT MIR-CA-DIS-MANL-UW-IND-T[10]
    {
        Length="01";
        FieldGroup = "Table30";          
        SType = "Indicator";
        Label = "DMU";
        Index = "1";        
    } 
    
    OUT MIR-CA-DIS-DCLN-IND-T[10]
    {
        Length="01";
        FieldGroup = "Table30";          
        SType = "Indicator";
        Label = "DDI";
        Index = "1";        
    }   
       
#M27044 changes end here  
        
    OUT MIR-DIS-EXCL-NM-T[50]
    {
        Length = "200";
        FieldGroup = "Table20";        
        DBTableName = "TUDSD";
        SType = "Text";
        Label = "Disease Name";
        Index = "1";        
    } 

    OUT MIR-DIS-EXCL-DECID-TYP-CD-T[50]
    {
        Length = "7";
        FieldGroup = "Table20";        
        DBTableName = "TUDSD";
        SType = "Text";
        Label = "Disease Decision Type";
        Index = "1";        
    } 
        
#M27044 CHANGES START HERE           
#    OUT MIR-LIFE-EXCL-PART-NUM-T[50]
#    {
#        Length = "4";
#        FieldGroup = "Table20";        
#        DBTableName = "TUDAM";
#        SType = "Text";
#        Label = "Disease Exclusion Part No";
#        Index = "1";        
#    }      
#    
#    OUT MIR-LIFE-EXCL-TERM-DUR-T[50]
#    {
#        Length = "6";
#        FieldGroup = "Table20";        
#        DBTableName = "TUDAM";
#        SType = "Text";
#        Label = "Disease Exclusion Part Term";
#        Index = "1";        
#    }   
#M27044 CHANGES END HERE   

#M27058 CHANGES START HERE       
    OUT MIR-LIFE-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-LIFE-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }     
    
    OUT MIR-AD-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-AD-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }     
    
    OUT MIR-IJ-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-IJ-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }     
    
    OUT MIR-SPWL-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-SPWL-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }     
    
    OUT MIR-LTC-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-LTC-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }     
    
    OUT MIR-TVI-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-TVI-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }     

#M27058 CHANGES END HERE       

    OUT MIR-MED-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-MED-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }     
    
    OUT MIR-AMT-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-AMT-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }  
    
    OUT MIR-MED2-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-MED2-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }   
    
#M27044 CHANGES START HERE     
#    OUT MIR-AD-EXCL-PART-NUM-T[50]
#    {
#        Length = "4";
#        FieldGroup = "Table20";  
#        DBTableName = "TUDAM";
#        SType = "Text";
#        Label = "Disease Exclusion Part No";
#        Index = "1";        
#    }  
#    
#    OUT MIR-AD-EXCL-TERM-DUR-T[50]
#    {
#        Length = "6";
#        FieldGroup = "Table20";  
#        DBTableName = "TUDAM";
#        SType = "Text";
#        Label = "Disease Exclusion Part Term";
#        Index = "1";        
#    } 
#M27044 CHANGES START HERE 

    OUT MIR-LD-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-LD-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }
    
    OUT MIR-DD-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-DD-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }
    OUT MIR-FD-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-FD-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }
    OUT MIR-CI-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-CI-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }          
    OUT MIR-CA-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-CA-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }      
    
    OUT MIR-FR-EXCL-PART-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part No";
        Index = "1";        
    }  
    
    OUT MIR-FR-EXCL-TERM-DUR-T[50]
    {
        Length = "6";
        FieldGroup = "Table20";        
        DBTableName = "TUDAM";
        SType = "Text";
        Label = "Disease Exclusion Part Term";
        Index = "1";        
    }          
    
#M27044 CHANGES END HERE    
}


