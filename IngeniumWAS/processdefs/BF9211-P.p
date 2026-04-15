# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9211-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02GL03   6.1     New for Manuflex Phase2                                   *
#*  M00026   FB      Add MIR-ACCT-CLOS-IND - GL Account Journal Date Close Ind *
#*  Q07504   CTS     Add MIR-LAPS-JDG-DY-IND-T Judgement day indicator              *
#*******************************************************************************
 
P-STEP BF9211-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9211";
    BusinessFunctionName = "Business Day Create";
    BusinessFunctionType = "Create";
    MirName = "CCWM9211";
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

  INOUT MIR-BUS-CAL-DT-MTH-TXT
  {
    Key;
    Mandatory;
    Length = "10";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Name";
  }

 OUT MIR-DV-DY-NM-T[31]
 {
     Length = "2";
     FieldGroup = "Table1";
     DBTableName = "Derived";
     SType = "Text";
     Label = "Day";
     Index = "1";
 }

 OUT MIR-DV-DY-NUM-T[31]
 {
     Length = "2";
     Decimals = "0";
     FieldGroup = "Table1";
     DBTableName = "Derived";
     SType = "Number";
     Label = "Day";
     Index = "1";
 }

 OUT MIR-BUS-DY-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "Business Day";
     Index = "1";
 }
  
 OUT MIR-BUS-MTHLY-CLOS-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "Business Monthly Close";
     Index = "1";
 }
  
 OUT MIR-PD-PICK-DY-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "Payroll Pick Day";
     Index = "1";
 }
  
 OUT MIR-BT-BILL-DY-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "Bank Transfer Billing Day";
     Index = "1";
 }
  
 OUT MIR-BT-COLCT-DY-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "Bank Transfer Collection Day";
     Index = "1";
 }
  
 OUT MIR-APP-RECV-CUT-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "App Recvd Cutoff Day";
     Index = "1";
 }

 OUT MIR-ACCT-CLOS-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "Accounting Closed";
     Index = "1";
 }
#Q07504 Changes Begin
 OUT MIR-LAPS-JDG-DY-IND-T[31]
   {
       Length = "1";
       FieldGroup = "Table1";
       DBTableName = "TBSDT";
       SType = "Indicator";
       Label = "Judgement Day";
       Index = "1";
 }
#Q07504 Changes End
}

