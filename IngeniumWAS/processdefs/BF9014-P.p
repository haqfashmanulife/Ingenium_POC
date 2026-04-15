# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT

#*******************************************************************************
#*  Component:   BF9014-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01BL18  6.1      New for release 6.1                                       *
#*  01BL18  BMB      Make the Client id the default session id                 *
#*  24AUG09 CTS      ADDED NEW FIELD FOR TRAD POLICIES PROCESSING:             *
#*                     FWD-BILL-GR-IND                                         *
#*  09FEB17 CTS      ADDING NEW FIELD FOR TRAD POLICIES PROCESSING:            *
#*                     CLI-GR-CLOS-DT                                          *
#*  UY3C35  14OCT24  ADDING NEW FIELD CLI-DEGRA-DT                             *
#*******************************************************************************
 
P-STEP BF9014-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9014";
    BusinessFunctionName = "Group Payroll Deduction Client List";
    BusinessFunctionType = "List";
    MirName = "CCWM9014";
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

  OUT MIR-CLI-ID-T[20]
  {
    Length = "10";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    DBTableName = "TCLIG";
    SType = "Text";
    Label = "Group ID";
  }


  OUT MIR-CLI-GR-CO-NM-T[20]
  {
    Length = "50";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    DBTableName = "TCLNC";
    SType = "Text";
    Label = "GroupName";
  }


  OUT MIR-CLI-GR-PICK-DY-T[20]
  {
    Length = "2";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    DBTableName = "TCLIG";
    SType = "Text";
    Label = "Pick Day";
  }


  OUT MIR-CLI-GR-DRW-DY-T[20]
  {
    Length = "2";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    DBTableName = "TCLIG";
    SType = "Text";
    Label = "Draw Day";
  }


  OUT MIR-GR-BILL-MODE-CD-T[20]
  {
    Length = "2";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    DBTableName = "TCLIG";
    SType = "Text";
    Label = "Billing Mode";
  }

# Changes for NWLBCA starts here
  OUT MIR-FWD-BILL-GR-IND-T[20]
  {
    Length = "1";
    FieldGroup = "Table20";
    Index = "1";
    DBTableName = "TCLIG";
    SType = "Text";
    Label = "Forward-billing Group";
  }
# Changes for NWLBCA ends here

# Changes for MP308L starts here
  OUT MIR-CLI-GR-CLOS-DT-T[20]
  {
    Length = "10";
    FieldGroup = "Table20";
    Index = "1";
    DBTableName = "TCLIG";
    SType = "Date";
    Label = "Group close Date";
  }
# Changes for MP308L ends here

# Changes for UY3C35 starts here
  OUT MIR-CLI-DEGRA-DT-T[20]
  {
    Length = "10";
    FieldGroup = "Table20";
    Index = "1";
    DBTableName = "TCLIG";
    SType = "Date";
    Label = "Degradation Date";
  }
# Changes for UY3C35 ends here
}
