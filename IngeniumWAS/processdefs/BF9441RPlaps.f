# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9441RPlaps.f                                                *
#*  Description: Policy Inquiry - Tabular Surrender Values                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01PR04  TMC      New for MCL                                               *
#*  R15582  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9441-P.p";
INCLUDE "BF9441-I.s";
INCLUDE "BF9441-O.s";
#R15582 CHANGE START
#INCLUDE "GenRetrieve.f";
INCLUDE "GenRetrieveAud.f";
#R15582 CHANGE END

PROCESS BF9441RPlaps
{
    STEP Main
    {
      #R15582 CHANGE START
        #USES PROCESS "GenRetrieve";
        USES PROCESS "GenRetrieveAud";
      #R15582 CHANGE END
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9441Process -> Title;
        "BF9441-I" -> InputS;
        "BF9441-P" -> RetrieveP;
        "BF9441-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

