# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT
# M161CA CHANGES TO INCORPORATE DATE INDICATOR FIELDS
# M245G5 CHANGES TO INCORPORATE FOREIGN BUSINESS DAY INDICATOR FIELDS
# M269H2 CHANGES FOR BT AND PD AUTO REFUND INDICATOR

S-STEP BF9210-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Retrieve";
    Type = "Output";
    DelEmptyRows;
    FocusField = "OKButton";
    FocusFrame = "ButtonFrame";
  }

  IN Title;

  IN TitleBar;
  IN TitleBarSize;

  IN ButtonBar;
  IN ButtonBarSize;

  IN MessageFrame;
  IN MessageFrameSize;

  OUT action
  {
    SType="Hidden";
  }

  IN MIR-BUS-CAL-DT-YR 
  {
    Key;
    DisplayOnly;
    Length = "4";
    SType = "Text";
    Label = "Year";
  }

  IN MIR-BUS-CAL-DT-MO 
  {
    Key;
    DisplayOnly;
    Length = "2";
    SType = "Text";
    Label = "Month";
  }

  IN MIR-BUS-CAL-DT-MTH-TXT 
  {
    Key;
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Name";
  }

  IN MIR-DV-DY-NM-T[31] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Day";
  }

  IN MIR-DV-DY-NUM-T[31] 
  {
    DisplayOnly;
    Length = "2";
    Decimals = "0";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Number";
    Label = "Day";
  }

  IN MIR-BUS-DY-IND-T[31] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Business Day";
  }

  IN MIR-BUS-MTHLY-CLOS-IND-T[31] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Business Monthly Close";
  }
    
  IN MIR-ACCT-CLOS-IND-T[31] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Accounting Closed";
  }
  
#MP308B Changes begin

# IN MIR-PD-PICK-DY-IND-T[31]
# {
#   DisplayOnly;
#   Length = "1";
#   FieldGroup = "Table1";
#   Index = "1";
#   SType = "Indicator";
#   Label = "Payroll Pick Day";
# }
#
# IN MIR-PD-PICK-DT-T[31]
# {
#   DisplayOnly;
#   Length = "10";
#   FieldGroup = "Table1";
#   Index = "1";
#   SType = "Date";
#   Label = "Payroll Deduction Pick Date";
# }
#MP308B Ends begin
    
  IN MIR-FISC-YE-IND-T[31] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Fiscal Year End";
  }
    
  IN MIR-FISC-YE-LOW-DT-IND-T[31] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Fiscal Year End Low Date";
  }
    
  IN MIR-FISC-YE-HIGH-DT-IND-T[31] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Fiscal Year End High Date";
  }

  IN MIR-TAX-CERT-GR-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Tax Certificate - Group";
  }

  IN MIR-TAX-CERT-INDV-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Tax Certificate - Individual";
  }

  IN MIR-BT-BILL-DY-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Bank Transfer Billing Day";
  }

  IN MIR-BT-COLCT-DY-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Bank Transfer Collection Day";
  }

  IN MIR-APP-RECV-CUT-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "App Recvd Cutoff Day";
  }

# NWLTPD Changes begin

  IN MIR-TD-TAX-CERT-GR-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "TD Tax Certificate Group";
  }
  
# NWLTPD Changes End 

# NWLTBC Changes begin

  IN MIR-TD-TAX-CERT-INDV-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "TD Tax Certificate Individual";
  }
  
# NWLTBC Changes End
# Q07504 Changes Begin
IN MIR-LAPS-JDG-DY-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Judgement Day";
  }
# Q07504 Changes End
# M161CA START
IN MIR-TRXN-RQST-DT-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Transaction Request Date Indicator";
  }
  
IN MIR-VALID-RQST-DT-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Validation File Creation Date Indicator";
  }
  
IN MIR-VALID-RSLT-DT-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Validation Result Received Date Indicator";
  }
  
IN MIR-AUTO-CHRG-RQST-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Automatic Charge Request Date Indicator";
  }
  
IN MIR-AUTO-CHRG-RSLT-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Automatic Charge Result Date Indicator";
  }
# M161CA END
# M245G5 START
IN MIR-USD-BUS-DY-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "USD Business Day Indicator";
  }
  IN MIR-AUD-BUS-DY-IND-T[31]
    {
      DisplayOnly;
      Length = "1";
      FieldGroup = "Table1";
      Index = "1";
      SType = "Indicator";
      Label = "AUD Business Day Indicator";
  }
  IN MIR-EUR-BUS-DY-IND-T[31]
    {
      DisplayOnly;
      Length = "1";
      FieldGroup = "Table1";
      Index = "1";
      SType = "Indicator";
      Label = "EUR Business Day Indicator";
  }
  IN MIR-NZD-BUS-DY-IND-T[31]
    {
      DisplayOnly;
      Length = "1";
      FieldGroup = "Table1";
      Index = "1";
      SType = "Indicator";
      Label = "NZD Business Day Indicator";
  }
# M245G5 END  
#M269H2 STARTS
  IN MIR-BT-AUTO-RFND-IND-T[31]
    {
      DisplayOnly;
      Length = "1";
      FieldGroup = "Table1";
      Index = "1";
      SType = "Indicator";
      Label = "BT Auto Refund Indicator";
  }
  IN MIR-PD-AUTO-RFND-IND-T[31]
    {
      DisplayOnly;
      Length = "1";
      FieldGroup = "Table1";
      Index = "1";
      SType = "Indicator";
      Label = "PD Auto Refund Indicator";
  }
# M269H2 Changes Ends
}
