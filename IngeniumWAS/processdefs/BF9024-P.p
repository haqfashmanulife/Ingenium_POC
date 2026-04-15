# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT

#*******************************************************************************
#*  Component:   BF9024-P.p                                                    *
#*  Description: New Sales Office List Screen                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01CP02     6.1   New for Release 6.1                                       *
#*  B00526     VAN   ADD BRANCH ID AS KEY FIELD TO SALE OFFICE                 *
#*******************************************************************************
 
P-STEP BF9024-P
{
 
 ATTRIBUTES
 {
  BusinessFunctionId = "9024";
  BusinessFunctionName = "Sales Office Detail List";
  BusinessFunctionType = "List";
  MirName = "CCWM9024";
 }
 


 
 OUT LSIR-RETURN-CD;
 OUT MIR-RETRN-CD;

 INOUT MIR-SO-ID 
 {
  Key;
  Length = "5";
  CodeSource = "XTAB";
  CodeType = "SALE";
  DBTableName = "TSALE";
  SType = "Selection";
  Label = "Sales Office Number";
 }

 OUT MIR-SO-ID-T[12]
 {
  Length = "5";
  FieldGroup = "Table12";
  Index = "1";
  CodeSource = "XTAB";
  CodeType = "SALE";
  DBTableName = "TSALE";
  SType = "Text";
  Label = "Sales Office Number";
 }

 INOUT MIR-BR-ID 
 {
  Key;
  Length = "5";
  CodeSource = "XTAB";
  CodeType = "BRCH";
  DBTableName = "TSALE";
  SType = "Selection";
  Label = "Branch Number";
 }

 OUT MIR-BR-ID-T[12]
 {
  Length = "5";
  FieldGroup = "Table12";
  Index = "1";
  CodeSource = "XTAB";
  CodeType = "BRCH";
  DBTableName = "TSALE";
  SType = "Text";
  Label = "Branch Number";
 }

 OUT MIR-CLI-ADDR-TYP-CD-T[12]
 {
  Length = "40";
  FieldGroup = "Table12";
  Index = "1";
  CodeSource = "EDIT";
  CodeType = "ADTYP";
  DBTableName = "TSALE";
  SType = "Text";
  Label = "Address Type";
 }


 OUT MIR-CLI-ID-T[12]
 {
  Length = "10";
  FieldGroup = "Table12";
  Index = "1";
  DBTableName = "TSALE";
  SType = "Text";
  Label = "Client Number";
 }

}
