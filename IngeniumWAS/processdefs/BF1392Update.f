# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1392Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016227  602J      Code Cleanup                                             *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF1390-P.p";
INCLUDE "BF1390-I.s";
INCLUDE "BF1392-I.s";
INCLUDE "BF1392-ND-I.s";
INCLUDE "BF1390-O.s";
INCLUDE "BF1390-ND-O.s";
INCLUDE "BF1392-P.p";
INCLUDE "BF1392-02-I.s";
INCLUDE "BF1392-03-I.s";
INCLUDE "BF1392-04-I.s";
INCLUDE "BF1392-05-I.s";
INCLUDE "BF1392-06-I.s";
INCLUDE "BF1390-02-O.s";
INCLUDE "BF1390-03-O.s";
INCLUDE "BF1390-04-O.s";
INCLUDE "BF1390-05-O.s";
INCLUDE "BF1390-06-O.s";
INCLUDE "BF0422Update.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF1392Update
{
    Title = STRINGTABLE.IDS_TITLE_BF1392Update;
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
        VariableQuestionInput = "BF1392-ND-I";
        VariableQuestionOutput = "BF1390-ND-O";

        BRANCH Edit;

    }


    # If the location is not North Dakota, the regular set of questions
    # can be asked.

    VariableQuestionInput = "BF1392-I";
    VariableQuestionOutput = "BF1390-O";

    STEP Edit
    {
        USES S-STEP VariableQuestionInput;
    }

    returnToEdit = "FALSE";


    # If user selects Cancel then branch back to the input step;

    IF action == "ACTION_BACK"
    {
        ButtonBar = "ButtonBarOKCancel";

        BRANCH Input;

    }
    IF action == "ACTION_REFRESH"
        BRANCH Edit;



    # A subProcess variable is set to the name of a subprocess
    # that will be used to collect more information about a particular question.
    # initialize the variable to blank

    subProcess = "";


    # For each details button a user may select, an action will be set from
    # the page and returned to the flow.  Evaluate those possible actions
    # to save a field for the setting of page focus, and to set the subprocess
    # variable to the action selected.

    IF action == "SYS-CARDIO"
    {
        subProcess = "BF0422Update";
        FocusField = "MIR-DV-QSTN-RESP-TXT-023";

    }
    IF action == "SYS-DIGEST"
    {
        subProcess = "BF0422Update";
        FocusField = "MIR-DV-QSTN-RESP-TXT-024";

    }
    IF action == "SYS-GLAND"
    {
        subProcess = "BF0422Update";
        FocusField = "MIR-DV-QSTN-RESP-TXT-025";

    }
    IF action == "SYS-URINRY"
    {
        subProcess = "BF0422Update";
        FocusField = "MIR-DV-QSTN-RESP-TXT-026";

    }
    IF action == "SYS-SKELTL"
    {
        subProcess = "BF0422Update";
        FocusField = "MIR-DV-QSTN-RESP-TXT-027";

    }
    IF action == "SYS-NERVE"
    {
        subProcess = "BF0422Update";
        FocusField = "MIR-DV-QSTN-RESP-TXT-028";

    }
    IF action == "SYS-RESPIR"
    {
        subProcess = "BF0422Update";
        FocusField = "MIR-DV-QSTN-RESP-TXT-029";

    }
    IF action == "SYS-TUMOUR"
    {
        subProcess = "BF0422Update";
        FocusField = "MIR-DV-QSTN-RESP-TXT-030";

    }
    IF action == "SYS-ANTIBD"
    {
        subProcess = "BF0422Update";
        FocusField = "MIR-DV-QSTN-RESP-TXT-031";

    }
    IF action == "ALCOHOLIC"
    {
        subProcess = "BF0422Update";
        FocusField = "MIR-DV-QSTN-RESP-TXT-032";

    }
    IF action == "DISBENEFIT"
    {
        subProcess = "BF0422Update";
        FocusField = "MIR-DV-QSTN-RESP-TXT-033";

    }
    IF action == "CONSULTATN"
    {
        subProcess = "BF0422Update";
        FocusField = "MIR-DV-QSTN-RESP-TXT-034";

    }
    IF action == "DIAG-TESTS"
    {
        subProcess = "BF0422Update";
        FocusField = "MIR-DV-QSTN-RESP-TXT-035";

    }
    IF action == "SYS-AIDS"
    {
        subProcess = "BF0422Update";
        FocusField = "MIR-DV-QSTN-RESP-TXT-036";

    }

    # Before sending data to the server for whatever action was selected,
    # set question response values to the blank field character if no
    # answer was selected.

    IF MIR-DV-QSTN-RESP-TXT-023 != "N" && MIR-DV-QSTN-RESP-TXT-023 != "Y"
        MIR-DV-QSTN-RESP-TXT-023 = "*";

    IF MIR-DV-QSTN-RESP-TXT-024 != "N" && MIR-DV-QSTN-RESP-TXT-024 != "Y"
        MIR-DV-QSTN-RESP-TXT-024 = "*";

    IF MIR-DV-QSTN-RESP-TXT-025 != "N" && MIR-DV-QSTN-RESP-TXT-025 != "Y"
        MIR-DV-QSTN-RESP-TXT-025 = "*";

    IF MIR-DV-QSTN-RESP-TXT-026 != "N" && MIR-DV-QSTN-RESP-TXT-026 != "Y"
        MIR-DV-QSTN-RESP-TXT-026 = "*";

    IF MIR-DV-QSTN-RESP-TXT-027 != "N" && MIR-DV-QSTN-RESP-TXT-027 != "Y"
        MIR-DV-QSTN-RESP-TXT-027 = "*";

    IF MIR-DV-QSTN-RESP-TXT-028 != "N" && MIR-DV-QSTN-RESP-TXT-028 != "Y"
        MIR-DV-QSTN-RESP-TXT-028 = "*";

    IF MIR-DV-QSTN-RESP-TXT-029 != "N" && MIR-DV-QSTN-RESP-TXT-029 != "Y"
        MIR-DV-QSTN-RESP-TXT-029 = "*";

    IF MIR-DV-QSTN-RESP-TXT-030 != "N" && MIR-DV-QSTN-RESP-TXT-030 != "Y"
        MIR-DV-QSTN-RESP-TXT-030 = "*";

    IF MIR-DV-QSTN-RESP-TXT-031 != "N" && MIR-DV-QSTN-RESP-TXT-031 != "Y"
        MIR-DV-QSTN-RESP-TXT-031 = "*";

    IF MIR-DV-QSTN-RESP-TXT-032 != "N" && MIR-DV-QSTN-RESP-TXT-032 != "Y"
        MIR-DV-QSTN-RESP-TXT-032 = "*";

    IF MIR-DV-QSTN-RESP-TXT-033 != "N" && MIR-DV-QSTN-RESP-TXT-033 != "Y"
        MIR-DV-QSTN-RESP-TXT-033 = "*";

    IF MIR-DV-QSTN-RESP-TXT-034 != "N" && MIR-DV-QSTN-RESP-TXT-034 != "Y"
        MIR-DV-QSTN-RESP-TXT-034 = "*";

    IF MIR-DV-QSTN-RESP-TXT-035 != "N" && MIR-DV-QSTN-RESP-TXT-035 != "Y"
        MIR-DV-QSTN-RESP-TXT-035 = "*";

    IF MIR-DV-QSTN-RESP-TXT-036 != "N" && MIR-DV-QSTN-RESP-TXT-036 != "Y"
        MIR-DV-QSTN-RESP-TXT-036 = "*";


    # If any action had been taken that required more details, the subprocess
    # variable will be valued.  Update the server with data before executing
    # the subprocess specified.

    IF subProcess != ""
    {

        # Update the record who's data was just entered.

        STEP UpdatePreMEDQ
        {
            USES P-STEP "BF1392-P";
        }
        
#23774A CHANGES BEGIN

      
    temp-DTL-INFO  = MIR-CLI-ID + " " + MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;  
    
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }

            IF LSIR-RETURN-CD != "00"
            BRANCH Edit;
        
