# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1390Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016227  602J      Code Cleanup                                              *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF1390-P.p";
INCLUDE "BF1390-I.s";
INCLUDE "BF1390-O.s";
INCLUDE "BF1390-ND-O.s";
INCLUDE "BF1390-02-O.s";
INCLUDE "BF1390-03-O.s";
INCLUDE "BF1390-04-O.s";
INCLUDE "BF1390-05-O.s";
INCLUDE "BF1390-06-O.s";
INCLUDE "BF0420Retrieve.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF1390Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF1390Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF1390-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Retrieve the record

    STEP Retrieve
    {
        USES P-STEP "BF1390-P";
    }
  

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
#23774A CHANGES BEGIN

    temp-DTL-INFO  = MIR-CLI-ID + " " + MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;   
       
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO -> MIR-TRNX-DTL-INFO;  
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
        
#23774A CHANGES END 

    # A variation of the questions normally asked applies for the
    # state of North Dakota. A special location group has been set up
    # to accommodate this variation. Certain questions are prohibitted
    # from being asked in this state.
    # In this situation, override the standard question pages via the use
    # of a customized S-Step for both input and output S-Steps.
    # In the vast majority of cases the USES S-STEP syntax will reference a
    # S-Step value, corresponding directly to a step definition and page.
    # In the case where an override is necessary, a variable is substituted
    # for the S-Step name.  In this case, the variable name is VariableQuestionxxxx.

    IF MIR-LOC-GR-ID == "ND1"
    {
        VariableQuestionOutput = "BF1390-ND-O";

        BRANCH Display;

    }


    # If the location is not North Dakota, the regular set of questions
    # can be asked.

    VariableQuestionOutput = "BF1390-O";

    STEP Display
    {
        USES S-STEP VariableQuestionOutput;
        "ButtonBarOK" -> ButtonBar;
    }


    # If user selects OK then branch back 1 step;

    IF action == "ACTION_NEXT"
    {
        ButtonBar = "ButtonBarOKCancel";

        BRANCH Input;

    }
    IF action == "ACTION_REFRESH"
        BRANCH Display;



    # This variable will be set to the name of a subprocess that will be used
    # to view more information about a particular question.

    subProcess = "";

    IF action == "SYS-CARDIO"
    {
        subProcess = "BF0420Retrieve";
        FocusField = "MIR-DV-QSTN-RESP-TXT-023";

    }
    IF action == "SYS-DIGEST"
    {
        subProcess = "BF0420Retrieve";
        FocusField = "MIR-DV-QSTN-RESP-TXT-024";

    }
    IF action == "SYS-GLAND"
    {
        subProcess = "BF0420Retrieve";
        FocusField = "MIR-DV-QSTN-RESP-TXT-025";

    }
    IF action == "SYS-URINRY"
    {
        subProcess = "BF0420Retrieve";
        FocusField = "MIR-DV-QSTN-RESP-TXT-026";

    }
    IF action == "SYS-SKELTL"
    {
        subProcess = "BF0420Retrieve";
        FocusField = "MIR-DV-QSTN-RESP-TXT-027";

    }
    IF action == "SYS-NERVE"
    {
        subProcess = "BF0420Retrieve";
        FocusField = "MIR-DV-QSTN-RESP-TXT-028";

    }
    IF action == "SYS-RESPIR"
    {
        subProcess = "BF0420Retrieve";
        FocusField = "MIR-DV-QSTN-RESP-TXT-029";

    }
    IF action == "SYS-TUMOUR"
    {
        subProcess = "BF0420Retrieve";
        FocusField = "MIR-DV-QSTN-RESP-TXT-030";

    }
    IF action == "SYS-ANTIBD"
    {
        subProcess = "BF0420Retrieve";
        FocusField = "MIR-DV-QSTN-RESP-TXT-031";

    }
    IF action == "ALCOHOLIC"
    {
        subProcess = "BF0420Retrieve";
        FocusField = "MIR-DV-QSTN-RESP-TXT-032";

    }
    IF action == "DISBENEFIT"
    {
        subProcess = "BF0420Retrieve";
        FocusField = "MIR-DV-QSTN-RESP-TXT-033";

    }
    IF action == "CONSULTATN"
    {
        subProcess = "BF0420Retrieve";
        FocusField = "MIR-DV-QSTN-RESP-TXT-034";

    }
    IF action == "DIAG-TESTS"
    {
        subProcess = "BF0420Retrieve";
        FocusField = "MIR-DV-QSTN-RESP-TXT-035";

    }
    IF action == "SYS-AIDS"
    {
        subProcess = "BF0420Retrieve";
        FocusField = "MIR-DV-QSTN-RESP-TXT-036";

    }

    #.......

    IF subProcess != ""
    {
        STEP DisplayMedicalQuestionnaire
        {
            USES PROCESS subProcess;
            "FALSE" -> DisplayInput;
            action -> MIR-FLD-ID;
        }

        BRANCH Display;

    }
    IF action == "CHG-IND"
    {
        STEP DisplayChangeIndicator
        {
            USES S-STEP "BF1390-02-O";
            "ButtonBarOK" -> ButtonBar;
        }

        FocusField = "MIR-DV-QSTN-RESP-TXT-003";

        BRANCH Display;

    }
    IF action == "HAZ-DRIVE"
    {
        STEP DisplayHazardousDrivingIndicator
        {
            USES S-STEP "BF1390-03-O";
            "ButtonBarOK" -> ButtonBar;
        }

        FocusField = "MIR-DV-QSTN-RESP-TXT-007";

        BRANCH Display;

    }
    IF action == "HARD-DRUGS"
    {
        STEP DisplayHardDrugsIndicator
        {
            USES S-STEP "BF1390-04-O";
            "ButtonBarOK" -> ButtonBar;
        }

        FocusField = "MIR-DV-QSTN-RESP-TXT-011";

        BRANCH Display;

    }
    IF action == "SMOKE-CIGS"
    {
        STEP DisplaySmokingIndicator
        {
            USES S-STEP "BF1390-05-O";
            "ButtonBarOK" -> ButtonBar;
        }

        FocusField = "MIR-DV-QSTN-RESP-TXT-015";

        BRANCH Display;

    }
    IF action == "SMOKE-OTHR"
    {
        STEP DisplayOtherSmokingIndicator
        {
            USES S-STEP "BF1390-06-O";
            "ButtonBarOK" -> ButtonBar;
        }

        FocusField = "MIR-DV-QSTN-RESP-TXT-020";

        BRANCH Display;

    }
}

