# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT

#*******************************************************************************
#*  Component:   BF9185-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02PR55  DPK      New Screen                                                *
#*  PR006I  BMB      Changes for ManuMed rider renewals                        *
#*  PF20    PF 2.0   DisplayOnly flds with DefaultSession must be IN not INOUT *
#*                   all array fields changed to IN from INOUT                 *
#*  RP2009  CTS      Changes for medical repricing                             *  
#*  RPL009  CTS      Changes for Limited Pay                                   *          
#*  M213L1  CTS      Changes for RUM                                           *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  C23814  CTS      COMMENTED M241A3 CODE CHANGES FOR PERFORMANCE ISSUE       *
#*  018395  CTS      CHANGES DONE FOR TRAD RIDER RENEWAL                       *
#*  UY3001  CTS      STREAM 3 CHANGES                                          * 
#*******************************************************************************
S-STEP BF9185-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "List";
    Type = "Output";
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
    SType="Hidden";
  }
  
  OUT index
  {
    SType = "Hidden";
  }

#*  PF20    PF 2.0   DisplayOnly flds with DefaultSession must be IN not INOUT *
# INOUT MIR-POL-ID-BASE 
  IN MIR-POL-ID-BASE 
  {
    Key;
    DisplayOnly;
    Length = "9";
    DefaultSession = "MIR-POL-ID-BASE";
    SType = "Text";
    Label = "Policy Id";
  }

#*  PF20    PF 2.0   DisplayOnly flds with DefaultSession must be IN not INOUT *
# INOUT MIR-POL-ID-SFX 
  IN MIR-POL-ID-SFX 
  {
    Key;
    DisplayOnly;
    Length = "1";
    DefaultSession = "MIR-POL-ID-SFX";
    SType = "Text";
    Label = "Suffix";
  }

#*  PF20    PF 2.0   DisplayOnly flds must be IN not INOUT (DisplayOnly removed)
  IN MIR-EFF-DT 
  {
    Key;
    Length = "10";
    SType = "Date";
    Label = "Effective Date";
  }

  IN MIR-DV-OWN-CLI-NM 
  {
    Length = "75";
    SType = "Text";
    Label = "Owner Name";
  }

  IN MIR-POL-SNDRY-AMT 
  {
    Signed;
    Length = "15";
    SType = "Currency";
    Label = "Sundry Amount";
  }

# 018395 CHANGES START HERE
  IN MIR-POL-MPREM-AMT
  {
    Signed;
    Length = "15";
    DBTableName = "TPOL";
    SType = "Currency";
    Label = "Trad modal Amount";
  }
  IN MIR-ADV-PMT-AMT
  {
    Signed;
    Length = "15";
    SType = "Currency";
    Label = "Advance Premium";
  }
# 018395 CHANGES END HERE
  IN MIR-POL-BILL-MODE-CD 
  {
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "POL-BILL-MODE-CD";
    SType = "Text";
    Label = "Premium Mode";
  }

#*  PR006I  start position for more...      *
  IN MIR-SCR-SUB
  {
    Length = "3";
    SType = "Numeric";
    Label = "CVG Start";
  }

  IN MIR-CVG-NUM-T[109]
  {
    Length = "2";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Text";
    Label = "Coverage Number";
  }
   
  IN MIR-INSRD-CLI-ID-T[109]
  {
    Length = "10";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Text";
    Label = "Insured Client Id";
  }

  IN MIR-PLAN-ID-T[109]
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Rider Name";
  }

  IN MIR-DV-CVG-PLAN-ID-T[109]
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
#    CodeSource = "EDIT";
#    CodeType = "PLAN";
    SType = "Text";
    Label = "Renewal Rider";
  }

  IN MIR-CVG-STBL-1-CD-T[109]
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
#*C23814 changes START here*
#* M241A3 changes START here*  
#    CodeSource = "CSOM9D29";        
#    FilterFields = "2";
#    FilterField1 = "MIR-PLAN-ID-T"; 
#    FilterField2 = "MIR-CVG-STBL-1-CD-T";
#    CodeSource = "EDIT";
#    CodeType = "STB1";
#* M241A3 changes END here*  
    CodeSource = "EDIT";
    CodeType = "STB1";
