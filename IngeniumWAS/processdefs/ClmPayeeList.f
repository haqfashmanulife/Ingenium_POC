# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   ClmPayeeList.f                                                *                                                                              
#*  Description: Maintain a list of Payees for a claim.                        *                                                                  
#*                                                                             
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                                                                                 *
#*  HCL103  HIN/CL   ADD A PAYEE    (HCL103C)                                  *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*******************************************************************************
#* a Client ID will be passed 

INCLUDE "ClmPayeeList-O.s";
INCLUDE "ClmPayee-I.s";
INCLUDE "ClmPayee-O.s";
INCLUDE "BF9669-P.p";
INCLUDE "BF9666-P.p";
INCLUDE "BF9667-P.p";
INCLUDE "BF9665-P.p";
INCLUDE "BF9668-P.p";

PROCESS ClmPayeeList
{
  VARIABLES
  {
    IN MIR-CLM-ID;

    OUT MIR-CLRL-SEQ-NUM;
  }

    Title = STRINGTABLE.IDS_TITLE_ClmPayeeList;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ClmButtonBarPayeeList";
    ButtonBarSize = "50";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    RecordIsNew = "N";


    #***************************************

    GetClmPayeeList:

    STEP clmpayeelistStep
    {
        USES P-STEP "BF9669-P";
    }

    IF LSIR-RETURN-CD != "00"
    {
        EXIT;

    }


    #***************************************

    DisplayClmPayeeList:

    STEP DisplayClmPayeeListStep
    {
        USES S-STEP "ClmPayeeList-O";
        STRINGTABLE.IDS_TITLE_ClmPayeeList -> Title;
        "ClmButtonBarPayeeList" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
    {
        Lastaction = action;

        EXIT;

    }
    IF action == "ACTION_UPDATE"
    {

        #      user has selected a payee from the list to update 

        MIR-CLRL-SEQ-NUM = MIR-CLRL-SEQ-NUM-T[index];
        nextScreenTitle = STRINGTABLE.IDS_TITLE_ClmPayeeUpdate;

        BRANCH ClmPayeeUpdate;

    }
    IF action == "ACTION_ADD"
    {

        #  user wants to add a payee record to the client

        STEP ClmPayeeCreate
        {
            USES P-STEP "BF9666-P";
            "P" -> MIR-CLRL-REL-TYP-CD;
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayClmPayeeList;

        ELSE
        {
            RecordIsNew = "Y";
            nextScreenTitle = STRINGTABLE.IDS_TITLE_ClmPayeeAdd;

            BRANCH ClmPayeeUpdate;

        }

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES P-STEP "BF9668-P";
            MIR-CLM-ID -> MIR-CLM-ID;
            MIR-CLRL-SEQ-NUM-T[index] -> MIR-CLRL-SEQ-NUM;
            "P" -> MIR-CLRL-TYP-CD;
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayClmPayeeList;

        ELSE
            BRANCH GetClmPayeeList;


    }


    # process should not reach here            

    BRANCH GetClmPayeeList;

    #***************************************

    ClmPayeeUpdate:

    STEP ClmPayeeRetrieveStep
    {
        USES P-STEP "BF9665-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DisplayClmPayeeList;



    #***************************************

    DisplayClmPayeeRecord:

    STEP DisplayClmPayeeRecordStep
    {
        USES S-STEP "ClmPayee-I";

        #      STRINGTABLE.IDS_TITLE_ClmPayeeUpdate -> Title;

        nextScreenTitle -> Title;
        "AppButtonBarOKCancel" -> ButtonBar;
    }

    IF action == "ACTION_BACK" || action == "ACTION_CANCEL"
    {
        IF RecordIsNew == "Y"
            STEP ACTION_DELETE_NEW
            {
                USES P-STEP "BF9668-P";
                MIR-CLM-ID -> MIR-CLM-ID;
                MIR-CLRL-SEQ-NUM -> MIR-CLRL-SEQ-NUM;
                "P" -> MIR-CLRL-TYP-CD;
            }


        RecordIsNew = "N";

        BRANCH GetClmPayeeList;

    }
    IF action == "ACTION_OK"
    {
        STEP ClmPayeeUpdateStep
        {
            USES P-STEP "BF9667-P";
            "2" -> MIR-DV-PRCES-STATE-CD;
        }

        IF LSIR-RETURN-CD != "00"
        {
            BRANCH DisplayClmPayeeRecord;

        }
        ELSE
        {
            BRANCH ClmPayeeConfirm;

        }

    }

    ClmPayeeConfirm:

    STEP ClmPayeeConfirmStep
    {
        USES S-STEP "ClmPayee-O";
        STRINGTABLE.IDS_TITLE_ClmPayeeConfirm -> Title;
        "ButtonBarConfirmCancel" -> ButtonBar;
    }

    IF action == "ACTION_CONFIRM"
    {
        STEP ClmPayeeUpdateConfirmStep
        {
            USES P-STEP "BF9667-P";
            "3" -> MIR-DV-PRCES-STATE-CD;
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayClmPayeeRecord;

        ELSE
        {
            RecordIsNew = "N";

            BRANCH GetClmPayeeList;

        }

    }
    IF action == "ACTION_BACK"
    {
        BRANCH DisplayClmPayeeRecord;

    }
    # stay at confirm screen until valid action taken          

    BRANCH ClmPayeeConfirm;
}

