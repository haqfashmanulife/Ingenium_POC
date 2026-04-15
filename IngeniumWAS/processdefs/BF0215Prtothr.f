# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0215Prtothr.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  B00541  VAN      Add Policy Certificate Printing Request checkbox          *
#*  C12395  CTS      ADDED POLICY CERTIFICATE ENDORSEMENT MESSAGE DROP DOWN    *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

INCLUDE "BF0215-I.s";
INCLUDE "BF0215-P.p";

PROCESS BF0215Prtothr
{
    Title = STRINGTABLE.IDS_TITLE_BF0215Prtothr;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP BF0215-I
    {
        USES S-STEP "BF0215-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

#UY3004 CHANGES START

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
        BRANCH BF0215-I;
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

#UY3004 CHANGES END

    STEP BF0215-P
    {
        USES P-STEP "BF0215-P";
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[1];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[3];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[4];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[5];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[6];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[7];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[8];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[9];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[10];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[11];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[12];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[13];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[14];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[15];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[16];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[17];
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0215-I;


    STEP BF0215-I2
    {
        USES S-STEP "BF0215-I";
        " " -> MIR-POL-ID-SFX;
        " " -> MIR-CLI-ID;
        " " -> MIR-AGT-ID;
        " " -> MIR-TRNXT-DOC-CPY-QTY;
        " " -> MIR-DOC-ID;
        " " -> MIR-TRNXT-LANG-CD;
        " " -> MIR-POL-ID-BASE;
        " " -> MIR-TRNXT-RPT-DSTRB-CD;
#C12395 CHANGES STARTS HERE        
        " " -> MIR-PCERT-MSG; 
#C12395 CHANGES ENDS HERE           
    }

    IF action == "ACTION_BACK"
        EXIT;

#UY3004 CHANGES START

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
        BRANCH BF0215-I;
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

#UY3004 CHANGES END

    BRANCH BF0215-P;
}

