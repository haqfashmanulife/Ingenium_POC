# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF2302Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*******************************************************************************
# Retrieve Input S Step
# Retreive P Step

INCLUDE "BF2300-I.s";

# Update Input S Step

INCLUDE "BF2300-P.p";

# Update P Step

INCLUDE "BF2302-I.s";

# Update Output S Step

INCLUDE "BF2302-P.p";
INCLUDE "BF2300-O.s";

# Parameterized Flow

INCLUDE "GenUpdate.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END



# NOTE:  Name must match File Name

PROCESS BF2302Update
{

    # NOTE:  To be used by configuration tool
    #        In Future Releases

    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF2302Update -> Title;

        # Retrieve Input S Step

        "BF2300-I" -> InputS;

        # ENSURE THE DRIVERS BELOW ARE CORRECT
        # Retrieve P Step

        "BF2300-P" -> RetrieveP;

        # Update Input S Step

        "BF2302-I" -> EditS;

        # Update P Step

        "BF2302-P" -> UpdateP;

        # Update Output S Step

        "BF2300-O" -> OutputS;
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

