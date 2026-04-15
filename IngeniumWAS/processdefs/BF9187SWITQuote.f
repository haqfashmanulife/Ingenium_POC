# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9187SWITQuote.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M142U1  CTS      INITIAL VERSION
#*  C21111  CTS      ADDED MIR-DV-2-CVG-PRIM-GR-ID AS A FIX FOR M213L1         *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

INCLUDE "BF9180-P.p";
INCLUDE "BF9180-I.s";
INCLUDE "BF9182-I.s";
INCLUDE "BF9183-I.s";
INCLUDE "BF9183MultiSwitch.f";
INCLUDE "BF9182-O.s";
INCLUDE "BF9182-P.p";
INCLUDE "BF9187-P.p";

PROCESS BF9187SWITQuote
{
    Title = STRINGTABLE.IDS_TITLE_BF9187SWITQuote;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Clear the messages before displaying the s-step for the first time
     
    MESSAGES-T[0] = "";

    # Always perform a refresh when this process is invoked.

    STEP Input
    {
        USES S-STEP "BF9180-I";
  #         ATTRIBUTES
  #         {
  #             SendMessages = "NO";
  #         }
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        EXIT;
    }

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

    STEP Retrieve
    {
        USES P-STEP "BF9180-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # The overides below allow the drop down box to operate in an array

    STEP Edit
    {
        USES S-STEP "BF9182-I";
        "ButtonBarSwitch" -> ButtonBar;
        MIR-PLAN-ID-T[1] -> temp-PLAN-ID-1;
        MIR-PLAN-ID-T[2] -> temp-PLAN-ID-2;
        MIR-PLAN-ID-T[3] -> temp-PLAN-ID-3;
        MIR-PLAN-ID-T[4] -> temp-PLAN-ID-4;
        MIR-PLAN-ID-T[5] -> temp-PLAN-ID-5;
        MIR-PLAN-ID-T[6] -> temp-PLAN-ID-6;
        MIR-PLAN-ID-T[7] -> temp-PLAN-ID-7;
        MIR-PLAN-ID-T[8] -> temp-PLAN-ID-8;
        MIR-PLAN-ID-T[9] -> temp-PLAN-ID-9;
        MIR-PLAN-ID-T[10] -> temp-PLAN-ID-10;
        MIR-PLAN-ID-T[11] -> temp-PLAN-ID-11;
        MIR-PLAN-ID-T[12] -> temp-PLAN-ID-12;
        MIR-PLAN-ID-T[13] -> temp-PLAN-ID-13;
        MIR-PLAN-ID-T[14] -> temp-PLAN-ID-14;
        MIR-PLAN-ID-T[15] -> temp-PLAN-ID-15;
        MIR-PLAN-ID-T[16] -> temp-PLAN-ID-16;
        MIR-PLAN-ID-T[17] -> temp-PLAN-ID-17;
        MIR-PLAN-ID-T[18] -> temp-PLAN-ID-18;
        MIR-PLAN-ID-T[19] -> temp-PLAN-ID-19;
        MIR-PLAN-ID-T[20] -> temp-PLAN-ID-20;
        MIR-PLAN-ID-T[21] -> temp-PLAN-ID-21;
        MIR-PLAN-ID-T[22] -> temp-PLAN-ID-22;
        MIR-PLAN-ID-T[23] -> temp-PLAN-ID-23;
        MIR-PLAN-ID-T[24] -> temp-PLAN-ID-24;
        MIR-PLAN-ID-T[25] -> temp-PLAN-ID-25;
        MIR-PLAN-ID-T[26] -> temp-PLAN-ID-26;
        MIR-PLAN-ID-T[27] -> temp-PLAN-ID-27;
        MIR-PLAN-ID-T[28] -> temp-PLAN-ID-28;
        MIR-PLAN-ID-T[29] -> temp-PLAN-ID-29;
        MIR-PLAN-ID-T[30] -> temp-PLAN-ID-30;
        MIR-PLAN-ID-T[31] -> temp-PLAN-ID-31;
        MIR-PLAN-ID-T[32] -> temp-PLAN-ID-32;
        MIR-PLAN-ID-T[33] -> temp-PLAN-ID-33;
        MIR-PLAN-ID-T[34] -> temp-PLAN-ID-34;
        MIR-PLAN-ID-T[35] -> temp-PLAN-ID-35;
        MIR-PLAN-ID-T[36] -> temp-PLAN-ID-36;
        MIR-PLAN-ID-T[37] -> temp-PLAN-ID-37;
        MIR-PLAN-ID-T[38] -> temp-PLAN-ID-38;
        MIR-PLAN-ID-T[39] -> temp-PLAN-ID-39;
        MIR-PLAN-ID-T[40] -> temp-PLAN-ID-40;
        MIR-PLAN-ID-T[41] -> temp-PLAN-ID-41;
        MIR-PLAN-ID-T[42] -> temp-PLAN-ID-42;
        MIR-PLAN-ID-T[43] -> temp-PLAN-ID-43;
        MIR-PLAN-ID-T[44] -> temp-PLAN-ID-44;
        MIR-PLAN-ID-T[45] -> temp-PLAN-ID-45;
        MIR-PLAN-ID-T[46] -> temp-PLAN-ID-46;
        MIR-PLAN-ID-T[47] -> temp-PLAN-ID-47;
        MIR-PLAN-ID-T[48] -> temp-PLAN-ID-48;
        MIR-PLAN-ID-T[49] -> temp-PLAN-ID-49;
        MIR-PLAN-ID-T[50] -> temp-PLAN-ID-50;
        MIR-PLAN-ID-T[51] -> temp-PLAN-ID-51;
        MIR-PLAN-ID-T[52] -> temp-PLAN-ID-52;
        MIR-PLAN-ID-T[53] -> temp-PLAN-ID-53;
        MIR-PLAN-ID-T[54] -> temp-PLAN-ID-54;
        MIR-PLAN-ID-T[55] -> temp-PLAN-ID-55;
        MIR-PLAN-ID-T[56] -> temp-PLAN-ID-56;
        MIR-PLAN-ID-T[57] -> temp-PLAN-ID-57;
        MIR-PLAN-ID-T[58] -> temp-PLAN-ID-58;
        MIR-PLAN-ID-T[59] -> temp-PLAN-ID-59;
        MIR-PLAN-ID-T[60] -> temp-PLAN-ID-60;
        MIR-PLAN-ID-T[61] -> temp-PLAN-ID-61;
        MIR-PLAN-ID-T[62] -> temp-PLAN-ID-62;
        MIR-PLAN-ID-T[63] -> temp-PLAN-ID-63;
        MIR-PLAN-ID-T[64] -> temp-PLAN-ID-64;
        MIR-PLAN-ID-T[65] -> temp-PLAN-ID-65;
        MIR-PLAN-ID-T[66] -> temp-PLAN-ID-66;
        MIR-PLAN-ID-T[67] -> temp-PLAN-ID-67;
        MIR-PLAN-ID-T[68] -> temp-PLAN-ID-68;
        MIR-PLAN-ID-T[69] -> temp-PLAN-ID-69;
        MIR-PLAN-ID-T[70] -> temp-PLAN-ID-70;
        MIR-PLAN-ID-T[71] -> temp-PLAN-ID-71;
        MIR-PLAN-ID-T[72] -> temp-PLAN-ID-72;
        MIR-PLAN-ID-T[73] -> temp-PLAN-ID-73;
        MIR-PLAN-ID-T[74] -> temp-PLAN-ID-74;
        MIR-PLAN-ID-T[75] -> temp-PLAN-ID-75;
        MIR-PLAN-ID-T[76] -> temp-PLAN-ID-76;
        MIR-PLAN-ID-T[77] -> temp-PLAN-ID-77;
        MIR-PLAN-ID-T[78] -> temp-PLAN-ID-78;
        MIR-PLAN-ID-T[79] -> temp-PLAN-ID-79;
        MIR-PLAN-ID-T[80] -> temp-PLAN-ID-80;
        MIR-PLAN-ID-T[81] -> temp-PLAN-ID-81;
        MIR-PLAN-ID-T[82] -> temp-PLAN-ID-82;
        MIR-PLAN-ID-T[83] -> temp-PLAN-ID-83;
        MIR-PLAN-ID-T[84] -> temp-PLAN-ID-84;
        MIR-PLAN-ID-T[85] -> temp-PLAN-ID-85;
        MIR-PLAN-ID-T[86] -> temp-PLAN-ID-86;
        MIR-PLAN-ID-T[87] -> temp-PLAN-ID-87;
        MIR-PLAN-ID-T[88] -> temp-PLAN-ID-88;
        MIR-PLAN-ID-T[89] -> temp-PLAN-ID-89;
        MIR-PLAN-ID-T[90] -> temp-PLAN-ID-90;
        MIR-PLAN-ID-T[91] -> temp-PLAN-ID-91;
        MIR-PLAN-ID-T[92] -> temp-PLAN-ID-92;
        MIR-PLAN-ID-T[93] -> temp-PLAN-ID-93;
        MIR-PLAN-ID-T[94] -> temp-PLAN-ID-94;
        MIR-PLAN-ID-T[95] -> temp-PLAN-ID-95;
        MIR-PLAN-ID-T[96] -> temp-PLAN-ID-96;
        MIR-PLAN-ID-T[97] -> temp-PLAN-ID-97;
        MIR-PLAN-ID-T[98] -> temp-PLAN-ID-98;
        MIR-PLAN-ID-T[99] -> temp-PLAN-ID-99;
        MIR-PLAN-ID-T[100] -> temp-PLAN-ID-100;
        MIR-PLAN-ID-T[101] -> temp-PLAN-ID-101;
        MIR-PLAN-ID-T[102] -> temp-PLAN-ID-102;
        MIR-PLAN-ID-T[103] -> temp-PLAN-ID-103;
        MIR-PLAN-ID-T[104] -> temp-PLAN-ID-104;
        MIR-PLAN-ID-T[105] -> temp-PLAN-ID-105;
        MIR-PLAN-ID-T[106] -> temp-PLAN-ID-106;
        MIR-PLAN-ID-T[107] -> temp-PLAN-ID-107;
        MIR-PLAN-ID-T[108] -> temp-PLAN-ID-108;
        MIR-PLAN-ID-T[109] -> temp-PLAN-ID-109;
         
        MIR-PLAN-ID-T[1] <- temp-PLAN-ID-1;
        MIR-PLAN-ID-T[2] <- temp-PLAN-ID-2;
        MIR-PLAN-ID-T[3] <- temp-PLAN-ID-3;
        MIR-PLAN-ID-T[4] <- temp-PLAN-ID-4;
        MIR-PLAN-ID-T[5] <- temp-PLAN-ID-5;
        MIR-PLAN-ID-T[6] <- temp-PLAN-ID-6;
        MIR-PLAN-ID-T[7] <- temp-PLAN-ID-7;
        MIR-PLAN-ID-T[8] <- temp-PLAN-ID-8;
        MIR-PLAN-ID-T[9] <- temp-PLAN-ID-9;
        MIR-PLAN-ID-T[10] <- temp-PLAN-ID-10;
        MIR-PLAN-ID-T[11] <- temp-PLAN-ID-11;
        MIR-PLAN-ID-T[12] <- temp-PLAN-ID-12;
        MIR-PLAN-ID-T[13] <- temp-PLAN-ID-13;
        MIR-PLAN-ID-T[14] <- temp-PLAN-ID-14;
        MIR-PLAN-ID-T[15] <- temp-PLAN-ID-15;
        MIR-PLAN-ID-T[16] <- temp-PLAN-ID-16;
        MIR-PLAN-ID-T[17] <- temp-PLAN-ID-17;
        MIR-PLAN-ID-T[18] <- temp-PLAN-ID-18;
        MIR-PLAN-ID-T[19] <- temp-PLAN-ID-19;
        MIR-PLAN-ID-T[20] <- temp-PLAN-ID-20;
        MIR-PLAN-ID-T[21] <- temp-PLAN-ID-21;
        MIR-PLAN-ID-T[22] <- temp-PLAN-ID-22;
        MIR-PLAN-ID-T[23] <- temp-PLAN-ID-23;
        MIR-PLAN-ID-T[24] <- temp-PLAN-ID-24;
        MIR-PLAN-ID-T[25] <- temp-PLAN-ID-25;
        MIR-PLAN-ID-T[26] <- temp-PLAN-ID-26;
        MIR-PLAN-ID-T[27] <- temp-PLAN-ID-27;
        MIR-PLAN-ID-T[28] <- temp-PLAN-ID-28;
        MIR-PLAN-ID-T[29] <- temp-PLAN-ID-29;
        MIR-PLAN-ID-T[30] <- temp-PLAN-ID-30;
        MIR-PLAN-ID-T[31] <- temp-PLAN-ID-31;
        MIR-PLAN-ID-T[32] <- temp-PLAN-ID-32;
        MIR-PLAN-ID-T[33] <- temp-PLAN-ID-33;
        MIR-PLAN-ID-T[34] <- temp-PLAN-ID-34;
        MIR-PLAN-ID-T[35] <- temp-PLAN-ID-35;
        MIR-PLAN-ID-T[36] <- temp-PLAN-ID-36;
        MIR-PLAN-ID-T[37] <- temp-PLAN-ID-37;
        MIR-PLAN-ID-T[38] <- temp-PLAN-ID-38;
        MIR-PLAN-ID-T[39] <- temp-PLAN-ID-39;
        MIR-PLAN-ID-T[40] <- temp-PLAN-ID-40;
        MIR-PLAN-ID-T[41] <- temp-PLAN-ID-41;
        MIR-PLAN-ID-T[42] <- temp-PLAN-ID-42;
        MIR-PLAN-ID-T[43] <- temp-PLAN-ID-43;
        MIR-PLAN-ID-T[44] <- temp-PLAN-ID-44;
        MIR-PLAN-ID-T[45] <- temp-PLAN-ID-45;
        MIR-PLAN-ID-T[46] <- temp-PLAN-ID-46;
        MIR-PLAN-ID-T[47] <- temp-PLAN-ID-47;
        MIR-PLAN-ID-T[48] <- temp-PLAN-ID-48;
        MIR-PLAN-ID-T[49] <- temp-PLAN-ID-49;
        MIR-PLAN-ID-T[50] <- temp-PLAN-ID-50;
        MIR-PLAN-ID-T[51] <- temp-PLAN-ID-51;
        MIR-PLAN-ID-T[52] <- temp-PLAN-ID-52;
        MIR-PLAN-ID-T[53] <- temp-PLAN-ID-53;
        MIR-PLAN-ID-T[54] <- temp-PLAN-ID-54;
        MIR-PLAN-ID-T[55] <- temp-PLAN-ID-55;
        MIR-PLAN-ID-T[56] <- temp-PLAN-ID-56;
        MIR-PLAN-ID-T[57] <- temp-PLAN-ID-57;
        MIR-PLAN-ID-T[58] <- temp-PLAN-ID-58;
        MIR-PLAN-ID-T[59] <- temp-PLAN-ID-59;
        MIR-PLAN-ID-T[60] <- temp-PLAN-ID-60;
        MIR-PLAN-ID-T[61] <- temp-PLAN-ID-61;
        MIR-PLAN-ID-T[62] <- temp-PLAN-ID-62;
        MIR-PLAN-ID-T[63] <- temp-PLAN-ID-63;
        MIR-PLAN-ID-T[64] <- temp-PLAN-ID-64;
        MIR-PLAN-ID-T[65] <- temp-PLAN-ID-65;
        MIR-PLAN-ID-T[66] <- temp-PLAN-ID-66;
        MIR-PLAN-ID-T[67] <- temp-PLAN-ID-67;
        MIR-PLAN-ID-T[68] <- temp-PLAN-ID-68;
        MIR-PLAN-ID-T[69] <- temp-PLAN-ID-69;
        MIR-PLAN-ID-T[70] <- temp-PLAN-ID-70;
        MIR-PLAN-ID-T[71] <- temp-PLAN-ID-71;
        MIR-PLAN-ID-T[72] <- temp-PLAN-ID-72;
        MIR-PLAN-ID-T[73] <- temp-PLAN-ID-73;
        MIR-PLAN-ID-T[74] <- temp-PLAN-ID-74;
        MIR-PLAN-ID-T[75] <- temp-PLAN-ID-75;
        MIR-PLAN-ID-T[76] <- temp-PLAN-ID-76;
        MIR-PLAN-ID-T[77] <- temp-PLAN-ID-77;
        MIR-PLAN-ID-T[78] <- temp-PLAN-ID-78;
        MIR-PLAN-ID-T[79] <- temp-PLAN-ID-79;
        MIR-PLAN-ID-T[80] <- temp-PLAN-ID-80;
        MIR-PLAN-ID-T[81] <- temp-PLAN-ID-81;
        MIR-PLAN-ID-T[82] <- temp-PLAN-ID-82;
        MIR-PLAN-ID-T[83] <- temp-PLAN-ID-83;
        MIR-PLAN-ID-T[84] <- temp-PLAN-ID-84;
        MIR-PLAN-ID-T[85] <- temp-PLAN-ID-85;
        MIR-PLAN-ID-T[86] <- temp-PLAN-ID-86;
        MIR-PLAN-ID-T[87] <- temp-PLAN-ID-87;
        MIR-PLAN-ID-T[88] <- temp-PLAN-ID-88;
        MIR-PLAN-ID-T[89] <- temp-PLAN-ID-89;
        MIR-PLAN-ID-T[90] <- temp-PLAN-ID-90;
        MIR-PLAN-ID-T[91] <- temp-PLAN-ID-91;
        MIR-PLAN-ID-T[92] <- temp-PLAN-ID-92;
        MIR-PLAN-ID-T[93] <- temp-PLAN-ID-93;
        MIR-PLAN-ID-T[94] <- temp-PLAN-ID-94;
        MIR-PLAN-ID-T[95] <- temp-PLAN-ID-95;
        MIR-PLAN-ID-T[96] <- temp-PLAN-ID-96;
        MIR-PLAN-ID-T[97] <- temp-PLAN-ID-97;
        MIR-PLAN-ID-T[98] <- temp-PLAN-ID-98;
        MIR-PLAN-ID-T[99] <- temp-PLAN-ID-99;
        MIR-PLAN-ID-T[100] <- temp-PLAN-ID-100;
        MIR-PLAN-ID-T[101] <- temp-PLAN-ID-101;
        MIR-PLAN-ID-T[102] <- temp-PLAN-ID-102;
        MIR-PLAN-ID-T[103] <- temp-PLAN-ID-103;
        MIR-PLAN-ID-T[104] <- temp-PLAN-ID-104;
        MIR-PLAN-ID-T[105] <- temp-PLAN-ID-105;
        MIR-PLAN-ID-T[106] <- temp-PLAN-ID-106;
        MIR-PLAN-ID-T[107] <- temp-PLAN-ID-107;
        MIR-PLAN-ID-T[108] <- temp-PLAN-ID-108;
        MIR-PLAN-ID-T[109] <- temp-PLAN-ID-109;
    }


    # If the user clicks Cancel, take the user back to the input page

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH Input;
    }

    # If the user hasn't selected an item and has pressed "Change",
    # an error message pops up.
   
    IF index == "0" && action == "ACTION_CHNGMULTI"
        BRANCH Edit;

    # If the Change button is clicked, branch to the multi-switch process.
    # Set the original rider values for display in the new process.
      
    MIR-DV-2-INSRD-CLI-NM      = MIR-DV-INSRD-CLI-NM-T [index];
    MIR-DV-2-CVG-NUM           = MIR-CVG-NUM-T [index];
    MIR-DV-2-PLAN-ID           = MIR-PLAN-ID-T [index];
    MIR-DV-2-CVG-STBL-1-CD     = MIR-CVG-STBL-1-CD-T [index];
    MIR-DV-2-CVG-PREM-CHNG-DT  = MIR-CVG-PREM-CHNG-DT-T [index];
    MIR-DV-2-CVG-STBL-2-CD     = MIR-CVG-STBL-2-CD-T [index];
    MIR-DV-2-CVG-FACE-AMT      = MIR-CVG-FACE-AMT-T [index];
    MIR-DV-2-CVG-NEW-FACE-AMT  = MIR-DV-CVG-FACE-AMT-T [index];
    MIR-DV-2-CVG-MPREM-AMT     = MIR-CVG-MPREM-AMT-T [index];
    MIR-DV-2-CVG-RENEW-CD      = MIR-DV-CVG-RENEW-CD-T [index];
   # C21111 Changes start here.
    MIR-DV-2-CVG-PRIM-GR-ID    = MIR-CVG-PRIM-GR-ID-T [index];
   # C21111 Changes end here.
   
    IF action == "ACTION_CHNGMULTI"
    {
        STEP MultiSwitch
        {
            USES PROCESS "BF9183MultiSwitch";
            ATTRIBUTES
            {
                GetMessages = "YES";
            }
   
             MIR-DV-2-CVG-RENEW-CD         -> MIR-DV-2-CVG-RENEW-CD;
             MIR-DV-2-PLAN-ID              -> MIR-DV-2-PLAN-ID;
             MIR-DV-2-CVG-STBL-1-CD        -> MIR-DV-2-CVG-STBL-1-CD;
             MIR-DV-2-CVG-NEW-FACE-AMT     -> MIR-DV-2-CVG-NEW-FACE-AMT;
                                          
             MIR-DV-CVG-RENEW-CD-T [index] <- MIR-DV-2-CVG-RENEW-CD;
             MIR-PLAN-ID-T [index]         <- MIR-DV-2-PLAN-ID;
             MIR-CVG-STBL-1-CD-T [index]   <- MIR-DV-2-CVG-STBL-1-CD;                             
             MIR-DV-CVG-FACE-AMT-T [index] <- MIR-DV-2-CVG-NEW-FACE-AMT;                           

            "FALSE"  -> DisplayInput;
        }

    # After returning from Multiple Rider Switch go back to
    # the original coverage details screen.

         BRANCH Edit;
    }


    # If action is none of the above, then it is assumed to be Calculate.
    # This is where the new modal premium is calculated based on new face amount.
    # Start the subscrpt at 001  

    MIR-SCR-SUB = 001;

    STEP PerformCalculate-P
    {
        USES P-STEP "BF9182-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

    IF MIR-RETRN-CD != "00"
    {
        BRANCH Edit;

    }


    # The overides below allow the More command re-access to the array fields
    # PF2.0 - [0] removed and arrows changed direction 

    # Instead of Confirm button OK button is added in the result screen
    
    STEP Output
    {
        USES S-STEP "BF9182-O";
        "ButtonBarOKCancelMore" -> ButtonBar;
         MIR-POL-ID-BASE        -> MIR-POL-ID-BASE;
	 MIR-POL-ID-SFX         -> MIR-POL-ID-SFX;
	 MIR-EFF-DT             -> MIR-EFF-DT;
	 MIR-SCR-SUB            -> MIR-SCR-SUB;
	 MIR-DV-OWN-CLI-NM      -> MIR-DV-OWN-CLI-NM;
	 MIR-POL-SNDRY-AMT      -> MIR-POL-SNDRY-AMT;
	 MIR-POL-BILL-MODE-CD   -> MIR-POL-BILL-MODE-CD;
	 MIR-CVG-NUM-T          -> MIR-CVG-NUM-T;
	 MIR-INSRD-CLI-ID-T     -> MIR-INSRD-CLI-ID-T;
	 MIR-PLAN-ID-T          -> MIR-PLAN-ID-T;
	 MIR-CVG-STBL-1-CD-T    -> MIR-CVG-STBL-1-CD-T;
	 MIR-DV-INSRD-CLI-NM-T  -> MIR-DV-INSRD-CLI-NM-T;
	 MIR-CVG-FACE-AMT-T     -> MIR-CVG-FACE-AMT-T;
	 MIR-DV-CVG-FACE-AMT-T  -> MIR-DV-CVG-FACE-AMT-T;
	 MIR-CVG-MPREM-AMT-T    -> MIR-CVG-MPREM-AMT-T;
	 MIR-DV-CVG-RENEW-CD-T  -> MIR-DV-CVG-RENEW-CD-T;
	 MIR-CVG-STBL-2-CD-T    -> MIR-CVG-STBL-2-CD-T;
	 MIR-CVG-PREM-CHNG-DT-T -> MIR-CVG-PREM-CHNG-DT-T;
         MIR-DV-CHNG-STATUS-T   -> MIR-DV-CHNG-STATUS-T;
    }

   # If the user has pressed the More button, go back and show the rest of the output

    IF action == "ACTION_MORE"
        BRANCH PerformCalculate-P;

    
    # If the user has pressed the cancel button, go back to the input screen

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH Input;
    }
    # when the user presses OK button it takes to a blank screen.So Exit is added during Action back
    EXIT;

    
}
