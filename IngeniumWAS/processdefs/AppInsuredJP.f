# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppInsuredJP.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016227  602J      Code Cleanup                                             *
#*  016423  602J     New for release 602J                                      *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0540-P.p";
INCLUDE "BF0542-P.p";
INCLUDE "BF0550-P.p";
INCLUDE "BF0552-P.p";
INCLUDE "BF0560-P.p";
INCLUDE "BF0562-P.p";
INCLUDE "BF1060-P.p";
INCLUDE "BF1061-P.p";
INCLUDE "BF1062-P.p";
INCLUDE "BF1220-P.p";
INCLUDE "BF1222-P.p";
INCLUDE "BF8002-P.p";
INCLUDE "BF8041-P.p";
INCLUDE "AppNonmedHeightWeightJP.s";
INCLUDE "AppNonmedPhysicianJP.s";
INCLUDE "AppNonmedInsuranceHistory.s";
INCLUDE "AppNonmedFamilyHistory.s";
INCLUDE "AppNonmedEmploymentJP.s";
INCLUDE "AppInsuredList.s";
INCLUDE "AppInsuredQuestions.s";
INCLUDE "AppLifestyleQuestionsND.s";
INCLUDE "BF1390-P.p";
INCLUDE "AppLifestyleQuestions.s";
INCLUDE "BF1392-P.p";
INCLUDE "AppChangeQuestions.s";
INCLUDE "AppDrivingOffenceQuestions.s";
INCLUDE "AppControlledSubstanceQuestions.s";
INCLUDE "AppSmokingQuestions.s";
INCLUDE "AppOtherSmokingQuestions.s";
INCLUDE "AppMedicalQuestions.f";
INCLUDE "BF9061Create.f";

