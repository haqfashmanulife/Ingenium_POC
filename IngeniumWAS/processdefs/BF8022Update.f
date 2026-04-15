# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8022Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016161  602J     pol/covg update to loop back to input                     *
#*  016168  602J     have more link show if > 5 messages                       *
#*  02NB64  WBP      Add Insured Search                                        *
#*  HIS017  HIN/LJ   Refresh additional fields after Policy Diagnostics        *
#*                                                                             *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP253N  CTS      Changes done to display the Complete plan-names or Filter *
#*                   plan-names as part of ULE-II                              *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF8020-I.s";

# Update input for pending coverage/pending AD policy

INCLUDE "BF8020-P.p";

# Update input for inforce coverage/inforce AD policy

INCLUDE "BF8022ADP-I.s";

# Update input for pending coverage/inforce AD policy

INCLUDE "BF8022ADI-I.s";
INCLUDE "BF8022ADPI-I.s";

# Output for AD policy

INCLUDE "BF8022Update-P.p";

# Update input for NB policy

INCLUDE "BF8020AD-O.s";

# Output for NB policy

INCLUDE "BF8022NB-I.s";
INCLUDE "BF8020NB-O.s";

#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF8022Update
{
    Title = STRINGTABLE.IDS_TITLE_BF8022Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Enter the key(s) for the value that you'd like to create

#M245B2 CHANGES STARTS HERE
    MIR-GLOB-CRCY-CD= "JP";
#M245B2 CHANGES STARTS HERE  
    STEP Input
    {
        USES S-STEP "BF8020-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
        UserDefinedPolicyIDSuffix <- WS9D34-POL-ID-SFX;
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH Input;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX;
      }

    # UY3004 CHANGES END 

    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF8020-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


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
    IF MIR-CVG-CSTAT-CD == "1" || MIR-CVG-CSTAT-CD == "2" || MIR-CVG-CSTAT-CD == "3" || MIR-CVG-CSTAT-CD == "4"
    {
        UpdatePrcesI = "BF8022ADI-I";
        UpdatePrcesO = "BF8020AD-O";

    }
    IF (MIR-CVG-CSTAT-CD != "1" && MIR-CVG-CSTAT-CD != "2" && MIR-CVG-CSTAT-CD != "3" && MIR-CVG-CSTAT-CD != "4") && (MIR-POL-CSTAT-CD == "1" || MIR-POL-CSTAT-CD == "2" || MIR-POL-CSTAT-CD == "3" || MIR-POL-CSTAT-CD == "4")
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
    # M241A3 CHANGES START        
    IF action == "ACTION_REFRESH"
        BRANCH Edit; 
    # M241A3 CHANGES END        

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

#* 23774A CHANGES BEGIN

    temp-MSGS-T[1] = MESSAGES-T[1];
    temp-MSGS-T[2] = MESSAGES-T[2];
    temp-MSGS-T[3] = MESSAGES-T[3];
    temp-MSGS-T[4] = MESSAGES-T[4];
    temp-MSGS-T[5] = MESSAGES-T[5];
    temp-MSGS-T[6] = MESSAGES-T[6];
    temp-MSGS-T[7] = MESSAGES-T[7];
    temp-MSGS-T[8] = MESSAGES-T[8];
    temp-MSGS-T[9] = MESSAGES-T[9];
    temp-MSGS-T[10] = MESSAGES-T[10];
    
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;  

    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
    "C" -> MIR-LOG-LEVL-CD;
    
    }

      
    IF LSIR-RETURN-CD != "00"
        BRANCH Edit; 
        
      MESSAGES-T[1] = temp-MSGS-T[1];
      MESSAGES-T[2] = temp-MSGS-T[2];
      MESSAGES-T[3] = temp-MSGS-T[3];
      MESSAGES-T[4] = temp-MSGS-T[4];
      MESSAGES-T[5] = temp-MSGS-T[5];
      MESSAGES-T[6] = temp-MSGS-T[6];
      MESSAGES-T[7] = temp-MSGS-T[7];
      MESSAGES-T[8] = temp-MSGS-T[8];
      MESSAGES-T[9] = temp-MSGS-T[9];
      MESSAGES-T[10] = temp-MSGS-T[10];
      
#* 23774A CHANGES END

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

    MESSAGES-T[0] = "";

    # BRANCH Input;

}

