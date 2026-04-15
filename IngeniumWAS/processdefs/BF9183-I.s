#*******************************************************************************
#*  Component:   BF9183-I.s                                                    *
#*  Description: S-Step for processing multiple Life rider switches            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* MFPLI5   CLB      New for ManuFlex Plus multiple Life rider switch          *
#* BP0051   CLB      Enable text for mode premium value and duration           *
#* MP185H   CTS      CHANGES DONE TO INCLUDE THE SUBTABLE 3 VALUE FOR LIFE     *
#*                   RIDERS                                                    *
#*  M213L1  CTS      CHANGES FOR RUM                                           *
#*******************************************************************************
S-STEP BF9183-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    Type = "Input";
    FocusField = "MIR-POL-ID-BASE";
    FocusFrame = "ContentFrame";
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

  INOUT MIR-DV-OWN-CLI-NM
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Owner Name";
  }

  INOUT MIR-POL-SNDRY-AMT
  {
    DisplayOnly;
    Signed;
    Length = "15";
    SType = "Currency";
    Label = "Sundry Amount";
  }

  INOUT MIR-POL-BILL-MODE-CD
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "POL-BILL-MODE-CD";
    SType = "Text";
    Label = "Premium Mode";
  }

  INOUT MIR-DV-2-INSRD-CLI-NM
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Insured Name";
  }

  INOUT MIR-DV-2-CVG-NUM
  {
    DisplayOnly;
    Length = "2";
    SType = "Text";
    Label = "#";
  }

  INOUT MIR-DV-2-PLAN-ID
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Rider";
  }

  INOUT MIR-DV-2-CVG-STBL-1-CD
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "EDIT";
    CodeType = "STB1";
    SType = "Text";
    Label = "Duration";
  }

  INOUT MIR-DV-2-CVG-PREM-CHNG-DT
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Premium Change Date";
  }

  INOUT MIR-DV-2-CVG-STBL-2-CD
  {
    DisplayOnly;
    Length = "40";
    SType = "Text";
    Label = "Benefit Limit";
  }

  INOUT MIR-DV-2-CVG-FACE-AMT
  {
    DisplayOnly;
    Length = "15";
    SType = "Currency";
    Label = "Current Face Amount";
  }

  INOUT MIR-DV-2-CVG-NEW-FACE-AMT
  {
    Length = "15";
    SType = "Currency";
    Label = "New Face Amount";
  }

  INOUT MIR-DV-2-CVG-MPREM-AMT
  {
    DisplayOnly;
    Signed;
    Length = "15";
    SType = "Currency";
    Label = "Modal Premium";
  }

  INOUT MIR-DV-2-KEEP-THIS-CVG-CD
  {
    Length = "1";
    SType = "Indicator";
    Label = "Keep this rider (Original rider face amount must be reduced)";
  }

  INOUT MIR-DV-NEW-PLAN-ID-T[3]
  {
    Length = "40";
    FieldGroup = "Table3";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "LPLAN";
    SType = "Selection";
    Label = "Rider Plan";
  }

  INOUT MIR-DV-NEW-STBL-1-CD-T[3]
  {
    Length = "40";
    FieldGroup = "Table3";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "STB1";
    SType = "Selection";
    Label = "Duration";
  }

  INOUT MIR-DV-NEW-STBL-2-CD-T[3]
  {
    Length = "40";
    FieldGroup = "Table3";
    Index = "1";
    SType = "Hidden";
    Label = "Benefit Limit";
  }

  INOUT MIR-DV-NEW-FACE-AMT-T[3]
  {
    Length = "15";
    FieldGroup = "Table3";
    Index = "1";
    SType = "Currency";
    Label = "Face Amount";
  }

  INOUT MIR-DV-2-CVG-RENEW-CD
  {
    Length = "1";
    SType = "Hidden";
    Label = "Renewal Code for JS";
  }

  INOUT MIR-DV-PRCES-STATE-CD
  {
    Length = "1";
    SType = "Hidden";
    Label = "Process State";
  }

  #MP185H changes start here 
      
  INOUT MIR-DV-2-CVG-STBL-3-CD
  {
    DisplayOnly;
    Length = "5";
    CodeSource = "EDIT";
    CodeType = "STB3";
    SType = "Text";
    Label = "Sub Table 3";
  }
  
  INOUT MIR-DV-NEW-STBL-3-CD-T[3]
  {
     Length = "5";
     FieldGroup = "Table3";
     Index = "1";
     CodeSource = "EDIT";
     CodeType = "STB3";
     SType = "Selection";
     Label = "Sub Table 3";
  }
        
  #* MP185H Changes End 
#M213L1 CHANGES STARTS HERE   
  INOUT  MIR-DV-2-CVG-PRIM-GR-ID
  {
    DisplayOnly;
    Length = "2";
    SType = "Text";
    Label = "Group ID";
  }  
#M213L1 CHANGES ENDS HERE   
  
}
