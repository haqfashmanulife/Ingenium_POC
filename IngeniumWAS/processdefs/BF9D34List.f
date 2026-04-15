# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF9D34List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3004   CTS      DUPLICATE POLICY ID LIST CHANGES                         *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

INCLUDE "BF9D34-O.s";
INCLUDE "BF9D34-P.p";

PROCESS BF9D34List
{
  VARIABLES
  {
    OUT WS9D34-POL-ID-BASE;
    OUT WS9D34-POL-ID-SFX;
    OUT WS9D34-POL-COUNTER;
    OUT WS9D34-POL-ID;
    OUT WS9D34-CANCEL-IND;
    OUT WS9D34-RETURN-CD;
# UY3049 CHANGES STARTS
    OUT WS9D34-STR3-PAYO-IND;
    OUT WS9D34-10-POL-ID;
# UY3049 CHANGES ENDS
  }
    Title = STRINGTABLE.IDS_TITLE_BF9D34List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
      
    WS9D34-CANCEL-IND="N";
# UY3049 CHANGES STARTS
    WS9D34-STR3-PAYO-IND="N";
# UY3049 CHANGES ENDS

    STEP ListP
    {
        USES P-STEP "BF9D34-P";
    }

#   LSIR-RETURN-CD is passed to calling flow file so that error messeges from CSOM9D34 will be displayed in
#   original flow file.

    WS9D34-RETURN-CD = LSIR-RETURN-CD;

#  MIR-POL-COUNT= 0 indicates there is no policy present in tpol table
    WS9D34-POL-COUNTER=MIR-POL-COUNT;

    IF MIR-POL-COUNT == "00" 
      {
       EXIT;
      }

# policy count is one indicates there is no duplicate policy present in system 
    IF MIR-POL-COUNT == "01" 
      {
       WS9D34-POL-ID-BASE  = MIR-POL-ID-BASE;
       WS9D34-POL-ID-SFX   = MIR-POL-ID-SFX;
       WS9D34-POL-ID = WS9D34-POL-ID-BASE + WS9D34-POL-ID-SFX;
# UY3049 CHANGES STARTS
       WS9D34-STR3-PAYO-IND = MIR-STR3-PAYO-IND;
       WS9D34-10-POL-ID = MIR-10-POL-ID;
# UY3049 CHANGES ENDS
       EXIT;
      }

    ButtonBar = "BF9D34ButtonBarOKCan";

    STEP DisplayList
    {
        USES S-STEP "BF9D34-O";
    }
    
    IF action == "ACTION_BACK"
     {
      WS9D34-CANCEL-IND="Y";
      EXIT;
     }

# The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;

# The user  selected an item will pass to next screen

    WS9D34-POL-ID-BASE = MIR-POL-ID-BASE-T[index];
    WS9D34-POL-ID-SFX  = MIR-POL-ID-SFX-T[index];
    WS9D34-POL-ID = WS9D34-POL-ID-BASE + WS9D34-POL-ID-SFX;

}


