# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9361-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MFPFU7  AC       New                                                       *
#*  5-0039  AC       Changed MIR-FND-UNIT-VALU-T from 9 decimal places to 4    *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         * 
#*  Q25506  CTS      CHANGES FOR VIRTUAL UNDO                                  *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************
 
P-STEP BF9361-P
{
 
 ATTRIBUTES
 {
  BusinessFunctionId = "9361";
  BusinessFunctionName = "Policy Inquiry - Fund Values";
  BusinessFunctionType = "TabSurVal";
  MirName = "CCWM9361";
 }

 
 OUT LSIR-RETURN-CD;
    
 OUT MIR-RETRN-CD;

 INOUT MIR-APPL-CTL-PRCES-DT
 {
     Key;
     Length = "10";
     DBTableName = "TMAST";
     DefaultSession = "LSIR-PRCES-DT";
     SType = "Date";
     Label = "Process Date";
 }

 INOUT MIR-POL-ID-BASE
 {
     Key;
     Mandatory;
     Length = "9";
     DBTableName = "TPOL";
     DefaultSession = "MIR-POL-ID-BASE";
     SType = "Text";
     Label = "Policy Id";
 }

 INOUT MIR-POL-ID-SFX
 {
     Key;
     Length = "1";
     DBTableName = "TPOL";
     DefaultSession = "MIR-POL-ID-SFX";
     SType = "Text";
     Label = "Suffix";
 }

 INOUT MIR-CVG-NUM
 {
     Length = "2";
     DBTableName = "TCVG";
     SType = "Text";
     Label = "Coverage Number";
 }

 IN  MIR-CVG-SURRCHRG
 {
     SType = "Hidden";
 }

 OUT MIR-FND-ID-T[25]
 {
     Length = "6";
     FieldGroup = "Table50";
     Index = "1";
     CodeSource = "EDIT";
     CodeType = "SEGFD";
     DBTableName = "TFV";
     SType = "Text";
     Label = "Fund";
 }

  OUT MIR-FND-UNIT-QTY-T[25]
  {
    Signed;
    Length = "17";
    Decimals = "4";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Number";
    Label = "Fund Unit Balance";
  }

  OUT MIR-FND-UNIT-VALU-T[25]
  {
    Signed;
    Length = "17";
    Decimals = "9";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Fund Unit Price";
  }

 OUT MIR-FND-ACUM-VAL-T[25]
 {
     Signed;
     Length = "17";
     FieldGroup = "Table50";
     Index = "1";
     DBTableName = "TCFLW";
     SType = "Currency";
     Label = "Accumulated Fund Value";
 }

 OUT MIR-FND-SURRCHRG-T[25]
 {
     Signed;
     Length = "17";
     FieldGroup = "Table50";
     Index = "1";
     DBTableName = "TCFLW";
     SType = "Currency";
     Label = "Surrender Charge";
 }

 OUT MIR-FND-NET-VAL-T[25]
 {
     Signed;
     Length = "17";
     FieldGroup = "Table50";
     Index = "1";
     DBTableName = "TCFLW";
     SType = "Currency";
     Label = "Net Fund Value";
 }

# ISLADM - Changes start here     
  OUT MIR-SURR-FORM-ACPT-DT
  { 
      Length = "10";
      DBTableName = "TPOL";        
      SType = "Date";
      Label = "Surrender Request Form Acceptance Date";
  }
  
  OUT MIR-ASIGN-SURR-EFF-DT
  { 
      Length = "10";
      DBTableName = "TPOL";                
      SType = "Date";
      Label = "Assigned Surrender Effective Date for Policy with Assignee";
  }
  
  OUT MIR-POL-STEP-IN-RIGHT-IND
  { 
      Length = "1";
      DBTableName = "TPOL";                
      SType = "Indicator";
      Label = "Policy with Step-In Right";
  }    
# ISLADM - Changes end here
#Q25506 CHANGES STARTS HERE
   IN MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        DBTableName = "Derived";
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
