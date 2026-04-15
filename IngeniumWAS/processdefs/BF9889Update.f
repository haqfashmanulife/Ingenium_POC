# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9889Update.f                                                *
#*  Description: Protected Settled Claim Update                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104B HIN/IH   Initial version                                           *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9887-I.s";
INCLUDE "BF9887-P.p";
INCLUDE "BF9887-O.s";
INCLUDE "BF9888-P.p";
INCLUDE "BF9889-I.s";
INCLUDE "BF9889-P.p";
INCLUDE "BF9889-O.s";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF9889Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9889Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Get the Claim ID to process

    STEP ListStart
    {
        USES S-STEP "BF9887-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH ListStart;



    # Retrieve the Completed Claims Benefit Details Summary information

    STEP DisplayBenefitDetails
    {
        USES P-STEP "BF9887-P";
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH ListStart;



    # Display the Completed Claims Benefit Details Summary screen

    ListOut:

    ButtonBar = "ButtonBarListsU";

    STEP DisplayList
    {
        USES S-STEP "BF9887-O";
    }


    # Perform the appropriate processing depending on which button
    # the user clicked

    IF action == "ACTION_BACK"
        EXIT;


    # If the user hasn't selected an item to work with.  Go back.

    IF index == "0" || index == ""
        BRANCH DisplayList;


    # User selected one record in the list to retrieve the details

    IF action == "SelectItem" || action == "ACTION_UPDATE"
    {
        STEP Retrieve
        {
            USES P-STEP "BF9888-P";
            MIR-CLM-ID -> MIR-CLM-ID;
            MIR-POL-ID-T[index] -> MIR-POL-ID;
            MIR-CVG-NUM-T[index] -> MIR-CVG-NUM;
            MIR-PLAN-ID-T[index] -> MIR-PLAN-ID;
            MIR-BNFT-NM-ID-T[index] -> MIR-BNFT-NM-ID;
            MIR-CVG-FACE-AMT-T[index] -> MIR-CVG-FACE-AMT;
            MIR-BNFT-PAYBL-AMT-T[index] -> MIR-BNFT-PAYBL-AMT;
        }

    }
    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH ListStart;


    ButtonBar = "ButtonBarOKCancel";

    STEP Update-S
    {
        USES S-STEP "BF9889-I";
    }

    IF action == "ACTION_BACK"
        BRANCH ListOut;



    # Update the Completed Claims Benefit Details records

    STEP UpdateClaims-P
    {
        USES P-STEP "BF9889-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Update-S;

# 23774A CHANGES BEGIN
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLM-ID -> MIR-TRNX-DTL-INFO;    
    "C" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
       BRANCH Update-S;
        
# 23774A CHANGES END

    ButtonBar = "ButtonBarOK";

    STEP DisplayResult-S
    {
        USES S-STEP "BF9889-O";
    }

    BRANCH ListOut;
}

