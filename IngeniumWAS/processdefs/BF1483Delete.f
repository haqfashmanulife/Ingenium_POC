# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1483Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
#///
#//  NOTE:  A Suggested way to utilize this Template is to follow these steps:
#//
#// 1.  Choose the FIND AND REPLACE function from your editor.
#// 2.  For the "Find What:" Field, enter "148" (without quotations).
#// 3.  For the "Replace With:" Field, enter the first three digits of your BFID.
#// 4.  Choose the Replace All Function.
#// 5.  Now, in the "Find What:" Field, enter "NCWM1480" (without quotations).
#// 6.  Now, in the "Replace With:" Field, enter the process driver name for the 
#//     Delete Function (e.g. NCWM0583).
#// 7.  Again, Choose the Replace All Function.
#// 8.  Now, in the "Find What:" Field enter "DRIVERS" (without quotations).
#// 9.  Press The Find Next Button (Twice if word above is highlighted).
#// 10. Cancel the FIND AND REPLACE Function
#// 11. Ensure the names for the Retrieve and Update functions are all correct
#// 12. Choose the Save As function from the File Menu
#// 13. Replace the "148" part of the file name with the first three digits of your BFID.
#// 14. Save the File
#///
# Retrieve Input S Step
# Retrieve P Step

INCLUDE "BF1480-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF1480-P.p";

# Delete P Step

INCLUDE "BF1480-O.s";

# Delete Output S Step

INCLUDE "BF1483-P.p";
INCLUDE "BF1483-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF1483Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1483Delete -> Title;

        # Retrieve Input S Step

        "BF1480-I" -> InputS;

        # ENSURE THE DRIVERS BELOW ARE CORRECT
        # Retrieve Input P Step

        "BF1480-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF1480-O" -> ConfirmS;

        # Delete P Step

        "BF1483-P" -> DeleteP;

        # Delete Output S Step

        "BF1483-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

