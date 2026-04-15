# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9213-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02GL03   6.1     New for Manuflex Phase2                                   *
#*******************************************************************************
 
P-STEP BF9213-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9213";
    BusinessFunctionName = "Business Day Delete";
    BusinessFunctionType = "Delete";
    MirName = "CCWM9213";
  }
  


  
  OUT LSIR-RETURN-CD;
  OUT MIR-RETRN-CD;

  INOUT MIR-BUS-CAL-DT-YR
  {
    Key;
    Mandatory;
    Length = "4";
    DBTableName = "TBSDT";
    SType = "Text";
    Label = "Year";
  }

  INOUT MIR-BUS-CAL-DT-MO
  {
    Key;
    Mandatory;
    Length = "2";
    DBTableName = "TBSDT";
    SType = "Text";
    Label = "Month";
  }

}
