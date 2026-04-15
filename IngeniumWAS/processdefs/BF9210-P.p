# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9210-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02GL03   6.1     New for Manuflex Phase2                                   *
#*  M00026   FB      Add MIR-ACCT-CLOS-IND - GL Account Journal Date Close Ind *
#*  MI0009   AT      Add several fields for generation of control records      *
#*  NWLTPD   CTS     Add new indicator TD Tax Certificate Group                *
#*  NWLTBC   CTS     Add new indicator TD Tax Certificate Individual           *
#*  Q07504   CTS     Add new indicator LApse Jugdement day                     *
#*  M161CA  CTS    CHANGES TO INCORPORATE DATE INDICATOR FIELDS
#*  M245G5   CTS     CHANGES DONE FOR FOREIGN HOLIDAY                          *
#*  M269H2   CTS     CHANGES FOR BT AND PD AUTO REFUND INDICATOR               *
#*******************************************************************************
 
P-STEP BF9210-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9210";
    BusinessFunctionName = "Business Day Retrieve";
    BusinessFunctionType = "Retrieve";
    MirName = "CCWM9210";
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
    DBTableName = "TBSDT";
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
  
 OUT MIR-ACCT-CLOS-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "Accounting Closed";
     Index = "1";
 }
#MP308B Changes begin
#OUT MIR-PD-PICK-DY-IND-T[31]
#{
#    Length = "1";
#    FieldGroup = "Table1";
#    DBTableName = "TBSDT";
#    SType = "Indicator";
#    Label = "Payroll Pick Day";
#    Index = "1";
#}
#
#OUT MIR-PD-PICK-DT-T[31]
#{
#    Length = "10";
#    FieldGroup = "Table1";
#    DBTableName = "TBSDT";
#    SType = "Date";
#    Label = "Payroll Deduction Pick Date";
#    Index = "1";
#}
#MP308B Ends begin

 OUT MIR-FISC-YE-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "Fiscal Year End";
     Index = "1";
 }

 OUT MIR-FISC-YE-LOW-DT-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "Fiscal Year End Low Date";
     Index = "1";
 }

 OUT MIR-FISC-YE-HIGH-DT-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "Fiscal Year End High Date";
     Index = "1";
 }

 OUT MIR-TAX-CERT-GR-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "Tax Certificate Group";
     Index = "1";
 }

 OUT MIR-TAX-CERT-INDV-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "Tax Certificate Individual";
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

#NWLTPD Changes begin
 OUT MIR-TD-TAX-CERT-GR-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "TD Tax Certificate Group";
     Index = "1";
 }
#NWLTPD Changes End 

#NWLTBC Changes begin
 OUT MIR-TD-TAX-CERT-INDV-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "TD Tax Certificate Individual";
     Index = "1";
 }
#NWLTBC Changes End
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
# M161CA START
OUT MIR-TRXN-RQST-DT-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    DBTableName = "TBSDT";
    Index = "1";
    SType = "Indicator";
    Label = "Transaction Request Date Indicator";
  }
 
OUT MIR-VALID-RQST-DT-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    DBTableName = "TBSDT";
    Index = "1";
    SType = "Indicator";
    Label = "Validation File Creation Date Indicator";
  }
  
OUT MIR-VALID-RSLT-DT-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    DBTableName = "TBSDT";
    Index = "1";
    SType = "Indicator";
    Label = "Validation Result Received Date Indicator";
  }
  
OUT MIR-AUTO-CHRG-RQST-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    DBTableName = "TBSDT";
    Index = "1";
    SType = "Indicator";
    Label = "Automatic Charge Request Date Indicator";
  }
  
OUT MIR-AUTO-CHRG-RSLT-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    DBTableName = "TBSDT";
    Index = "1";
    SType = "Indicator";
    Label = "Automatic Charge Result Date Indicator";
  }
# M161CA END
#M245G5 Changes begin
 OUT MIR-USD-BUS-DY-IND-T[31]
 {
     Length = "1";
     FieldGroup = "Table1";
     DBTableName = "TBSDT";
     SType = "Indicator";
     Label = "USD Business Day Indicator";
     Index = "1";
 }
 OUT MIR-AUD-BUS-DY-IND-T[31]
  {
      Length = "1";
      FieldGroup = "Table1";
      DBTableName = "TBSDT";
      SType = "Indicator";
      Label = "AUD Business Day Indicator";
      Index = "1";
 }
 OUT MIR-EUR-BUS-DY-IND-T[31]
  {
      Length = "1";
      FieldGroup = "Table1";
      DBTableName = "TBSDT";
      SType = "Indicator";
      Label = "EUR Business Day Indicator";
      Index = "1";
 }
 OUT MIR-NZD-BUS-DY-IND-T[31]
  {
      Length = "1";
      FieldGroup = "Table1";
      DBTableName = "TBSDT";
      SType = "Indicator";
      Label = "NZD Business Day Indicator";
      Index = "1";
 }
#M245G5 Changes End
#M269H2 changes starts
 OUT MIR-BT-AUTO-RFND-IND-T[31]
  {
      Length = "1";
      FieldGroup = "Table1";
      DBTableName = "TBSDT";
      SType = "Indicator";
      Label = "BT Auto Refund Indicator";
      Index = "1";
 }
 OUT MIR-PD-AUTO-RFND-IND-T[31]
  {
      Length = "1";
      FieldGroup = "Table1";
      DBTableName = "TBSDT";
      SType = "Indicator";
      Label = "PD Auto Refund Indicator";
      Index = "1";
 }
#M269H2 changes ends
}
