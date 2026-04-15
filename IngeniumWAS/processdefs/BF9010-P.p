# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT

#*******************************************************************************
#*  Component:   BF9010-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01BL18  6.1      New for release 6.1                                       *
#*  B00050  DPK      Split Report date into Month/Day                          *
#*  01BL18  BMB      Make the Client id the default session id                 *
#*  24AUG09 CTS      ADDED NEW FIELD FOR TRAD POLICIES PROCESSING:             *
#*                     FWD-BILL-GR-IND                                         *
#*  10FEB17 CTS      ADDING NEW FIELD FOR TRAD POLICIES PROCESSING:            *
#*                     CLI-GR-CLOS-DT                                          *
#*  UY3C35  14OCT24  ADDING NEW FIELD CLI-DEGRA-DT                             *
#*******************************************************************************
 
P-STEP BF9010-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9010";
    BusinessFunctionName = "Group Payroll Deduction Retrieve";
    BusinessFunctionType = "Retrieve";
    MirName = "CCWM9010";
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

  OUT MIR-CLI-GR-PICK-DY
  {
    Length = "2";
    DBTableName = "TCLIG";
    SType = "Text";
    Label = "Pick Day";
  }

  OUT MIR-CLI-GR-DRW-DY
  {
    Length = "2";
    DBTableName = "TCLIG";
    SType = "Text";
    Label = "Draw Day";
  }

  OUT MIR-GR-BILL-MODE-CD
  {
    Length = "2";
    DBTableName = "TCLIG";
    SType = "Text";
    Label = "Billing Mode";
  }

  OUT MIR-CLI-GR-RPT-DT-MO
  {
    Length = "2";
    DBTableName = "TCLIG";
    SType = "Text";
    Label = "Report Date Month";
  }

  OUT MIR-CLI-GR-RPT-DT-DY
  {
    Length = "2";
    DBTableName = "TCLIG";
    SType = "Text";
    Label = "Report Date Day";
  }
 
  OUT MIR-CLI-DBL-AMT-IND
  {
    Length = "1";
    DBTableName = "TCLIG";
    SType = "Text";
    Label = "Catch-Up Billing";
  }

  OUT MIR-GR-ADDL-MPREM-QTY
  {
    Length = "1";
    DBTableName = "TCLIG";
    SType = "Text";
    Label = "Additional Premiums";
  }

  OUT MIR-CLI-GR-TYP-CD
  {
    Length = "1";
    DBTableName = "TCLIG";
    SType = "Text";
    Label = "Group Size";
  }

  OUT MIR-CLI-GR-CO-NM
  {
    Length = "50";
    DBTableName = "TCLNC";
    SType = "Text";
    Label = "Group Name";
  }

# Changes for NWLBCA starts here
  OUT MIR-FWD-BILL-GR-IND
  {
    Length = "1";
    DBTableName = "TCLIG";
    SType = "Text";
    Label = "Forward-billing Group";
  }
# Changes for NWLBCA ends here
# Changes for MP308L starts here
  OUT MIR-CLI-GR-CLOS-DT
  {
    Length = "10";
    DBTableName = "TCLIG";
    SType = "Date";
    Label = "Group Close Date";
  }
# Changes for MP308L ends here

# Changes for UY3C35 starts here
  OUT MIR-CLI-DEGRA-DT
  {
    Length = "10";
    DBTableName = "TCLIG";
    SType = "Date";
    Label = "Degradation Date";
  }
# Changes for UY3C35 ends here
}
