# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT

#*******************************************************************************
#*  Component:   BF9050-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB05  CSS      New for MCL                                               *
#*  B00074  DPK      Added Policy Prefix                                       *
#*  HNB403  HIN/AI   LINC UPLOAD CHANGES (Add Hosp & DB Amounts)               *
#*  M119NB  CTS      ADDED FLAG FOR AGGREGATE FACE AMOUNT FOR THE INSURED UNDER*
#*                   15 YEARS OLD EXCEEDING 10 MILLION YEN 		               *
#*  27676A  CTS      CHANGES DONE FOR LINC ITEMS AND TIMES                     *
#*******************************************************************************
 
P-STEP BF9050-P
{
 
 ATTRIBUTES
 {
  BusinessFunctionId = "9050";
  BusinessFunctionName = "LINC Inquiry";
  BusinessFunctionType = "Retrieve";
  MirName = "NCWM9050";
 }

 
 OUT LSIR-RETURN-CD;
 OUT MIR-RETRN-CD;

 IN MIR-CLI-ID 
 {
  Key;
  Mandatory;
  Length = "10";
  DBTableName = "TLINC";
  SType = "Text";
  Label = "Client Number";
 }

 IN MIR-POL-ID-BASE 
 {
  Key;
  Mandatory;
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

 OUT MIR-LINC-REG-ID
 {
  Length = "12";
  DBTableName = "TLINC";
  SType = "Text";
  Label = "Registration Number";
 }

 OUT MIR-LINC-REG-DT
 {
  Length = "10";
  DBTableName = "TLINC";
  SType = "Text";
  Label = "Registration Date";
 }
 
 OUT MIR-LINC-TOT-HOSP-AMT
 {
  Length = "07";
  DBTableName = "TLINC";
  SType = "Currency";
  Label = "Total Hospitalization";
 }
 
 OUT MIR-LINC-TOT-DB-AMT
 {
  Length = "11";
  DBTableName = "TLINC";
  SType = "Currency";
  Label = "Total Death Benefit";
 }

 OUT MIR-DV-CLI-NM
 {
  Length = "75";
  DBTableName = "Derived";
  SType = "Text";
  Label = "Client Name";
 }
#27676A CHANGES START HERE
 OUT MIR-TOT-HOSP-BNFT-AMT 
 {
  Length = "17";
  DBTableName = "TLINC";
  SType = "Currency";
  Label = "Total Hospitalization LumpSum Benefit";
 }
 OUT MIR-TOT-MEDIC-BNFT-QTY 
 {
  Length = "02";
  DBTableName = "TLINC";
  SType = "TEXT";
  Label = "Total Advanced Medical Benefit Count";
 }
 OUT MIR-TOT-CNCR-BNFT-AMT 
 {
  Length = "17";
  DBTableName = "TLINC";
  SType = "Currency";
  Label = "Total Cancer LumpSum benefit";
 }
 OUT MIR-TOT-IP-BNFT-AMT 
 {
  Length = "17";
  DBTableName = "TLINC";
  SType = "Currency";
  Label = "Total Living Income Protection Monthly Benefit";
 }
 OUT MIR-TOT-AD-BNFT-AMT 
 {
  Length = "17";
  DBTableName = "TLINC";
  SType = "Currency";
  Label = "Total Accidental Death Face Amount";
 }
#27676A CHANGES ENDS HERE
#M119NB CHANGES STARTS HERE
 OUT MIR-LINC-AGGR-FACE-AMT-IND
 {
  Length = "1";
  DBTableName = "TLINC";
  SType = "Indicator";
  Label = "Aggregate Face Amount LINC Indicator for Insured below 15 years";
 }
}
