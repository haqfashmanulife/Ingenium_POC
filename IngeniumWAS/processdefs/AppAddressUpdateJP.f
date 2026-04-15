# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   AppAddressUpdateJP                                           *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  016736  611J     Code cleanup                                              *
#*******************************************************************************

INCLUDE "AppAddressUpdateJP.s";
INCLUDE "AppAddressListJP.s";
INCLUDE "BF0494-P.p";
INCLUDE "BF0491-P.p";
INCLUDE "BF0490-P.p";
INCLUDE "BF0492-P.p";

PROCESS AppAddressUpdateJP
{
	VARIABLES
	{
	    OUT MIR-CLI-ADDR-TYP-CD-T[1];
	}
    Title = "Address Update";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "AppButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    BannerBar = "AppBannerBar";
    BannerBarSize = "40";
    MIR-CLI-ID = MIR-CLI-ID-T[1];

    # preserve the original value of the field outputted from this
    # sub-process, in case the user cancels from it.

    Orig-MIR-CLI-ADDR-TYP-CD-T[1] = MIR-CLI-ADDR-TYP-CD-T[1];

    # Set values to produce selection boxes from a Postal Code

    MIR-DV-RQST-PSTL-ADDR-GR-KJ = "KJ";
    MIR-DV-RQST-PSTL-ADDR-GR-KA = "KA";
    MIR-DV-RQST-PSTL-ADDR-LN-1-TXT = "1";
    MIR-DV-RQST-PSTL-ADDR-LN-2-TXT = "2";


    #*****************************************************************
    # The purpose of this process is to retrieve a list of existing address
    # records for the user to decide what to do next, for the owner client.
    # the only output from this process will be a value to be sent to the
    # policy upon update, recording the address that mailings are to be
    # directed to.
    #*****************************************************************

    STEP RetrieveList
    {
        USES P-STEP "BF0494-P";
        "" -> MIR-CLI-ADDR-TYP-CD;
        "" -> MIR-CLI-ADDR-SEQ-NUM;
    }

    STEP DisplayList
    {
        USES S-STEP "AppAddressListJP";
        STRINGTABLE.IDS_TITLE_BF0494List -> Title;
        "AppButtonBarAddressList" -> ButtonBar;
    }

    IF action == "ACTION_CANCEL"
    {
        MIR-CLI-ADDR-TYP-CD-T[1] = Orig-MIR-CLI-ADDR-TYP-CD-T[1];

        EXIT;

    }
    IF action == "ACTION_ADDTYPE"
    {

        # provide for an address type of other only.

        MIR-CLI-ADDR-TYP-CD = "O";

        # preserve the owner client's country of residence to default onto
        # the new address record.  This is required because the address create
        # routine will provide for a user-sign-on country default.

        temp-MIR-CLI-CTRY-CD = MIR-CLI-CTRY-CD;

        STEP AddType
        {
            USES P-STEP "BF0491-P";
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
        {

            # reset the list fields

            MIR-CLI-ADDR-TYP-CD = "";
            MIR-CLI-ADDR-SEQ-NUM = "";

            BRANCH DisplayList;

        }

        STEP RetrieveNewAddress
        {
            USES P-STEP "BF0490-P";
        }

        IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
        {

            # reset the list fields

            MIR-CLI-ADDR-TYP-CD = "";
            MIR-CLI-ADDR-SEQ-NUM = "";

            BRANCH DisplayList;

        }


        # reset the value preserved above, to the page displayed value

        MIR-CLI-CTRY-CD = temp-MIR-CLI-CTRY-CD;

        STEP UpdateNewAddress
        {
            USES S-STEP "AppAddressUpdateJP";
            STRINGTABLE.IDS_TITLE_AppCreateAddress -> Title;
        }

        IF action == "ACTION_REFRESH"
            BRANCH UpdateNewAddress;

        IF action == "ACTION_CANCEL"
            BRANCH DisplayList;

        IF action == "ACTION_OK"
        {

            #Save the address information in case the address gets defaulted from the 
            #postal code but the address record is not updated because of a failed edit

            FLOW-CLI-ADDR-LN-1-TXT-T[1] = MIR-CLI-ADDR-LN-1-TXT-T[1];
            FLOW-CLI-ADDR-LN-2-TXT-T[1] = MIR-CLI-ADDR-LN-2-TXT-T[1];
            FLOW-CLI-ADDR-LN-3-TXT-T[1] = MIR-CLI-ADDR-LN-3-TXT-T[1];
            FLOW-CLI-ADDR-ADDL-TXT-T[1] = MIR-CLI-ADDR-ADDL-TXT-T[1];
            FLOW-CLI-CITY-NM-TXT-T[1] = MIR-CLI-CITY-NM-TXT-T[1];
            FLOW-CLI-ADDR-MUN-CD = MIR-CLI-ADDR-MUN-CD;
            FLOW-CLI-JP-ADDR-CD-T[1] = MIR-CLI-JP-ADDR-CD-T[1];
            FLOW-CLI-RES-TYP-CD = MIR-CLI-RES-TYP-CD;
            FLOW-CLI-RES-NUM-T[1] = MIR-CLI-RES-NUM-T[1];

            STEP SaveNewAddress
            {
                USES P-STEP "BF0492-P";
            }


            # If the address record is not updated MIR-RETRN-CD will be set to 3
            # This indiactes that the address fields need to be restored to what was on the 
            # page before the update was processed

            IF MIR-RETRN-CD == "03"
            {
                MIR-CLI-ADDR-LN-1-TXT-T[1] = FLOW-CLI-ADDR-LN-1-TXT-T[1];
                MIR-CLI-ADDR-LN-2-TXT-T[1] = FLOW-CLI-ADDR-LN-2-TXT-T[1];
                MIR-CLI-ADDR-LN-3-TXT-T[1] = FLOW-CLI-ADDR-LN-3-TXT-T[1];
                MIR-CLI-ADDR-ADDL-TXT-T[1] = FLOW-CLI-ADDR-ADDL-TXT-T[1];
                MIR-CLI-CITY-NM-TXT-T[1] = FLOW-CLI-CITY-NM-TXT-T[1];
                MIR-CLI-ADDR-MUN-CD = FLOW-CLI-ADDR-MUN-CD;
                MIR-CLI-JP-ADDR-CD-T[1] = FLOW-CLI-JP-ADDR-CD-T[1];
                MIR-CLI-RES-TYP-CD = FLOW-CLI-RES-TYP-CD;
                MIR-CLI-RES-NUM-T[1] = FLOW-CLI-RES-NUM-T[1];

            }


            # record the policy record equivalent of the
            # address type just created, to output from
            # this process.

            MIR-CLI-ADDR-TYP-CD-T[1] = MIR-CLI-ADDR-TYP-CD;


            # If the postal code has changed return code 3, then return to the 
            # update page to select from Line 1 options and line 2 options

            IF LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "03"
                BRANCH UpdateNewAddress;


            EXIT;

        }

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;

    IF action == "ACTION_UPDATE"
    {
        MIR-CLI-ADDR-TYP-CD = MIR-CLI-ADDR-TYP-CD-T[index];
        MIR-CLI-ADDR-SEQ-NUM = MIR-CLI-ADDR-SEQ-NUM-T[index];

        STEP RetrieveAddress
        {
            USES P-STEP "BF0490-P";
        }

        STEP UpdateAddress
        {
            USES S-STEP "AppAddressUpdateJP";
            STRINGTABLE.IDS_TITLE_AppUpdateAddress -> Title;
        }

        IF action == "ACTION_REFRESH"
            BRANCH UpdateAddress;

        IF action == "ACTION_CANCEL"
            BRANCH DisplayList;

        IF action == "ACTION_OK"
        {

            #Save the address information in case the address gets defaulted from the 
            #postal code but the address record is not updated because of a failed edit

            FLOW-CLI-ADDR-LN-1-TXT-T[1] = MIR-CLI-ADDR-LN-1-TXT-T[1];
            FLOW-CLI-ADDR-LN-2-TXT-T[1] = MIR-CLI-ADDR-LN-2-TXT-T[1];
            FLOW-CLI-ADDR-LN-3-TXT-T[1] = MIR-CLI-ADDR-LN-3-TXT-T[1];
            FLOW-CLI-ADDR-ADDL-TXT-T[1] = MIR-CLI-ADDR-ADDL-TXT-T[1];
            FLOW-CLI-CITY-NM-TXT-T[1] = MIR-CLI-CITY-NM-TXT-T[1];
            FLOW-CLI-ADDR-MUN-CD = MIR-CLI-ADDR-MUN-CD;
            FLOW-CLI-JP-ADDR-CD-T[1] = MIR-CLI-JP-ADDR-CD-T[1];
            FLOW-CLI-RES-TYP-CD = MIR-CLI-RES-TYP-CD;
            FLOW-CLI-RES-NUM-T[1] = MIR-CLI-RES-NUM-T[1];

            STEP SaveAddress
            {
                USES P-STEP "BF0492-P";
            }


            # If the address record is not updated MIR-RETRN-CD will be set to 3
            # This indiactes that the address fields need to be restored to what was on the 
            # page before the update was processed

            IF MIR-RETRN-CD == "03"
            {
                MIR-CLI-ADDR-LN-1-TXT-T[1] = FLOW-CLI-ADDR-LN-1-TXT-T[1];
                MIR-CLI-ADDR-LN-2-TXT-T[1] = FLOW-CLI-ADDR-LN-2-TXT-T[1];
                MIR-CLI-ADDR-LN-3-TXT-T[1] = FLOW-CLI-ADDR-LN-3-TXT-T[1];
                MIR-CLI-ADDR-ADDL-TXT-T[1] = FLOW-CLI-ADDR-ADDL-TXT-T[1];
                MIR-CLI-CITY-NM-TXT-T[1] = FLOW-CLI-CITY-NM-TXT-T[1];
                MIR-CLI-ADDR-MUN-CD = FLOW-CLI-ADDR-MUN-CD;
                MIR-CLI-JP-ADDR-CD-T[1] = FLOW-CLI-JP-ADDR-CD-T[1];
                MIR-CLI-RES-TYP-CD = FLOW-CLI-RES-TYP-CD;
                MIR-CLI-RES-NUM-T[1] = FLOW-CLI-RES-NUM-T[1];

            }


            # record the policy record equivalent of the
            # address type just created, to output from
            # this process.

            MIR-CLI-ADDR-TYP-CD-T[1] = MIR-CLI-ADDR-TYP-CD;


            # If the postal code has changed return code 3, then return to the 
            # update page to select from Line 1 options and line 2 options

            IF LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05" || LSIR-RETURN-CD == "03"
                BRANCH UpdateAddress;



            # reset the postal lines

            MIR-PSTL-ADDR-LN-1-TXT = " ";
            MIR-PSTL-ADDR-LN-1-TXT-2 = " ";
            MIR-PSTL-ADDR-LN-2-TXT = " ";
            MIR-PSTL-ADDR-LN-2-TXT-2 = " ";

            # reset the list fields

            MIR-CLI-ADDR-TYP-CD = "";
            MIR-CLI-ADDR-SEQ-NUM = "";

            EXIT;

        }

    }
    IF action == "ACTION_ATTACH"
    {

        # record the policy record equivalent of the
        # address type just selected, to output from
        # this process.  The sequence number field is immaterial to this function.

        MIR-CLI-ADDR-TYP-CD-T[1] = MIR-CLI-ADDR-TYP-CD-T[index];

        EXIT;

    }
}

