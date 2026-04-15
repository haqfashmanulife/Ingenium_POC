# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0785Copy.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0785-I.s";
INCLUDE "BF0785-O.s";
INCLUDE "BF0785-P.p";
INCLUDE "GenCopy.f";

PROCESS BF0785Copy
{
    STEP Main
    {
        USES PROCESS "GenCopy";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0785Copy -> Title;
        "BF0785-I" -> InputS;
        "BF0785-P" -> CopyP;
    }
}

