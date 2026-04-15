# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:12 PM EDT

#*********************************************************************************
#*B00243   CHANGE Pre-Underwriting Indicator TO Underwriting before physical exam*
#*B00107   CHANGE Relationship of owner to insured                               *
#*B00107   TO Relationship of insured to policy owner                            *
#*B00383   ADD RCLIU-CLI-LNB-IND                                                 *
#*1CNB02   ADD MIR-CNVR-ORIG-DB-AMT & MIR-CNVR-ORIG-HOSP-AMT                     *
#*CR116C   ADD RCLIU-CLI-TCB-IND                                                 *
#*P01161   REDUCE LENGTH OF CONVERSION FIELDS                                    *
#*MP4802   ADD RCLIU-SUBST-CLMT-IND                                              *
#*M245B2   Foreign Currency Formatting 			                         *
#*********************************************************************************                                                                                  

S-STEP AppInsuredListL-O
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

  IN MIR-DV-POL-INSRD-QTY 
  {
    DisplayOnly;
    Length = "2";
    SType = "Text";
    Label = "Number of insured clients returned";
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

  IN MIR-DV-CLI-NM-T[20] 
  {
    DisplayOnly;
    Length = "75";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Text";
    Label = "Client Name";
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

  IN MIR-OWNR-REL-INSR-CD-T[20] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table20";
    Index = "1";
    CodeSource = "DataModel";
    CodeType = "OWNR-REL-INSR-CD";
    SType = "Text";
    Label = "Relationship of Insured to Policy Owner";
  }

  IN MIR-UW-UPLD-IND-T[20] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Indicator";
    Label = "Underwriting Upload Indicator";
  }

  IN MIR-UW-UPLD-DT-T[20] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Date";
    Label = "Underwriting Upload Date";
  }

  IN MIR-DEFIC-IND-T[20] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Indicator";
    Label = "Deficiency Indicator";
  }

  IN MIR-PRE-UWG-IND-T[20] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Indicator";
    Label = "Underwriting before Physical Exam";
  }

  IN MIR-SPCL-NOTE-SD-IND-T[20] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Indicator";
    Label = "Special Notes of Self-Disclosure Form";
  }
   
  IN MIR-CLI-LNB-IND-T[20] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Indicator";
    Label = "Living Needs Benefits";
  }
       
   
  IN MIR-CLI-TCB-IND-T[20] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Indicator";
    Label = "Terminal Care Benefits";
  }

# MP4802 STARTS HERE
  IN MIR-SUBST-CLMT-IND-T[20] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Indicator";
    Label = "Substitute Claimant Rider Indicator";
  }
# MP4802 ENDS HERE

  IN MIR-CNVR-ORIG-DB-AMT-T[20]
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Length = "17";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Currency";
    Label = "Pre-Conversion Original Death Benefit Amount";
  }

  IN MIR-CNVR-ORIG-HOSP-AMT-T[20]
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Length = "17";
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
