# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9214-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02GL03   6.1     New for Manuflex Phase2                                   *
#*******************************************************************************
 
P-STEP BF9214-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9214";
    BusinessFunctionName = "Business Day List";
    BusinessFunctionType = "List";
    MirName = "CCWM9214";
  }
  

  
  OUT LSIR-RETURN-CD;
  OUT MIR-RETRN-CD;

  INOUT MIR-BUS-CAL-DT-YR
  {
    Key;
    Length = "4";
    DBTableName = "TBSDT";
    SType = "Text";
    Label = "Year";
  }

  INOUT MIR-BUS-CAL-DT-MO
  {
    Key;
    Length = "2";
    DBTableName = "TBSDT";
    SType = "Text";
    Label = "Month";
  }

 INOUT MIR-BUS-CAL-DT-MTH-TXT
 {
    Key;
    Length = "10";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Name";
 }
  
  OUT MIR-BUS-CAL-DT-YR-T[20]
  {
    Length = "4";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    DBTableName = "TBSDT";
    SType = "Text";
    Label = "Year";
  }


  OUT MIR-BUS-CAL-DT-MO-T[20]
  {
    Length = "2";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    DBTableName = "TBSDT";
    SType = "Text";
    Label = "Month";
  }

  OUT MIR-BUS-CAL-DT-MTH-TXT-T[20]
  {
    Length = "10";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Month";
  }

}
