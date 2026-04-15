# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:57 PM EDT

#*******************************************************************************
#*  Component:   BF9054-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB05  CSS      New for MCL                                               *
#*  B00074  DPK      Added Policy Prefix                                       *
#*  HNB403  HIN/AI   LINC UPLOAD CHANGES (Add Hosp & DB Amounts)               *
#*  M119NB  CTS      ADDED FLAG FOR AGGREGATE FACE AMOUNT FOR THE INSURED UNDER*
#*                   15 YEARS OLD EXCEEDING 10 MILLION YEN 		       *
#*******************************************************************************
 
P-STEP BF9054-P
{
 
 ATTRIBUTES
 {
  BusinessFunctionId = "9054";
  BusinessFunctionName = "LINC List";
  BusinessFunctionType = "List";
  MirName = "NCWM9054";
 }
 
 OUT LSIR-RETURN-CD;
    
 OUT MIR-RETRN-CD;

 INOUT MIR-CLI-ID 
 {
  Key;
  Mandatory;
  Length = "10";
  DBTableName = "TLINC";
  SType = "Text";
  Label = "Client Number";
 }

 INOUT MIR-POL-ID-BASE 
 {
  Key;
  Length = "10";
  DBTableName = "TLINC";
  SType = "Text";
  Label = "Policy ID";
 }

 IN MIR-POL-ID-SFX
  {
  Key;
  Length = "1";
  DBTableName = "TLINC";
  SType = "Text";
  Label = "Suffix";
 }
  
 OUT MIR-DV-CLI-NM
 {
  Length = "75";
  DBTableName = "Derived";
  SType = "Text";
  Label = "Client Name";
 }

 OUT MIR-CLI-ID-T[12]
 {
  Length = "10";
  FieldGroup = "Table12";
  Index = "1";
  DBTableName = "TLINC";
  SType = "Text";
  Label = "Client Number";
 }

 OUT MIR-POL-ID-T[12]
 {
  Length = "10";
  FieldGroup = "Table12";
  Index = "1";
  DBTableName = "TLINC";
  SType = "Text";
  Label = "Policy Number";
 }

 OUT MIR-LINC-REG-ID-T[12]
 {
  Length = "12";
  FieldGroup = "Table12";
  Index = "1";
  DBTableName = "TLINC";
  SType = "Text";
  Label = "Registration Number";
 }
 
 OUT MIR-LINC-REG-DT-T[12]
 {
  Length = "10";
  FieldGroup = "Table12";
  Index = "1";
  DBTableName = "TLINC";
  SType = "Text";
  Label = "Registration Date";
 }
 
 OUT MIR-LINC-TOT-HOSP-AMT-T[12]
 {
  Length = "06";
  FieldGroup = "Table12";
  Index = "1";
  DBTableName = "TLINC";
  SType = "Currency";
  Label = "Total Hospitalization";
 }

 OUT MIR-LINC-TOT-DB-AMT-T[12]
 {
  Length = "11";
  FieldGroup = "Table12";
  Index = "1";
  DBTableName = "TLINC";
  SType = "Currency";
  Label = "Total Death Benefit";
 }
#M119NB CHANGES STARTS HERE
 OUT MIR-LINC-AGGR-FACE-AMT-IND-T[12]
 {
  Length = "01";
  FieldGroup = "Table12";
  Index = "1";
  DBTableName = "TLINC";
  SType = "Indicator";
  Label = "Aggregate Face Amount LINC Indicator for Insured below 15 years";
 }
}
