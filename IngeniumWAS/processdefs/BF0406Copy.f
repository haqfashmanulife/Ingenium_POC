# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0406Copy.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0406-I.s";
INCLUDE "BF0406-O.s";
INCLUDE "BF0406-P.p";
INCLUDE "GenCopy.f";

PROCESS BF0406Copy
{
    STEP Main
    {
        USES PROCESS "GenCopy";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0406Copy -> Title;
        "BF0406-I" -> InputS;
        "BF0406-P" -> CopyP;
    }
}

