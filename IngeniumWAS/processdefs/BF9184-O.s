# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT

#*******************************************************************************
#*  Component:   BF9184-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02PR55  DPK      New Screen                                                *
#*  PR006I  BMB      Changes for ManuMed rider renewals                        *
#*  018395  CTS      CHANGES DONE FOR TRAD RIDER RENEWAL                       *
#*  UY3001  CTS      STREAM 3 CHANGES                                          * 
#*******************************************************************************
S-STEP BF9184-O
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

  IN MIR-POL-ID-BASE 
  {
    Key;
    DisplayOnly;
    Length = "9";
    DefaultSession = "MIR-POL-ID-BASE";
    SType = "Text";
    Label = "Policy Id";
  }

  IN MIR-POL-ID-SFX 
  {
    Key;
    DisplayOnly;
    Length = "1";
    DefaultSession = "MIR-POL-ID-SFX";
    SType = "Text";
    Label = "Suffix";
  }

  IN MIR-EFF-DT 
  {
    Key;
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Effective Date";
  }

  IN MIR-DV-OWN-CLI-NM 
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Owner Name";
  }

  IN MIR-POL-SNDRY-AMT 
  {
    DisplayOnly;
    Signed;
    Length = "15";
    SType = "Currency";
    Label = "Sundry Amount";
  }

# 018395 CHANGES START HERE
  IN MIR-POL-MPREM-AMT
  {
    DisplayOnly;   
    Signed;
    Length = "15";
    DBTableName = "TPOL";
    SType = "Currency";
    Label = "Trad modal Amount";
  }
  IN MIR-ADV-PMT-AMT
  {
    DisplayOnly;
    Signed;
    Length = "15";
    SType = "Currency";
    Label = "Advance Premium";
  }
# 018395 CHANGES END HERE

  IN MIR-POL-BILL-MODE-CD 
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "POL-BILL-MODE-CD";
    SType = "Text";
    Label = "Premium Mode";
  }

#*  PR006I  start position for more...      *
  INOUT MIR-SCR-SUB
  {
    DisplayOnly;
    Length = "3";
    SType = "Numeric";
    Label = "CVG Start";
  }

  IN MIR-CVG-NUM-T[109] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Text";
    Label = "Coverage Number";
  }
   
  IN MIR-INSRD-CLI-ID-T[109] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Text";
    Label = "Insured Client Id";
  }

  IN MIR-PLAN-ID-T[109] 
  {
    DisplayOnly;
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
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
#    CodeSource = "EDIT";
#    CodeType = "PLAN";
    SType = "Text";
    Label = "Renewal Rider";
  }

#  IN MIR-CVG-ISS-EFF-DT-T[109]
#  {
#    DisplayOnly;
#    Length = "10";
#    FieldGroup = "Table109";
#    SType = "Date";
#    Label = "Rider Issue Date";
#    Index = "1";
#  }
 
  IN MIR-CVG-STBL-1-CD-T[109] 
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "STB1";
    SType = "Text";
    Label = "Duration";
  }

  IN MIR-DV-INSRD-CLI-NM-T[109] 
  {
    DisplayOnly;
    Length = "75";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Text";
    Label = "Insured's Name";
  }

  IN MIR-CVG-FACE-AMT-T[109] 
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "Current Face Amount";
  }

  IN MIR-CVG-MPREM-AMT-T[109] 
  {
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "Renewal Modal Premium";
  }

  IN MIR-DV-CVG-FACE-AMT-T[109] 
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "New Face Amount";
  }

  IN MIR-DV-CVG-MPREM-AMT-T[109] 
  {
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "New Modal Premium";
  }
   
  IN MIR-DV-CVG-RENEW-CD-T[109]
    {
    DisplayOnly;
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
    DisplayOnly;
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
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table109";
    CodeSource = "EDIT";
    CodeType = "STB1";
    DBTableName = "TCVG";
    SType = "Text";
    Label = "Renewal Duration";
    Index = "1";
    }
 
  IN MIR-DV-CVG-STBL-2-CD-T[109]
    {
    DisplayOnly;
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
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table109";
    DBTableName = "TCVG";
    SType = "Date";
    Label = "Next Renewal Date";
    Index = "1";
    }
 
  IN MIR-DV-CHNG-STATUS-T[109]
    {
    DisplayOnly;
    Length = "06";
    FieldGroup = "Table109";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Stat";
    Index = "1";
    }
 
}
