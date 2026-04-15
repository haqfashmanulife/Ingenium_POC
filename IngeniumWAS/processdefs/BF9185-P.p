# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9185-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02PR55  DPK      New Screen                                                *
#*  PR006I  BMB      Changes for ManuMed rider renewals                        *
#*  RP2009  CTS      Changes for Medical Repricing Renewals                    * 
#*  RPL009  CTS      Changes for Limited pay                                   * 
#*  MP142B  CTS      Renewal Quote screen changes                              *
#*  MP142D  CTS      Changes for webservices                                   *
#*  M213L1  CTS      Changes for RUM                                           *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  C23814  CTS      COMMENTED M241A3 CODE CHANGES FOR PERFORMANCE ISSUE       *
#*  018395  CTS     CHANGES DONE FOR TRAD RIDER RENEWAL                        * 
#*  UY3001  CTS      STREAM 3 CHANGES                                          * 
#*******************************************************************************

P-STEP BF9185-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9185";
        BusinessFunctionName = "Rider Renewal Quote Details";
        BusinessFunctionType = "Update";
        MirName = "CCWM9185";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

#MP142D changes start here
    IN MIR-NUM-OF-ROWS
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of Rows";
    }
#MP142D changes end here    

    INOUT MIR-EFF-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    INOUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
    }

# 018395 CHANGES START HERE

   INOUT MIR-POL-MPREM-AMT
    {
        DisplayOnly;   
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Trad modal Amount";
    }
   INOUT MIR-ADV-PMT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Advance Premium";
    }
# 018395 CHANGES END HERE

    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
    }

#MP142D changes start here
    INOUT MIR-DV-FND-BAL-AMT
    {
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Fund Balance";
    }
#MP142D changes end here

#*  PR006I  start position for more...      *
                                                
    INOUT MIR-SCR-SUB 
    {
        Length = "3";
        SType = "Numeric";
        Label = "CVG Start";
    }
     
    INOUT MIR-CVG-NUM-T[109]
    {
        Length = "2";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }
     
    INOUT MIR-INSRD-CLI-ID-T[109] 
    {
        Length = "10";
        FieldGroup = "Table109";
        DBTableName = "TCVGC";
        Index = "1";
        SType = "Text";
        Label = "Insured Client Id";
    }

    INOUT MIR-PLAN-ID-T[109]
    {
        Length = "40";
        FieldGroup = "Table109";
#        CodeSource = "EDIT";
#        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Rider Name";
        Index = "1";
    }
 
    INOUT MIR-DV-CVG-PLAN-ID-T[109]
    {
        Length = "40";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
#        CodeSource = "EDIT";
#        CodeType = "PLAN";
#        CodeSource = "CSOM9188";
#        FilterFields = "2";
#        FilterField1 = "MIR-PLAN-ID-T";
#        FilterField2 = "MIR-CVG-PREM-CHNG-DT-T";
        SType = "Selection";
        Label = "New Rider";
        Index = "1";
    }

#   INOUT MIR-CVG-ISS-EFF-DT-T[109]
#   {
#       Length = "10";
#       FieldGroup = "Table109";
#       SType = "Date";
#       Label = "Rider Issue Date";
#       Index = "1";
#   }
 
 
    INOUT MIR-CVG-STBL-1-CD-T[109]
    {
        Length = "40";
        FieldGroup = "Table109";
#*C23814 changes START here*
#* M241A3 changes START here*         
#        CodeSource = "CSOM9D29";        
#	FilterFields = "2";
#        FilterField1 = "MIR-PLAN-ID-T"; 
#        FilterField2 = "MIR-CVG-STBL-1-CD-T"; 
#       CodeSource = "EDIT";
#       CodeType = "STB1";
#* M241A3 changes END here*        
    CodeSource = "EDIT";
    CodeType = "STB1";
#*C23814 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Duration";
        Index = "1";
    }
     
    INOUT MIR-DV-INSRD-CLI-NM-T[109]
    {
        Length = "75";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }
 
    INOUT MIR-CVG-FACE-AMT-T[109]
    {
        Length = "15";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Current Face Amount";
        Index = "1";
    }
     
    INOUT MIR-CVG-MPREM-AMT-T[109]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Current Modal Premium";
        Index = "1";
    }
     
    INOUT MIR-DV-CVG-FACE-AMT-T[109]
    {
        Length = "15";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "New Face Amount";
        Index = "1";
    }
