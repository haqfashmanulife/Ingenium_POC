# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9520-P.p                                                    *
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
 
P-STEP BF9520-P
{
 
 ATTRIBUTES
 {
  BusinessFunctionId = "9520";
  BusinessFunctionName = "Inquiry - Client Coverage Relationship";
  BusinessFunctionType = "Retrieve";
  MirName = "CCWM9520";
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

 IN MIR-CLI-ID
 {
     Key;
     Length = "10";
     DBTableName = "TCLI";
     DefaultSession = "MIR-CLI-ID";
   # DefaultSession = "";
     SType = "Text";
     Label = "Client Id";
 }

 OUT MIR-DV-OWN-CLI-NM
 {
     Length = "75";
     DBTableName = "Derived";
     SType = "Text";
     Label = "Owner Name";
 }

 OUT MIR-POL-CVG-REC-CTR
 {
     Length = "2";
     DBTableName = "TPOL";
     SType = "Text";
     Label = "Number of Coverages";
 }

 OUT MIR-POL-CSTAT-CD
 {
     Length = "4";
     CodeSource = "DataModel";
     CodeType = "POL-CSTAT-CD";
     DBTableName = "TPOL";
     SType = "Text";
     Label = "Policy Status";
 }
 #TDMG24 CHANGES START HERE
 OUT MIR-PREM-PMT-CMPLT-IND
 {
 
     Length = "1";
     DBTableName = "TPOL";
     SType = "Indicator";
     Label = "Base Policy Premium Payment Completion";
 
 }    
#TDMG24 CHANGES END HERE    

 OUT MIR-SBSDRY-CO-ID
 {
     Length = "2";
     CodeSource = "EDIT";
     CodeType = "SUBCO";
     DBTableName = "TPOL";
     SType = "Text";
     Label = "Sub Company";
 }

 OUT MIR-CLI-ID-T[100]
 {
     Length = "10";
     FieldGroup = "Table100";
     Index = "1";
     DBTableName = "TCVGC";
     SType = "Text";
     Label = "Insured Id";
 }

 OUT MIR-DV-INSRD-CLI-NM-T[100]
 {
     Length = "75";
     FieldGroup = "Table100";
     Index = "1";
     DBTableName = "Derived";
     SType = "Text";
     Label = "Insured Name";
 }

 OUT MIR-CVG-NUM-T[100]
 {
     Length = "2";
     FieldGroup = "Table100";
     Index = "1";
     DBTableName = "TCVGC";
     SType = "Text";
     Label = "Coverage Number";
 }

 OUT MIR-PLAN-ID-T[100]
 {
     Length = "6";
     FieldGroup = "Table100";
     Index = "1";
     DBTableName = "TCVG";
     SType = "Text";
     Label = "Product Name";
 }

}
