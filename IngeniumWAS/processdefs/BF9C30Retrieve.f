
#*******************************************************************************
#*  Component:   BF9C30Retrieve.f                                              *
#*  Description: UW SUMMARY SCREEN.THIS SCREEN HAS THE SUMMARY OF UW INFO      *
#*               FROM UW FINAL DECISION UPDATE, UW DECISION UPDATE, REQT LIST  *
#*               AMENDMENT LIST AND INQUIRY - COVERAGE LIST                    *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  R11837  CTS      INITIAL REVISION                                          *
#*  C68605  CTS      FIXED MORE BUTTON FUNCTION GLITCH FOR REQUIREMENTS P-STEPS*
#*  R12048  CTS      FIXED MORE FUNCTION GLITCH FOR UW DECISION P-STEP         *
#*  MP310I  CTS      THE TOTAL NUMBER OF UW REQUIREMENTS ARRAY INCREASED       *
#*******************************************************************************
# Change this to the S that starts the list
# Change this to the P that retrieves the list

INCLUDE "BF9C30-O.s";
INCLUDE "BF9A24-O.s";
INCLUDE "BF9A51-I.s";
INCLUDE "BF9A20-I.s";
INCLUDE "BF9A24-P.p";
INCLUDE "BF9A20-P.p";
INCLUDE "BF9A20-O.s";
INCLUDE "BF9A20Retrieve.f";
INCLUDE "BF1194-P.p";
INCLUDE "BF1190Retrieve.f";
INCLUDE "BF1584-P.p";
INCLUDE "BF1580Retrieve.f";
INCLUDE "GenRetrieveMore.f";
INCLUDE "BF1250-P.p";
INCLUDE "BF6925-P.p";

