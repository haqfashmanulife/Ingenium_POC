#*******************************************************************************
#*  Component:   BF9834List.f                                                  *
#*  Description:   Question Description List                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   INITIAL VERSION                                              *
#*  AFF024  CTS   Fix for Duplicate branch target found and variable index is  *
#*                not an IN or INOUT variable                                  *
#*******************************************************************************

INCLUDE "BF9834-I.s";
INCLUDE "BF9900-P.p";
INCLUDE "BF9900-O.s";
INCLUDE "BF9832-I.s";
INCLUDE "BF9832-P.p";
INCLUDE "BF9833-P.p";
INCLUDE "BF9834-O.s";
INCLUDE "BF9834-P.p";
INCLUDE "BF9831Create.f";

PROCESS BF9834List
{
    Title = STRINGTABLE.IDS_TITLE_BF9834List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9834-I";     
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP InquiryList
    {
        USES P-STEP "BF9834-P";
    }

    IF LSIR-RETURN-CD != "00"
    {
        ButtonBar = "ButtonBarOKCancel";
        ButtonBarSize = "40";
        BRANCH ListStart;
    }


    Title = STRINGTABLE.IDS_TITLE_BF9834List;
    ButtonBar = "ButtonBarListsICRUD";

    STEP DisplayList
    {
        USES S-STEP "BF9834-O";
#AFF024        "0" -> index;
    }

    IF action == "ACTION_BACK"
    {
       MESSAGES-T[0]="";
       MESSAGES-T[1]="";
       ButtonBar = "ButtonBarOKCancel";
       ButtonBarSize = "40";
       BRANCH ListStart;

    }


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
          BRANCH InquiryList;

    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the key will not be populated on the add

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF9831Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

        }
        MIR-QSTN-ID = MIR-QSTN-ID ;
        MIR-USER-TYP-CD = MIR-USER-TYP-CD ;

        BRANCH InquiryList;
    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
    {
           Title = STRINGTABLE.IDS_TITLE_BF9834List;
           ButtonBar = "ButtonBarListsICRUD";     
           BRANCH DisplayList;
    }


    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.
 
        MIR-QSTN-ID = MIR-QSTN-ID-T[index] ;
        MIR-USER-TYP-CD = MIR-USER-TYP-CD-T[index] ;

    IF action == "ACTION_INSERT"
    {

            Title = STRINGTABLE.IDS_TITLE_BF9831Create;
            ButtonBar = "ButtonBarOKCancel";
            MIR-HID-QSTN-ID = MIR-QSTN-ID-T[index] ;
            MESSAGES-T[0]="";
            MIR-MAJ-QSTN-IND = "A";

            STEP InputS
            {
                 USES S-STEP "BF9831u-I";
                 MIR-HID-QSTN-ID -> MIR-QSTN-ID;
            }

            IF action == "ACTION_BACK"
            {
                MIR-QSTN-ID = MIR-QSTN-ID ;
                MIR-USER-TYP-CD = MIR-USER-TYP-CD ;
                BRANCH InquiryList;
            }

            IF action == "ACTION_LANGCHANGE"
                BRANCH InputS;

            STEP CreateP
            {
                 USES P-STEP "BF9831-P";
                 MIR-HID-QSTN-ID -> MIR-QSTN-ID;
            }

            IF LSIR-RETURN-CD != "00"
                BRANCH InputS;

            STEP RetrieveP
            {
                 USES P-STEP "BF9900-P";
            }

            ButtonBar = "ButtonBarOK";

            STEP OutputS
            {
                 USES S-STEP "BF9900-O";
            }

            MIR-QSTN-ID = MIR-QSTN-ID ;
            MIR-USER-TYP-CD = MIR-USER-TYP-CD ;        
            BRANCH InquiryList;
    }





    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
          MIR-QSTN-ID = MIR-QSTN-ID-T[index] ;
          MIR-USER-TYP-CD = MIR-USER-TYP-CD-T[index] ;
            
#AFF024 changes start            
#          STEP Retrieve
          STEP RetrieveI
#AFF024 changes end           
          {
              USES P-STEP "BF9900-P";
          }
          MESSAGES-T[0]="";
          MESSAGES-T[1]="";          
          ButtonBar = "ButtonBarOK";

         Title = STRINGTABLE.IDS_TITLE_BF9900Retrieve;
         TitleBar = "TitleBar";
         TitleBarSize = "70";

#AFF024 changes start
#          STEP Output
          STEP OutputI
#AFF024 changes end           
          {
              USES S-STEP "BF9900-O";
          }

        MIR-QSTN-ID = MIR-QSTN-ID ;
        MIR-USER-TYP-CD = MIR-USER-TYP-CD ;    
        BRANCH InquiryList;
    }
    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
          MIR-QSTN-ID = MIR-QSTN-ID-T[index] ;
          MIR-USER-TYP-CD = MIR-USER-TYP-CD-T[index] ;
          
          MESSAGES-T[0]="";
          MESSAGES-T[1]="";  
          ButtonBar = "ButtonBarOKCancel";

#AFF024 changes start
#          STEP Retrieve
          STEP RetrieveU
#AFF024 changes end           
          {
              USES P-STEP "BF9900-P";
          }

         Title = STRINGTABLE.IDS_TITLE_BF9832Update;
         TitleBar = "TitleBar";
         TitleBarSize = "70";

          STEP Edit
          {
               USES S-STEP "BF9832-I";
          }

          IF action == "ACTION_BACK"
          {
               Title = STRINGTABLE.IDS_TITLE_BF9834List;
               ButtonBar = "ButtonBarListsICRUD";
               BRANCH DisplayList;
          }

          STEP Update
          {
               USES P-STEP "BF9832-P";
          }

          IF LSIR-RETURN-CD != "00"
          BRANCH Edit;

          ButtonBar = "ButtonBarOK";

         Title = STRINGTABLE.IDS_TITLE_BF9900Retrieve;
         TitleBar = "TitleBar";
         TitleBarSize = "70";

#AFF024 changes start
#          STEP Output
          STEP OutputU
#AFF024 changes end           
          {
               USES S-STEP "BF9900-O";
          }
 
          MIR-QSTN-ID = MIR-QSTN-ID ;
          MIR-USER-TYP-CD = MIR-USER-TYP-CD ;
          BRANCH InquiryList;
    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
          MIR-QSTN-ID = MIR-QSTN-ID-T[index] ;
          MIR-USER-TYP-CD = MIR-USER-TYP-CD-T[index] ;
      
#AFF024 changes start
#          STEP Retrieve
          STEP RetrieveD
#AFF024 changes end           
          {
               USES P-STEP "BF9900-P";
          }

          MESSAGES-T[0]="";
          MESSAGES-T[1]="";  
          ButtonBar = "ButtonBarDeleteCancel";

         Title = STRINGTABLE.IDS_TITLE_BF9833Delete;
         TitleBar = "TitleBar";
         TitleBarSize = "70";


          STEP Confirm
          {
               USES S-STEP "BF9900-O";
          }

          IF action == "ACTION_BACK"
          {
               Title = STRINGTABLE.IDS_TITLE_BF9834List;
               ButtonBar = "ButtonBarListsICRUD";
               BRANCH DisplayList;
          }
          
          STEP Delete
          {
               USES P-STEP "BF9833-P";
          }


          IF LSIR-RETURN-CD != "00"
               BRANCH Confirm;        
                      
        MIR-QSTN-ID = MIR-QSTN-ID ;
        MIR-USER-TYP-CD = MIR-USER-TYP-CD ;        
        BRANCH InquiryList;
    }

  
}
