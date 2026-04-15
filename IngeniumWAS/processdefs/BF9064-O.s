# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT

#*******************************************************************************
#*  Component:   BF9060-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB01  TMC      New for MCL                                               *
#*                                                                             *
#*******************************************************************************
 

S-STEP BF9064-O
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

  INOUT MIR-CLI-ID 
  {
    Key;
    Mandatory;
    Length = "10";
    SType = "Text";
    Label = "Client ID";
  }

  INOUT MIR-STCKR-ID 
  {
    Key;
    Length = "11";
    SType = "Text";
    Label = "Sticker Number";
  }

  INOUT MIR-POL-ID-BASE 
  {
    Key;
    Length = "9";
    SType = "Text";
    Label = "Policy ID";
  }

  INOUT MIR-POL-ID-SFX 
  {
    Key;
    Length = "1";
    SType = "Text";
    Label = "Suffix";
  }

  IN MIR-DV-CLI-NM 
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Client Name";
  }

  IN MIR-CLI-ID-T[20] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Text";
    Label = "Client ID";
  }

  IN MIR-STCKR-ID-T[20] 
  {
    DisplayOnly;
    Length = "11";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Text";
    Label = "Sticker Number";
  }

  IN MIR-POL-ID-BASE-T[20] 
  {
    DisplayOnly;
    Length = "9";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Text";
    Label = "Policy ID";
  }

  IN MIR-POL-ID-SFX-T[20] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Text";
    Label = "Suffix";
  }

  IN MIR-UW-TYP-CD-T[20] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table20";
    Index = "1";
    CodeSource = "DataModel";
    CodeType = "UW-TYP-CD";
    SType = "Text";
    Label = "Level of Underwriting";
  }
}
