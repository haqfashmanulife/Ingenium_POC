# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1227Reset.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1227-P.p";
INCLUDE "BF1227-I.s";
INCLUDE "BF1227-O.s";
INCLUDE "GenProcess.f";

PROCESS BF1227Reset
{
    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            Explicit;
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1227Reset -> Title;
        "BF1227-I" -> InputS;
        "BF1227-P" -> ProcessP;
        "BF1227-O" -> OutputS;
    }
}

