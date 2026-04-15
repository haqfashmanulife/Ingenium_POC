# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9185Renewals.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02PR55  DPK      New Rider Renewal Quote screen                            *
#*  PR006I  BMB      ManuMed Rider Renewals                                    *
#*  PF 2.0  PF22     PathFinder 2.0 release changes to array handling          *
#*  RP2009  CTS      Added subtable 4 code for medical repricing               *
#*  RPL009  CTS      Added subtable 3 code for limited pay
#*  MP142B  CTS      Renewal Quote screen changes                              *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  C23814  CTS      COMMENTED M241A3 CODE CHANGES FOR PERFORMANCE ISSUE       *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  UY3028  CTS      BASE RENEWAL CHANGES FOR STREAM 3 PRODUCT                 *
#*******************************************************************************

INCLUDE "BF9184-P.p";
INCLUDE "BF9184-I.s";
INCLUDE "BF9185-I.s";

#INCLUDE "BF9184-O.s";

INCLUDE "BF9185-O.s";
INCLUDE "BF9185-P.p";

PROCESS BF9185Renewals
{
    Title = STRINGTABLE.IDS_TITLE_BF9185Renewals;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Always perform a refresh when this process is invoked.

    STEP Input
    {
        USES S-STEP "BF9184-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # UY3004 changes start

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

    # UY3004 changes end

    STEP Retrieve
    {
        USES P-STEP "BF9184-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

#MP142B changes start here
    TEMP-DV-ORIG-CVG-FACE-AMT-T = MIR-DV-CVG-FACE-AMT-T;
#MP142B changes end here
#UY3028 changes start here
    BASE-DV-CVG-PLAN-ID-T[1] = MIR-DV-CVG-PLAN-ID-T[1];
#UY3028 changes end here
    # The overides below allow the CSOM9188 drop down box to operate in an array

    STEP Edit
    {
        USES S-STEP "BF9185-I";
        "ButtonBarProj" -> ButtonBar;
        MIR-DV-CVG-PLAN-ID-T[1] -> temp-DV-CVG-PLAN-ID-1;
        MIR-DV-CVG-PLAN-ID-T[2] -> temp-DV-CVG-PLAN-ID-2;
        MIR-DV-CVG-PLAN-ID-T[3] -> temp-DV-CVG-PLAN-ID-3;
        MIR-DV-CVG-PLAN-ID-T[4] -> temp-DV-CVG-PLAN-ID-4;
        MIR-DV-CVG-PLAN-ID-T[5] -> temp-DV-CVG-PLAN-ID-5;
        MIR-DV-CVG-PLAN-ID-T[6] -> temp-DV-CVG-PLAN-ID-6;
        MIR-DV-CVG-PLAN-ID-T[7] -> temp-DV-CVG-PLAN-ID-7;
        MIR-DV-CVG-PLAN-ID-T[8] -> temp-DV-CVG-PLAN-ID-8;
        MIR-DV-CVG-PLAN-ID-T[9] -> temp-DV-CVG-PLAN-ID-9;
        MIR-DV-CVG-PLAN-ID-T[10] -> temp-DV-CVG-PLAN-ID-10;
        MIR-DV-CVG-PLAN-ID-T[11] -> temp-DV-CVG-PLAN-ID-11;
        MIR-DV-CVG-PLAN-ID-T[12] -> temp-DV-CVG-PLAN-ID-12;
        MIR-DV-CVG-PLAN-ID-T[13] -> temp-DV-CVG-PLAN-ID-13;
        MIR-DV-CVG-PLAN-ID-T[14] -> temp-DV-CVG-PLAN-ID-14;
        MIR-DV-CVG-PLAN-ID-T[15] -> temp-DV-CVG-PLAN-ID-15;
        MIR-DV-CVG-PLAN-ID-T[16] -> temp-DV-CVG-PLAN-ID-16;
        MIR-DV-CVG-PLAN-ID-T[17] -> temp-DV-CVG-PLAN-ID-17;
        MIR-DV-CVG-PLAN-ID-T[18] -> temp-DV-CVG-PLAN-ID-18;
        MIR-DV-CVG-PLAN-ID-T[19] -> temp-DV-CVG-PLAN-ID-19;
        MIR-DV-CVG-PLAN-ID-T[20] -> temp-DV-CVG-PLAN-ID-20;
        MIR-DV-CVG-PLAN-ID-T[21] -> temp-DV-CVG-PLAN-ID-21;
        MIR-DV-CVG-PLAN-ID-T[22] -> temp-DV-CVG-PLAN-ID-22;
        MIR-DV-CVG-PLAN-ID-T[23] -> temp-DV-CVG-PLAN-ID-23;
        MIR-DV-CVG-PLAN-ID-T[24] -> temp-DV-CVG-PLAN-ID-24;
        MIR-DV-CVG-PLAN-ID-T[25] -> temp-DV-CVG-PLAN-ID-25;
        MIR-DV-CVG-PLAN-ID-T[26] -> temp-DV-CVG-PLAN-ID-26;
        MIR-DV-CVG-PLAN-ID-T[27] -> temp-DV-CVG-PLAN-ID-27;
        MIR-DV-CVG-PLAN-ID-T[28] -> temp-DV-CVG-PLAN-ID-28;
        MIR-DV-CVG-PLAN-ID-T[29] -> temp-DV-CVG-PLAN-ID-29;
        MIR-DV-CVG-PLAN-ID-T[30] -> temp-DV-CVG-PLAN-ID-30;
        MIR-DV-CVG-PLAN-ID-T[31] -> temp-DV-CVG-PLAN-ID-31;
        MIR-DV-CVG-PLAN-ID-T[32] -> temp-DV-CVG-PLAN-ID-32;
        MIR-DV-CVG-PLAN-ID-T[33] -> temp-DV-CVG-PLAN-ID-33;
        MIR-DV-CVG-PLAN-ID-T[34] -> temp-DV-CVG-PLAN-ID-34;
        MIR-DV-CVG-PLAN-ID-T[35] -> temp-DV-CVG-PLAN-ID-35;
        MIR-DV-CVG-PLAN-ID-T[36] -> temp-DV-CVG-PLAN-ID-36;
        MIR-DV-CVG-PLAN-ID-T[37] -> temp-DV-CVG-PLAN-ID-37;
        MIR-DV-CVG-PLAN-ID-T[38] -> temp-DV-CVG-PLAN-ID-38;
        MIR-DV-CVG-PLAN-ID-T[39] -> temp-DV-CVG-PLAN-ID-39;
        MIR-DV-CVG-PLAN-ID-T[40] -> temp-DV-CVG-PLAN-ID-40;
        MIR-DV-CVG-PLAN-ID-T[41] -> temp-DV-CVG-PLAN-ID-41;
        MIR-DV-CVG-PLAN-ID-T[42] -> temp-DV-CVG-PLAN-ID-42;
        MIR-DV-CVG-PLAN-ID-T[43] -> temp-DV-CVG-PLAN-ID-43;
        MIR-DV-CVG-PLAN-ID-T[44] -> temp-DV-CVG-PLAN-ID-44;
        MIR-DV-CVG-PLAN-ID-T[45] -> temp-DV-CVG-PLAN-ID-45;
        MIR-DV-CVG-PLAN-ID-T[46] -> temp-DV-CVG-PLAN-ID-46;
        MIR-DV-CVG-PLAN-ID-T[47] -> temp-DV-CVG-PLAN-ID-47;
        MIR-DV-CVG-PLAN-ID-T[48] -> temp-DV-CVG-PLAN-ID-48;
        MIR-DV-CVG-PLAN-ID-T[49] -> temp-DV-CVG-PLAN-ID-49;
        MIR-DV-CVG-PLAN-ID-T[50] -> temp-DV-CVG-PLAN-ID-50;
        MIR-DV-CVG-PLAN-ID-T[51] -> temp-DV-CVG-PLAN-ID-51;
        MIR-DV-CVG-PLAN-ID-T[52] -> temp-DV-CVG-PLAN-ID-52;
        MIR-DV-CVG-PLAN-ID-T[53] -> temp-DV-CVG-PLAN-ID-53;
        MIR-DV-CVG-PLAN-ID-T[54] -> temp-DV-CVG-PLAN-ID-54;
        MIR-DV-CVG-PLAN-ID-T[55] -> temp-DV-CVG-PLAN-ID-55;
        MIR-DV-CVG-PLAN-ID-T[56] -> temp-DV-CVG-PLAN-ID-56;
        MIR-DV-CVG-PLAN-ID-T[57] -> temp-DV-CVG-PLAN-ID-57;
        MIR-DV-CVG-PLAN-ID-T[58] -> temp-DV-CVG-PLAN-ID-58;
        MIR-DV-CVG-PLAN-ID-T[59] -> temp-DV-CVG-PLAN-ID-59;
        MIR-DV-CVG-PLAN-ID-T[60] -> temp-DV-CVG-PLAN-ID-60;
        MIR-DV-CVG-PLAN-ID-T[61] -> temp-DV-CVG-PLAN-ID-61;
        MIR-DV-CVG-PLAN-ID-T[62] -> temp-DV-CVG-PLAN-ID-62;
        MIR-DV-CVG-PLAN-ID-T[63] -> temp-DV-CVG-PLAN-ID-63;
        MIR-DV-CVG-PLAN-ID-T[64] -> temp-DV-CVG-PLAN-ID-64;
        MIR-DV-CVG-PLAN-ID-T[65] -> temp-DV-CVG-PLAN-ID-65;
        MIR-DV-CVG-PLAN-ID-T[66] -> temp-DV-CVG-PLAN-ID-66;
        MIR-DV-CVG-PLAN-ID-T[67] -> temp-DV-CVG-PLAN-ID-67;
        MIR-DV-CVG-PLAN-ID-T[68] -> temp-DV-CVG-PLAN-ID-68;
        MIR-DV-CVG-PLAN-ID-T[69] -> temp-DV-CVG-PLAN-ID-69;
        MIR-DV-CVG-PLAN-ID-T[70] -> temp-DV-CVG-PLAN-ID-70;
        MIR-DV-CVG-PLAN-ID-T[71] -> temp-DV-CVG-PLAN-ID-71;
        MIR-DV-CVG-PLAN-ID-T[72] -> temp-DV-CVG-PLAN-ID-72;
        MIR-DV-CVG-PLAN-ID-T[73] -> temp-DV-CVG-PLAN-ID-73;
        MIR-DV-CVG-PLAN-ID-T[74] -> temp-DV-CVG-PLAN-ID-74;
        MIR-DV-CVG-PLAN-ID-T[75] -> temp-DV-CVG-PLAN-ID-75;
        MIR-DV-CVG-PLAN-ID-T[76] -> temp-DV-CVG-PLAN-ID-76;
        MIR-DV-CVG-PLAN-ID-T[77] -> temp-DV-CVG-PLAN-ID-77;
        MIR-DV-CVG-PLAN-ID-T[78] -> temp-DV-CVG-PLAN-ID-78;
        MIR-DV-CVG-PLAN-ID-T[79] -> temp-DV-CVG-PLAN-ID-79;
        MIR-DV-CVG-PLAN-ID-T[80] -> temp-DV-CVG-PLAN-ID-80;
        MIR-DV-CVG-PLAN-ID-T[81] -> temp-DV-CVG-PLAN-ID-81;
        MIR-DV-CVG-PLAN-ID-T[82] -> temp-DV-CVG-PLAN-ID-82;
        MIR-DV-CVG-PLAN-ID-T[83] -> temp-DV-CVG-PLAN-ID-83;
        MIR-DV-CVG-PLAN-ID-T[84] -> temp-DV-CVG-PLAN-ID-84;
        MIR-DV-CVG-PLAN-ID-T[85] -> temp-DV-CVG-PLAN-ID-85;
        MIR-DV-CVG-PLAN-ID-T[86] -> temp-DV-CVG-PLAN-ID-86;
        MIR-DV-CVG-PLAN-ID-T[87] -> temp-DV-CVG-PLAN-ID-87;
        MIR-DV-CVG-PLAN-ID-T[88] -> temp-DV-CVG-PLAN-ID-88;
        MIR-DV-CVG-PLAN-ID-T[89] -> temp-DV-CVG-PLAN-ID-89;
        MIR-DV-CVG-PLAN-ID-T[90] -> temp-DV-CVG-PLAN-ID-90;
        MIR-DV-CVG-PLAN-ID-T[91] -> temp-DV-CVG-PLAN-ID-91;
        MIR-DV-CVG-PLAN-ID-T[92] -> temp-DV-CVG-PLAN-ID-92;
        MIR-DV-CVG-PLAN-ID-T[93] -> temp-DV-CVG-PLAN-ID-93;
        MIR-DV-CVG-PLAN-ID-T[94] -> temp-DV-CVG-PLAN-ID-94;
        MIR-DV-CVG-PLAN-ID-T[95] -> temp-DV-CVG-PLAN-ID-95;
        MIR-DV-CVG-PLAN-ID-T[96] -> temp-DV-CVG-PLAN-ID-96;
        MIR-DV-CVG-PLAN-ID-T[97] -> temp-DV-CVG-PLAN-ID-97;
        MIR-DV-CVG-PLAN-ID-T[98] -> temp-DV-CVG-PLAN-ID-98;
        MIR-DV-CVG-PLAN-ID-T[99] -> temp-DV-CVG-PLAN-ID-99;
        MIR-DV-CVG-PLAN-ID-T[100] -> temp-DV-CVG-PLAN-ID-100;
        MIR-DV-CVG-PLAN-ID-T[101] -> temp-DV-CVG-PLAN-ID-101;
        MIR-DV-CVG-PLAN-ID-T[102] -> temp-DV-CVG-PLAN-ID-102;
        MIR-DV-CVG-PLAN-ID-T[103] -> temp-DV-CVG-PLAN-ID-103;
        MIR-DV-CVG-PLAN-ID-T[104] -> temp-DV-CVG-PLAN-ID-104;
        MIR-DV-CVG-PLAN-ID-T[105] -> temp-DV-CVG-PLAN-ID-105;
        MIR-DV-CVG-PLAN-ID-T[106] -> temp-DV-CVG-PLAN-ID-106;
        MIR-DV-CVG-PLAN-ID-T[107] -> temp-DV-CVG-PLAN-ID-107;
        MIR-DV-CVG-PLAN-ID-T[108] -> temp-DV-CVG-PLAN-ID-108;
        MIR-DV-CVG-PLAN-ID-T[109] -> temp-DV-CVG-PLAN-ID-109;
        MIR-DV-CVG-PLAN-ID-T[1] <- temp-DV-CVG-PLAN-ID-1;
        MIR-DV-CVG-PLAN-ID-T[2] <- temp-DV-CVG-PLAN-ID-2;
        MIR-DV-CVG-PLAN-ID-T[3] <- temp-DV-CVG-PLAN-ID-3;
        MIR-DV-CVG-PLAN-ID-T[4] <- temp-DV-CVG-PLAN-ID-4;
        MIR-DV-CVG-PLAN-ID-T[5] <- temp-DV-CVG-PLAN-ID-5;
        MIR-DV-CVG-PLAN-ID-T[6] <- temp-DV-CVG-PLAN-ID-6;
        MIR-DV-CVG-PLAN-ID-T[7] <- temp-DV-CVG-PLAN-ID-7;
        MIR-DV-CVG-PLAN-ID-T[8] <- temp-DV-CVG-PLAN-ID-8;
        MIR-DV-CVG-PLAN-ID-T[9] <- temp-DV-CVG-PLAN-ID-9;
        MIR-DV-CVG-PLAN-ID-T[10] <- temp-DV-CVG-PLAN-ID-10;
        MIR-DV-CVG-PLAN-ID-T[11] <- temp-DV-CVG-PLAN-ID-11;
        MIR-DV-CVG-PLAN-ID-T[12] <- temp-DV-CVG-PLAN-ID-12;
        MIR-DV-CVG-PLAN-ID-T[13] <- temp-DV-CVG-PLAN-ID-13;
        MIR-DV-CVG-PLAN-ID-T[14] <- temp-DV-CVG-PLAN-ID-14;
        MIR-DV-CVG-PLAN-ID-T[15] <- temp-DV-CVG-PLAN-ID-15;
        MIR-DV-CVG-PLAN-ID-T[16] <- temp-DV-CVG-PLAN-ID-16;
        MIR-DV-CVG-PLAN-ID-T[17] <- temp-DV-CVG-PLAN-ID-17;
        MIR-DV-CVG-PLAN-ID-T[18] <- temp-DV-CVG-PLAN-ID-18;
        MIR-DV-CVG-PLAN-ID-T[19] <- temp-DV-CVG-PLAN-ID-19;
        MIR-DV-CVG-PLAN-ID-T[20] <- temp-DV-CVG-PLAN-ID-20;
        MIR-DV-CVG-PLAN-ID-T[21] <- temp-DV-CVG-PLAN-ID-21;
        MIR-DV-CVG-PLAN-ID-T[22] <- temp-DV-CVG-PLAN-ID-22;
        MIR-DV-CVG-PLAN-ID-T[23] <- temp-DV-CVG-PLAN-ID-23;
        MIR-DV-CVG-PLAN-ID-T[24] <- temp-DV-CVG-PLAN-ID-24;
        MIR-DV-CVG-PLAN-ID-T[25] <- temp-DV-CVG-PLAN-ID-25;
        MIR-DV-CVG-PLAN-ID-T[26] <- temp-DV-CVG-PLAN-ID-26;
        MIR-DV-CVG-PLAN-ID-T[27] <- temp-DV-CVG-PLAN-ID-27;
        MIR-DV-CVG-PLAN-ID-T[28] <- temp-DV-CVG-PLAN-ID-28;
        MIR-DV-CVG-PLAN-ID-T[29] <- temp-DV-CVG-PLAN-ID-29;
        MIR-DV-CVG-PLAN-ID-T[30] <- temp-DV-CVG-PLAN-ID-30;
        MIR-DV-CVG-PLAN-ID-T[31] <- temp-DV-CVG-PLAN-ID-31;
        MIR-DV-CVG-PLAN-ID-T[32] <- temp-DV-CVG-PLAN-ID-32;
        MIR-DV-CVG-PLAN-ID-T[33] <- temp-DV-CVG-PLAN-ID-33;
        MIR-DV-CVG-PLAN-ID-T[34] <- temp-DV-CVG-PLAN-ID-34;
        MIR-DV-CVG-PLAN-ID-T[35] <- temp-DV-CVG-PLAN-ID-35;
        MIR-DV-CVG-PLAN-ID-T[36] <- temp-DV-CVG-PLAN-ID-36;
        MIR-DV-CVG-PLAN-ID-T[37] <- temp-DV-CVG-PLAN-ID-37;
        MIR-DV-CVG-PLAN-ID-T[38] <- temp-DV-CVG-PLAN-ID-38;
        MIR-DV-CVG-PLAN-ID-T[39] <- temp-DV-CVG-PLAN-ID-39;
        MIR-DV-CVG-PLAN-ID-T[40] <- temp-DV-CVG-PLAN-ID-40;
        MIR-DV-CVG-PLAN-ID-T[41] <- temp-DV-CVG-PLAN-ID-41;
        MIR-DV-CVG-PLAN-ID-T[42] <- temp-DV-CVG-PLAN-ID-42;
        MIR-DV-CVG-PLAN-ID-T[43] <- temp-DV-CVG-PLAN-ID-43;
        MIR-DV-CVG-PLAN-ID-T[44] <- temp-DV-CVG-PLAN-ID-44;
        MIR-DV-CVG-PLAN-ID-T[45] <- temp-DV-CVG-PLAN-ID-45;
        MIR-DV-CVG-PLAN-ID-T[46] <- temp-DV-CVG-PLAN-ID-46;
        MIR-DV-CVG-PLAN-ID-T[47] <- temp-DV-CVG-PLAN-ID-47;
        MIR-DV-CVG-PLAN-ID-T[48] <- temp-DV-CVG-PLAN-ID-48;
        MIR-DV-CVG-PLAN-ID-T[49] <- temp-DV-CVG-PLAN-ID-49;
        MIR-DV-CVG-PLAN-ID-T[50] <- temp-DV-CVG-PLAN-ID-50;
        MIR-DV-CVG-PLAN-ID-T[51] <- temp-DV-CVG-PLAN-ID-51;
        MIR-DV-CVG-PLAN-ID-T[52] <- temp-DV-CVG-PLAN-ID-52;
        MIR-DV-CVG-PLAN-ID-T[53] <- temp-DV-CVG-PLAN-ID-53;
        MIR-DV-CVG-PLAN-ID-T[54] <- temp-DV-CVG-PLAN-ID-54;
        MIR-DV-CVG-PLAN-ID-T[55] <- temp-DV-CVG-PLAN-ID-55;
        MIR-DV-CVG-PLAN-ID-T[56] <- temp-DV-CVG-PLAN-ID-56;
        MIR-DV-CVG-PLAN-ID-T[57] <- temp-DV-CVG-PLAN-ID-57;
        MIR-DV-CVG-PLAN-ID-T[58] <- temp-DV-CVG-PLAN-ID-58;
        MIR-DV-CVG-PLAN-ID-T[59] <- temp-DV-CVG-PLAN-ID-59;
        MIR-DV-CVG-PLAN-ID-T[60] <- temp-DV-CVG-PLAN-ID-60;
        MIR-DV-CVG-PLAN-ID-T[61] <- temp-DV-CVG-PLAN-ID-61;
        MIR-DV-CVG-PLAN-ID-T[62] <- temp-DV-CVG-PLAN-ID-62;
        MIR-DV-CVG-PLAN-ID-T[63] <- temp-DV-CVG-PLAN-ID-63;
        MIR-DV-CVG-PLAN-ID-T[64] <- temp-DV-CVG-PLAN-ID-64;
        MIR-DV-CVG-PLAN-ID-T[65] <- temp-DV-CVG-PLAN-ID-65;
        MIR-DV-CVG-PLAN-ID-T[66] <- temp-DV-CVG-PLAN-ID-66;
        MIR-DV-CVG-PLAN-ID-T[67] <- temp-DV-CVG-PLAN-ID-67;
        MIR-DV-CVG-PLAN-ID-T[68] <- temp-DV-CVG-PLAN-ID-68;
        MIR-DV-CVG-PLAN-ID-T[69] <- temp-DV-CVG-PLAN-ID-69;
        MIR-DV-CVG-PLAN-ID-T[70] <- temp-DV-CVG-PLAN-ID-70;
        MIR-DV-CVG-PLAN-ID-T[71] <- temp-DV-CVG-PLAN-ID-71;
        MIR-DV-CVG-PLAN-ID-T[72] <- temp-DV-CVG-PLAN-ID-72;
        MIR-DV-CVG-PLAN-ID-T[73] <- temp-DV-CVG-PLAN-ID-73;
        MIR-DV-CVG-PLAN-ID-T[74] <- temp-DV-CVG-PLAN-ID-74;
        MIR-DV-CVG-PLAN-ID-T[75] <- temp-DV-CVG-PLAN-ID-75;
        MIR-DV-CVG-PLAN-ID-T[76] <- temp-DV-CVG-PLAN-ID-76;
        MIR-DV-CVG-PLAN-ID-T[77] <- temp-DV-CVG-PLAN-ID-77;
        MIR-DV-CVG-PLAN-ID-T[78] <- temp-DV-CVG-PLAN-ID-78;
        MIR-DV-CVG-PLAN-ID-T[79] <- temp-DV-CVG-PLAN-ID-79;
        MIR-DV-CVG-PLAN-ID-T[80] <- temp-DV-CVG-PLAN-ID-80;
        MIR-DV-CVG-PLAN-ID-T[81] <- temp-DV-CVG-PLAN-ID-81;
        MIR-DV-CVG-PLAN-ID-T[82] <- temp-DV-CVG-PLAN-ID-82;
        MIR-DV-CVG-PLAN-ID-T[83] <- temp-DV-CVG-PLAN-ID-83;
        MIR-DV-CVG-PLAN-ID-T[84] <- temp-DV-CVG-PLAN-ID-84;
        MIR-DV-CVG-PLAN-ID-T[85] <- temp-DV-CVG-PLAN-ID-85;
        MIR-DV-CVG-PLAN-ID-T[86] <- temp-DV-CVG-PLAN-ID-86;
        MIR-DV-CVG-PLAN-ID-T[87] <- temp-DV-CVG-PLAN-ID-87;
        MIR-DV-CVG-PLAN-ID-T[88] <- temp-DV-CVG-PLAN-ID-88;
        MIR-DV-CVG-PLAN-ID-T[89] <- temp-DV-CVG-PLAN-ID-89;
        MIR-DV-CVG-PLAN-ID-T[90] <- temp-DV-CVG-PLAN-ID-90;
        MIR-DV-CVG-PLAN-ID-T[91] <- temp-DV-CVG-PLAN-ID-91;
        MIR-DV-CVG-PLAN-ID-T[92] <- temp-DV-CVG-PLAN-ID-92;
        MIR-DV-CVG-PLAN-ID-T[93] <- temp-DV-CVG-PLAN-ID-93;
        MIR-DV-CVG-PLAN-ID-T[94] <- temp-DV-CVG-PLAN-ID-94;
        MIR-DV-CVG-PLAN-ID-T[95] <- temp-DV-CVG-PLAN-ID-95;
        MIR-DV-CVG-PLAN-ID-T[96] <- temp-DV-CVG-PLAN-ID-96;
        MIR-DV-CVG-PLAN-ID-T[97] <- temp-DV-CVG-PLAN-ID-97;
        MIR-DV-CVG-PLAN-ID-T[98] <- temp-DV-CVG-PLAN-ID-98;
        MIR-DV-CVG-PLAN-ID-T[99] <- temp-DV-CVG-PLAN-ID-99;
        MIR-DV-CVG-PLAN-ID-T[100] <- temp-DV-CVG-PLAN-ID-100;
        MIR-DV-CVG-PLAN-ID-T[101] <- temp-DV-CVG-PLAN-ID-101;
        MIR-DV-CVG-PLAN-ID-T[102] <- temp-DV-CVG-PLAN-ID-102;
        MIR-DV-CVG-PLAN-ID-T[103] <- temp-DV-CVG-PLAN-ID-103;
        MIR-DV-CVG-PLAN-ID-T[104] <- temp-DV-CVG-PLAN-ID-104;
        MIR-DV-CVG-PLAN-ID-T[105] <- temp-DV-CVG-PLAN-ID-105;
        MIR-DV-CVG-PLAN-ID-T[106] <- temp-DV-CVG-PLAN-ID-106;
        MIR-DV-CVG-PLAN-ID-T[107] <- temp-DV-CVG-PLAN-ID-107;
        MIR-DV-CVG-PLAN-ID-T[108] <- temp-DV-CVG-PLAN-ID-108;
        MIR-DV-CVG-PLAN-ID-T[109] <- temp-DV-CVG-PLAN-ID-109;
    }


    # If the user clicks Cancel, take the user back to the input page

    IF action == "ACTION_BACK"
        BRANCH Input;

    # If the user clicks Refresh, retrieve page again using different or 
    # same effective date.

    IF action == "ACTION_REFRESH"
        BRANCH Retrieve;
#*C23814 changes START here*
#* M241A3 changes START here*   
#    IF action == "ACTION_PLANCHG"
#        BRANCH Edit;
#* M241A3 changes END here*        
#*C23814 changes END here*
#MP142B changes start here
    MIR-DV-ORIG-CVG-FACE-AMT-T = TEMP-DV-ORIG-CVG-FACE-AMT-T;
#MP142B changes end here
#UY3028 changes start here
    MIR-DV-CVG-PLAN-ID-T[1] = BASE-DV-CVG-PLAN-ID-T[1];
#UY3028 changes end here    
    # If action is none of the above, then it is assumed to be Calculate.
    # This is where the new modal premium is calculated based on new face amount.
    # Start the subscrpt at 001  

    MIR-SCR-SUB = 001;

    STEP PerformCalculate-P
    {
        USES P-STEP "BF9185-P";
    }


    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

    IF MIR-RETRN-CD != "00"
    {
        BRANCH Edit;

    }


    # The overides below allow the more command re-access to the array fields
    # subtable 3 field is added

    STEP Output
    {
        USES S-STEP "BF9185-O";
        #        USES S-STEP "BF9184-O";

        "ButtonBarOKCancelMore" -> ButtonBar;
        MIR-POL-ID-BASE  -> MIR-POL-ID-BASE;
        MIR-POL-ID-SFX   -> MIR-POL-ID-SFX;

        MIR-EFF-DT  -> MIR-EFF-DT;
        MIR-SCR-SUB -> MIR-SCR-SUB;

        MIR-DV-OWN-CLI-NM      -> MIR-DV-OWN-CLI-NM;
        MIR-POL-SNDRY-AMT      -> MIR-POL-SNDRY-AMT;
        MIR-POL-BILL-MODE-CD   -> MIR-POL-BILL-MODE-CD;
         
        MIR-DV-CVG-PLAN-ID-T   -> MIR-DV-CVG-PLAN-ID-T;
        MIR-DV-CVG-STBL-1-CD-T -> MIR-DV-CVG-STBL-1-CD-T;
        MIR-DV-CVG-STBL-2-CD-T -> MIR-DV-CVG-STBL-2-CD-T;
        MIR-DV-CVG-STBL-3-CD-T -> MIR-DV-CVG-STBL-3-CD-T;
        MIR-DV-CVG-STBL-4-CD-T -> MIR-DV-CVG-STBL-4-CD-T;
        MIR-CVG-NUM-T          -> MIR-CVG-NUM-T;
        MIR-INSRD-CLI-ID-T     -> MIR-INSRD-CLI-ID-T;
        MIR-PLAN-ID-T          -> MIR-PLAN-ID-T;
        MIR-CVG-STBL-1-CD-T    -> MIR-CVG-STBL-1-CD-T;
        MIR-DV-INSRD-CLI-NM-T  -> MIR-DV-INSRD-CLI-NM-T;
        MIR-CVG-FACE-AMT-T     -> MIR-CVG-FACE-AMT-T;
        MIR-CVG-MPREM-AMT-T    -> MIR-CVG-MPREM-AMT-T;
        MIR-DV-CVG-MPREM-AMT-T -> MIR-DV-CVG-MPREM-AMT-T;
        MIR-DV-CVG-RENEW-CD-T  -> MIR-DV-CVG-RENEW-CD-T;
        MIR-CVG-STBL-2-CD-T    -> MIR-CVG-STBL-2-CD-T;
        MIR-CVG-STBL-3-CD-T    -> MIR-CVG-STBL-3-CD-T;        
        MIR-CVG-STBL-4-CD-T    -> MIR-CVG-STBL-4-CD-T;
        MIR-CVG-PREM-CHNG-DT-T -> MIR-CVG-PREM-CHNG-DT-T;
        MIR-DV-CHNG-STATUS-T   -> MIR-DV-CHNG-STATUS-T;
        MIR-DV-CVG-FACE-AMT-T  -> MIR-DV-CVG-FACE-AMT-T;
    }

    # If the user has pressed the more button, go back and show the rest of the output

    IF action == "ACTION_MORE"
        BRANCH PerformCalculate-P;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Input;
}

