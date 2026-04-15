# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT

#*******************************************************************************
#*  Component:   BF9182-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02PR55  DPK      New Screen                                                *
#*  PR006I  BMB      Changes for ManuMed rider renewals                        *
#*  M00037  CLB      Add new face amount field to screen                       *
#*  PF20    PF 2.0   DisplayOnly flds with DefaultSession must be IN not INOUT *
#*                   all array fields changed to IN from INOUT                 *
#*  RP2010  CTS      Add SubTable 4 value to the screen                        *
#*  RPL010  CTS      Add SubTable 3 value to the screen                        *
#*  M142U1  CTS      ADD TOTAL CSV VALUE TO THE SCREEN                         *
#*  M213L1  CTS      CHANGES FOR RUM                                           *
#*******************************************************************************
S-STEP BF9182-O
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

# PF20 - change for Pathfinder Release 2.0
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

# PF20 - change for Pathfinder Release 2.0
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

# INOUT MIR-EFF-DT
  IN MIR-EFF-DT
  {
    Key;
    Length = "10";
    SType = "Date";
    Label = "Effective Date";
  }

# INOUT MIR-DV-OWN-CLI-NM
  IN MIR-DV-OWN-CLI-NM
  {
    Length = "75";
    SType = "Text";
    Label = "Owner Name";
  }

# INOUT MIR-POL-SNDRY-AMT
  IN MIR-POL-SNDRY-AMT
  {
    Signed;
    Length = "15";
    SType = "Currency";
    Label = "Sundry Amount";
  }

# INOUT MIR-POL-BILL-MODE-CD
  IN MIR-POL-BILL-MODE-CD
  {
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "POL-BILL-MODE-CD";
    SType = "Text";
    Label = "Premium Mode";
  }

#*  PR006I  start position for more...      *
# INOUT MIR-SCR-SUB
  IN MIR-SCR-SUB
  {
    Length = "3";
    SType = "Numeric";
    Label = "CVG Start";
  }

# INOUT MIR-CVG-NUM-T[109]
  IN MIR-CVG-NUM-T[109]
  {
    Length = "2";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Text";
    Label = "Coverage Number";
  }

# INOUT MIR-INSRD-CLI-ID-T[109]
  IN MIR-INSRD-CLI-ID-T[109]
  {
    Length = "10";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Text";
    Label = "Insured Client Id";
  }

# INOUT MIR-PLAN-ID-T[109]
  IN MIR-PLAN-ID-T[109]
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
#    CodeSource = "EDIT";
#    CodeType = "PLAN";
    SType = "Text";
    Label = "Rider Name";
  }

# INOUT MIR-CVG-STBL-1-CD-T[109]
  IN MIR-CVG-STBL-1-CD-T[109]
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "STB1";
    SType = "Text";
    Label = "Duration";
  }

# INOUT MIR-DV-INSRD-CLI-NM-T[109]
  IN MIR-DV-INSRD-CLI-NM-T[109]
  {
    Length = "75";
#    FieldGroup = "Table20";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Text";
    Label = "Insured's Name";
  }

# INOUT MIR-CVG-FACE-AMT-T[109]
  IN MIR-CVG-FACE-AMT-T[109]
  {
    Length = "15";
#    FieldGroup = "Table20";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "Current Face Amount";
  }

# INOUT MIR-DV-CVG-FACE-AMT-T[109]
  IN MIR-DV-CVG-FACE-AMT-T[109]
  {
    Length = "15";
#    FieldGroup = "Table20";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "New Face Amount";
  }

# INOUT MIR-CVG-MPREM-AMT-T[109]
  IN MIR-CVG-MPREM-AMT-T[109]
  {
    Signed;
    Length = "15";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "Modal Premium";
  }

# INOUT MIR-DV-CVG-RENEW-CD-T[109]
  IN MIR-DV-CVG-RENEW-CD-T[109]
    {
    Length = "01";
    FieldGroup = "Table109";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Rider Renewal Code";
    Index = "1";
  }

# INOUT MIR-CVG-STBL-2-CD-T[109]
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

# INOUT MIR-CVG-PREM-CHNG-DT-T[109]
  IN MIR-CVG-PREM-CHNG-DT-T[109]
    {
    Length = "10";
    FieldGroup = "Table109";
    DBTableName = "TCVG";
    SType = "Date";
    Label = "Next Renewal Date";
    Index = "1";
    }

# INOUT MIR-DV-CHNG-STATUS-T[109]
  IN MIR-DV-CHNG-STATUS-T[109]
    {
    Length = "06";
    FieldGroup = "Table109";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Stat";
    Index = "1";
    }
#* Add a new field Sub Table 3*
  IN MIR-CVG-STBL-3-CD-T[109]
    {
      Length = "5";
      FieldGroup = "Table109";
      DBTableName = "TCVG";
      SType = "Text";
      Label = "Sub Table 3";
      Index = "1";
    }
#* End of the field Sub Table 3*

  IN MIR-CVG-STBL-4-CD-T[109]
    {
      Length = "40";
      FieldGroup = "Table109";
      DBTableName = "TCVG";
      SType = "Text";
      Label = "Sub Table 4";
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
    CodeSource = "EDIT";
    CodeType = "STB1";
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
    Label = "Current Face Amount";
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

#* Add a new field Sub Table 3*
  IN MIR-DISP-CVG-STBL-3-CD-T[60]
    {
    DisplayOnly;
    Length = "5";
    FieldGroup = "Table60";
    CodeSource = "EDIT";
    CodeType = "STB3";
    DBTableName = "TCVG";
    SType = "Text";
    Label = "Sub Table 3";
    Index = "1";
    }
#* End of the field Sub Table 3*

  IN MIR-DISP-CVG-STBL-4-CD-T[60]
    {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table60";
    CodeSource = "EDIT";
    CodeType = "STB4";
    DBTableName = "TCVG";
    SType = "Text";
    Label = "Sub Table 4";
    Index = "1";
    }
  
#*M142U1 CHANGES STARTS HERE*    
  IN  MIR-DISP-CSV-RFND-AMT
  {	
         DisplayOnly;
         Signed;
         Length = "16";
         SType = "Currency";
         Label = "Total CSV";
         
       
   }
#*M142U1 CHANGES ENDS HERE*   
#M213L1 CHANGES STARTS HERE 

  IN MIR-DISP-PRIM-GR-ID-T[60]
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table60";
    SType = "Text";
    Label = "Group ID";
    Index = "1";
  }
    
  IN MIR-CVG-PRIM-GR-ID-T[109]
  {
    Length = "2";
    FieldGroup = "Table109";
    SType = "Text";
    Label = "Group ID";
  }
    
#M213L1 CHANGES ENDS HERE
}
