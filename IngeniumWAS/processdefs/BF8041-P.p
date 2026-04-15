# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8041-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB01  GW       New CLIU return info. for new App. entry flow.            *
#*  B00243  VAN      Change Pre-Underwriting Indicator                         *
#*  B00243           TO Underwriting before physical exam                      *
#*  B00107  VAN      CHANGE Relationship of owner to insured                   *
#*  B00107           TO Relationship of insured to policy owner                *
#*  B00623  WBP      Add Living Needs Benefit                                  *
#*  1CNB02  EKM      ADD MIR-CNVR-ORIG-DB-AMT & MIR-CNVR-ORIG-HOSP-AMT         *
#*  CR116C  FB       ADD RCLIU-CLI-TCB-IND                                     *
#*  MP4802  CTS      ADD RCLIU-SUBST-CLMT-IND                                  *
#*  IPCACS  CTS      ADD MIR-DV-CLI-KJ-NM , MIR-CLI-SEX-CD ,MIR-POL-CSTAT-CD   *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF8041-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8041";
        BusinessFunctionName = "Policy Insured's List";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM8041";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-CLI-BTH-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "BirthDate";
        Index = "1";
    }

    INOUT MIR-DV-CLI-NM-T[20]
    {
        Length = "75";
        FieldGroup = "Table50";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
        Index = "1";
    }

# IPCACS STARTS HERE

    INOUT MIR-DV-CLI-KJ-NM-T[20]
    {
        Length = "60";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Kanji Name";
        Index= "1";
    }

    INOUT MIR-CLI-SEX-CD-T[20]
    {
        Length = "01";
        FieldGroup = "Table20";
        DBTableName = "TCLI";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    INOUT MIR-POL-CSTAT-CD
    {
       DisplayOnly;
       DBTableName = "TPOL";
       Length = "40";
       CodeSource = "DataModel";
       CodeType = "POL-CSTAT-CD";
       SType = "Text";
       Label = "Policy Status";
    }

# IPCACS ENDS HERE

    INOUT MIR-DV-POL-INSRD-QTY
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of insured clients returned";
    }

    INOUT MIR-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table50";
        KeyColumn;
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client ID";
        Index = "1";
    }

    INOUT MIR-PLAN-UWG-IND-T[20]
    {
        Length = "40";
        FieldGroup = "Table50";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Underwriting Required";
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
      Length = "19";
      DBTableName = "TCLIU";
      FieldGroup = "Table20";
      Index = "1";
      SType = "Currency";
      Label = "Pre-Conversion Original Death Benefit Amount";
    }

    INOUT MIR-CNVR-ORIG-HOSP-AMT-T[20]
    {
      Length = "19";
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

