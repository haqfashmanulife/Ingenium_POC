# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT

#*******************************************************************************
#*  Component:   BF9011-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01BL18   6.1     New for release 6.1                                       *
#*  01BL18  BMB      Make the Client id the default session id                 *
#*  24AUG09 CTS      ADDED NEW FIELD FOR TRAD POLICIES PROCESSING:             *
#*                     FWD-BILL-GR-IND                                         *
#*  10FEB17 CTS      ADDING NEW FIELD FOR TRAD POLICIES PROCESSING:            *
#*                     CLI-GR-CLOS-DT                                          *
#*  UY3C35  14OCT24  ADDING NEW FIELD CLI-DEGRA-DT                             *
#*******************************************************************************
 
P-STEP BF9011-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9011";
    BusinessFunctionName = "Group Payroll Deduction Create";
    BusinessFunctionType = "Create";
    MirName = "CCWM9011";
  }
  


  
  OUT LSIR-RETURN-CD;
  OUT MIR-RETRN-CD;

  IN MIR-CLI-ID
  {
    Key;
    Mandatory;
    Length = "10";
    DBTableName = "TCLIG";
    DefaultSession = "MIR-CLI-ID";
    SType = "Text";
    Label = "Group ID";
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

