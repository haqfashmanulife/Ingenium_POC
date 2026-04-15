# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:57 PM EDT

#*******************************************************************************
#*  Component:   BF9062-P.p                                                    *
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
#*  MFFFU4  ACR      ADD OWN-INV-XPER-IND, AGT-XPER-CD, VERIF-MTHD-CD,         *
#*                     & BUS-FCN-SUB-ID                                        *
#*  MP4801  CTS      ADD RCLIU-SUBST-CLMT-IND                                  *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************
 
P-STEP BF9062-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9062";
    BusinessFunctionName = "Client Application Details Update";
    BusinessFunctionType = "Update";
    MirName = "NCWM9062";
  }
  

  OUT LSIR-RETURN-CD;
 
  OUT MIR-RETRN-CD;

  IN MIR-BUS-FCN-SUB-ID
  {
    Length = "6";
    DBTableName = "Derived";
    SType = "Hidden";
    Label = "Function Code";
  }

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
    Mandatory;
    Length = "11";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Sticker Number";
  }

  INOUT MIR-POL-ID-BASE
  {
    Key;
    Mandatory;
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

  INOUT MIR-UW-TYP-CD
  {
    Mandatory;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "UW-TYP-CD";
    DBTableName = "TCLIU";
    SType = "Selection";
    Label = "Level of Underwriting";
  }

  INOUT MIR-OTHR-STCKR-ID
  {
    Length = "11";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Other Sticker Number";
  }

  INOUT MIR-UW-UPLD-IND
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Underwriting Upload Indicator";
  }

  INOUT MIR-UW-UPLD-DT
  {
    Length = "10";
    DBTableName = "TCLIU";
    SType = "Date";
    Label = "Underwriting Upload Date";
  }

  INOUT MIR-DEFIC-IND
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Deficiency Indicator";
  }

  INOUT MIR-OWNR-REL-INSR-CD
  {
    Mandatory;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "OWNR-REL-INSR-CD";
    DBTableName = "TCLIU";
    SType = "Selection";
    Label = "Relationship of Insured to Policy Owner";
  }

  INOUT MIR-PRE-UWG-IND
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Underwriting before Physical Exam";
  }

  INOUT MIR-SPCL-NOTE-SD-IND
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Special Notes of Self-Disclosure Form";
  }

  INOUT MIR-DV-CLI-NM
  {
    Length = "75";
    DBTableName = "TCLI";
    SType = "Text";
    Label = "Client Name";
  }
   
  INOUT MIR-CLI-LNB-IND
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Living Needs Benefits";
  }
   
  INOUT MIR-CLI-TCB-IND
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Terminal Care Benefits";
  }

#MP4801
  INOUT MIR-SUBST-CLMT-IND
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Substitute Claimant Rider";
  }

  INOUT MIR-CNVR-ORIG-DB-AMT
  {
    Signed;
    Length = "19";
    DBTableName = "TCLIU";
    SType = "Currency";
    Label = "Pre-Conversion Original Death Benefit Amount";
  }

  INOUT MIR-CNVR-ORIG-HOSP-AMT
  {
    Signed;
    Length = "19";
    DBTableName = "TCLIU";
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
#M245B2 CHANGES START HERE   
  INOUT MIR-POL-CRCY-CD
     {
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
   }
#M245B2 CHANGES END HERE    

}
