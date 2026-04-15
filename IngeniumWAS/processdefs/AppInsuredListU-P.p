# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:15 PM EDT

#*******************************************************************************
#*  Component:   AppInsuredListU-P.p                                           *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB01  GW      New for MCL                                                *
#*  B00243  VAN     Change Pre-Underwriting Indicator                          *
#*  B00243          TO Underwriting before physical exam                       *
#*  B00107  VAN     CHANGE Relationship of owner to insured                    *
#*  B00107          TO Relationship of insured to policy owner                 *
#*  B00383  VAN     ADD RCLIU-CLI-LNB-IND                                      *
#*  1CNB02  EKM     ADD MIR-CNVR-ORIG-DB-AMT & MIR-CNVR-ORIG-HOSP-AMT          *
#*  CR116C  FB      ADD RCLIU-CLI-TCB-IND                                      *
#*  P01161  AT      REDUCE LENGTH OF CONVERSION FIELDS                         *
#*  MFFFU4  ACR      UW changes for funds project; new out fields to pass info *
#*                   to new step (AppInsuredFTJUL) in calling flow             *
#*  MP4802  CTS     ADD RCLIU-SUBST-CLMT-IND                                   *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************
 
P-STEP AppInsuredListU-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9065";
    BusinessFunctionName = "List of Insureds on this Application";
    BusinessFunctionType = "Update";
    MirName = "NCWM9065";
  }
  

  
  OUT LSIR-RETURN-CD;
  
  OUT MIR-RETRN-CD;

  OUT MIR-OWN-STCKR-ID
    {
        SType = "Hidden";
    }
  OUT MIR-OWN-CLI-ID
    {
        SType = "Hidden";
    }
  OUT MIR-EFF-DT
    {
        SType = "Hidden";
    }
  OUT MIR-OWN-CLI-NM
    {
        SType = "Hidden";
    }
  OUT MIR-SKIP-UW-IND
    {
        SType = "Hidden";
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

  INOUT MIR-DV-POL-INSRD-QTY
  {
      Length = "2";
      DBTableName = "Derived";
      SType = "Text";
      Label = "Number of insured clients returned";
  }

  INOUT MIR-CLI-ID-T[20]
  {
    Mandatory;
    Length = "10";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Client ID";
    FieldGroup = "Table20";
    Index = "1";
  }

  INOUT MIR-DV-CLI-NM-T[20]
  {
    DisplayOnly;
    Length = "75";
    DBTableName = "TCLI";
    SType = "Text";
    Label = "Client Name";
    FieldGroup = "Table20";
    Index = "1";
  }

  INOUT MIR-STCKR-ID-T[20]
  {
    Mandatory;
    Length = "11";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Sticker Number";
    FieldGroup = "Table20";
    Index = "1";
  }

  INOUT MIR-UW-TYP-CD-T[20]
  {
    Mandatory;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "UW-TYP-CD";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Level of Underwriting";
    CodeSource = "DataModel";
    SType = "Selection";
    FieldGroup = "Table20";
    Index = "1";
  }

  INOUT MIR-OWNR-REL-INSR-CD-T[20]
  {
    Mandatory;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "OWNR-REL-INSR-CD";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Relationship of Insured to Policy Owner";
    CodeSource = "DataModel";
    SType = "Selection";
    FieldGroup = "Table20";
    Index = "1";
  }

  INOUT MIR-UW-UPLD-IND-T[20]
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Underwriting Upload Indicator";
    FieldGroup = "Table20";
    Index = "1";
  }

  INOUT MIR-UW-UPLD-DT-T[20]
  {
    Length = "10";
    DBTableName = "TCLIU";
    SType = "Date";
    Label = "Underwriting Upload Date";
    FieldGroup = "Table20";
    Index = "1";
  }

  INOUT MIR-DEFIC-IND-T[20]
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Deficiency Indicator";
    FieldGroup = "Table20";
    Index = "1";
  }

  INOUT MIR-PRE-UWG-IND-T[20]
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Underwriting before Physical Exam";
    FieldGroup = "Table20";
    Index = "1";
  }

  INOUT MIR-SPCL-NOTE-SD-IND-T[20]
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Special Notes of Self-Disclosure Form";
    FieldGroup = "Table20";
    Index = "1";
  }
   
  INOUT MIR-CLI-LNB-IND-T[20]
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Living Needs Benefits";
    FieldGroup = "Table20";
    Index = "1";
  }
   
  INOUT MIR-CLI-TCB-IND-T[20]
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Terminal Care Benefits";
    FieldGroup = "Table20";
    Index = "1";
  }

# MP4802 STARTS HERE
#  INOUT MIR-CLI-TCB-IND-T[20]
#  {
#    Length = "1";
#    DBTableName = "TCLIU";
#    SType = "Indicator";
#    Label = "Terminal Care Benefits";
#    FieldGroup = "Table20";
#    Index = "1";
#  }

  INOUT MIR-SUBST-CLMT-IND-T[20]
  {
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Indicator";
    Label = "Substitute Claimant Rider Indicator";
    FieldGroup = "Table20";
    Index = "1";
  } 
# MP4802 ENDS HERE

  INOUT MIR-CNVR-ORIG-DB-AMT-T[20]
  {
    Length = "17";
    DBTableName = "TCLIU";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Currency";
    Label = "Pre-Conversion Original Death Benefit Amount";
  }

  INOUT MIR-CNVR-ORIG-HOSP-AMT-T[20]
  {
    Length = "17";
    DBTableName = "TCLIU";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Currency";
    Label = "Pre-Conversion Original Hospitalization Amount";
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

