# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0852Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  MFFALL  CLB      Modify to support allocation by amount for 2-tier,        *
#*  MFFALL           Cvg-Fund level system.                                    *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*******************************************************************************
# Retrieve Input S Step
# Retreive P Step

INCLUDE "BF0852Key-I.s";
#INCLUDE "BF0850-I.s";

# Update Input S Step

INCLUDE "BF0850-P.p";

# Update P Step

INCLUDE "BF0852-I.s";

# Update Output S Step

INCLUDE "BF0852-P.p";
INCLUDE "BF0850-O.s";

# Parameterized Flow

INCLUDE "GenUpdate.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF0852Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0852Update -> Title;

        # Retrieve Input S Step

        "BF0852Key-I" -> InputS;
        #"BF0850-I" -> InputS;

        # Retrieve P Step

        "BF0850-P" -> RetrieveP;

        # Update Input S Step

        "BF0852-I" -> EditS;

        # Update P Step

        "BF0852-P" -> UpdateP;

        # Update Output S Step

        "BF0850-O" -> OutputS;
    }

    
# 23774A CHANGES STARTS

   IF AuditWriteInd == "Y"
   {
            
        temp-DTL-INFO  = SESSION.MIR-POL-ID-BASE + " " + SESSION.MIR-POL-ID-SFX;
      
        STEP AudOutput
        {
          USES P-STEP "BF9G99-P";
        
        SESSION.MIR-USER-ID -> MIR-USER-ID;
        SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
        temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
        "C" -> MIR-LOG-LEVL-CD;    
        }
    
        IF LSIR-RETURN-CD != "00"
            BRANCH Main;
    }         
      
# 23774A CHANGES ENDS

    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

