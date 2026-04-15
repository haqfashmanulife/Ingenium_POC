# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9G10Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TLB404  CTS      NEW SCREEN FOR BULK BUNDLE APPLICATION                    *
#*******************************************************************************

INCLUDE "BF9G10-I.s";
INCLUDE "BF9G14Alphalist.f";
INCLUDE "BF9G14Alphalstnmlist.f";
INCLUDE "BF9G14-P.p";
INCLUDE "BF9G14-O.s";
INCLUDE "BF9G10-P.p";
INCLUDE "BF9G10-O.s";
INCLUDE "BF9G12-P.p";

PROCESS BF9G10Retrieve
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9G10Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;

    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF9G10-I";
    }
     
    
    IF action == "ACTION_BACK"
        EXIT;
		
    IF action == "ACTION_ALPH_SRCH"
    {
       STEP ACTION_ALPH_SRCH
       {
          USES PROCESS "BF9G14Alphalist";
   
       }
       BRANCH Input;
    }       
     
    IF action == "ACTION_LNM_SRCH"
    {
       STEP ACTION_LNM_SRCH
       {
           USES PROCESS "BF9G14Alphalstnmlist";
       }
       BRANCH Input; 
    }  


    # Retrieve the data for the key value
     TEMP-CLI-ID             = MIR-CLI-ID;
     TEMP-UPLD-STRT-DT = MIR-UPLD-STRT-DT;
     TEMP-UPLD-END-DT = MIR-UPLD-END-DT;
    FLOW-PAGE = 0;
    MIR-RECORD-CTR =0;
    STEP ListRetrieve
    {
        USES P-STEP "BF9G14-P";
    }
    
    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
    

    # Select the Application Id and display the corresponding 
    # details on the next page
    
    STEP ListOutput
    {
        USES S-STEP "BF9G14-O";
        "ButtonBarOkCancelBackMore" -> ButtonBar;
         STRINGTABLE.IDS_TITLE_BF9G14List -> Title;
    }

    IF action == "ACTION_BACK"
            BRANCH Input;

     IF action == "ACTION_PREV"
     {
     MIR-CLI-ID             = TEMP-CLI-ID;
     MIR-UPLD-STRT-DT = TEMP-UPLD-STRT-DT;
     MIR-UPLD-END-DT = TEMP-UPLD-END-DT;
       FLOW-PAGE = FLOW-PAGE - 1;
       MIR-RECORD-CTR = FLOW-PAGE;
         BRANCH ListRetrieve;
     }  

     IF action == "ACTION_MORE" 
     {
     MIR-CLI-ID             = TEMP-CLI-ID;
     MIR-UPLD-STRT-DT = TEMP-UPLD-STRT-DT;
     MIR-UPLD-END-DT = TEMP-UPLD-END-DT;
         FLOW-PAGE = FLOW-PAGE + 1;
         MIR-RECORD-CTR = FLOW-PAGE;
     
         BRANCH ListRetrieve;
      }
    
   IF index == "0"
    BRANCH ListOutput;

   MIR-BULK-BUNDLE-APP-ID = MIR-BULK-BUNDLE-APP-ID-T[index];
   MIR-APP-UPLD-DT        = MIR-APP-UPLD-DT-T[index];
   MIR-CLI-ID             = MIR-CLI-ID-T[index];
   MIR-OWN-CLI-NM         = MIR-OWN-CLI-NM-T[index];
   MIR-PROD-APP-TYP-CD    = MIR-PROD-APP-TYP-CD-T[index];
   MIR-APP-CAT-CD         = MIR-APP-CAT-CD-T[index];
   
   TEMP-BULK-BUNDLE-APP-ID = MIR-BULK-BUNDLE-APP-ID;
      TEMP-APP-UPLD-DT        = MIR-APP-UPLD-DT;
      TEMP-CLI-ID             = MIR-CLI-ID;
      TEMP-OWN-CLI-NM         = MIR-OWN-CLI-NM;
      TEMP-PROD-APP-TYP-CD    = MIR-PROD-APP-TYP-CD;
   TEMP-APP-CAT-CD         = MIR-APP-CAT-CD;

    # Retrieve the data for the Selected key value
    FLOW-PAGE1 = 0;
    MIR-RECORD-CTR1 =0;
    STEP Retrieve
    {
        USES P-STEP "BF9G10-P";
         ATTRIBUTES
       
          {
       
            GetMessages = "Merge";
     
          }
    }
          
           
     
    COUNTER = 1;

        WHILE (COUNTER < 31)
        {
            TEMP-POL-ID-T[COUNTER] = MIR-POL-ID-T[COUNTER];

          TRACE ("TEMP-POL-ID-T[COUNTER]  " +TEMP-POL-ID-T[COUNTER]);
            COUNTER = COUNTER + 1;

        }       

    IF LSIR-RETURN-CD != "00"
        BRANCH ListOutput;
        
    # Select the Application Id and display the corresponding 
    # details on the appropriate Output page
     MIR-UPLD-STRT-DT = TEMP-UPLD-STRT-DT;
     MIR-UPLD-END-DT = TEMP-UPLD-END-DT;
        STEP Output
    {
        USES S-STEP "BF9G10-O";
        "ButtonBarOkCancelBackMore" -> ButtonBar;
         STRINGTABLE.IDS_TITLE_BF9G12Update -> Title;
    }

    COUNTER = 1;

        WHILE (COUNTER < 31)
        {
            MIR-POL-ID-T[COUNTER] = TEMP-POL-ID-T[COUNTER];
          TRACE ("MIR-POL-ID-T[1]  " +MIR-POL-ID-T[COUNTER]);

            COUNTER = COUNTER + 1;

        }       

   IF action == "ACTION_BACK"
            BRANCH ListOutput;

     IF action == "ACTION_PREV"
     {
      MIR-BULK-BUNDLE-APP-ID = TEMP-BULK-BUNDLE-APP-ID;
      MIR-APP-UPLD-DT        = TEMP-APP-UPLD-DT;
      MIR-CLI-ID             = TEMP-CLI-ID;
      MIR-OWN-CLI-NM         = TEMP-OWN-CLI-NM;
      MIR-PROD-APP-TYP-CD    = TEMP-PROD-APP-TYP-CD;
      MIR-APP-CAT-CD         = TEMP-APP-CAT-CD;
      MIR-UPLD-STRT-DT = TEMP-UPLD-STRT-DT;
      MIR-UPLD-END-DT = TEMP-UPLD-END-DT;
       FLOW-PAGE1 = FLOW-PAGE1 - 1;
       MIR-RECORD-CTR1 = FLOW-PAGE1;
         BRANCH Retrieve;
     }  

     IF action == "ACTION_MORE" 
     {
       MIR-BULK-BUNDLE-APP-ID = TEMP-BULK-BUNDLE-APP-ID;
      MIR-APP-UPLD-DT        = TEMP-APP-UPLD-DT;
      MIR-CLI-ID             = TEMP-CLI-ID;
      MIR-OWN-CLI-NM         = TEMP-OWN-CLI-NM;
      MIR-PROD-APP-TYP-CD    = TEMP-PROD-APP-TYP-CD;
      MIR-APP-CAT-CD         = TEMP-APP-CAT-CD;
      MIR-UPLD-STRT-DT = TEMP-UPLD-STRT-DT;
      MIR-UPLD-END-DT = TEMP-UPLD-END-DT;
         FLOW-PAGE1 = FLOW-PAGE1 + 1;
       MIR-RECORD-CTR1 = FLOW-PAGE1;
         BRANCH Retrieve;
      }
    
       
    # Retrieve the data and update in DB
   TRACE ("Before BF9G12-P");
        COUNTER = 1;

        WHILE (COUNTER < 31)
        {
           
          TRACE ("MIR-POL-ID-T[1]  " +MIR-POL-ID-T[COUNTER]);
          TRACE ("MIR-SPCL-APROV-IND-T[index]    " +MIR-SPCL-APROV-IND-T[COUNTER]);

            COUNTER = COUNTER + 1;

        }        

    
    STEP UPDATE
    {
        USES P-STEP "BF9G12-P";
    } 


    
    IF LSIR-RETURN-CD != "00"
      { 
       # TEMP-FLAG=1;
        MIR-BULK-BUNDLE-APP-ID = TEMP-BULK-BUNDLE-APP-ID;
        MIR-APP-UPLD-DT        = TEMP-APP-UPLD-DT;
        MIR-CLI-ID             = TEMP-CLI-ID;
        MIR-OWN-CLI-NM         = TEMP-OWN-CLI-NM;
        MIR-PROD-APP-TYP-CD    = TEMP-PROD-APP-TYP-CD;
        MIR-APP-CAT-CD         = TEMP-APP-CAT-CD;
        MIR-UPLD-STRT-DT = TEMP-UPLD-STRT-DT;
        MIR-UPLD-END-DT = TEMP-UPLD-END-DT;
       BRANCH Retrieve;
      }   
      BRANCH Input;       
}