#*C23814 changes END here*
    SType = "Text";
    Label = "Duration";
  }

  IN MIR-DV-INSRD-CLI-NM-T[109]
  {
    Length = "75";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Text";
    Label = "Insured's Name";
  }

  IN MIR-CVG-FACE-AMT-T[109]
  {
    Length = "15";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Currency";
    Label = "Face Amount";
  }

  IN MIR-CVG-MPREM-AMT-T[109]
  {
    Signed;
    Length = "15";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "Modal Premium";
  }

  IN MIR-DV-CVG-FACE-AMT-T[109]
  {
    Length = "15";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "New Face Amount";
  }

  IN MIR-DV-CVG-MPREM-AMT-T[109]
  {
    Signed;
    Length = "15";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "New Modal Premium";
  }
   
  IN MIR-DV-CVG-RENEW-CD-T[109]
    {
    Length = "01";
    FieldGroup = "Table109";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Rider Renewal Code";
    Index = "1";
  }
#UY3001 CHANGES STARTS  
  IN MIR-DV-BASE-RENW-IND
  {
      Length = "1";
      SType = "Indicator";
      Label = "Base renewal indicator";
  }
#UY3001 CHANGES ENDS
#*  PR006I  changes for ManuMed rider renewals    *
                                                
  IN MIR-CVG-STBL-2-CD-T[109]
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
 
  IN MIR-DV-CVG-STBL-1-CD-T[109]
    {
    Length = "40";
    FieldGroup = "Table109";
#*C23814 changes START here*
 #* M241A3 changes START here* 
#    CodeSource = "EDIT";
#    CodeType = "STB1";
#    CodeSource = "CSOM9D29";        
#    FilterFields = "2";
#    FilterField1 = "MIR-DV-CVG-PLAN-ID-T"; 
#    FilterField2 = "MIR-DV-CVG-STBL-1-CD-T";
 #* M241A3 changes END here*     
    CodeSource = "EDIT";
    CodeType = "STB1";
#*C23814 changes END here*
    DBTableName = "TCVG";
    SType = "Text";
    Label = "Renewal Duration";
    Index = "1";
    }
 
  IN MIR-DV-CVG-STBL-2-CD-T[109]
    {
    Length = "40";
    FieldGroup = "Table109";
    CodeSource = "EDIT";
    CodeType = "STB2";
    DBTableName = "TCVG";
    SType = "Text";
    Label = "Renewal Benefit Limit";
    Index = "1";
    }
 
  IN MIR-CVG-PREM-CHNG-DT-T[109]
    {
    Length = "10";
    FieldGroup = "Table109";
    DBTableName = "TCVG";
    SType = "Date";
    Label = "Next Renewal Date";
    Index = "1";
    }
 
  IN MIR-DV-CHNG-STATUS-T[109]
    {
    Length = "06";
    FieldGroup = "Table109";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Stat";
    Index = "1";
    }
 
  IN MIR-DISP-CVG-NUM-T[60]
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table60";
    Index = "1";
    SType = "Text";
    Label = "Coverage Number";
  }

  IN MIR-DISP-PLAN-ID-T[60]
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

  IN MIR-DISP-CVG-STBL-1-CD-T[60]
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table60";
    Index = "1";
#*C23814 changes START here*
#* M241A3 changes START here* 
 #   CodeSource = "EDIT";
 #   CodeType = "STB1";
 #   CodeSource = "CSOM9D29";        
 #   FilterFields = "2";
 #   FilterField1 = "MIR-DISP-PLAN-ID-T"; 
 #   FilterField2 = "MIR-DISP-CVG-STBL-1-CD-T";
#* M241A3 changes END here*   
    CodeSource = "EDIT";
    CodeType = "STB1";
#*C23814 changes END here*
    SType = "Text";
    Label = "Duration";
  }

  IN MIR-DISP-DV-INSRD-CLI-NM-T[60]
  {
    DisplayOnly;
    Length = "75";
    FieldGroup = "Table60";
    Index = "1";
    SType = "Text";
    Label = "Insured's Name";
  }

  IN MIR-DISP-CVG-FACE-AMT-T[60]
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table60";
    Index = "1";
    SType = "Currency";
    Label = "Face Amount";
  }

  IN MIR-DISP-CVG-MPREM-AMT-T[60]
  {
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table60";
    Index = "1";
    SType = "Currency";
    Label = "Modal Premium";
  }

  IN MIR-DISP-DV-CVG-RENEW-CD-T[60]
    {
    DisplayOnly;
    Length = "01";
    FieldGroup = "Table60";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Rider Renewal Code";
    Index = "1";
  }

  IN MIR-DISP-CVG-STBL-2-CD-T[60]
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
 
