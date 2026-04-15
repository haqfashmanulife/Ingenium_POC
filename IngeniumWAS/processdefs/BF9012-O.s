# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

#*******************************************************************************
#*  Component:   BF9012-O.s                                                    *
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
 
S-STEP BF9012-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
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

  IN MIR-CLI-ID 
  {
    Key;
    DisplayOnly;
    Length = "10";
    DefaultSession = "MIR-CLI-ID";
    SType = "Text";
    Label = "Group ID";
  }

  IN MIR-CLI-GR-PICK-DY 
  {
    DisplayOnly;
    Length = "2";
    SType = "Text";
    Label = "Pick Day";
  }

  IN MIR-CLI-GR-DRW-DY 
  {
    DisplayOnly;
    Length = "2";
    SType = "Text";
    Label = "Draw Day";
  }

  IN MIR-GR-BILL-MODE-CD 
  {
    DisplayOnly;
    Length = "2";
    SType = "Text";
    Label = "Billing Mode";
  }

  IN MIR-CLI-GR-RPT-DT-MO 
  {
    DisplayOnly;
    Length = "2";
    SType = "Text";
    Label = "Report Date Month";
  }

  IN MIR-CLI-GR-RPT-DT-DY 
  {
    DisplayOnly;
    Length = "2";
    SType = "Text";
    Label = "Report Date Day";
  }

  IN MIR-CLI-DBL-AMT-IND 
  {
    DisplayOnly;
    Length = "1";
    SType = "Text";
    Label = "Catch-Up Billing";
  }

  IN MIR-GR-ADDL-MPREM-QTY 
  {
    DisplayOnly;
    Length = "1";
    SType = "Text";
    Label = "Additional Premiums";
  }

  IN MIR-CLI-GR-TYP-CD 
  {
    DisplayOnly;
    Length = "1";
    SType = "Text";
    Label = "Group Size";
  }

  IN MIR-CLI-GR-CO-NM 
  {
    DisplayOnly;
    Length = "50";
    SType = "Text";
    Label = "Group Name";
  }

# Changes for NWLBCA starts here  
  IN MIR-FWD-BILL-GR-IND 
  {
    DisplayOnly;
    Length = "1";
    SType = "Text";
    Label = "Forward-billing Group";
  }
# Changes for NWLBCA ends here

# Changes for MP308L starts here  
  IN MIR-CLI-GR-CLOS-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Group close Date";
  }
# Changes for MP308L ends here

# Changes for UY3C35 starts here  
  IN MIR-CLI-DEGRA-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Degradation Date";
  }
# Changes for UY3C35 ends here
}
