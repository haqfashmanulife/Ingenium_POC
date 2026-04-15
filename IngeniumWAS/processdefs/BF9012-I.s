# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

#*******************************************************************************
#*  Component:   BF9012-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01BL18  6.1      New for release 6.1                                       *
#*  01BL18  BMB      Make the Client id the default session id                 *
#*  24AUG09 CTS      ADDED NEW FIELD FOR TRAD POLICIES PROCESSING:             *
#*                     FWD-BILL-GR-IND                                         *
#*  10FEB17 CTS      ADDING NEW FIELD FOR TRAD POLICIES PROCESSING:            *
#*                     CLI-GR-CLSO-DT                                          *
#*  UY3C35  14OCT24  ADDING NEW FIELD CLI-DEGRA-DT                             *
#*******************************************************************************
 
S-STEP BF9012-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    Type = "Input";
    FocusField = "MIR-CLI-ID";
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

  IN MIR-CLI-ID 
  {
    Key;
    DisplayOnly;
    Length = "10";
    DefaultSession = "MIR-CLI-ID";
    SType = "Text";
    Label = "Group ID";
  }

  INOUT MIR-CLI-GR-PICK-DY
  {
    Length = "2";
    SType = "Text";
    Label = "Pick Day";
  }

  INOUT MIR-CLI-GR-DRW-DY
  {
    Length = "2";
    SType = "Text";
    Label = "Draw Day";
  }

  INOUT MIR-GR-BILL-MODE-CD
  {
    Length = "2";
    SType = "Text";
    Label = "Billing Mode";
  }

  INOUT MIR-CLI-GR-RPT-DT-MO
  {
    Length = "2";
    SType = "Text";
    Label = "Report Date Month";
  }

  INOUT MIR-CLI-GR-RPT-DT-DY
  {
    Length = "2";
    SType = "Text";
    Label = "Report Date Day";
  }

  INOUT MIR-CLI-DBL-AMT-IND
  {
    Length = "1";
    SType = "Text";
    Label = "Catch-Up Billing";
  }

  INOUT MIR-GR-ADDL-MPREM-QTY
  {
    Length = "1";
    SType = "Text";
    Label = "Additional Premiums";
  }

  INOUT MIR-CLI-GR-TYP-CD
  {
    Length = "1";
    SType = "Text";
    Label = "Group Size";
  }
  
# Changes for NWLBCA starts here  
  INOUT MIR-FWD-BILL-GR-IND
  {
    Length = "1";
    SType = "Text";
    Label = "Forward-billing Group";
  }
# Changes for NWLBCA ends here

# Changes for MP308L starts here  
  INOUT MIR-CLI-GR-CLOS-DT
  {
    Length = "10";
    SType = "Date";
    Label = "Group Close Date";
  }
# Changes for MP308L ends here

# Changes for UY3C35 starts here  
  INOUT MIR-CLI-DEGRA-DT
  {
    Length = "10";
    SType = "Date";
    Label = "Degradation Date";
  }
# Changes for UY3C35 ends here
}
