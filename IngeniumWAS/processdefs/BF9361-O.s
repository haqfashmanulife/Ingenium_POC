# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*******************************************************************************
#*  Component:   BF9361-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MFPFU7  AC       New                                                       *
#*  5-0039  AC       Changed MIR-FND-UNIT-VALU-T from 9 decimal places to 4    *
#*  MP5002  CTS      ADD FLEXFUND SURRENDER CHARGE TYPE                        *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*  Q25506  CTS      CHANGES FOR VIRTUAL UNDO                                  *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************
 
S-STEP BF9361-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "TabSurVal";
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

  IN MIR-APPL-CTL-PRCES-DT 
  {
    Key;
    DisplayOnly;
    Length = "10";
    DefaultSession = "LSIR-PRCES-DT";
    SType = "Date";
    Label = "Process Date";
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

  IN MIR-SBSDRY-CO-ID 
  {
    DisplayOnly;
    Length = "2";
    CodeSource = "EDIT";
    CodeType = "SUBCO";
    SType = "Text";
    Label = "Sub Company";
  }

  IN MIR-DV-OWN-CLI-NM 
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Owner Name";
  }

  IN MIR-CVG-NUM
  {
    Key;
    DisplayOnly;
    Length = "2";
    SType = "Text";
    Label = "Coverage Number";
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

  IN MIR-FND-ID-T[25]
  {
     DisplayOnly;
     Length = "5";
     FieldGroup = "Table25";
     KeyColumn;
     CodeSource = "EDIT";
     CodeType = "SEGFD";
     SType = "Text";
     Label = "Fund";
     Index = "1";
  }
     
  IN MIR-FND-UNIT-QTY-T[25] 
  {
    DisplayOnly;
    Signed;
    Length = "17";
    Decimals = "4";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Number";
    Label = "Fund Unit Balance";
  }

  IN MIR-FND-UNIT-VALU-T[25] 
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE  
    DisplayOnly;
    Signed;
    Length = "17";
    Decimals = "9";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Fund Unit Price";
  }

  IN MIR-FND-ACUM-VAL-T[25] 
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Accumulated Fund Value Amount";
  }

  IN MIR-FND-SURRCHRG-T[25] 
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Surrender Charge";
  }

  IN MIR-FND-NET-VAL-T[25] 
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Net Fund Value";
  }
#MP5002  
  IN MIR-SURR-CHRG-TYP-CD 
    {
      Key;
      DisplayOnly;
      Length = "1";
      CodeSource = "EDIT";
      CodeType = "MVAL";
      DBTableName = "TPOL";
      SType = "Text";
      Label = "FlexFund Surrender Charge type";
    }

# ISLADM - Changes start here     
  IN MIR-SURR-FORM-ACPT-DT
  { 
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Surrender Request Form Acceptance Date";
  }
  
  IN MIR-ASIGN-SURR-EFF-DT
  { 
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Assigned Surrender Effective Date for Policy with Assignee";
  }
  
  IN MIR-POL-STEP-IN-RIGHT-IND
  { 
      DisplayOnly;
      Length = "1";
      SType = "Indicator";
      Label = "Policy with Step-In Right";
  }    
# ISLADM - Changes end here
#Q25506 CHANGES STARTS HERE
   IN MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Undo Indicator";
    }
#Q25506 CHANGES ENDS HERE    
#M245B2 CHANGES START HERE 
   INOUT MIR-POL-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        }  
 #M245B2 CHANGES END HERE        
}
