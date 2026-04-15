# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT

#*******************************************************************************
#*  Component:   BF9013-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01BL18  6.1      New for release 6.1                                       *
#*  01BL18  BMB      Make the Client id the default session id                 *
#*                                                                             *
#*******************************************************************************
 
P-STEP BF9013-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9013";
    BusinessFunctionName = "Group Payroll Deduction Delete";
    BusinessFunctionType = "Delete";
    MirName = "CCWM9013";
  }
  


  
  OUT LSIR-RETURN-CD;
  OUT MIR-RETRN-CD;

  INOUT MIR-CLI-ID
  {
    Key;
    Mandatory;
    Length = "10";
    DBTableName = "TCLIG";
    DefaultSession = "MIR-CLI-ID";
    SType = "Text";
    Label = "Group ID";
  }
}
