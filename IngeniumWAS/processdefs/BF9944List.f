#*******************************************************************************
#*  Component:   BF9944List.f                                                  *
#*  Description:   Question Rule List                                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   INITIAL VERSION                                              *
#*  AFF018  CTS   CORRECTED TITLE                                              *
#*******************************************************************************



INCLUDE "BF9944-I.s";

# Change this to the P that retrieves the list
INCLUDE "BF9940-P.p";
INCLUDE "BF9940-O.s";
INCLUDE "BF9942-I.s";
INCLUDE "BF9942-P.p";
INCLUDE "BF9943-P.p";
INCLUDE "BF9944-O.s";
INCLUDE "BF9944-P.p";
INCLUDE "BF9945-P.p";
INCLUDE "BF9941Create.f";

PROCESS BF9944List
{
    Title = STRINGTABLE.IDS_TITLE_BF9944List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9944-I";     
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP InquiryList
    {
        USES P-STEP "BF9944-P";
    }

    IF LSIR-RETURN-CD != "00"
    {
        ButtonBar = "ButtonBarOKCancel";
        ButtonBarSize = "40";
        BRANCH ListStart;
    }


    Title = STRINGTABLE.IDS_TITLE_BF9944List;
    ButtonBar = "ButtonBarListsICRUD";

    STEP DisplayList
    {
        USES S-STEP "BF9944-O";
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
            USES PROCESS "BF9941Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-MAJ-QSTN-ID;
            " " -> MIR-PRNT-QSTN-ID;
            " " -> MIR-QSTN-ID;
            " " -> MIR-HID-MAJ-QSTN-ID;
            "FALSE" -> DisplayInput;
        }
        MIR-MAJ-QSTN-ID = MIR-MAJ-QSTN-ID;
        MIR-PRNT-QSTN-ID = MIR-PRNT-QSTN-ID;
        MIR-QSTN-ID = MIR-QSTN-ID;       
        MIR-HID-MAJ-QSTN-ID = MIR-MAJ-QSTN-ID;
        MIR-HID-USER-TYP-CD = MIR-HID-USER-TYP-CD;
        BRANCH InquiryList;
    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.
 

    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
          MIR-MAJ-QSTN-ID = MIR-MAJ-QSTN-ID-T[index];
          MIR-PRNT-QSTN-ID = MIR-PRNT-QSTN-ID-T[index];
          MIR-QSTN-ID = MIR-ACTV-ID-T[index];  
          MIR-HID-USER-TYP-CD = MIR-HID-USER-TYP-CD-T[index];
            
          STEP RetrieveInquire
          {
              USES P-STEP "BF9940-P";
          }


          IF LSIR-RETURN-CD != "00"
          {
              MIR-QSTN-ID = " ";
              Title = STRINGTABLE.IDS_TITLE_BF9944List;
              ButtonBar = "ButtonBarListsICRUD";
              BRANCH DisplayList;
          }

          MESSAGES-T[0]="";
          MESSAGES-T[1]="";          
          ButtonBar = "ButtonBarOK";
          Title = STRINGTABLE.IDS_TITLE_BF9940Inquiry;

          STEP Output
          {
              USES S-STEP "BF9940-O";
          }

          MIR-MAJ-QSTN-ID = MIR-MAJ-QSTN-ID;
          MIR-PRNT-QSTN-ID = MIR-PRNT-QSTN-ID;
          MIR-QSTN-ID = MIR-QSTN-ID;  
          MIR-HID-MAJ-QSTN-ID = MIR-MAJ-QSTN-ID;
          MIR-HID-USER-TYP-CD = MIR-HID-USER-TYP-CD;
    
        BRANCH InquiryList;
    }
    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
          MIR-MAJ-QSTN-ID = MIR-MAJ-QSTN-ID-T[index];
          MIR-PRNT-QSTN-ID = MIR-PRNT-QSTN-ID-T[index];
          MIR-QSTN-ID = MIR-ACTV-ID-T[index]; 
          MIR-HID-USER-TYP-CD = MIR-HID-USER-TYP-CD-T[index];
                    
          STEP RetrieveUpdate        
          {        
              USES P-STEP "BF9940-P";    
          }    

          IF LSIR-RETURN-CD != "00"
          {
              MIR-QSTN-ID = " ";
              Title = STRINGTABLE.IDS_TITLE_BF9944List;
              ButtonBar = "ButtonBarListsICRUD";
              BRANCH DisplayList;
          }  


          MESSAGES-T[0]="";
          MESSAGES-T[1]="";  
          ButtonBar = "ButtonBarOKCancel";
          Title = STRINGTABLE.IDS_TITLE_BF9942Update;

          STEP EditUpdate
          {
               USES S-STEP "BF9942-I";
          }

          IF action == "ACTION_BACK"
          {
              MESSAGES-T[0]="";
              MESSAGES-T[1]="";
              Title = STRINGTABLE.IDS_TITLE_BF9944List;
              ButtonBar = "ButtonBarListsICRUD";
              BRANCH DisplayList;
          }

          IF action == "ACTION_REFRESH"
          BRANCH EditUpdate;

          STEP Update
          {
               USES P-STEP "BF9942-P";
          }

          IF LSIR-RETURN-CD != "00"
          BRANCH EditUpdate;

          STEP ConfirmUpdate
          {
               USES P-STEP "BF9940-P";
          }

          ButtonBar = "ButtonBarOK";

          STEP OutputUpdate
          {
               USES S-STEP "BF9940-O";
          }

          MIR-MAJ-QSTN-ID = MIR-MAJ-QSTN-ID;
          MIR-PRNT-QSTN-ID = MIR-PRNT-QSTN-ID;
          MIR-QSTN-ID = MIR-QSTN-ID;  
          MIR-HID-MAJ-QSTN-ID = MIR-MAJ-QSTN-ID;
          MIR-HID-USER-TYP-CD = MIR-HID-USER-TYP-CD;

          BRANCH InquiryList;
    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
          MIR-MAJ-QSTN-ID = MIR-MAJ-QSTN-ID-T[index];
          MIR-PRNT-QSTN-ID = MIR-PRNT-QSTN-ID-T[index];
          MIR-QSTN-ID = MIR-ACTV-ID-T[index];  
          MIR-HID-USER-TYP-CD = MIR-HID-USER-TYP-CD-T[index];
    
          STEP RetrieveDelete
          {
               USES P-STEP "BF9940-P";
          }

          IF LSIR-RETURN-CD != "00"
          {
              MIR-QSTN-ID = " ";
              Title = STRINGTABLE.IDS_TITLE_BF9944List;
              ButtonBar = "ButtonBarListsICRUD";
              BRANCH DisplayList;
          }

          MESSAGES-T[0]="";
          MESSAGES-T[1]="";  
          ButtonBar = "ButtonBarDeleteCancel";
          Title = STRINGTABLE.IDS_TITLE_BF9943Delete;

          STEP ConfirmDelete
          {
               USES S-STEP "BF9940-O";
          }


          IF LSIR-RETURN-CD != "00"
          BRANCH InquiryList;

          IF action == "ACTION_BACK"
          {
               MESSAGES-T[0]="";
               MESSAGES-T[1]="";  
               BRANCH InquiryList;
          }
          
          STEP Delete
          {
               USES P-STEP "BF9943-P";
          }


          IF LSIR-RETURN-CD != "00"
               BRANCH ConfirmDelete;        
                      
        MIR-MAJ-QSTN-ID = MIR-MAJ-QSTN-ID;
        MIR-PRNT-QSTN-ID = MIR-PRNT-QSTN-ID;
        MIR-QSTN-ID = MIR-QSTN-ID;  
        MIR-HID-MAJ-QSTN-ID = MIR-MAJ-QSTN-ID;
        MIR-HID-USER-TYP-CD = MIR-HID-USER-TYP-CD;
