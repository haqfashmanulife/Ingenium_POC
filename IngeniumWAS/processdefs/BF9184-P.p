# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9184-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02PR55  DPK      New Screen                                                *
#*  PR006I  BMB      Changes for ManuMed rider renewals                        *
#*  RP2009  CTS      Changes for Medical Repricing                             *
#*  RPL009  CTS      Changes for Limited Pay                                   *
#*  MP142B  CTS      CHANGES FOR CALCULATING FUTURE DATED                      *
#*                   POST RENEWAL VALUES.                                      *
#*  MP142D  CTS      CHANGES FOR WEBSERVICES                                   *
#*  M213L1  CTS      Changes for RUM                                           *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  018395  CTS      CHANGES DONE FOR TRAD RIDER RENEWAL                       *
#*  TDM21C  CTS      CHANGES DONE FOR AUTOMATIC RIDER RENEWAL                  *
#*  MOR161  CTS      CHANGES AS PART OF CR-28 ARM2 DAY2                        *
#*  S44274  CTS      CHANGES DONE FOR BASE RENEWAL INDICATOR                   *
#*******************************************************************************

P-STEP BF9184-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9184";
        BusinessFunctionName = "Rider Renewal Quote Details";
        BusinessFunctionType = "List";
        MirName = "CCWM9184";
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

    INOUT MIR-EFF-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
    }

# 018395 CHANGES START HERE
    OUT MIR-POL-MPREM-AMT
    {
        DisplayOnly;   
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Trad modal Amount";
    }
    OUT MIR-ADV-PMT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Advance Premium";
    }
# 018395 CHANGES END HERE

    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
    }
     
    #MP142D CHANGES START HERE
    OUT MIR-NUM-OF-ROWS
    {
        Length = "04";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of Rows";

    }

    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Effective Date";
    }    
    
    #MP142D CHANGES END HERE      
    
#*  PR006I  start position for more...      *
                                                
    INOUT MIR-SCR-SUB 
    {
        Length = "3";
        SType = "Numeric";
        Label = "CVG Start";
    }
     
    OUT MIR-CVG-NUM-T[109]
    {
        Length = "2";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }
     
    OUT MIR-INSRD-CLI-ID-T[109] 
    {
      Length = "10";
      FieldGroup = "Table109";
      Index = "1";
      SType = "Text";
      Label = "Insured Client Id";
    }

    OUT MIR-PLAN-ID-T[109]
    {
        Length = "6";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Rider Name";
        Index = "1";
    }
 
#*  PR006I  changes for ManuMed rider renewals    *
                                                
    OUT MIR-DV-CVG-PLAN-ID-T[109]
    {
        Length = "6";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "New Rider";
        Index = "1";
    }
 
#   OUT MIR-CVG-ISS-EFF-DT-T[109]
#   {
#       Length = "10";
#       FieldGroup = "Table109";
#       SType = "Date";
#       Label = "Rider Issue Date";
#       Index = "1";
#   }
 
    OUT MIR-CVG-STBL-1-CD-T[109]
    {
        Length = "40";
        FieldGroup = "Table109";
#* M241A3 changes START here* 
#       CodeSource = "EDIT";
#       CodeType = "STB1";
 	CodeSource = "CSOM9D29";        
	FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T"; 
        FilterField2 = "MIR-CVG-STBL-1-CD-T";
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Duration";
        Index = "1";
    }
     
    OUT MIR-DV-INSRD-CLI-NM-T[109]
    {
        Length = "75";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }
 
    OUT MIR-CVG-FACE-AMT-T[109]
    {
        Length = "15";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Current Face Amount";
        Index = "1";
    }
     
    OUT MIR-CVG-MPREM-AMT-T[109]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Current Modal Premium";
        Index = "1";
    }
     
    OUT MIR-DV-CVG-FACE-AMT-T[109]
    {
        Length = "15";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "New Face Amount";
        Index = "1";
    }

    OUT MIR-DV-CVG-MPREM-AMT-T[109]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "New Modal Premium";
        Index = "1";
    }
     
    OUT MIR-DV-CVG-RENEW-CD-T[109]
    {
        Length = "01";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Rider Renewal Code";
        Index = "1";
    }
#S44274 CHANGES STARTS HERE    
    OUT MIR-DV-BASE-RENW-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Base renewal indicator";
    }
