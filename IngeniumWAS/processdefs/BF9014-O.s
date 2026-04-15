# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

#*******************************************************************************
#*  Component:   BF9014-O.s                                                    *
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
 
S-STEP BF9014-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "List";
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
  
  OUT index
  {
    SType = "Hidden";
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

  IN MIR-CLI-ID-T[20] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    Link;
    SType = "Text";
    Label = "Group ID";
    Action = "SelectItem";
  }

  IN MIR-CLI-GR-CO-NM-T[20] 
  {
    DisplayOnly;
    Length = "50";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    Link;
    SType = "Text";
    Label = "GroupName";
    Action = "SelectItem";
  }

  IN MIR-CLI-GR-PICK-DY-T[20] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    Link;
    SType = "Text";
    Label = "Pick Day";
    Action = "SelectItem";
  }

  IN MIR-CLI-GR-DRW-DY-T[20] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    Link;
    SType = "Text";
    Label = "Draw Day";
    Action = "SelectItem";
  }

  IN MIR-GR-BILL-MODE-CD-T[20] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    Link;
    SType = "Text";
    Label = "Billing Mode";
    Action = "SelectItem";
  }
  
# Changes for NWLBCA starts here
  IN MIR-FWD-BILL-GR-IND-T[20] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Text";
    Label = "Forward-billing Group";
    Action = "SelectItem";
  }
# Changes for NWLBCA ends here

# Changes for MP308L starts here
  IN MIR-CLI-GR-CLOS-DT-T[20] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Date";
    Label = "Group close Date";
    Action = "SelectItem";
  }
# Changes for MP308L ends here

# Changes for UY3C35 starts here
  IN MIR-CLI-DEGRA-DT-T[20] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Date";
    Label = "Degradation Date";
    Action = "SelectItem";
  }
# Changes for UY3C35 ends here
 
}
