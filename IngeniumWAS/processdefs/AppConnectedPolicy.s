# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppConnectedPolicy.s                                          *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02PR62  DPK      New Screen                                                *
#*                                                                             *
#*  M142S1  CTS      CHANGES TO HANDLE SPLIT POLICY                            *
#*******************************************************************************
S-STEP AppConnectedPolicy
{
  ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        DelEmptyRows;
        FocusField = "MIR-POL-APP-FORM-ID";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    IN BannerBar;

    IN BannerBarSize;

    IN BannerProductID
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
    }

    IN BannerPolicyID;

    IN BannerPrimaryInsured;
     
    IN MIR-POL-ID-BASE;

    IN MIR-POL-ID-SFX;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }


  IN MIR-CVG-NUM-T[20]
  {
    Length = "2";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Hidden";
    Label = "Coverage Number";
  }
   
  IN MIR-PLAN-ID-T[20]
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table20";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Product";
  }
   
  INOUT MIR-CONN-CVG-NUM-T[20]
  {
      Length = "2";
      Index = "1";
      FieldGroup = "Table20";
      SType = "Text";
      Label = "Connected Coverage Number";
  }

  INOUT MIR-CONN-POL-ID-T[20]
  {
      Length = "10";
      Index = "1";
      FieldGroup = "Table20";
      SType = "Text";
      Label = "Connected Policy Number";
  }

  INOUT MIR-CVG-CONN-REASN-CD-T[20]
  {
      Length = "40";
      Index = "1";
      FieldGroup = "Table20";
      CodeSource = "DataModel";
      CodeType = "CVG-CONN-REASN-CD";
      SType = "Selection";
      Label = "Connected Policy Reason";
  }

# M142S1 CHANGES START

  INOUT MIR-POL-CONN-REL-CD
  {
      Length = "40";
      CodeSource = "DataModel";
      CodeType = "OWNR-REL-INSR-CD";
      SType = "Selection";
      Label = "Relationship of Pre-Split/Joint Policyholder to Post-Split/Single Policyholder";
  }

# M142S1 CHANGES END

}