#MP142B changes start here
    INOUT MIR-DV-ORIG-CVG-FACE-AMT-T[109]
    {
        Length = "15";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "";
        Index = "1";
    }
#MP142B changes end here
    INOUT MIR-DV-CVG-MPREM-AMT-T[109]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "New Modal Premium";
        Index = "1";
    }
     
    INOUT MIR-DV-CVG-RENEW-CD-T[109]
    {
        Length = "01";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Rider Renewal Code";
        Index = "1";
    }
#UY3001 CHANGES STARTS
    INOUT MIR-DV-BASE-RENW-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Base renewal indicator";
    }
#UY3001 CHANGES ENDS
#** MP142D CHANGES START HERE
    INOUT MIR-DV-RENW-CHNG-CD-T[109]
    {
        Length = "02";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Coverage Renewal Change Code";
        Index = "1";
    }
#** MP142D CHANGES END HERE

#*  PR006I  changes for ManuMed rider renewals    *
                                                
    INOUT MIR-CVG-STBL-2-CD-T[109]
    {
        Length = "40";
        FieldGroup = "Table109";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Benefit Limit";
        Index = "1";
    }
 
    INOUT MIR-DV-CVG-STBL-1-CD-T[109]
    {
        Length = "40";
        FieldGroup = "Table109";
#*C23814 changes START here*
#* M241A3 changes START here*          
#        CodeSource = "CSOM9D27";        
#	FilterFields = "1";
#        FilterField1 = "MIR-DV-CVG-PLAN-ID-T"; 
#       CodeSource = "EDIT";
#       CodeType = "STB1";
#* M241A3 changes END here*         
    CodeSource = "EDIT";
    CodeType = "STB1";
#*C23814 changes END here*
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "New Duration";
        Index = "1";
    }
 
    INOUT MIR-DV-CVG-STBL-2-CD-T[109]
    {
        Length = "40";
        FieldGroup = "Table109";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "New Benefit Limit";
        Index = "1";
    }
 
    INOUT MIR-CVG-PREM-CHNG-DT-T[109]
    {
        Length = "10";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Next Renewal Date";
        Index = "1";
    }
 
    INOUT MIR-DV-CHNG-STATUS-T[109]
    {
        Length = "06";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Stat";
        Index = "1";
    }
 
    OUT MIR-DISP-CVG-NUM-T[60]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table60";
        Index = "1";
        SType = "Text";
        Label = "Coverage Number";
    }

    OUT MIR-DISP-PLAN-ID-T[60]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table60";
        Index = "1";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Rider Name";
    }

    OUT MIR-DISP-CVG-STBL-1-CD-T[60]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table60";
        Index = "1";
#*C23814 changes START here*
#* M241A3 changes START here*         
#        CodeSource = "CSOM9D29";        
#	FilterFields = "2";
#        FilterField1 = "MIR-DISP-PLAN-ID-T"; 
#        FilterField2 = "MIR-DISP-CVG-STBL-1-CD-T";
#       CodeSource = "EDIT";
#       CodeType = "STB1";
#* M241A3 changes END here*         
    CodeSource = "EDIT";
    CodeType = "STB1";