#AFF018 Changes start
        Title = STRINGTABLE.IDS_TITLE_BF9944List; 
        ButtonBar = "ButtonBarListsICRUD";    
#AFF018 Changes end
        BRANCH InquiryList;
    }

    IF action == "SelectItem" || action == "ACTION_INSERT"
    {
          MIR-MAJ-QSTN-ID = MIR-HID-MAJ-QSTN-ID-T[index];
          MIR-PRNT-QSTN-ID = MIR-PRNT-QSTN-ID-T[index];
          MIR-QSTN-ID = MIR-ACTV-ID-T[index];  
          MIR-HID-USER-TYP-CD = MIR-HID-USER-TYP-CD-T[index];
                 
          MESSAGES-T[0]="";
          MESSAGES-T[1]="";  
          ButtonBar = "ButtonBarOKCancel";

          STEP Insert
          {
              USES P-STEP "BF9945-P";
          }

          IF LSIR-RETURN-CD != "00"
          {

              Title = STRINGTABLE.IDS_TITLE_BF9944List;
              ButtonBar = "ButtonBarListsICRUD";
              BRANCH DisplayList;
          }

          Title = STRINGTABLE.IDS_TITLE_BF9941Create;

          STEP Input
          {
              USES S-STEP "BF9941-I";
          }

          IF action == "ACTION_BACK"
          {
              MESSAGES-T[0]="";
              MESSAGES-T[1]="";  
              Title = STRINGTABLE.IDS_TITLE_BF9944List;
              ButtonBar = "ButtonBarListsICRUD";
              BRANCH DisplayList;
          }

          IF action == "ACTION_REFRESH"
              BRANCH Input;

          STEP Create
          {
              USES P-STEP "BF9941-P";
          }

          IF LSIR-RETURN-CD != "00"
              BRANCH Input;


          STEP RetrieveInsert
          {
              USES P-STEP "BF9940-P";
          }

          IF LSIR-RETURN-CD != "00"
              BRANCH Input;

          STEP EditInsert
          {
              USES S-STEP "BF9942-I";
          }


          IF action == "ACTION_BACK"
          {

              MESSAGES-T[0]="";
              MESSAGES-T[1]="";  
              BRANCH InquiryList;
          }

          IF action == "ACTION_REFRESH"
              BRANCH EditInsert;
      
          STEP UpdateInsert
          {
              USES P-STEP "BF9942-P";
          }

          IF LSIR-RETURN-CD != "00"
              BRANCH EditInsert;

          STEP RetrieveOutput
          {
              USES P-STEP "BF9940-P";
          }

          ButtonBar = "ButtonBarOK";

          STEP OutputInsert
          {
              USES S-STEP "BF9940-O";
          }

        MIR-MAJ-QSTN-ID = MIR-MAJ-QSTN-ID;
        MIR-PRNT-QSTN-ID = MIR-PRNT-QSTN-ID;
        MIR-QSTN-ID = MIR-QSTN-ID;  
        MIR-HID-MAJ-QSTN-ID = MIR-MAJ-QSTN-ID;   
        MIR-HID-USER-TYP-CD = MIR-HID-USER-TYP-CD;  
        BRANCH InquiryList;
   }
   
}
