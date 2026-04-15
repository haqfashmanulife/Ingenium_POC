# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT

#*******************************************************************************
#*  Component:   BF9023-P.p                                                    *
#*  Description: New Sales Office Delete Screen                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01CP02     6.1   New for Release 6.1                                       *
#*  B00526     VAN   ADD BRANCH ID AS KEY FIELD TO SALE TABLE                  *
#*******************************************************************************
 
P-STEP BF9023-P
{
 
 ATTRIBUTES
 {
  BusinessFunctionId = "9023";
  BusinessFunctionName = "Sales Office Detail Delete";
  BusinessFunctionType = "Delete";
  MirName = "CCWM9023";
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
}
