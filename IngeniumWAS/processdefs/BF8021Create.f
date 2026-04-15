# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8021Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016168  602J     have more link show if > 5 messages                       *
#*  02NB64  WBP      Add in Client Search                                      *
#*  HIS032  HIN/LJ   Refresh additional fields after Policy Diagnostics        *
#*                                                                             *
#*  MP253N  CTS      Changes done to display the Complete plan-names or Filter *
#*                   plan-names as part of ULE-II                              *
#*******************************************************************************

INCLUDE "BF8021-I.s";
INCLUDE "BF8021-P.p";

# Update input for pending coverage/pending AD policy

INCLUDE "BF8020-P.p";

# Update input for pending coverage/inforce AD policy

INCLUDE "BF8022ADP-I.s";
INCLUDE "BF8022ADPI-I.s";

# Output for AD policy 

INCLUDE "BF8022Update-P.p";

# Update input for NB policy

INCLUDE "BF8020AD-O.s";

# Output for NB policy

INCLUDE "BF8022NB-I.s";
INCLUDE "BF8020NB-O.s";

PROCESS BF8021Create
{
    Title = STRINGTABLE.IDS_TITLE_BF8021Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

#MP253N CHANGES STARTS HERE
    MIR-PLAN-LIST-CD = "F";
#MP253N CHANGES ENDS HERE  

    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF8021-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Create the new record and retrieve it to get the system defaults

    STEP Create
    {
        USES P-STEP "BF8021-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    STEP Retrieve
    {
        USES P-STEP "BF8020-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    MIR-POL-APP-NUM = "1";
    UpdatePrcesI = "BF8022ADP-I";
    UpdatePrcesO = "BF8020AD-O";


    # Determine if policy is AD Pending or AD Inforce or NB and branch to 
    # the appropraite input and output screens

    IF MIR-POL-APPL-CTL-CD == "NB"
    {
        UpdatePrcesI = "BF8022NB-I";
        UpdatePrcesO = "BF8020NB-O";
#MP253N CHANGES STARTS HERE
        MIR-PLAN-LIST-CD = "F";
#MP253N CHANGES ENDS HERE                

    }
    IF MIR-POL-CSTAT-CD == "1" || MIR-POL-CSTAT-CD == "2" || MIR-POL-CSTAT-CD == "3" || MIR-POL-CSTAT-CD == "4"
    {
        UpdatePrcesI = "BF8022ADPI-I";
        UpdatePrcesO = "BF8020AD-O";
#MP253N CHANGES STARTS HERE        
        MIR-PLAN-LIST-CD = "C";
#MP253N CHANGES ENDS HERE         

    }

    STEP Edit
    {
        USES S-STEP UpdatePrcesI;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "GoToInsuredSearch"
    {
        STEP IndividualSearchInsured
        {
            USES PROCESS "AppIndivSearchFTJUL";
            STRINGTABLE.IDS_TITLE_BF2200List -> SearchTitle;
            STRINGTABLE.IDS_TITLE_AppListPrimaryInsured -> ListTitle;
            STRINGTABLE.IDS_TITLE_AppCreatePrimaryInsured -> CreateTitle;
            STRINGTABLE.IDS_TITLE_AppUpdatePrimaryInsured -> UpdateTitle;
            MIR-INSRD-CLI-ID-T[index] -> MIR-CLI-ID;
            MIR-DV-INSRD-CLI-NM-T[index] -> MIR-DV-CLI-NM;
            MIR-INSRD-CLI-ID-T[index] <- MIR-CLI-ID;
            MIR-DV-INSRD-CLI-NM-T[index] <- MIR-DV-CLI-NM;
        }

        BRANCH Edit;

    }


    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP "BF8022Update-P";
    }

    # The value of SESSION.LSIR-MORE-MESSAGES-IND that has been produced
    # by the Update P-Step needs to be retained to properly display the 'MORE' link
    # on the message box, but the next P-Step will overwrite this value before the 
    # page is displayed. To fix this, the value will be stored in the variable
    # LSIR-MORE-MESSAGES-IND which is defined as an 'IN' field on the S-Step
    # for the page display.  When the page is displayed, the value of 
    # LSIR-MORE-MESSAGES-IND will override the value of 
    # SESSION.LSIR-MORE-MESSAGES-IND.
    # Explicitly retrieve values which may have been updated by the
    # Diagnostics process before branching 

    STEP DiagnosticsOutput
    {
        USES P-STEP "BF8020-P";
        ATTRIBUTES
        {
            Explicit;
            GetMessages = "NO";
        }

        MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
        MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
        MIR-CVG-NUM -> MIR-CVG-NUM;
        MIR-CVG-CSTAT-CD <- MIR-CVG-CSTAT-CD;
        MIR-CVG-AD-XPRY-DT <- MIR-CVG-AD-XPRY-DT;
        MIR-CVG-WP-XPRY-DT <- MIR-CVG-WP-XPRY-DT;
        MIR-CVG-CNVR-XPRY-DT <- MIR-CVG-CNVR-XPRY-DT;
        MIR-DV-INSRD-CLI-NM <- MIR-DV-INSRD-CLI-NM;
        MIR-POL-MPREM-AMT <- MIR-POL-MPREM-AMT;
        MIR-POL-PD-TO-DT-NUM <- MIR-POL-PD-TO-DT-NUM;
        MIR-POL-CVG-REC-CTR <- MIR-POL-CVG-REC-CTR;
        MIR-POL-CSTAT-CD <- MIR-POL-CSTAT-CD;
        MIR-POL-BILL-MODE-CD <- MIR-POL-BILL-MODE-CD;
        MIR-CVG-CSN-REC-CTR <- MIR-CVG-CSN-REC-CTR;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;


    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP UpdatePrcesO;
    }

}

