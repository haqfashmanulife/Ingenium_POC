# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*******************************************************************************
#*  Component:   BF9520-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01PR11  CSS      New for MCL                                               *
#*  P00768  CLB      Correct DefaultSession for MIR-CLI-ID.                    *
#*                                                                             *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*******************************************************************************
 
S-STEP BF9520-O
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

  IN MIR-POL-ID-BASE 
  {
    Key;
    DisplayOnly;
    Length = "9";
    DefaultSession = "MIR-POL-ID-BASE";
    SType = "Text";
    Label = "Policy Id";
  }

  IN MIR-POL-ID-SFX 
  {
    Key;
    DisplayOnly;
    Length = "1";
    DefaultSession = "MIR-POL-ID-SFX";
    SType = "Text";
    Label = "Suffix";
  }

  IN MIR-CLI-ID 
  {
    Key;
    DisplayOnly;
    Length = "10";
    DefaultSession = "MIR-CLI-ID";
  # DefaultSession;
    SType = "Text";
    Label = "Client Id";
  }

  IN MIR-DV-OWN-CLI-NM 
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Owner Name";
  }

  IN MIR-POL-CVG-REC-CTR 
  {
    DisplayOnly;
    Length = "2";
    SType = "Text";
    Label = "Number of Coverages";
  }

  IN MIR-POL-CSTAT-CD 
  {
    DisplayOnly;
    Length = "4";
    CodeSource = "DataModel";
    CodeType = "POL-CSTAT-CD";
    SType = "Text";
    Label = "Policy Status";
  }
  
  #TDMG24 CHANGES START HERE
          IN MIR-PREM-PMT-CMPLT-IND
          {
              DisplayOnly;
              Length = "1";
              SType = "Indicator";
              Label = "Base Policy Premium Payment Completion";
      
          }    
  #TDMG24 CHANGES END HERE    


  IN MIR-SBSDRY-CO-ID 
  {
    DisplayOnly;
    Length = "2";
    CodeSource = "EDIT";
    CodeType = "SUBCO";
    SType = "Text";
    Label = "Sub Company";
  }

  IN MIR-CLI-ID-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table100";
    Index = "1";
    SType = "Text";
    Label = "Insured Id";
  }

  IN MIR-DV-INSRD-CLI-NM-T[100] 
  {
    DisplayOnly;
    Length = "75";
    FieldGroup = "Table100";
    Index = "1";
    SType = "Text";
    Label = "Insured Name";
  }

  IN MIR-CVG-NUM-T[100] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table100";
    Index = "1";
    SType = "Text";
    Label = "Coverage Number";
  }

  IN MIR-PLAN-ID-T[100] 
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    FieldGroup = "Table100";
    Index = "1";
    SType = "Text";
    Label = "Product Name";
  }
}
