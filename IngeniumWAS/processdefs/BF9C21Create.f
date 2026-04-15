# *******************************************************************************
# *  Component:   BF9C21Create.f                                                *
# *  Description: TD Reinstatement Information(REIN) Create function            *
# *                                                                             *
# *******************************************************************************
# *  Chg#    Release  Description                                               *
# *  NWLGLR  CTS      Intial Version                                            *
# *  R15582  CTS      AUDIT LOG RELATED CHANGES                                 *
# *  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
# *  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATION POLICY                  *
# *                                                                             *
# *******************************************************************************
PROCESS BF9C21Create
{
           Title = STRINGTABLE.IDS_TITLE_BF9C21Create;
           TitleBar = "TitleBar";
           TitleBarSize = "70";
           ButtonBar = "ButtonBarOKCancel";
           ButtonBarSize = "40";
           MessageFrame = "MessagesDisp";
           MessageFrameSize = "70";
           
	STEP INPUTSTEP
	{
		USES S-STEP "BF9C21-I";
	}

	IF action == "ACTION_BACK"
	{
		EXIT;

	}
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
        BRANCH INPUTSTEP;
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

	STEP STEP1
	{
		USES P-STEP "BF9C21-P";
	}

        IF LSIR-RETURN-CD != "00"
                BRANCH INPUTSTEP;   
#123718 CHANGES BEGIN
              temp-MSGS-T[1] = MESSAGES-T[1];
              temp-MSGS-T[2] = MESSAGES-T[2];
              temp-MSGS-T[3] = MESSAGES-T[3];
              temp-MSGS-T[4] = MESSAGES-T[4];
              temp-MSGS-T[5] = MESSAGES-T[5];
              temp-MSGS-T[6] = MESSAGES-T[6];
              temp-MSGS-T[7] = MESSAGES-T[7];
              temp-MSGS-T[8] = MESSAGES-T[8];
              temp-MSGS-T[9] = MESSAGES-T[9];
              temp-MSGS-T[10] = MESSAGES-T[10];
#123718 CHANGES END
#R15582 CHANGES BEGIN

              temp-DTL-INFO = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-APPL-CTL-PRCES-DT;              
              
              STEP AUTROutput
                 {
                   USES P-STEP "BF9G99-P";
    
                   SESSION.MIR-USER-ID -> MIR-USER-ID;
                   SESSION.LSIR-BPF-ID -> MIR-BFCN-ID;      
 
                   temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    
                 }
     


           IF LSIR-RETURN-CD != "00"
                 BRANCH INPUTSTEP;	
           
#R15582 CHANGES END
#123718 CHANGES BEGIN
      MESSAGES-T[1] = temp-MSGS-T[1];
      MESSAGES-T[2] = temp-MSGS-T[2];
      MESSAGES-T[3] = temp-MSGS-T[3];
      MESSAGES-T[4] = temp-MSGS-T[4];
      MESSAGES-T[5] = temp-MSGS-T[5];
      MESSAGES-T[6] = temp-MSGS-T[6];
      MESSAGES-T[7] = temp-MSGS-T[7];
      MESSAGES-T[8] = temp-MSGS-T[8];
      MESSAGES-T[9] = temp-MSGS-T[9];
      MESSAGES-T[10] = temp-MSGS-T[10]; 
#123718 CHANGES END

	STEP Main
	{
		USES PROCESS "BF9C24ListMain";
	
	}

	IF DisplayInput == "FALSE"
	{
		EXIT;

	}

	IF action == "ACTION_BACK"
	{
		EXIT;

	}

}
