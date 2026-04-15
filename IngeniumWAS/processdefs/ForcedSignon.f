# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   ForcedSignon.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Include statements for S-steps

INCLUDE "ForceSignOn.s";

PROCESS ForcedSignOn
{

  Title = "Sign On Required";
  TitleBar = "TitleBar";
  TitleBarSize = "120";
  ButtonBar = "ButtonBarOK";
  ButtonBarSize = "40";
  STEP step1
  {
    USES S-STEP "ForceSignOn";
  }

}
