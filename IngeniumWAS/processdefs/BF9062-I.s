# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

#*******************************************************************************
#*  Component:   BF9062-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB01  TMC      New for MCL                                               *
#*  B00243  VAN      Change Pre-Underwriting Indicator                         *
#*                   TO Underwriting before physical exam                      *
#*  B00107  VAN      CHANGE Relationship of owner to insured                   *
#*  B00107           TO Relationship of insured to policy owner                *
#*  B00383  VAN      ADD RCLIU-CLI-LNB-IND                                     *
#*  1CNB02  EKM      ADD MIR-CNVR-ORIG-DB-AMT & MIR-CNVR-ORIG-HOSP-AMT         *
#*  CR116C  FB       ADD RCLIU-CLI-TCB-IND                                     *
#*  MFFFU4  ACR      ADD OWN-INV-XPER-IND, AGT-XPER-CD, VERIF-MTHD-CD          *
#*  MP4801  CTS      ADD RCLIU-SUBST-CLMT-IND                                  *
#*  MP55OU  CTS      ADDED SUB TYPE CODE UWD FOR MIR-UW-TYP-CD                 *
#*  EN5572  CTS      Commeted the code for SUB TYPE CODE UWD for MIR-UW-TYP-CD *
#*******************************************************************************
 
S-STEP BF9062-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    Type = "Input";
    FocusField = "MIR-CLI-ID";
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

  IN MIR-CLI-ID 
  {
    Key;
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Client ID";
  }

  IN MIR-STCKR-ID 
  {
    Key;
    DisplayOnly;
    Length = "11";
    SType = "Text";
    Label = "Sticker Number";
  }

  IN MIR-POL-ID-BASE 
  {
    Key;
    DisplayOnly;
    Length = "9";
    SType = "Text";
    Label = "Policy ID";
  }

  IN MIR-POL-ID-SFX 
  {
    Key;
    DisplayOnly;
    Length = "1";
    SType = "Text";
    Label = "Suffix";
  }

  INOUT MIR-UW-TYP-CD
  {
    Mandatory;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "UW-TYP-CD";
   #EN5572 - Changes Begin
   #CodeSubType = "UWD";
   #EN5572 - Changes End
    SType = "Selection";
    Label = "Level of Underwriting";
  }

  INOUT MIR-OTHR-STCKR-ID
  {
    Length = "11";
    SType = "Text";
    Label = "Other Sticker Number";
  }

  INOUT MIR-UW-UPLD-IND
  {
    Length = "1";
    SType = "Indicator";
    Label = "Underwriting Upload Indicator";
  }

  INOUT MIR-UW-UPLD-DT
  {
    Length = "10";
    SType = "Date";
    Label = "Underwriting Upload Date";
  }

  INOUT MIR-DEFIC-IND
  {
    Length = "1";
    SType = "Indicator";
    Label = "Deficiency Indicator";
  }

  INOUT MIR-OWNR-REL-INSR-CD
  {
    Mandatory;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "OWNR-REL-INSR-CD";
    SType = "Selection";
    Label = "Relationship of Insured to Policy Owner";
  }

  INOUT MIR-PRE-UWG-IND
  {
    Length = "1";
    SType = "Indicator";
    Label = "Underwriting before Physical Exam";
  }

  INOUT MIR-SPCL-NOTE-SD-IND
  {
    Length = "1";
    SType = "Indicator";
    Label = "Special Notes of Self-Disclosure Form";
  }

  IN MIR-DV-CLI-NM
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Client Name";
  }
   
  INOUT MIR-CLI-LNB-IND
  {
    Length = "1";
    SType = "Indicator";
    Label = "Living Needs Benefits";
  }
   
  INOUT MIR-CLI-TCB-IND
  {
    Length = "1";
    SType = "Indicator";
    Label = "Terminal Care Benefits";
  }

#MP4801
  INOUT MIR-SUBST-CLMT-IND
  {
    Length = "1";
    SType = "Indicator";
    Label = "Substitute Claimant Rider";
  }

  INOUT MIR-CNVR-ORIG-DB-AMT
  {
    Length = "19";
    SType = "Currency";
    Label = "Pre-Conversion Original Death Benefit Amount";
  }

  INOUT MIR-CNVR-ORIG-HOSP-AMT
  {
    Length = "19";
    SType = "Currency";
    Label = "Pre-Conversion Original Hospitalization Amount";
  }

  INOUT MIR-OWN-INV-XPER-IND
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "OWN-INV-XPER-CD";
    DBTableName = "TCLIU";
    SType = "Selection";
    Label = "Does the policyholder have Investment Experience?";
  }

  INOUT MIR-AGT-XPER-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "AGT-XPER-CD";
    DBTableName = "TCLIU";
    SType = "Selection";
    Label = "Sales Rep Experience";
  }

  INOUT MIR-VERIF-MTHD-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "VERIF-MTHD-CD";
    DBTableName = "TCLIU";
    SType = "Selection";
    Label = "What method was used?";
  }

}