#** RP2009 Changes start here 

  IN MIR-CVG-STBL-4-CD-T[109]
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

  IN MIR-DV-CVG-STBL-4-CD-T[109]
    {
    Length = "02";
    FieldGroup = "Table109";
    CodeSource = "EDIT";
    CodeType = "STB4";
    DBTableName = "TCVG";
    SType = "Text";
    Label = "Override Subtable 4";
    Index = "1";
    }
    
  IN MIR-DISP-CVG-STBL-4-CD-T[60]
    {
        DisplayOnly;
        Length = "02";
        FieldGroup = "Table60";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub Table 4";
        Index = "1";
    }

#** RP2009 Changes end here

#** RPL009 Changes start here 
  
  IN MIR-CVG-STBL-3-CD-T[109]
      {
      Length = "05";
      FieldGroup = "Table109";
#*C23814 changes START here*
#* M241A3 changes START here*   
#      CodeSource = "CSOM9D30";        
#      FilterFields = "2";
#      FilterField1 = "MIR-PLAN-ID-T";
#      FilterField2 = "MIR-CVG-STBL-3-CD-T";
 #     CodeSource = "EDIT";
 #     CodeType = "STB3";
#* M241A3 changes END here*      
    CodeSource = "EDIT";
    CodeType = "STB3";
#*C23814 changes END here*
      DBTableName = "TCVG";
      SType = "Text";
      Label = "Sub Table 3";
      Index = "1";
      }
  
  IN MIR-DV-CVG-STBL-3-CD-T[109]
      {
      Length = "05";
      FieldGroup = "Table109";
#*C23814 changes START here*
#* M241A3 changes START here*   
#      CodeSource = "CSOM9D30";        
#      FilterFields = "2";
#      FilterField1 = "MIR-DV-CVG-PLAN-ID-T";
#      FilterField2 = "MIR-DV-CVG-STBL-3-CD-T";
  #    CodeSource = "EDIT";
  #    CodeType = "STB3";
#* M241A3 changes END here*      
    CodeSource = "EDIT";
    CodeType = "STB3";
#*C23814 changes END here*
      DBTableName = "TCVG";
      SType = "Text";
      Label = "Override Subtable 3";
      Index = "1";
      }
  IN MIR-DISP-CVG-STBL-3-CD-T[60]
     {
        DisplayOnly;
        Length = "05";
        FieldGroup = "Table60";
#*C23814 changes START here*
#* M241A3 changes START here*   
#        CodeSource = "CSOM9D30";        
#	FilterFields = "2";
#        FilterField1 = "MIR-DISP-PLAN-ID-T";
#        FilterField2 = "MIR-DISP-CVG-STBL-3-CD-T";
  #      CodeSource = "EDIT";
  #      CodeType = "STB3";
#* M241A3 changes END here*      
    CodeSource = "EDIT";
    CodeType = "STB3";
#*C23814 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub Table 3";
        Index = "1";
     }
    
#** RPL009 Changes end here 
    
  IN MIR-DISP-CVG-PREM-CHNG-DT-T[60]
    {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table60";
    DBTableName = "TCVG";
    SType = "Date";
    Label = "Next Renewal Date";
    Index = "1";
    }
 
  IN MIR-DISP-DV-CHNG-STATUS-T[60]
    {
    DisplayOnly;
    Length = "06";
    FieldGroup = "Table60";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Stat";
    Index = "1";
    }
#M213L1 CHANGES STARTS HERE 

   IN MIR-CVG-PRIM-GR-ID-T[109]
    {
        Length = "2";
        FieldGroup = "Table109";
        SType = "Text";
        Label = "Group ID";
        Index = "1";
    }
   IN MIR-DISP-PRIM-GR-ID-T[60]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table60";
        Index = "1";
        SType = "Text";
        Label = "Group ID";
    }   
    
#M213L1 CHANGES ENDS HERE      
 
}
