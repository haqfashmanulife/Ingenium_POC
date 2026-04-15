# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0063Newpass.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016301  602J     Add IMPLICIT to fix cancel problem                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0063-P.p";
INCLUDE "BF0063-I.s";
INCLUDE "BF0063-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF0063Newpass
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0063Newpass -> Title;
        "BF0063-I" -> InputS;
        "BF0063-P" -> RetrieveP;
        "BF0063-O" -> OutputS;
    }
}

