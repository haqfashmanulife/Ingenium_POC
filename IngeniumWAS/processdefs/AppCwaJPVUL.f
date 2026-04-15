# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppCwaJPVUL.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  016763  611J     fix posting to misc. susp                                 *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************

INCLUDE "AppCwaJPVUL.s";
INCLUDE "BF0460-P.p";

PROCESS AppCwaJPVUL
{
  VARIABLES
  {
    OUT tempCashAmount;


    # ENSURE REQUIRED FIELD VALUES ARE
    # PASSED INTO THIS SUB-PROCESS

    IN MIR-POL-ID-BASE;

    IN MIR-POL-ID-SFX;


    OUT LastAction;
  }

    Title = "App Cash With Application";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "AppButtonBar";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    BannerBar = "AppBannerBar";
    BannerBarSize = "40";

    # the payment process driver resets policy number values
    # to spaces.  Store the current values in case an error condition
    # is returned by the server.

    policyId = MIR-POL-ID-BASE;
    policySfx = MIR-POL-IS-SFX;

    # default the value for the NOC agent id field from the 1st writing
    # agent on the policy

    MIR-AGT-ID = MIR-AGT-ID-T[1];

    STEP AppCwaInput
    {
        USES S-STEP "AppCwaJPVUL";
        STRINGTABLE.IDS_TITLE_AppCwa -> Title;
    }

    IF action == "ACTION_PREVIOUS"
    {
        LastAction = action;

        EXIT;

    }

    # IF THE USER HAS SELECTED THE VALUE OF "N"
    # FOR THE CASH WITH APP QUESTION SKIP THIS
    # PROCESS

    IF cashYesNo == "Y"
    {

        # IF THE USER HAS SELECTED THE VALUE OF "N"
        # FOR THE NET OF COMMISSION QUESTION AND
        # HAS ALSO ENTERED VALUES IN THE NET OF
        # COMMISSION FIELDS, CLEAR THE NOC FIELDS
        # BEFORE SENDING DATA TO THE P-STEP

        IF NOCInOut == "N"
        {

            # BLANK OUT THE AGENT
            # BLANK OUT THE RETAINED COMM

            MIR-AGT-ID = "";
            MIR-DV-POL-RCOMM-AMT = "";

        }


        # SAVE ALL MIR FIELDS TO TEMPORARY VARIABLES IN CASE
        # THE P-STEPS FAIL AND CLEAR THEM OUT

        tempCashAmount = MIR-DV-ENTR-CSH-AMT;
        tempEffDate = MIR-DV-PRCES-DT;
        tempSrcDep = MIR-CF-REG-FND-SRC-CD;
        tempSuppInd = MIR-SUPRES-CNFRM-IND;
        tempAgtId = MIR-AGT-ID;
        tempRetComm = MIR-DV-POL-RCOMM-AMT;

        # 16763 - add the next 3 lines         
        # Set the amount automatically to suspense
        # since we are using '3' for process state code

        MIR-POL-MISC-SUSP-AMT = MIR-DV-ENTR-CSH-AMT;

        STEP UpdateHost-P
        {
            USES P-STEP "BF0460-P";
            "3" -> MIR-DV-PRCES-STATE-CD;
        }

        IF LSIR-RETURN-CD != "00"
        {

            # RESET THE POLICY AND SUFFIX VALUES
            # INITIALLY BROUGHT INTO THIS FLOW
            # AS THEY ARE CHANGED TO BLANKS BY
            # THIS PROCESS DRIVER

            MIR-POL-ID-BASE = policyId;
            MIR-POL-ID-SFX = policySfx;

            IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "02"
            {

                # REPRESENTS A ERROR WITH ROLLBACK
                # THEREFORE SHOULD RESTORE THE
                # VALUES INITIALLY IN THE MIR
                # FIELDS

                MIR-DV-ENTR-CSH-AMT = tempCashAmount;
                MIR-DV-PRCES-DT = tempEffDate;
                MIR-CF-REG-FND-SRC-CD = tempSrcDep;
                MIR-SUPRES-CNFRM-IND = tempSuppInd;
                MIR-AGT-ID = tempAgtId;
                MIR-DV-POL-RCOMM-AMT = tempRetComm;

                # 16763 - add the next line      

                tempCashAmount = "";
                MIR-POL-MISC-SUSP-AMT = "";

                BRANCH AppCwaInput;

            }

        }

    }

    EXIT;
}

