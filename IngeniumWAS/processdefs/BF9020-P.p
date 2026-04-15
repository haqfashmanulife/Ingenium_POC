# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT

#*******************************************************************************
#*  Component:   BF9020-P.p                                                    *
#*  Description: New Sales Office Inquiry Screen                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* 01CP02    6.1     New for release 6.1                                       *
#* B00526    VAN     ADD BRANCH ID AS KEY FIELD TO SALE TABLE                  *
#*******************************************************************************
 
P-STEP BF9020-P
{
 
 ATTRIBUTES
 {
  BusinessFunctionId = "9020";
  BusinessFunctionName = "Sales Office Detail Retrieve";
  BusinessFunctionType = "Retrieve";
  MirName = "CCWM9020";
 }
 


 
 OUT LSIR-RETURN-CD;
 OUT MIR-RETRN-CD;

 IN MIR-SO-ID 
 {
  Key;
  Mandatory;
  Length = "5";
  CodeSource = "XTAB";
  CodeType = "SALE";
  DBTableName = "TSALE";
  SType = "Selection";
  Label = "Sales Office Number";
 }

 IN MIR-BR-ID 
 {
  Key;
  Mandatory;
  Length = "5";
  CodeSource = "XTAB";
  CodeType = "BRCH";
  DBTableName = "TSALE";
  SType = "Selection";
  Label = "Branch Number";
 }

 OUT MIR-CLI-ADDR-TYP-CD
 {
  Length = "40";
  CodeSource = "EDIT";
  CodeType = "ADTYP";
  DBTableName = "TSALE";
  SType = "Text";
  Label = "Address Type";
 }

 OUT MIR-CLI-ID
 {
  Length = "10";
  DBTableName = "TSALE";
  SType = "Text";
  Label = "Client Number";
 }

 OUT MIR-DV-CLI-NM
 {
  Length = "75";
  DBTableName = "Derived";
  SType = "Text";
  Label = "Client Name";
 }
}