PROCESS BF9C30Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF9C30Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOK";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP Input
    {
        USES S-STEP "BF9A51-I";
    }


    IF action == "ACTION_BACK"
        EXIT;
        
    ORIG-POL-ID = MIR-POL-ID;
    ORIG-CLI-ID = MIR-CLI-ID;

 # There could be multiple users updating UW Final decision for a 
 # policy and client so if the list has more than one record then
 # the UW Final Decision List screen is displayed. User can select
 # from the list then the new UW Check Summary screen is displayed
 
    MIR-COUNT-INIT = 0;
    
    STEP RetrieveList
    {
        USES P-STEP "BF9A24-P";
    }
    
    IF LSIR-RETURN-CD == "00" && MIR-POL-ID-T[2] !=""
      { 
        STEP DisplayList
       {
        USES S-STEP "BF9A24-O";
       }
      
       IF index == "0"
        BRANCH DisplayList;

        MIR-POL-ID = MIR-POL-ID-T[index];
        MIR-CLI-ID = MIR-CLI-ID-T[index];
        MIR-USER-ID = MIR-USER-ID-T[index];
        MIR-APP-TYP-CD = MIR-APP-TYP-CD-T[index];
        MIR-SEQ-NUM = MIR-SEQ-NUM-T[index];

        IF action == "SelectItem" || action == "ACTION_INQUIRE"
         BRANCH UWFDdata;
         
      }   
 # If there is only one record in the UWFD table then the flow is 
 # passed directly to the new UW Summary check screen. New variables
 # MIR-UWFD are introduced because some of the variables have conflict
 # with other P-steps and there is a chance that UWFD is not present for
 # all the policies 
 
    IF LSIR-RETURN-CD == "00" && MIR-POL-ID-T[1] !="" && MIR-POL-ID-T[2] ==""
     {     
      
       MIR-POL-ID = MIR-POL-ID-T[1];
       MIR-CLI-ID = MIR-CLI-ID-T[1];
       MIR-USER-ID = MIR-USER-ID-T[1];
       MIR-APP-TYP-CD = MIR-APP-TYP-CD-T[1];
       MIR-SEQ-NUM = MIR-SEQ-NUM-T[1];
      
      } 
           
       STEP UWFDdata
       {
         USES P-STEP "BF9A20-P";
       } 
       
       # The UW Final decision Update screen doesnt have the more functionality so 
       # only the first 20 coverages will be displayed
       
       index5 = 1;
       MAX5 = 20;
       
       WHILE (index5 <= MAX5)
        {
         MIR-UWFD-CVG-NUM-T[index5]             =   MIR-CVG-NUM-T[index5];     
         MIR-UWFD-PLAN-ID-T[index5]             =   MIR-PLAN-ID-T[index5];     
         MIR-UWFD-CVG-FACE-AMT-T[index5]        =   MIR-CVG-FACE-AMT-T[index5];
         MIR-UWFD-UW-NOTE-T[index5]             =   MIR-UW-NOTE-T[index5];     
         MIR-UWFD-CVG-WP-IND-T[index5]          =   MIR-CVG-WP-IND-T[index5];  
         MIR-UWFD-CVG-STBL-1-CD-T[index5]       =   MIR-CVG-STBL-1-CD-T[index5];
         IF MIR-CVG-NUM-T[index5] != ""
           {
           MIR-UWFD-POL-ID-T[index5]            =   MIR-POL-ID-T[1];                
           }
         index5 = index5+1;  
        }
    
     # Requirement list is fetched next. First the client ID is passed 
     # and policy ID is not to fetch the UW requirments. Only open requirements
     # should be displayed in the screen. Different MIR variables are used
     # Issue and UW requirements just for easier reference
 
    MIR-POL-ID-BASE = "";   
    MIR-CPREQ-CREAT-DT = "";
    MIR-CPREQ-SEQ-NUM = "";
    MIR-REQIR-ID ="";
    MIR-CLI-ID = ORIG-CLI-ID;
    
    # System will loop through the requirements 20 times and fetch the 
    # latest open requirements. Assumption is it will not cross more than
    # 20 open requirements so the MIR array is only 20
    
    # MP310I changes to modify the MAX value from 20 to 100. For a client there
    # is a possibility of having more than 20 UW requirements (Open & closed)
    # so the looping times has to be increased so that it can fetch upto 100 
    # requirements and pass on 20 open requirements to the screen. There will
    # be no issue related to performance because of this fix as the loop exists
    # once we reach the end of requirements 

    #MAX = 20;
    MAX = 100;
    
    # MP310I Changes end
    
    index7 = 1;  
    index8 = 1;
    
    STEP Reqtdata
    
    {
        USES P-STEP "BF1194-P";
    }
    index1 = 1; 
    
     IF LSIR-RETURN-CD == "00"
      {
        WHILE (index8 <= MAX)
        {
           IF  MIR-CPREQ-STAT-CD-T[index1] == "SIR" || 
               MIR-CPREQ-STAT-CD-T[index1] == "SAA" ||
               MIR-CPREQ-STAT-CD-T[index1] == "SCC" ||
               MIR-CPREQ-STAT-CD-T[index1] == "SCH" ||
               MIR-CPREQ-STAT-CD-T[index1] == "NTO" ||
               MIR-CPREQ-STAT-CD-T[index1] == "ORD" 
           
             {
                MIR-UW-REQIR-ID-T[index7] = MIR-REQIR-ID-T[index1];
                MIR-UW-REQIR-TYP-CD-T[index7] = MIR-REQIR-TYP-CD-T[index1];
                MIR-UW-CPREQ-SEQ-NUM-T[index7] =  MIR-CPREQ-SEQ-NUM-T[index1];
                MIR-UW-CPREQ-STAT-CD-T[index7] = MIR-CPREQ-STAT-CD-T[index1];
                MIR-UW-PREV-UPDT-DT-T[index7] = MIR-PREV-UPDT-DT-T[index1];
                MIR-UW-USER-ID-T[index7] = MIR-USER-ID-T[index1];
                index7 = index7 +1 ;  
             }
           
            index1 = index1+1;
            index8 = index8+1;                         
 # C68605 Changes to modify the MIR-REQIR-ID-T array from T[11] to T[12] as the
 # more functionality needs to be invoked only if there are more than 11 requierments
 #          IF index1 == "13"&& MIR-REQIR-ID-T[11] != ""
 #          IF index1 == "13"&& MIR-REQIR-ID-T[12] != ""
            IF index1 == "12"&& MIR-REQIR-ID != "" && MIR-REQIR-ID != MIR-REQIR-ID-T[1]
            {
             BRANCH Reqtdata; 
            }             
         }
      }
 # Issue requirements are fetched next with passing the CLI_ID as spaces
 
        MIR-POL-ID-BASE = ORIG-POL-ID; 
        MIR-CLI-ID = "";
        MIR-CPREQ-CREAT-DT = "";
        MIR-CPREQ-SEQ-NUM = "";
        MIR-REQIR-ID ="";
        
        MAX1 = 20;
        index6 = 1;          
        index9 = 1;
        
        STEP Reqtdata1
        {
          USES P-STEP "BF1194-P";
        }
        index2 = 1;            
         
       IF LSIR-RETURN-CD == "00"
       { 
        WHILE (index9 <= MAX1)
        {
           IF  MIR-CPREQ-STAT-CD-T[index2] == "SIR" || 
               MIR-CPREQ-STAT-CD-T[index2] == "SAA" ||
               MIR-CPREQ-STAT-CD-T[index2] == "SCC" ||
               MIR-CPREQ-STAT-CD-T[index2] == "SCH" ||
               MIR-CPREQ-STAT-CD-T[index2] == "NTO" ||
               MIR-CPREQ-STAT-CD-T[index2] == "ORD" 
           
             {      
                MIR-ISS-REQIR-ID-T[index6] = MIR-REQIR-ID-T[index2];
                MIR-ISS-REQIR-TYP-CD-T[index6] = MIR-REQIR-TYP-CD-T[index2];
                MIR-ISS-CPREQ-SEQ-NUM-T[index6] =  MIR-CPREQ-SEQ-NUM-T[index2];
                MIR-ISS-CPREQ-STAT-CD-T[index6] = MIR-CPREQ-STAT-CD-T[index2];
                MIR-ISS-PREV-UPDT-DT-T[index6] = MIR-PREV-UPDT-DT-T[index2];
                MIR-ISS-USER-ID-T[index6] = MIR-USER-ID-T[index2];
                index6 = index6 +1;
             }
             index2 = index2 +1;
             index9 = index9 +1;             
 # C68605 Changes to modify the MIR-REQIR-ID-T array from T[11] to T[12] as the
 # more functionality needs to be invoked only if there are more than 11 requierments
 #           IF index2 == "13" && MIR-REQIR-ID-T[11] != ""
 
             IF index2 == "13" && MIR-REQIR-ID-T[12] != ""
             {
              BRANCH Reqtdata1; 
             }  
          }
       } 
        
 # Amendments are fetched next by passing Client and Policy IDs

      MIR-AMEX-SEQ-NUM  = "01";
      MIR-INSRD-CLI-ID = ORIG-CLI-ID;
      MIR-POL-ID-BASE = ORIG-POL-ID;
      STEP Amenddata
      {
        USES P-STEP "BF1584-P";
      }
  # Inquiry Coverage details P-step is called next to fetch the 3DD WoP for the 
  # base coverage
  
     MIR-POL-ID-BASE = ORIG-POL-ID;
     MIR-CVG-NUM = "01";
  
     STEP CoverageInq
      {
       USES P-STEP "BF6925-P";
      }	
      
      IF LSIR-RETURN-CD == "00"
       {
        MIR-CVG-NUM = MIR-CVG-NUM-T[1];
        MIR-CVG-WP-IND = MIR-CVG-WP-IND-T[1];
       }
      ELSE
       BRANCH  Input;
    
 # UW decision update fields are fetched next by passing Client ID. 
 # Additional loop is added to cover all the coverages for the policies
 # users dont want a More button in the screen. The max size of the loop
 # is set to 100. Assuming couple of new policies in pending status for 
 # any insured. Can be increased in the future
 
    MIR-CLI-ID = ORIG-CLI-ID;
    MAX3 = 100;
    index3 = 1; 
    index10 = 1;    
    
    STEP UWDecndata
    {
           USES P-STEP "BF1250-P";
    }
     index4 = 1;
    
    IF LSIR-RETURN-CD == "00"
    
    {
      WHILE (index10 <= MAX3)
        {
           IF MIR-POL-ID-BASE-T[index4] == MIR-POL-ID-BASE 
           {
 # R12048 changes start here. Special logic implemented to handle the
 # more logic in UW decision update screen to avoid populating same coverage
 # number more than once 
              IF (MIR-CVG-NUM-T[index4]  == "01" && index3 >= "21")
              {
               BRANCH Output;
              } 
 # R12048 end here 
                MIR-UW-POL-ID-BASE-T[index3]          = MIR-POL-ID-BASE-T[index4];
                MIR-UW-POL-ID-SFX-T[index3]	       = MIR-POL-ID-SFX-T[index4];
                MIR-UW-PLAN-ID-T[index3]	       = MIR-PLAN-ID-T[index4];
                MIR-UW-CVG-SUPP-BNFT-CD-T[index3]     = MIR-CVG-SUPP-BNFT-CD-T[index4];
                MIR-UW-CVG-REINS-IND-T[index3] = MIR-CVG-REINS-IND-T[index4];
                MIR-UW-CVG-REINS-CO-ID-T[index3]      = MIR-CVG-REINS-CO-ID-T[index4];
                MIR-UW-CVG-REINS-TRTY-NUM-T[index3]   = MIR-CVG-REINS-TRTY-NUM-T[index4];
                MIR-UW-CVG-REINS-CED-PCT-T[index3]    = MIR-CVG-REINS-CED-PCT-T[index4];
                IF  MIR-POL-CRCY-CD-T[index4] != ""
                    MIR-UWFD-POL-CRCY-CD   = MIR-POL-CRCY-CD-T[index4];            
                MIR-UW-CVG-UWGDECN-CD-T[index3]       = MIR-CVG-UWGDECN-CD-T[index4];
                MIR-UW-CVG-ME-DUR-T[index3]	       = MIR-CVG-ME-DUR-T[index4];
                MIR-UW-CVG-ME-FCT-T[index3]	       = MIR-CVG-ME-FCT-T[index4];
                MIR-UW-CVG-ME-REASN-CD-T[index3]      = MIR-CVG-ME-REASN-CD-T[index4];
                MIR-UW-CVG-NUM-T[index3]	       = MIR-CVG-NUM-T[index4];
                MIR-UW-CVG-LIEN-DUR-T[index3]      = MIR-CVG-LIEN-DUR-T[index4];
                MIR-UW-POL-CRCY-CD-T[index3]      = MIR-POL-CRCY-CD-T[index4];
                MIR-UW-SSTD-AGE-ADD-DUR-T[index3]     = MIR-SSTD-AGE-ADD-DUR-T[index4];   
                index3 = index3+1;
            }
             index10 = index10+1;
             index4  = index4+1;
             IF index4 == "21" && MIR-POL-ID-BASE-T[20]!=""
               {
                BRANCH UWDecndata; 
               }
        }  
     }
      ELSE
       BRANCH  Input;     
     
  # Output screen
  
    STEP Output
    {
        USES S-STEP "BF9C30-O";
    }     
  
  # Users can select from the link of Amendments, Issue & UW requirements
  # from the output screen and the repective details are displayed
  
    MIR-AMEX-REC-TYP-CD = MIR-AMEX-REC-TYP-CD-T[index];
    MIR-AMEX-SEQ-NUM = MIR-AMEX-SEQ-NUM-T[index];
    
    # action will be "SelectItem1" if the user clicks on a hyperlink in the screen
    
    IF action == "SelectItem1" 
    {
        STEP SelectItem1
        {
            USES PROCESS "BF1580Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-AMEX-REC-TYP-CD -> MIR-AMEX-REC-TYP-CD;
            MIR-AMEX-SEQ-NUM -> MIR-AMEX-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }
        BRANCH Output;

    }

    MIR-CPREQ-SEQ-NUM = MIR-ISS-CPREQ-SEQ-NUM-T[index];
    MIR-REQIR-ID = MIR-ISS-REQIR-ID-T[index];
    MIR-CLI-ID = "";
    MIR-POL-ID-BASE = ORIG-POL-ID;
    ReqtType = 2;

    # action will be "SelectItem" if the user clicks on a hyperlink in the screen

    IF action == "SelectItem"
    {
        STEP SelectItem
        {
        
           USES PROCESS "BF1190Retrieve";
           ATTRIBUTES
           {
               Explicit;
               GetMessages = "NO";
           }

            MIR-CPREQ-SEQ-NUM -> MIR-CPREQ-SEQ-NUM;
            MIR-REQIR-ID -> MIR-REQIR-ID;
            "FALSE" -> DisplayInput;
        }
        BRANCH Output;
    }    
 
     MIR-CPREQ-SEQ-NUM = MIR-UW-CPREQ-SEQ-NUM-T[index];
     MIR-REQIR-ID = MIR-UW-REQIR-ID-T[index];
     MIR-CLI-ID = ORIG-CLI-ID;
     MIR-POL-ID-BASE = "";
     ReqtType = 1;
 
    # action will be "SelectItem3" if the user clicks on a hyperlink in the screen
 
     IF action == "SelectItem3"
     {
         STEP SelectItem3
         {
         
            USES PROCESS "BF1190Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
 
             MIR-CPREQ-SEQ-NUM -> MIR-CPREQ-SEQ-NUM;
             MIR-REQIR-ID -> MIR-REQIR-ID;
             "FALSE" -> DisplayInput;
         }

         BRANCH Output;
     }    
      
    IF action == "ACTION_BACK"
        EXIT;

}

