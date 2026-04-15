#*******************************************************************************
#*  Component:   BF9002-O.s                                                    *
#*  Description: Claims Additional Questions                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   Initial Version                                              *
#*                                                                             *
#*  AFU015  CTS    Change to increse the length of question description to 200 *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*******************************************************************************

S-STEP BF9002-O
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

  IN MIR-DV-PRCES-STATE-CD 
  {
    DisplayOnly;
    Label = "process code";
    Length = "1";
    SType = "Hidden";
  }

  IN MIR-CLM-ID 
  {
    DisplayOnly;
    Label = "Claim ID";
    Length = "8";
    SType = "Text";
  }

  IN MIR-DV-INS-CLI-NM 
  {
    DisplayOnly;
    Label = "Insured Name";
    Length = "75";
    SType = "Text";
  }

  IN MIR-CLMA-CLM-STAT-CD 
  {
    CodeSource = "DataModel";
    CodeType = "CLMA-CLM-STAT-CD";
    DisplayOnly;
    Label = "Master Claim Status";
    Length = "40";
    SType = "Text";
  }

  IN MIR-CLMA-INSRD-CLI-ID 
  {
    DisplayOnly;
    Label = "Insured Client ID";
    Length = "10";
    SType = "Text";
  }

  IN MIR-CLI-BTH-DT 
  {
    DisplayOnly;
    Label = "Date of Birth";
    Length = "10";
    SType = "Date";
  }

  IN MIR-CLI-DTH-DT 
  {
    DisplayOnly;
    Label = "Date of Death";
    Length = "10";
    SType = "Date";
  }

  IN MIR-CLI-SEX-CD 
  {
    CodeSource = "DataModel";
    CodeType = "CLI-SEX-CD";
    DisplayOnly;
    Label = "Sex";
    Length = "40";
    SType = "Text";
  }

  IN MIR-INS-MORAL-RISK-IND 
  {
    DisplayOnly;
    Label = "Insured Moral Risk";
    Length = "1";
    SType = "Indicator";
  }

  IN MIR-CLAIM-NOTE-IND 
  {
    DisplayOnly;
    Label = "Claim Note";
    Length = "1";
    SType = "Indicator";
  }

  IN MIR-PREV-AUTO-ADJC-DT 
  {
    DisplayOnly;
    Label = "Last Auto Adjudication Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-PREV-UPDT-DT 
  {
    DisplayOnly;
    Label = "Previous Update Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-PREV-UPDT-USER-ID 
  {
    DisplayOnly;
    Label = "Previous Update User ID";
    Length = "12";
    SType = "Text";
  }

  IN MIR-CLMA-HIST-CLM-IND 
  {
    DisplayOnly;
    Label = "Historical Claim";
    Length = "1";
    SType = "Indicator";
  }
  #UYSDMC CHANGES STARTS HERE
  IN MIR-CLMA-USYS-CLM-IND
  {    
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "Unisys Claim";
    }
   #UYSDMC CHANGES ENDS HERE
  INOUT MIR-HID-MORE-QSTN-ID
  {
      Length = "09";
      DBTableName = "TCQDR";
      FieldGroup = "Table1";
      SType = "Hidden";
      Label = "";
  }

  INOUT MIR-HID-MORE-LVL-NUM
  {
      Length = "03";
      FieldGroup = "Table 1";
      SType = "Hidden";
      Label = "";
  }
                   
  INOUT MIR-HID-FLOW-CHK-IND
  {
      Length = "01";
      FieldGroup = "Table 1";
      SType = "Hidden";
      Label = "";
  }

  IN MIR-QSTN-DESC-TXT-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table1";
    Index = "1";
    Label;
#AFU015 CHANGES START
#   Length = "100";
    Length = "200";
#AFU015 CHANGES END
    SType = "Text";
  }

  INOUT MIR-ANSWR-CD-T[50]
  {
    FieldGroup = "Table1";
    Index = "1";
    Length = "01";
    SType = "YesNoUnanswered";
  }

  IN MIR-HID-QSTN-ID-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table1";
    Index = "1";
    Label;
    Length = "09";
    SType = "Hidden";
  }

  IN MIR-HID-LVL-NUM-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table 1";
    Index = "1";
    Label;
    Length = "03";
    SType = "Hidden";
  }

  IN MIR-HID-TRIGGR-CD-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table1";
    Index = "1";
    Label;
    Length = "01";
    SType = "Hidden";
  }

  IN MIR-HID-PARNT-QSTN-ID-T[50] 
  {
    DisplayOnly;
    FieldGroup = "Table1";
    Index = "1";
    Label;
    Length = "09";
    SType = "Hidden";
  }
}
