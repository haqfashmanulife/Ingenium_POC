# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9270Retrieve.f                                              *
#*  Description: Adjudicator Inquiry                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106A HIN/CL   ADJUDICATOR INQUIRY                                       *
#*  MP302M  Aug/2016 Added the link to the Screen Survival Benefit / Deferral  *
#*                   Benefit Chargeback Details                                *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9270Retrieve
{
	VARIABLES
	{
	    OUT DisplayInput;
	}
    Title = STRINGTABLE.IDS_TITLE_BF9270Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF9270-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9270-P";
        "R" -> MIR-FCN-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

# 23774A CHANGES BEGIN
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLM-ID -> MIR-TRNX-DTL-INFO;    
    "I" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
        
# 23774A CHANGES END

    ButtonBar = "ButtonBarOK";


    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF9270-O";
    }

    # User selected one record in the list to retrieve the details

    IF action == "SelectItem"
    {
        STEP RetrieveDetail
        {
            USES PROCESS "BF9271Retrieve";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-POL-ID-T[index] -> MIR-POL-ID;
            MIR-CVG-NUM-T[index] -> MIR-CVG-NUM;
            MIR-PLAN-ID-T[index] -> MIR-PLAN-ID;
            MIR-BNFT-NM-ID-T[index] -> MIR-BNFT-NM-ID;
            MIR-BNFT-STAT-CD-T[index] -> MIR-BNFT-STAT-CD;
            MIR-CVG-FACE-AMT-T[index] -> MIR-CVG-FACE-AMT;
            MIR-BNFT-PAYBL-AMT-T[index] -> MIR-BNFT-PAYBL-AMT;
            MIR-CLBN-FINAL-MAJ-CD-T[index] -> MIR-CLBN-FINAL-MAJ-CD;
        }


        # If Cancel selected in BF9271Retrieve and we came from another flow
        # EXIT this flow otherwise TERMINATE

        IF action == "ACTION_EXIT"
        {
            IF DisplayInput == "FALSE"
                EXIT;

            ELSE
                TERMINATE;


        }

        BRANCH Retrieve;

    }
    # MP302M Changes Starts
    IF action == "GoToSrvbenChrgbckDet"
    {
        STEP SrvbenChrgbckDet
        {
            USES PROCESS "BF9D11SrvbChrbc";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }
            MIR-POL-ID-T[1]        -> MIR-POL-ID;
            "R" -> DisplayInput;
        }
        BRANCH Retrieve;
    }
    # MP302M Changes Ends

}