#S44274 CHANGES ENDS HERE         
#*  PR006I  changes for ManuMed rider renewals    *
                                                
    OUT MIR-CVG-STBL-2-CD-T[109]
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
 
    OUT MIR-DV-CVG-STBL-1-CD-T[109]
    {
        Length = "40";
        FieldGroup = "Table109";
#* M241A3 changes START here*
        CodeSource = "CSOM9D29";        
	FilterFields = "2";
        FilterField1 = "MIR-DV-CVG-PLAN-ID-T";
        FilterField2 = "MIR-DV-CVG-STBL-1-CD-T";
#      CodeSource = "EDIT";
#      CodeType = "STB1";
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "New Duration";
        Index = "1";
    }
 
    OUT MIR-DV-CVG-STBL-2-CD-T[109]
    {
        Length = "40";
        FieldGroup = "Table109";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "New Benefit Limit";
        Index = "1";
    }
 
    OUT MIR-CVG-PREM-CHNG-DT-T[109]
    {
        Length = "10";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Next Renewal Date";
        Index = "1";
    }
 
    OUT MIR-DV-CHNG-STATUS-T[109]
    {
        Length = "06";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Stat";
        Index = "1";
    }
 
    # RP2009 changes start here
    
    OUT MIR-CVG-STBL-4-CD-T[109]
    {
        Length = "02";
        FieldGroup = "Table109";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub Table 4";
        Index = "1";
    }
    
    OUT MIR-DV-CVG-STBL-4-CD-T[109]
    {
        Length = "02";
        FieldGroup = "Table109";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Sub Table 4";
        Index = "1";
    }
    
    # RP2009 changes end here
    # RPL009 changes start here
        
    OUT MIR-CVG-STBL-3-CD-T[109]
    {
        Length = "05";
        FieldGroup = "Table109";
#* M241A3 changes START here*        
        CodeSource = "CSOM9D30";        
	FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T"; 
        FilterField2 = "MIR-CVG-STBL-3-CD-T";
#       CodeSource = "EDIT";
#       CodeType = "STB3";
#* M241A3 changes END here* 
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub Table 3";
        Index = "1";
    }
        
    OUT MIR-DV-CVG-STBL-3-CD-T[109]
    {
        Length = "05";
        FieldGroup = "Table109";
#* M241A3 changes START here*        
        CodeSource = "CSOM9D30";        
	FilterFields = "2";
        FilterField1 = "MIR-DV-CVG-PLAN-ID-T";
        FilterField2 = "MIR-DV-CVG-STBL-3-CD-T";
#       CodeSource = "EDIT";
#       CodeType = "STB3";
#* M241A3 changes END here* 
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Sub Table 3";
        Index = "1";
    }
        
    # RPL009 changes end here
    #MP142B CHANGES START HERE
    OUT MIR-FACE-AMT-CHNG-OK-T[109]
    {
        Length = "01";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Text";
        Label = "";
        Index = "1";
    }
    #MP142B CHANGES END HERE   
    
    #MP142D CHANGES START HERE
    OUT MIR-DV-RENW-CHNG-CD-T[109]
    {
        Length = "02";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Text";
        Label = "";
        Index = "1";
    }
    #MP142D CHANGES END HERE    
#M213L1 CHANGES STARTS HERE 
    OUT MIR-CVG-PRIM-GR-ID-T[109]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Group ID";
        Index = "1";
    }
#M213L1 CHANGES ENDS HERE  
#018395 CHANGES STARTS HERE 
    OUT MIR-DV-CVG-RENW-IND-T[109]
    {
        Length = "1";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Renewal indicator";
        Index = "1";
    }
#018395 CHANGES ENDS HERE 
#TDM21C CHANGES STARTS HERE
  OUT MIR-DV-AUTO-RENW-IND-T[109]
  {
        Length = "1";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Auto Renewal indicator";
        Index = "1";
  }
#TDM21C CHANGES  ENDS HERE
#MOR161 CHANGES STARTS HERE
  IN MIR-PRCES-REQT-TYP-CD
  {
        Length ="1";
        SType = "Indicator";
        Label = "Process request type code";
  }
  INOUT MIR-WSB-ERR-IND
  {
        Length ="1";
        SType = "Indicator";
        Label = "WSB Error indicator";
  }
#MOR161 CHANGES  ENDS HERE
}

