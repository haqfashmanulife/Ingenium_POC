# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:57 PM EDT

#*******************************************************************************
#*  Component:   BF9064-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB01  TMC      New for MCL                                               *
#*                                                                             *
#*******************************************************************************
 
P-STEP BF9064-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9064";
    BusinessFunctionName = "Client Application Details List";
    BusinessFunctionType = "List";
    MirName = "NCWM9064";
  }
  

  
  OUT LSIR-RETURN-CD;
  
  OUT MIR-RETRN-CD;

  INOUT MIR-CLI-ID
  {
    Key;
    Mandatory;
    Length = "10";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Client ID";
  }

  INOUT MIR-STCKR-ID
  {
    Key;
    Length = "11";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Sticker Number";
  }

  INOUT MIR-POL-ID-BASE
  {
    Key;
    Length = "9";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Policy ID";
  }

  INOUT MIR-POL-ID-SFX
  {
    Key;
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Suffix";
  }

  OUT MIR-DV-CLI-NM
  {
    Length = "75";
    DBTableName = "TCLI";
    SType = "Text";
    Label = "Client Name";
  }

  OUT MIR-CLI-ID-T[20]
  {
    Length = "10";
    FieldGroup = "Table20";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Client ID";
    Index = "1";
  }

  OUT MIR-STCKR-ID-T[20]
  {
    Length = "11";
    FieldGroup = "Table20";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Sticker Number";
    Index = "1";
  }

  OUT MIR-POL-ID-BASE-T[20]
  {
    Length = "9";
    FieldGroup = "Table20";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Policy ID";
    Index = "1";
  }

  OUT MIR-POL-ID-SFX-T[20]
  {
    Length = "1";
    FieldGroup = "Table20";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Suffix";
    Index = "1";
  }

  OUT MIR-UW-TYP-CD-T[20]
  {
    Length = "1";
    FieldGroup = "Table20";
    CodeSource = "DataModel";
    CodeType = "UW-TYP-CD";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Level of Underwriting";
    Index = "1";
  }

}
