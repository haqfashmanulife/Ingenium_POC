# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT
# M161CA CHANGES TO INCORPORATE DATE INDICATOR FIELDS
# M245G5 CHANGES TO INCORPORATE FOREIGN BUSINESS DAY INDICATOR FIELDS
# M269H2 CHANGES FOR BT AND PD AUTO REFUND INDICATOR

S-STEP BF9212-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    Type = "Input";
    FocusField = "MIR-BUS-CAL-DT-YR";
    FocusFrame = "ContentFrame";
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
    Mandatory;
    Length = "10";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Name";
 }
  INOUT MIR-DV-DY-NM-T[31]
  {
    Length = "2";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Day";
  }

  INOUT MIR-DV-DY-NUM-T[31]
  {
    Length = "2";
    Decimals = "0";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Number";
    Label = "Day";
  }

  INOUT MIR-BUS-DY-IND-T[31]
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Business Day";
  }

  INOUT MIR-BUS-MTHLY-CLOS-IND-T[31]
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Business Monthly Close";
  }
 #MP308B Changes begin

# INOUT MIR-PD-PICK-DY-IND-T[31]
# {
#   Length = "1";
#   FieldGroup = "Table1";
#   Index = "1";
#   SType = "Indicator";
#   Label = "Payroll Pick Day";
# }
#  
# INOUT MIR-PD-PICK-DT-T[31]
# {
#   Length = "10";
#   FieldGroup = "Table1";
#   Index = "1";
#   SType = "Date";
#   Label = "Payroll Deduction Pick Date";
# }
  #MP308B Ends begin
 
    
  INOUT MIR-FISC-YE-IND-T[31] 
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Fiscal Year End";
  }
    
  INOUT MIR-FISC-YE-LOW-DT-IND-T[31] 
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Fiscal Year End Low Date";
  }
    
  INOUT MIR-FISC-YE-HIGH-DT-IND-T[31] 
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Fiscal Year End High Date";
  }

  INOUT MIR-TAX-CERT-GR-IND-T[31]
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Tax Certificate - Group";
  }

  INOUT MIR-TAX-CERT-INDV-IND-T[31]
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Tax Certificate - Individual";
  }

  INOUT MIR-BT-BILL-DY-IND-T[31]
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Bank Transfer Billing Day";
  }

  INOUT MIR-BT-COLCT-DY-IND-T[31]
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Bank Transfer Collection Day";
  }

  INOUT MIR-APP-RECV-CUT-IND-T[31]
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "App Recvd Cutoff Day";
  }

  INOUT MIR-ACCT-CLOS-IND-T[31]
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Accounting Closed";
  }

#NWLTPD Changes Begin
  INOUT MIR-TD-TAX-CERT-GR-IND-T[31]
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "TD Tax Certificate Group";
  }
#NWLTPD Changes End

#NWLTBC Changes Begin
  INOUT MIR-TD-TAX-CERT-INDV-IND-T[31]
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "TD Tax Certificate Individual";
  }
#NWLTBC Changes End
#Q07504 Changes Begin
  INOUT MIR-LAPS-JDG-DY-IND-T[31]
  {
      Length = "1";
      FieldGroup = "Table1";
      Index = "1";
      SType = "Indicator";
      Label = "Judgement Day";
   }
#Q07504 Changes End
# M161CA START
  INOUT MIR-TRXN-RQST-DT-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Transaction Request Date Indicator";
  }
  
  INOUT MIR-VALID-RQST-DT-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Validation File Creation Date Indicator";
  }
  
  INOUT MIR-VALID-RSLT-DT-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Validation Result Received Date Indicator";
  }
  
  INOUT MIR-AUTO-CHRG-RQST-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "Automatic Charge Request Date Indicator";
  }
  
  INOUT MIR-AUTO-CHRG-RSLT-IND-T[31]
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
  INOUT MIR-USD-BUS-DY-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "USDBusiness Day Indicator";
  }
  INOUT MIR-AUD-BUS-DY-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "AUD Business Day Indicator";
  }
  INOUT MIR-EUR-BUS-DY-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "EUR Business Day Indicator";
  }
  INOUT MIR-NZD-BUS-DY-IND-T[31]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "NZD Business Day Indicator";
  }
# M245G5 END  
#M269H2 CHANGES STARTS
  INOUT MIR-BT-AUTO-RFND-IND-T[31]
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "BT Auto Refund Indicator";
  }
  INOUT MIR-PD-AUTO-RFND-IND-T[31]
  {
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Indicator";
    Label = "PD Auto Refund Indicator";
  }
#M269H2 CHANGES ENDS
}