PROCESS AppInsuredJP
{
  VARIABLES
  {
    OUT LastAction;

    # output variables used to store and control messages
    # temporarily, back to the main flow.

    OUT BankingInfoMessages;

    OUT banking-temp-msg-t;


    OUT DataCollected-T[10];
  }

    Title = "Insured List";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    BannerBar = "AppBannerBar";
    BannerBarSize = "40";
    ButtonBar = "AppButtonBar";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    #*****************************************************************
    # Display all the Insureds and their U/W req'ts
    #*****************************************************************

    STEP RetrievePolicyInsureds
    {
        USES P-STEP "BF8041-P";
    }

    IF LSIR-RETURN-CD != "00"
        EXIT;


    # re-display any messages from the billing step.
    # messages from the step above are unlikely to be produced
    # and those from the billing step are important to note.
    # to determine if messages should be displayed from the
    # banking info step, or from the policy update step
    # evaluate a temporary variable with this information.

    IF BankingInfoMessages == "TRUE"
    {
        MESSAGES-T = banking-temp-msg-t;
        BankingInfoMessages = "FALSE";
        banking-temp-msg-t[0] = "";

        BRANCH InsuredList;

    }

    MESSAGES-T = temp-msg-t;

    STEP InsuredList
    {
        USES S-STEP "AppInsuredList";
        STRINGTABLE.IDS_TITLE_AppInsuredList -> Title;
    }

    MIR-CLI-ID = MIR-INSRD-CLI-ID-T[index];

    IF action == "ACTION_PREVIOUS"
    {
        LastAction = action;

        EXIT;

    }
    IF action == "GoToInsuredQuestions"
        BRANCH CreateCliuEntry;

    IF action == "ACTION_NEXT"
        EXIT;



    #*****************************************************************
    # ask the details for the insured to u/w (employmt, ins hist,
    # medical, etc.
    #*****************************************************************
    #******jerzy

    STEP CreateCliuEntry
    {
        USES PROCESS "BF9061Create";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

    }

    IF action == "ACTION_PREVIOUS"
        BRANCH RetrievePolicyInsureds;

    IF action == "ACTION_NEXT"
        EXIT;


    STEP InsuredQuestions
    {
        USES S-STEP "AppInsuredQuestions";
        STRINGTABLE.IDS_TITLE_AppInsuredQuestions -> Title;
    }

    IF action == "ACTION_PREVIOUS"
        BRANCH RetrievePolicyInsureds;

    IF action == "ACTION_NEXT"
        EXIT;


    # The following actions invoke links to provide client information used for underwriting

    IF action == "GoToInsuranceHistory"
    {
        STEP InsuranceHistoryRetrieve
        {
            USES P-STEP "BF0550-P";
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "02"
            BRANCH InsuredQuestions;


        STEP InsuranceHistoryInput
        {
            USES S-STEP "AppNonmedInsuranceHistory";
            STRINGTABLE.IDS_TITLE_AppInsuranceHistoryInput -> Title;
            "ButtonBarOKCancel" -> ButtonBar;
        }

        IF MIR-OINS-INFC-PEND-IND != "Y"
        {
            MIR-CLI-OINS-CO-NM-T[1] = "**";
            MIR-CLI-OINS-CO-NM-T[2] = "**";
            MIR-CLI-OINS-CO-NM-T[3] = "**";
            MIR-CLI-OINS-CO-NM-T[4] = "**";
            MIR-CLI-OINS-CO-NM-T[5] = "**";
            MIR-CLI-OINS-CO-NM-T[6] = "**";

        }
        IF MIR-OINS-INFC-PEND-IND != "Y" && MIR-OINS-INFC-PEND-IND != "N"
            MIR-OINS-INFC-PEND-IND = "*";

        IF MIR-CLI-INS-REFUS-IND != "Y"
        {
            MIR-CLI-INS-REFUS-YR = "0000";
            MIR-INS-REFUS-CO-1-NM-T[1] = "*";
            MIR-INS-REFUS-CO-1-NM-T[2] = "*";
            MIR-CLI-REFUS-CO-1-IND-T[1] = "*";
            MIR-CLI-REFUS-CO-1-IND-T[2] = "*";
            MIR-REFUS-REASN-1-TXT-T[1] = "*";
            MIR-REFUS-REASN-1-TXT-T[2] = "*";

        }
        IF MIR-CLI-INS-REFUS-IND != "Y" && MIR-CLI-INS-REFUS-IND != "N"
            MIR-CLI-INS-REFUS-IND = "*";

        IF action == "ACTION_NEXT"
        {
            STEP InsuranceHistoryProcess
            {
                USES P-STEP "BF0552-P";
            }

        }

        BRANCH InsuredQuestions;

    }
    IF action == "GoToEmployment"
    {
        STEP EmploymentGeneralInformationRetrieve
        {
            USES P-STEP "BF1220-P";
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "02"
            BRANCH InsuredQuestions;


        STEP EmploymentIncomeInformationRetrieve
        {
            USES P-STEP "BF1060-P";
            MIR-POL-ISS-EFF-DT -> MIR-CLI-INCM-EFF-DT;
        }


        # If client income (with effective date = policy issue date) does not exist, need to
        # create one after input step, therefore reset client income date to blank and if equal
        # to blank, client income record will be created, otherwise existing one will be updated

        IF MIR-RETRN-CD != "00"
            MIR-CLI-INCM-EFF-DT = "";


        # set a default country code for an employment address
        # to be equal to that of the country for the client's
        # residence address, unless one exists already.

        IF MIR-CLI-EMPLR-CTRY-CD == ""
            MIR-CLI-EMPLR-CTRY-CD = MIR-CLI-CTRY-CD;


        STEP EmploymentInformationInput
        {
            USES S-STEP "AppNonmedEmploymentJP";
            STRINGTABLE.IDS_TITLE_AppEmploymentInformation -> Title;
            "ButtonBarOKCancel" -> ButtonBar;
        }

        IF action == "ACTION_REFRESH"
            BRANCH EmploymentInformationInput;

        IF action == "ACTION_NEXT"
        {
            IF MIR-CLI-INCM-EFF-DT == ""
                STEP EmploymentIncomeInformationCreate
                {
                    USES P-STEP "BF1061-P";
                    MIR-POL-ISS-EFF-DT -> MIR-CLI-INCM-EFF-DT;
                }

            IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "02"
                BRANCH EmploymentInformationInput;


            STEP EmploymentIncomeInformationProcess
            {
                USES P-STEP "BF1062-P";
            }

            IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "02"
                BRANCH EmploymentInformationInput;


            STEP EmploymentGeneralInformationProcess
            {
                USES P-STEP "BF1222-P";
            }

            IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "02"
                BRANCH EmploymentInformationInput;


            BRANCH InsuredQuestions;

        }

        BRANCH InsuredQuestions;

    }
    IF action == "GoToHeightWeight"
    {
        STEP HeightWeightInfoRetrieve
        {
            USES P-STEP "BF0540-P";
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "02"
            BRANCH InsuredQuestions;


        STEP HeightWeightInfoInput
        {
            USES S-STEP "AppNonmedHeightWeightJP";
            STRINGTABLE.IDS_TITLE_AppHeightWeight -> Title;
            "ButtonBarOKCancel" -> ButtonBar;
        }

        IF action == "ACTION_NEXT"
        {
            STEP HeightWeightInfoProcess
            {
                USES P-STEP "BF0542-P";
            }

            IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "02"
                BRANCH HeightWeightInfoInput;


            BRANCH InsuredQuestions;

        }

        BRANCH InsuredQuestions;

    }
    IF action == "GoToPhysician"
    {
        STEP PhysicianInfoRetrieve
        {
            USES P-STEP "BF0540-P";
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "02"
            BRANCH InsuredQuestions;


        STEP PhysicianInfoInput
        {
            USES S-STEP "AppNonmedPhysicianJP";
            STRINGTABLE.IDS_TITLE_AppPhysician -> Title;
            "ButtonBarOKCancel" -> ButtonBar;
        }

        IF action == "ACTION_REFRESH"
            BRANCH PhysicianInfoInput;

        IF action == "ACTION_NEXT"
        {
            STEP PhysicianInfoProcess
            {
                USES P-STEP "BF0542-P";
            }

            IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "02"
                BRANCH PhysicianInfoInput;


            BRANCH InsuredQuestions;

        }

        BRANCH InsuredQuestions;

    }
    IF action == "GoToFamilyHistory"
    {
        STEP FamilyHistoryRetrieve
        {
            USES P-STEP "BF0560-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH InsuredQuestions;


        STEP FamilyHistoryInput
        {
            USES S-STEP "AppNonmedFamilyHistory";
            STRINGTABLE.IDS_TITLE_AppFamilyHistory -> Title;
            "ButtonBarOKCancel" -> ButtonBar;
        }

        IF MIR-HIST-UNKNWN-IND != "N"
        {
            MIR-CLI-REL-DTH-AGE-T[1] = "000";
            MIR-CLI-REL-DTH-AGE-T[2] = "000";
            MIR-CLI-REL-DTH-AGE-T[3] = "000";
            MIR-CLI-REL-DTH-AGE-T[4] = "000";
            MIR-CLI-REL-LVNG-AGE-T[1] = "000";
            MIR-CLI-REL-LVNG-AGE-T[2] = "000";
            MIR-CLI-REL-LVNG-AGE-T[3] = "000";
            MIR-CLI-REL-LVNG-AGE-T[4] = "000";
            MIR-HERED-DISORD-1-CD-T[1] = "*";
            MIR-HERED-DISORD-1-CD-T[2] = "*";
            MIR-HERED-DISORD-1-CD-T[3] = "*";
            MIR-HERED-DISORD-1-CD-T[4] = "*";
            MIR-HERED-DISORD-2-CD-T[1] = "*";
            MIR-HERED-DISORD-2-CD-T[2] = "*";
            MIR-HERED-DISORD-2-CD-T[3] = "*";
            MIR-HERED-DISORD-2-CD-T[4] = "*";
            MIR-REL-HLTH-STATE-CD-T[1] = "*";
            MIR-REL-HLTH-STATE-CD-T[2] = "*";
            MIR-REL-HLTH-STATE-CD-T[3] = "*";
            MIR-REL-HLTH-STATE-CD-T[4] = "*";
            MIR-CLI-REL-LVNG-QTY-T[3] = "00";
            MIR-CLI-REL-LVNG-QTY-T[4] = "00";
            MIR-CLI-REL-DTH-QTY-T[3] = "00";
            MIR-CLI-REL-DTH-QTY-T[4] = "00";

        }
        IF MIR-HIST-UNKNWN-IND != "N" && MIR-HIST-UNKNWN-IND != "Y"
            MIR-HIST-UNKNWN-IND = "*";

        IF action == "ACTION_NEXT"
        {
            STEP FamilyHistoryProcess
            {
                USES P-STEP "BF0562-P";
            }

        }

        BRANCH InsuredQuestions;

    }
    IF action == "GoToLifestyle"
    {
        STEP LifestyleRetrieve
        {
            USES P-STEP "BF1390-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH InsuredQuestions;


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
            VariableQuestionInput = "AppLifestyleQuestionsND";

            BRANCH LifestyleInput;

        }


        # If the location is not North Dakota, the regular set of questions
        # can be asked.

        VariableQuestionInput = "AppLifestyleQuestions";

        STEP LifestyleInput
        {
            USES S-STEP VariableQuestionInput;
            STRINGTABLE.IDS_TITLE_AppLifestyleQuestions -> Title;
            "ButtonBarOKCancel" -> ButtonBar;
        }


        # Next variable set to true if user chooses to input additional details to any question
        # If this variable is true, main lifestyle questions page will be invoked after providing
        # additional details, otherwise proceed to next step

        ReturnToLifestyleInput = "FALSE";

        # This variable will be set to the name of the medical questions subprocess if user chooses
        # to input additional details for a medical question. If this variable is not blank, the
        # subprocess to provide additional details will be invoked.

        subProcess = "";

        IF action == "SYS-CARDIO"
        {
            subProcess = "AppMedicalQuestions";
            FocusField = "MIR-DV-QSTN-RESP-TXT-023";

        }
        IF action == "SYS-DIGEST"
        {
            subProcess = "AppMedicalQuestions";
            FocusField = "MIR-DV-QSTN-RESP-TXT-024";

        }
        IF action == "SYS-GLAND"
        {
            subProcess = "AppMedicalQuestions";
            FocusField = "MIR-DV-QSTN-RESP-TXT-025";

        }
        IF action == "SYS-URINRY"
        {
            subProcess = "AppMedicalQuestions";
            FocusField = "MIR-DV-QSTN-RESP-TXT-026";

        }
        IF action == "SYS-SKELTL"
        {
            subProcess = "AppMedicalQuestions";
            FocusField = "MIR-DV-QSTN-RESP-TXT-027";

        }
        IF action == "SYS-NERVE"
        {
            subProcess = "AppMedicalQuestions";
            FocusField = "MIR-DV-QSTN-RESP-TXT-028";

        }
        IF action == "SYS-RESPIR"
        {
            subProcess = "AppMedicalQuestions";
            FocusField = "MIR-DV-QSTN-RESP-TXT-029";

        }
        IF action == "SYS-TUMOUR"
        {
            subProcess = "AppMedicalQuestions";
            FocusField = "MIR-DV-QSTN-RESP-TXT-030";

        }
        IF action == "SYS-ANTIBD"
        {
            subProcess = "AppMedicalQuestions";
            FocusField = "MIR-DV-QSTN-RESP-TXT-031";

        }
        IF action == "ALCOHOLIC"
        {
            subProcess = "AppMedicalQuestions";
            FocusField = "MIR-DV-QSTN-RESP-TXT-032";

        }
        IF action == "DISBENEFIT"
        {
            subProcess = "AppMedicalQuestions";
            FocusField = "MIR-DV-QSTN-RESP-TXT-033";

        }
        IF action == "CONSULTATN"
        {
            subProcess = "AppMedicalQuestions";
            FocusField = "MIR-DV-QSTN-RESP-TXT-034";

        }
        IF action == "DIAG-TESTS"
        {
            subProcess = "AppMedicalQuestions";
            FocusField = "MIR-DV-QSTN-RESP-TXT-035";

        }
        IF action == "SYS-AIDS"
        {
            subProcess = "AppMedicalQuestions";
            FocusField = "MIR-DV-QSTN-RESP-TXT-036";

        }
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

        IF subProcess != ""
        {
            STEP LifestyleProcess1
            {
                USES P-STEP "BF1392-P";
            }

            IF LSIR-RETURN-CD != "00"
                BRANCH LifestyleInput;



            # Have to call subprocess since BF1392-P and BF0422-P use same variables
            # otherwise variables will be overridden

            STEP MedicalQuestionnaire
            {
                USES PROCESS subProcess;
                action -> MIR-FLD-ID;
            }

            IF LSIR-RETURN-CD != "00"
                BRANCH LifestyleInput;


            ReturnToLifestyleInput = "TRUE";

        }


        # Following are actions for links to input additional details for a particular question

        detailquestion = "";

        IF action == "CHG-IND"
        {
            TEMP1 = MIR-DV-QSTN-RESP-TXT-004;
            TEMP2 = MIR-DV-QSTN-RESP-TXT-005;
            TEMP3 = MIR-DV-QSTN-RESP-TXT-006;
            detailquestion = "CHG-IND";

            STEP ChangeIndicator
            {
                USES S-STEP "AppChangeQuestions";
                STRINGTABLE.IDS_TITLE_AppChangeDetails -> Title;
                "ButtonBarOKCancel" -> ButtonBar;
            }

            IF action != "ACTION_NEXT"
            {
                MIR-DV-QSTN-RESP-TXT-004 = TEMP1;
                MIR-DV-QSTN-RESP-TXT-005 = TEMP2;
                MIR-DV-QSTN-RESP-TXT-006 = TEMP3;

                BRANCH LifestyleInput;

            }

            ReturnToLifestyleInput = "TRUE";
            FocusField = "MIR-DV-QSTN-RESP-TXT-003";

        }
        IF action == "HAZ-DRIVE"
        {
            TEMP1 = MIR-DV-QSTN-RESP-TXT-008;
            TEMP2 = MIR-DV-QSTN-RESP-TXT-009;
            TEMP3 = MIR-DV-QSTN-RESP-TXT-010;
            detailquestion = "HAZ-DRIVE";

            STEP HazardousDrivingIndicator
            {
                USES S-STEP "AppDrivingOffenceQuestions";
                STRINGTABLE.IDS_TITLE_AppDrivingDetails -> Title;
                "ButtonBarOKCancel" -> ButtonBar;
            }

            IF action != "ACTION_NEXT"
            {
                MIR-DV-QSTN-RESP-TXT-008 = TEMP1;
                MIR-DV-QSTN-RESP-TXT-009 = TEMP2;
                MIR-DV-QSTN-RESP-TXT-010 = TEMP3;

                BRANCH LifestyleInput;

            }

            ReturnToLifestyleInput = "TRUE";
            FocusField = "MIR-DV-QSTN-RESP-TXT-007";

        }
        IF action == "HARD-DRUGS"
        {
            TEMP1 = MIR-DV-QSTN-RESP-TXT-012;
            TEMP2 = MIR-DV-QSTN-RESP-TXT-013;
            TEMP3 = MIR-DV-QSTN-RESP-TXT-014;
            detailquestion = "HARD-DRUGS";

            STEP HardDrugsIndicator
            {
                USES S-STEP "AppControlledSubstanceQuestions";
                STRINGTABLE.IDS_TITLE_AppSubstanceDetails -> Title;
                "ButtonBarOKCancel" -> ButtonBar;
            }

            IF action != "ACTION_NEXT"
            {
                MIR-DV-QSTN-RESP-TXT-012 = TEMP1;
                MIR-DV-QSTN-RESP-TXT-013 = TEMP2;
                MIR-DV-QSTN-RESP-TXT-014 = TEMP3;

                BRANCH LifestyleInput;

            }

            ReturnToLifestyleInput = "TRUE";
            FocusField = "MIR-DV-QSTN-RESP-TXT-011";

        }
        IF action == "SMOKE-CIGS"
        {
            TEMP1 = MIR-DV-QSTN-RESP-TXT-016;
            TEMP2 = MIR-DV-QSTN-RESP-TXT-017;
            TEMP3 = MIR-DV-QSTN-RESP-TXT-018;
            detailquestion = "SMOKE-CIGS";

            STEP SmokingIndicator
            {
                USES S-STEP "AppSmokingQuestions";
                STRINGTABLE.IDS_TITLE_AppSmokingDetails -> Title;
                "ButtonBarOKCancel" -> ButtonBar;
            }

            IF action != "ACTION_NEXT"
            {
                MIR-DV-QSTN-RESP-TXT-016 = TEMP1;
                MIR-DV-QSTN-RESP-TXT-017 = TEMP2;
                MIR-DV-QSTN-RESP-TXT-018 = TEMP3;

                BRANCH LifestyleInput;

            }

            ReturnToLifestyleInput = "TRUE";
            FocusField = "MIR-DV-QSTN-RESP-TXT-015";

        }
        IF action == "SMOKE-OTHR"
        {
            TEMP1 = MIR-DV-QSTN-RESP-TXT-021;
            TEMP2 = MIR-DV-QSTN-RESP-TXT-022;
            detailquestion = "SMOKE-OTHR";

            STEP OtherSmokingIndicator
            {
                USES S-STEP "AppOtherSmokingQuestions";
                STRINGTABLE.IDS_TITLE_AppSmokingOtherDetails -> Title;
                "ButtonBarOKCancel" -> ButtonBar;
            }

            IF action != "ACTION_NEXT"
            {
                MIR-DV-QSTN-RESP-TXT-021 = TEMP1;
                MIR-DV-QSTN-RESP-TXT-022 = TEMP2;

                BRANCH LifestyleInput;

            }

            ReturnToLifestyleInput = "TRUE";
            FocusField = "MIR-DV-QSTN-RESP-TXT-020";

        }

        # If Unanswered was chosen, send an "*" to the server

        IF MIR-DV-QSTN-RESP-TXT-001 != "N" && MIR-DV-QSTN-RESP-TXT-001 != "Y"
            MIR-DV-QSTN-RESP-TXT-001 = "*";

        IF MIR-DV-QSTN-RESP-TXT-002 != "N" && MIR-DV-QSTN-RESP-TXT-002 != "Y"
            MIR-DV-QSTN-RESP-TXT-002 = "*";

        IF MIR-DV-QSTN-RESP-TXT-003 != "N" && MIR-DV-QSTN-RESP-TXT-003 != "Y"
            MIR-DV-QSTN-RESP-TXT-003 = "*";

        IF MIR-DV-QSTN-RESP-TXT-007 != "N" && MIR-DV-QSTN-RESP-TXT-007 != "Y"
            MIR-DV-QSTN-RESP-TXT-007 = "*";

        IF MIR-DV-QSTN-RESP-TXT-011 != "N" && MIR-DV-QSTN-RESP-TXT-011 != "Y"
            MIR-DV-QSTN-RESP-TXT-011 = "*";

        IF MIR-DV-QSTN-RESP-TXT-015 != "N" && MIR-DV-QSTN-RESP-TXT-015 != "Y"
            MIR-DV-QSTN-RESP-TXT-015 = "*";

        IF MIR-DV-QSTN-RESP-TXT-019 != "N" && MIR-DV-QSTN-RESP-TXT-019 != "Y"
            MIR-DV-QSTN-RESP-TXT-019 = "*";

        IF MIR-DV-QSTN-RESP-TXT-020 != "N" && MIR-DV-QSTN-RESP-TXT-020 != "Y"
            MIR-DV-QSTN-RESP-TXT-020 = "*";

        IF action == "ACTION_NEXT"
        {
            STEP LifestyleProcess2
            {
                USES P-STEP "BF1392-P";
            }

            IF LSIR-RETURN-CD != "00"
            {
                IF detailquestion == "CHG-IND"
                    BRANCH ChangeIndicator;

                IF detailquestion == "HAZ-DRIVE"
                    BRANCH HazardousDrivingIndicator;

                IF detailquestion == "HARD-DRUGS"
                    BRANCH HardDrugsIndicator;

                IF detailquestion == "SMOKE-CIGS"
                    BRANCH SmokingIndicator;

                IF detailquestion == "SMOKE-OTHR"
                    BRANCH OtherSmokingIndicator;


            }
            IF ReturnToLifestyleInput == "TRUE"
                BRANCH LifestyleInput;

            IF MIR-DV-POL-INSRD-QTY > "01"
            {
                DataCollected-T[index] = "Yes";

                BRANCH InsuredList;

            }

            DataCollected-T[index] = "Yes";

            EXIT;

        }
        IF action == "ACTION_BACK"
        {
            IF ReturnToLifestyleInput == "TRUE"
                BRANCH LifestyleInput;


            DataCollected-T[index] = "Yes";

            BRANCH InsuredQuestions;

        }

        STEP Update
        {
            USES P-STEP "BF1392-P";
        }

    }
}

