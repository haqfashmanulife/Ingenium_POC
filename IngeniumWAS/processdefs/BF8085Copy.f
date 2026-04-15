# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8085Copy.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J      New for release 602J                                     *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8085-I.s";
INCLUDE "BF8085-P.p";
INCLUDE "GenCopy.f";

PROCESS BF8085Copy
{
    STEP Main
    {
        USES PROCESS "GenCopy";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF8085Copy -> Title;
        "BF8085-I" -> InputS;
        "BF8085-P" -> CopyP;
    }
}