#*C23814 changes END here*
        SType = "Text";
        Label = "Duration";
    }

    OUT MIR-DISP-DV-INSRD-CLI-NM-T[60]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table60";
        Index = "1";
        SType = "Text";
        Label = "Insured's Name";
    }

    OUT MIR-DISP-CVG-FACE-AMT-T[60]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table60";
        Index = "1";
        SType = "Currency";
        Label = "Face Amount";
    }

    OUT MIR-DISP-CVG-MPREM-AMT-T[60]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table60";
        Index = "1";
        SType = "Currency";
        Label = "Modal Premium";
    }

    OUT MIR-DISP-DV-CVG-RENEW-CD-T[60]
    {
        DisplayOnly;
        Length = "01";
        FieldGroup = "Table60";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Rider Renewal Code";
        Index = "1";
    }

    OUT MIR-DISP-CVG-STBL-2-CD-T[60]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table60";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Benefit Limit";
        Index = "1";
    }

  #** RP2009 CHANGES START HERE
 
    IN MIR-CVG-STBL-4-CD-T [109]
    {
        DisplayOnly;
        Length = "02";
        FieldGroup = "Table109";
        Index = "1";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub table 4";
    }

    INOUT MIR-DV-CVG-STBL-4-CD-T[109]
    {
        Length = "02";
        FieldGroup = "Table109";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "New Sub Table 4";
        Index = "1";
    } 
    OUT MIR-DISP-CVG-STBL-4-CD-T[60]
       {
           DisplayOnly;
           Length = "02";
           FieldGroup = "Table60";
           CodeSource = "EDIT";
           CodeType = "STB4";
           DBTableName = "TCVG";
           SType = "Text";
           Label = "Sub Table 4 ";
           Index = "1";
       }
  #** RP2009 CHANGES END HERE

     INOUT MIR-IGNORE-ERROR-IND-T[109]
    {
        Length = "1";
        FieldGroup = "Table109";
        SType = "Indicator";
        Label = "Ignore Error";
        Index = "1";
    }

   
  #** RPL009 CHANGES START HERE 

     IN MIR-CVG-STBL-3-CD-T [109]
        {
            DisplayOnly;
            Length = "05";
            FieldGroup = "Table109";
            Index = "1";
#*C23814 changes START here*
#* M241A3 changes START here*         
#            CodeSource = "CSOM9D30";        
#	     FilterFields = "2";
#             FilterField1 = "MIR-PLAN-ID-T"; 
#             FilterField2 = "MIR-CVG-STBL-3-CD-T";
#          CodeSource = "EDIT";
#          CodeType = "STB3";
#* M241A3 changes END here*     
            CodeSource = "EDIT";
            CodeType = "STB3";
#*C23814 changes END here*
            DBTableName = "TCVG";
            SType = "Text";
            Label = "Sub table 3";
        }
    
        INOUT MIR-DV-CVG-STBL-3-CD-T[109]
        {
            Length = "05";
            FieldGroup = "Table109";
#*C23814 changes START here*
#* M241A3 changes START here*         
#            CodeSource = "CSOM9D28";        
#	     FilterFields = "1";
#            FilterField1 = "MIR-DV-CVG-PLAN-ID-T"; 
#         CodeSource = "EDIT";
#         CodeType = "STB3";
#* M241A3 changes END here*     
            CodeSource = "EDIT";
            CodeType = "STB3";
#*C23814 changes END here*
            DBTableName = "TCVG";
            SType = "Selection";
            Label = "New Sub Table 3";
            Index = "1";
       }
       
        OUT MIR-DISP-CVG-STBL-3-CD-T[60]
      {
        DisplayOnly;
        Length = "05";
        FieldGroup = "Table60";
#*C23814 changes START here*
#* M241A3 changes START here*         
#        CodeSource = "CSOM9D30";        
#        FilterFields = "2";
#        FilterField1 = "MIR-DISP-PLAN-ID-T"; 
#        FilterField2 = "MIR-DISP-CVG-STBL-3-CD-T"; 
#     CodeSource = "EDIT";
#     CodeType = "STB3";
#* M241A3 changes END here*     
        CodeSource = "EDIT";
        CodeType = "STB3";
#*C23814 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub Table 3 ";
        Index = "1";
      }
  #** RPL009 CHANGES END HERE 
     
    OUT MIR-DISP-CVG-PREM-CHNG-DT-T[60]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table60";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Next Renewal Date";
        Index = "1";
    }

    OUT MIR-DISP-DV-CHNG-STATUS-T[60]
    {
        DisplayOnly;
        Length = "06";
        FieldGroup = "Table60";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Stat";
        Index = "1";
    }
    
 #** MP142D CHANGES START HERE
 
    OUT MIR-DISP-RENW-CHNG-CD-T[60]
    {
        DisplayOnly;
        Length = "02";
        FieldGroup = "Table60";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Renewal Change Code";
        Index = "1";
    } 
    
    OUT MIR-DISP-CVG-CHNG-IND-T[60]
    {
        DisplayOnly;
        Length = "01";
        FieldGroup = "Table60";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Coverage ID Change Indicator";
        Index = "1";
    }   
    
#** MP142D CHANGES END HERE    
#* M213L1 CHANGES STARTS HERE 

    INOUT MIR-CVG-PRIM-GR-ID-T[109]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Group ID";
        Index = "1";
    }
   
   INOUT MIR-DISP-PRIM-GR-ID-T[60]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table60";
        Index = "1";
        SType = "Text";
        Label = "Group ID";
    }   
 
#* M213L1 CHANGES ENDS HERE  
}

