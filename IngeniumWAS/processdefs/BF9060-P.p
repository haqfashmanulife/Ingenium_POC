# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:57 PM EDT

#*******************************************************************************
#*  Component:   BF9060-P.p                                                    *
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
#*  CR096A  SG       Add MID-CVG-PKG-CD                                        *
#*  MFFFU4  ACR      ADD OWN-INV-XPER-IND, AGT-XPER-CD, VERIF-MTHD-CD          *
#*  MP4801  CTS      ADD RCLIU-SUBST-CLMT-IND                                  *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP300A  CTS      ADD RCLIU-UW-FORM-RECV-CD                                 *
#*******************************************************************************
 
P-STEP BF9060-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9060";
    BusinessFunctionName = "Client Application Details Retrieve";
    BusinessFunctionType = "Retrieve";
    MirName = "NCWM9060";
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


  OUT MIR-UW-TYP-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "UW-TYP-CD";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Level of Underwriting";
  }

  OUT MIR-OTHR-STCKR-ID
  {
    Length = "11";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Other Sticker Number";
  }

  OUT MIR-UW-UPLD-IND
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Underwriting Upload Indicator";
  }

  OUT MIR-UW-UPLD-DT
  {
    Length = "10";
    DBTableName = "TCLIU";
    SType = "Date";
    Label = "Underwriting Upload Date";
  }

  OUT MIR-DEFIC-IND
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Deficiency Indicator";
  }

  OUT MIR-OWNR-REL-INSR-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "OWNR-REL-INSR-CD";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Relationship of Insured to Policy Owner";
  }

  OUT MIR-PRE-UWG-IND
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Underwriting before Physical Exam";
  }

  OUT MIR-SPCL-NOTE-SD-IND
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Special Notes of Self-Disclosure Form";
  }

  OUT MIR-DV-CLI-NM
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
  

  OUT MIR-CVG-PKG-CD
  {
    Length = "3";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Rider Package Code";
  }

#MP4801
  INOUT MIR-SUBST-CLMT-IND
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Substitute Claimant Rider";
  }
  OUT MIR-CNVR-ORIG-DB-AMT
  {
    Signed;
    Length = "19";
    DBTableName = "TCLIU";
    SType = "Currency";
    Label = "Conversion Original Death Benefit Amount";
  }

  OUT MIR-CNVR-ORIG-HOSP-AMT
  {
    Signed;
    Length = "19";
    DBTableName = "TCLIU";
    SType = "Currency";
    Label = "Conversion Original Hospitalization Amount";
  }

  OUT MIR-OWN-INV-XPER-IND
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "OWN-INV-XPER-CD";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Does the policyholder have Investment Experience?";
  }

  OUT MIR-AGT-XPER-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "AGT-XPER-CD";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Sales Rep Experience";
  }

  OUT MIR-VERIF-MTHD-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "VERIF-MTHD-CD";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "What method was used?";
  }
#MP300A CHANGES START HERE 
  OUT MIR-UW-FORM-RECV-CD
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "ETC Status";
  }
#MP300A CHANGES END HERE
#M245B2 CHANGES START HERE   
  INOUT MIR-POL-CRCY-CD
     {
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
   }
#M245B2 CHANGES END HERE 
}

