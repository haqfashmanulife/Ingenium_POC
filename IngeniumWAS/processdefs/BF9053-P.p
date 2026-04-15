# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:57 PM EDT

#*******************************************************************************
#*  Component:   BF9053-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB05  CSS      New for MCL                                               *
#*  B00074  DPK      Added Policy Prefix                                       *
#*******************************************************************************
 
P-STEP BF9053-P
{
 
 ATTRIBUTES
 {
  BusinessFunctionId = "9053";
  BusinessFunctionName = "LINC Delete";
  BusinessFunctionType = "Delete";
  MirName = "NCWM9053";
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
}
