# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0890Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016301  602J     Add IMPLICIT to fix cancel problem                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0890-P.p";
INCLUDE "BF0890-I.s";
INCLUDE "BF0890-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF0890Retrieve
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0890Retrieve -> Title;
        "BF0890-I" -> InputS;
        "BF0890-P" -> RetrieveP;
        "BF0890-O" -> OutputS;
    }
}