#23774A CHANGES END        

        STEP MedicalQuestionnaire
        {
            USES PROCESS subProcess;

            # Because this subprocess utilizes a further subprocess, send in values
            # to fields allowing the user to bypass input pages.

            "FALSE" -> DisplayInput;

            # send in the action from the input page, to the subprocess for
            # proper retrieval of detailed questions for the base question.

            action -> MIR-FLD-ID;
        }

        BRANCH Edit;

    }

    # Evaulate the other actions possible on this page:

    IF action == "CHG-IND"
    {

        # the responses for this question will already have been retrieved by the original
        # retrieve step.  Save these values in case the user makes changes to the answers and
        # then decides to abandon the changes.

        TEMP1 = MIR-DV-QSTN-RESP-TXT-004;
        TEMP2 = MIR-DV-QSTN-RESP-TXT-005;
        TEMP3 = MIR-DV-QSTN-RESP-TXT-006;

        STEP ChangeIndicator
        {
            USES S-STEP "BF1392-02-I";
        }

        IF action != "ACTION_NEXT"
        {
            MIR-DV-QSTN-RESP-TXT-004 = TEMP1;
            MIR-DV-QSTN-RESP-TXT-005 = TEMP2;
            MIR-DV-QSTN-RESP-TXT-006 = TEMP3;

            BRANCH Edit;

        }

        returnToEdit = "TRUE";
        FocusField = "MIR-DV-QSTN-RESP-TXT-003";


        # If Unanswered was chosen, send an "*" to the server

        IF MIR-DV-QSTN-RESP-TXT-003 != "N" && MIR-DV-QSTN-RESP-TXT-003 != "Y"
            MIR-DV-QSTN-RESP-TXT-003 = "*";



        # Update the record who's data was just entered.

        STEP UpdateChangeIndicator
        {
            USES P-STEP "BF1392-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH ChangeIndicator;

#23774A CHANGES BEGIN

      
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-CLI-ID;   
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }
            IF LSIR-RETURN-CD != "00"
            BRANCH ChangeIndicator;
        
#23774A CHANGES END


        STEP OutputChangeIndicator
        {
            USES S-STEP "BF1390-02-O";
            "ButtonBarOK" -> ButtonBar;
        }

        IF returnToEdit == "TRUE"
            BRANCH Edit;


    }
    IF action == "HAZ-DRIVE"
    {

        # the responses for this question will already have been retrieved by the original
        # retrieve step.  Save these values in case the user makes changes to the answers and
        # then decides to abandon the changes.

        TEMP1 = MIR-DV-QSTN-RESP-TXT-008;
        TEMP2 = MIR-DV-QSTN-RESP-TXT-009;
        TEMP3 = MIR-DV-QSTN-RESP-TXT-010;

        STEP HazardousDrivingIndicator
        {
            USES S-STEP "BF1392-03-I";
        }

        IF action != "ACTION_NEXT"
        {
            MIR-DV-QSTN-RESP-TXT-008 = TEMP1;
            MIR-DV-QSTN-RESP-TXT-009 = TEMP2;
            MIR-DV-QSTN-RESP-TXT-010 = TEMP3;

            BRANCH Edit;

        }

        returnToEdit = "TRUE";
        FocusField = "MIR-DV-QSTN-RESP-TXT-007";

        IF MIR-DV-QSTN-RESP-TXT-007 != "N" && MIR-DV-QSTN-RESP-TXT-007 != "Y"
            MIR-DV-QSTN-RESP-TXT-007 = "*";



        # Update the record who's data was just entered.

        STEP UpdateHazardousDrivingIndicator
        {
            USES P-STEP "BF1392-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH HazardousDrivingIndicator;

#23774A CHANGES BEGIN

      
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-CLI-ID;   
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }
            IF LSIR-RETURN-CD != "00"
            BRANCH HazardousDrivingIndicator;
        
#23774A CHANGES END

        STEP OutputHazardousDrivingIndicator
        {
            USES S-STEP "BF1390-03-O";
            "ButtonBarOK" -> ButtonBar;
        }

        IF returnToEdit == "TRUE"
            BRANCH Edit;


    }
    IF action == "HARD-DRUGS"
    {

        # the responses for this question will already have been retrieved by the original
        # retrieve step.  Save these values in case the user makes changes to the answers and
        # then decides to abandon the changes.

        TEMP1 = MIR-DV-QSTN-RESP-TXT-012;
        TEMP2 = MIR-DV-QSTN-RESP-TXT-013;
        TEMP3 = MIR-DV-QSTN-RESP-TXT-014;

        STEP HardDrugsIndicator
        {
            USES S-STEP "BF1392-04-I";
        }

        IF action != "ACTION_NEXT"
        {
            MIR-DV-QSTN-RESP-TXT-012 = TEMP1;
            MIR-DV-QSTN-RESP-TXT-013 = TEMP2;
            MIR-DV-QSTN-RESP-TXT-014 = TEMP3;

            BRANCH Edit;

        }

        returnToEdit = "TRUE";
        FocusField = "MIR-DV-QSTN-RESP-TXT-011";

        IF MIR-DV-QSTN-RESP-TXT-011 != "N" && MIR-DV-QSTN-RESP-TXT-011 != "Y"
            MIR-DV-QSTN-RESP-TXT-011 = "*";



        # Update the record who's data was just entered.

        STEP UpdateHardDrugsIndicator
        {
            USES P-STEP "BF1392-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH HardDrugsIndicator;

#23774A CHANGES BEGIN

      
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-CLI-ID;   
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }
            IF LSIR-RETURN-CD != "00"
            BRANCH HardDrugsIndicator;
        
#23774A CHANGES END


        STEP OutputHardDrugsIndicator
        {
            USES S-STEP "BF1390-04-O";
            "ButtonBarOK" -> ButtonBar;
        }

        IF returnToEdit == "TRUE"
            BRANCH Edit;


    }
    IF action == "SMOKE-CIGS"
    {

        # the responses for this question will already have been retrieved by the original
        # retrieve step.  Save these values in case the user makes changes to the answers and
        # then decides to abandon the changes.

        TEMP1 = MIR-DV-QSTN-RESP-TXT-016;
        TEMP2 = MIR-DV-QSTN-RESP-TXT-017;
        TEMP3 = MIR-DV-QSTN-RESP-TXT-018;

        STEP SmokingIndicator
        {
            USES S-STEP "BF1392-05-I";
        }

        IF action != "ACTION_NEXT"
        {
            MIR-DV-QSTN-RESP-TXT-016 = TEMP1;
            MIR-DV-QSTN-RESP-TXT-017 = TEMP2;
            MIR-DV-QSTN-RESP-TXT-018 = TEMP3;

            BRANCH Edit;

        }

        returnToEdit = "TRUE";
        FocusField = "MIR-DV-QSTN-RESP-TXT-015";

        IF MIR-DV-QSTN-RESP-TXT-015 != "N" && MIR-DV-QSTN-RESP-TXT-015 != "Y"
            MIR-DV-QSTN-RESP-TXT-015 = "*";



        # Update the record who's data was just entered.

        STEP UpdateSmokingIndicator
        {
            USES P-STEP "BF1392-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH SmokingIndicator;

#23774A CHANGES BEGIN

      
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-CLI-ID;   
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }
            IF LSIR-RETURN-CD != "00"
            BRANCH SmokingIndicator;
        
#23774A CHANGES END


        STEP OutputSmokingIndicator
        {
            USES S-STEP "BF1390-05-O";
            "ButtonBarOK" -> ButtonBar;
        }

        IF returnToEdit == "TRUE"
            BRANCH Edit;


    }
    IF action == "SMOKE-OTHR"
    {

        # the responses for this question will already have been retrieved by the original
        # retrieve step.  Save these values in case the user makes changes to the answers and
        # then decides to abandon the changes.

        TEMP1 = MIR-DV-QSTN-RESP-TXT-021;
        TEMP2 = MIR-DV-QSTN-RESP-TXT-022;

        STEP OtherSmokingIndicator
        {
            USES S-STEP "BF1392-06-I";
        }

        IF action != "ACTION_NEXT"
        {
            MIR-DV-QSTN-RESP-TXT-021 = TEMP1;
            MIR-DV-QSTN-RESP-TXT-022 = TEMP2;

            BRANCH Edit;

        }

        returnToEdit = "TRUE";
        FocusField = "MIR-DV-QSTN-RESP-TXT-020";

        IF MIR-DV-QSTN-RESP-TXT-020 != "N" && MIR-DV-QSTN-RESP-TXT-020 != "Y"
            MIR-DV-QSTN-RESP-TXT-020 = "*";



        # Update the record who's data was just entered.

        STEP UpdateOtherSmokingIndicator
        {
            USES P-STEP "BF1392-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH OtherSmokingIndicator;

#23774A CHANGES BEGIN

      
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-CLI-ID;   
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }
            IF LSIR-RETURN-CD != "00"
            BRANCH OtherSmokingIndicator;
        
#23774A CHANGES END

        STEP OutputOtherSmokingIndicator
        {
            USES S-STEP "BF1390-06-O";
            "ButtonBarOK" -> ButtonBar;
        }

        IF returnToEdit == "TRUE"
            BRANCH Edit;


    }

    ButtonBar = "ButtonBarOK";

    IF MIR-DV-QSTN-RESP-TXT-001 != "N" && MIR-DV-QSTN-RESP-TXT-001 != "Y"
        MIR-DV-QSTN-RESP-TXT-001 = "*";

    IF MIR-DV-QSTN-RESP-TXT-002 != "N" && MIR-DV-QSTN-RESP-TXT-002 != "Y"
        MIR-DV-QSTN-RESP-TXT-002 = "*";

    IF MIR-DV-QSTN-RESP-TXT-019 != "N" && MIR-DV-QSTN-RESP-TXT-019 != "Y"
        MIR-DV-QSTN-RESP-TXT-019 = "*";


    STEP Update
    {
        USES P-STEP "BF1392-P";
    }
#23774A CHANGES BEGIN

      
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-CLI-ID;   
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }

            IF LSIR-RETURN-CD != "00"
            BRANCH OtherSmokingIndicator;
        
#23774A CHANGES END

    # Display the output of the update process

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
        subProcess = "BF0420Update";
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
            "ButtonBarOK" -> ButtonBar;
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

