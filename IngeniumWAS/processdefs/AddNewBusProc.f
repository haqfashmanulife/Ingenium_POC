# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AddNew BusProc.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*                                                                             *
#*******************************************************************************

INCLUDE "AddNewBusProc.s";
INCLUDE "AddNewBusProc-O.s";
INCLUDE "AddNewBusProc-P.p";
INCLUDE "BF8086ListMenu.f";
INCLUDE "BF2001Create.f";
INCLUDE "BF8081Create.f";

PROCESS AddNewBusProc
{
    Title = "Add New Business Process";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "AppButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # default the XTAB table type field to BPFID.  Don't bother asking or
    # forcing the user to enter this value as this must be the value BPFID.
    # 
    # Default the language of the XTAB record to be created, from that
    # of the user language from a session object.  The user can add alternate
    # languages after the standard one has been created.

    MIR-ETBL-TYP-ID = "BPFID";
    MIR-ETBL-LANG-CD = SESSION.LSIR-USER-LANG-CD;

    # Set phrase that will prompt the user to enter a new value. 
    # The phrase needs to vary by user language  

    MIR-ETBL-VALU-ID = STRINGTABLE.IDS_PROMPT_AddNewBusProc;

    STEP Input
    {
        USES S-STEP "AddNewBusProc";
        STRINGTABLE.IDS_TITLE_AddNewBusProc -> Title;
    }

    IF action == "ACTION_CANCEL"
        EXIT;

    IF action == "CheckSecurityLevels"
    {
        STEP CheckSecurityLevel
        {
            USES PROCESS "BF8086ListMenu";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BPF-SECUR-GR-CD -> MIR-BPF-SECUR-GR-CD;
            MIR-SECUR-CLAS-ID -> MIR-SECUR-CLAS-ID;
            "" -> MIR-BPF-SECUR-LVL-NUM;
        }

        BRANCH Input;

    }
    IF action == "ACTION_OK"
    {
        MIR-BPF-ID = MIR-ETBL-VALU-ID;


        # bypass the create step if we have already created an
        # XTAB record, but subsequent updates failed for whatever
        # reason.  this allows the user to re-submit the page
        # and continue with updates.

        IF BypassXTABCreate == "TRUE" && OrigBPFIDCode == MIR-ETBL-VALU-ID
        {
            BypassXTABCreate = "";
            OrigBPFIDCode = "";

            BRANCH BPFL-BPFSCreateUpdate;

        }

        STEP XTABCreate
        {
            USES P-STEP "BF2001-P";
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
            BRANCH Input;


        STEP BPFL-BPFSCreateUpdate
        {
            USES P-STEP "AddNewBusProc-P";
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
        {

            # because of the upper limit of CICS, we have
            # had to send in 2 wrapped p-steps.  This second group
            # of steps could fail. If it does, set a flag so that we
            # bypass the XTAB create step and allow the user to
            # re-submit the page to the server.

            OrigBPFIDCode = MIR-ETBL-VALU-ID;
            BypassXTABCreate = "TRUE";

            BRANCH Input;

        }

        BRANCH Output;

    }

    STEP Output
    {
        USES S-STEP "AddNewBusProc-O";
        "ButtonBarOK" -> ButtonBar;
    }

    IF action == "AddOtherLanguageDescriptions"
    {
        STEP AddOtherLanguageDescriptions
        {
            USES PROCESS "BF2001Create";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            "BPFID" -> MIR-ETBL-TYP-ID;
            MIR-ETBL-VALU-ID -> MIR-ETBL-VALU-ID;
        }

        BRANCH Output;

    }
    IF action == "AddOtherSecurityClasses"
    {
        STEP AddOtherSecurityClasses
        {
            USES PROCESS "BF8081Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

        }

        BRANCH Output;

    }
}

