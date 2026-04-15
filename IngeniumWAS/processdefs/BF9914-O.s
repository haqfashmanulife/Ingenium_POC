#*******************************************************************************
#*  Component:   BF9914-O.s                                                    *
#*  Description: CUSTOMER SEARCH RESULTS                                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP0026  CTS      Initial version                                           *
#*                                                                             *
#*******************************************************************************
S-STEP BF9914-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    DelEmptyRows;
    FocusField = "OKButton";
    FocusFrame = "ButtonFrame";
    Type = "Output";
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
    SType="Hidden";
  }

  IN MIR-PRCES-DT 
  {
    DefaultSession = "LSIR-PRCES-DT";
    DisplayOnly;
    Key;
    Label = "Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-DV-RO-SO-CD 
  {
    DisplayOnly;
    Key;
    Label = "RO-SO Code";
    Length = "10";
    SType = "Text";
  }

  IN MIR-AGT-ID 
  {
    DefaultSession = "MIR-AGT-ID";
    DisplayOnly;
    Key;
    Label = "PA Code";
    Length = "6";
    SType = "Text";
  }

  IN MIR-AGT-NM 
  {
    DisplayOnly;
    Key;
    Label = "PA Name";
    Length = "50";
    SType = "Text";
  }

  IN MIR-SRCH-TYP-CD 
  {
    DisplayOnly;
    Label;
    Length = "1";
    SType = "YesNo";
  }

  IN MIR-SRCH-CD 
  {
    DisplayOnly;
    Label;
    Length = "1";
    SType = "YesNoUnanswered";
  }

  IN MIR-GIV-NM-KA 
  {
    MixedCase;
    DisplayOnly;
    Label = "First Name Kana";
    Length = "50";
    SType = "Text";
  }

  IN MIR-SUR-NM-KA 
  {
    MixedCase;
    DisplayOnly;
    Label = "Last Name Kana";
    Length = "50";
    SType = "Text";
  }

  IN MIR-GIV-NM-KJ 
  {
    MixedCase;
    DisplayOnly;
    Label = "First Name Kanji";
    Length = "50";
    SType = "Text";
  }

  IN MIR-SUR-NM-KJ 
  {
    MixedCase;
    DisplayOnly;
    Label = "Last Name Kanji";
    Length = "50";
    SType = "Text";
  }

  IN MIR-DV-CLI-BTH-DT-1 
  {
    CodeSource = "DataModel";
    CodeType = "CLI-BTH-DT-1";
    DisplayOnly;
    Label = "Date of Birth From";
    Length = "2";
    SType = "Text";
  }

  IN MIR-DV-CLI-BTH-DT-2 
  {
    CodeSource = "DataModel";
    CodeType = "CLI-BTH-DT-2";
    DisplayOnly;
    Label = "Date of Birth To";
    Length = "2";
    SType = "Text";
  }

  IN MIR-PRT1-CLI-PSTL-CD 
  {
    DisplayOnly;
    Label = "Postal Code";
    Length = "3";
    SType = "Text";
  }

  IN MIR-PRT2-CLI-PSTL-CD 
  {
    DisplayOnly;
    Label = "Postal Code";
    Length = "7";
    SType = "Text";
  }

  IN MIR-PROD-CD 
  {
    DisplayOnly;
    Label = "Product Code";
    Length = "30";
    SType = "Text";
  }

  IN MIR-POL-ID 
  {
    DisplayOnly;
    Label = "Policy Id";
    Length = "30";
    SType = "Text";
  }

  IN MIR-HID-GIV-NM-KA
  {
    MixedCase;
    Length = "50";
    SType = "Hidden";
    Label = "";
  }
     
  IN MIR-HID-SUR-NM-KA
  {
    MixedCase;
    Length = "50";
    SType = "Hidden";
    Label = "";
  }

  IN MIR-CLI-BTH-DT
  {
    Length = "10";
    SType = "Hidden";
    Label = "";
  }

  IN MIR-SEQ-NUM
  {
    Length = "3";
    SType = "Hidden";
    Label = "";
  }

  IN MIR-DV-CLI-NUM-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table50";
    Index = "1";
    Label = "No.";
    Length = "3";
    SType = "Number";
  }

  IN MIR-DV-CLI-NM-KA-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table50";
    Index = "1";
    Label = "Name Kana";
    Length = "101";
    SType = "Text";
  }

  IN MIR-DV-CLI-NM-KJ-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table50";
    Index = "1";
    Label = "Name Kanji";
    Length = "101";
    SType = "Text";
  }

  IN MIR-CLI-BTH-DT-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table50";
    Index = "1";
    Label = "Date of Birth";
    Length = "10";
    SType = "Date";
  }

  IN MIR-CLI-CRT-ADD-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table50";
    Index = "1";
    Label = "Address";
    Length = "201";
    SType = "Text";
  }

  IN MIR-PSTL-CD-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table50";
    Index = "1";
    Label = "Postal Code";
    Length = "16";
    SType = "Text";
  }
}
