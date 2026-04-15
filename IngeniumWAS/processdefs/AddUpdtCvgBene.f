# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AddUpdtCvgBene.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02NB64  WBP      New                                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8041-P.p";
INCLUDE "BF1051-P.p";
INCLUDE "BF1051-I.s";
INCLUDE "BF1052-I.s";
INCLUDE "BF1052-P.p";
INCLUDE "BF1054-P.p";
INCLUDE "AddUpdtCvgBene.s";

PROCESS AddUpdtCvgBene
{
	VARIABLES
	{
	    OUT LastAction;
	}
    Title = "Application Beneficiary";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "AppButtonBar";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    BannerBar = "AppBannerBar";
    BannerBarSize = "40";


    #*****************************************************************
    # Retrieve list of Insureds entered on the Policy
    #*****************************************************************

    STEP RetrievePolicyInsureds
    {
        USES P-STEP "BF8041-P";
    }


    # ensure fields are kept for selection table (really no need for 20
    # - could limit to 12, Beneficiary P-Step/S-step, limited to 12)...

    temp-id-1 = MIR-CLI-ID-T[1];
    temp-id-2 = MIR-CLI-ID-T[2];
    temp-id-3 = MIR-CLI-ID-T[3];
    temp-id-4 = MIR-CLI-ID-T[4];
    temp-id-5 = MIR-CLI-ID-T[5];
    temp-id-6 = MIR-CLI-ID-T[6];
    temp-id-7 = MIR-CLI-ID-T[7];
    temp-id-8 = MIR-CLI-ID-T[8];
    temp-id-9 = MIR-CLI-ID-T[9];
    temp-id-10 = MIR-CLI-ID-T[10];
    temp-id-11 = MIR-CLI-ID-T[11];
    temp-id-12 = MIR-CLI-ID-T[12];
    temp-id-13 = MIR-CLI-ID-T[13];
    temp-id-14 = MIR-CLI-ID-T[14];
    temp-id-15 = MIR-CLI-ID-T[15];
    temp-id-16 = MIR-CLI-ID-T[16];
    temp-id-17 = MIR-CLI-ID-T[17];
    temp-id-18 = MIR-CLI-ID-T[18];
    temp-id-19 = MIR-CLI-ID-T[19];
    temp-id-20 = MIR-CLI-ID-T[20];


    #*****************************************************************
    # Retrieve list of all Beneficiaries attached to Policy...
    #*****************************************************************

    STEP RetrieveBeneList
    {
        USES P-STEP "BF1054-P";

        # ensure a complete listing is retrieved
        # set key fields to 00

        " " -> MIR-INSRD-CLI-ID;
        "00" -> MIR-BNFY-SEQ-NUM;
    }

    MIR-CLI-ID-T[1] = temp-id-1;
    MIR-CLI-ID-T[2] = temp-id-2;
    MIR-CLI-ID-T[3] = temp-id-3;
    MIR-CLI-ID-T[4] = temp-id-4;
    MIR-CLI-ID-T[5] = temp-id-5;
    MIR-CLI-ID-T[6] = temp-id-6;
    MIR-CLI-ID-T[7] = temp-id-7;
    MIR-CLI-ID-T[8] = temp-id-8;
    MIR-CLI-ID-T[9] = temp-id-9;
    MIR-CLI-ID-T[10] = temp-id-10;
    MIR-CLI-ID-T[11] = temp-id-11;
    MIR-CLI-ID-T[12] = temp-id-12;
    MIR-CLI-ID-T[13] = temp-id-13;
    MIR-CLI-ID-T[14] = temp-id-14;
    MIR-CLI-ID-T[15] = temp-id-15;
    MIR-CLI-ID-T[16] = temp-id-16;
    MIR-CLI-ID-T[17] = temp-id-17;
    MIR-CLI-ID-T[18] = temp-id-18;
    MIR-CLI-ID-T[19] = temp-id-19;
    MIR-CLI-ID-T[20] = temp-id-20;

    # move overriden messages back prior to an s-step being displayed

    MESSAGES-T = temp-msg-t;

    IF LSIR-RETURN-CODE != "00"
        BRANCH BenePage;


    STEP BenePage
    {
        USES S-STEP "AddUpdtCvgBene";
        STRINGTABLE.IDS_TITLE_AppBeneficiary -> Title;
        "AppButtonBarOKPrevNext" -> ButtonBar;

        # initialize all detail fields to spaces

        " " -> MIR-BNFY-NM;
        " " -> MIR-BNFY-DESGNT-CD;
        " " -> MIR-BNFY-PRCDS-PCT;
        " " -> MIR-BNFY-TYP-CD;
        " " -> MIR-BNFY-REL-INSRD-CD;
        " " -> MIR-BNFY-MINR-IND;
        " " -> MIR-INSRD-CLI-ID;
    }


    # move blank messages prior to an input s-step being displayed
    # to be sure the user won't see old messages.

    MESSAGES-T[0] = "";

    IF action == "ACTION_BACK"
    {
        LastAction = action;

        EXIT;

    }
    IF action == "ACTION_OK"
    {
        MIR-CLI-ID = "";
        MIR-INSRD-CLI-ID = MIR-CLI-ID-T[index];

        STEP EnterCreateBene
        {
            USES S-STEP "BF1052-I";
            "AppButtonBarOKCancel" -> ButtonBar;
            "O" -> MIR-BNFY-TYP-CD;
        }

        IF action == "ACTION_CANCEL"
            BRANCH BenePage;


        STEP CreateBene
        {
            USES P-STEP "BF1051-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH BenePage;


        STEP UpdateBene
        {
            USES P-STEP "BF1052-P";

            # assumption is that all Beneficiaries will
            # be added at the policy level.
            # set coverage to "00".

            "00" -> MIR-CVG-NUM;
        }


        # Preserve messages from the step above.
        # Messages are being overridden by the p-steps that follow,
        # prior to an s-step being displayed.

        temp-msg-t = MESSAGES-T;

        IF LSIR-RETURN-CD != "00"
        {

            # if there is an error on that screen we stay there until the error 
            # is fixed or user press "previous" button.

            STEP UpdateBeneError
            {
                USES S-STEP "BF1052-I";
                "AppButtonBarOKCancel" -> ButtonBar;
            }

            IF action == "ACTION_CANCEL"
                BRANCH RetrieveBeneList;


            BRANCH UpdateBene;

        }

        BRANCH RetrieveBeneList;

    }

    EXIT;
}

