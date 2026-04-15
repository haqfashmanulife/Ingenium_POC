# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

#*******************************************************************************
#*  Component:   BF9060-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB01  TMC      New for MCL                                               *
#*  B00243  VAN      Change Pre-Underwriting Indicator                         *
#*  B00243           TO Underwriting before physical exam                      *
#*  B00107  VAN      CHANGE Relationship of owner to insured                   *
#*  B00107           TO Relationship of insured to policy owner                *
#*  B00383  VAN      ADD RCLIU-CLI-LNB-IND                                     *
#*  1CNB02  EKM      ADD MIR-CNVR-ORIG-DB-AMT & MIR-CNVR-ORIG-HOSP-AMT         *
#*  CR116C  FB       ADD RCLIU-CLI-TCB-IND                                     *
#*  CR096A  SG       Add MID-CVG-PKG-CD                                        *
#*  MFFFU4  ACR      ADD OWN-INV-XPER-IND, AGT-XPER-CD, VERIF-MTHD-CD          *
#*  MP4801  CTS      ADD RCLIU-SUBST-CLMT-IND                                  *
#*  MP300A  CTS      ADD RCLIU-UW-FORM-RECV-CD                                 *
#*******************************************************************************
 
S-STEP BF9060-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Retrieve";
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

  IN MIR-UW-TYP-CD 
  {
    DisplayOnly;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "UW-TYP-CD";
    SType = "Text";
    Label = "Level of Underwriting";
  }

  IN MIR-OTHR-STCKR-ID 
  {
    DisplayOnly;
    Length = "11";
    SType = "Text";
    Label = "Other Sticker Number";
  }

  IN MIR-UW-UPLD-IND 
  {
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "Underwriting Upload Indicator";
  }

  IN MIR-UW-UPLD-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Underwriting Upload Date";
  }

  IN MIR-DEFIC-IND 
  {
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "Deficiency Indicator";
  }

  IN MIR-OWNR-REL-INSR-CD 
  {
    DisplayOnly;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "OWNR-REL-INSR-CD";
    SType = "Text";
    Label = "Relationship of Insured to Policy Owner";
  }

  IN MIR-PRE-UWG-IND 
  {
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "Underwriting before Physical Exam";
  }

  IN MIR-SPCL-NOTE-SD-IND 
  {
    DisplayOnly;
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
   
  IN MIR-CLI-LNB-IND 
  {
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "Living Needs Benefits";
  }
   
  IN MIR-CLI-TCB-IND 
  {
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "Terminal Care Benefits";
  }
  
#MP4801
  IN MIR-SUBST-CLMT-IND
  {
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "Substitute Claimant Rider";
  }

  IN MIR-CNVR-ORIG-DB-AMT
  {
    DisplayOnly;
    Length = "19";
    SType = "Currency";
    Label = "Pre-Conversion Original Death Benefit Amount";
  }

  IN MIR-CNVR-ORIG-HOSP-AMT
  {
    DisplayOnly;
    Length = "19";
    SType = "Currency";
    Label = "Pre-Conversion Original Hospitalization Amount";
  }

  IN MIR-CVG-PKG-CD 
  {
    DisplayOnly;
    Length = "3";
    SType = "Text";
    Label = "Rider Package Code";
  }

  IN MIR-OWN-INV-XPER-IND
  {
    DisplayOnly;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "OWN-INV-XPER-CD";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Does the policyholder have Investment Experience?";
  }

  IN MIR-AGT-XPER-CD
  {
    DisplayOnly;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "AGT-XPER-CD";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Sales Rep Experience";
  }

  IN MIR-VERIF-MTHD-CD
  {
    DisplayOnly;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "VERIF-MTHD-CD";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "What method was used?";
  }
#MP300A CHANGES START HERE 
  IN MIR-UW-FORM-RECV-CD
  {
    DisplayOnly;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "UW-FORM-RECV-CD";    
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "ETC Status";
  }
#MP300A CHANGES END HERE  

}
