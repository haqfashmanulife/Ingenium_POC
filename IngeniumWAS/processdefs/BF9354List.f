#*******************************************************************************
#*  Component:   BF9354List.f                                                  *
#*  Description:   Major Question List                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   INITIAL VERSION                                              *
#*                                                                             *
#*******************************************************************************



INCLUDE "BF9354-I.s";
INCLUDE "BF9310-P.p";
INCLUDE "BF9352-I.s";
INCLUDE "BF9352-P.p";
INCLUDE "BF9353-P.p";
INCLUDE "BF9354-O.s";
INCLUDE "BF9352-O.s";
INCLUDE "BF9354-P.p";
INCLUDE "BF9351Create.f";

PROCESS BF9354List
{
    Title = STRINGTABLE.IDS_TITLE_BF9354List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9354-I";
        "NA" -> MIR-DIS-TYP-CD; 
        "NA" -> MIR-SUR-TYP-CD; 
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP InquiryList
    {
        USES P-STEP "BF9354-P";
    }

    IF LSIR-RETURN-CD != "00"
    {
        ButtonBar = "ButtonBarOKCancel";
        ButtonBarSize = "40";
        BRANCH ListStart;
    }


    Title = STRINGTABLE.IDS_TITLE_BF9354List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF9354-O";
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

    {
       MIR-INCID-TYP-CD = MIR-HID-INCID-TYP-CD;
       MIR-BNFT-CAT-CD = MIR-HID-BNFT-CAT-CD;
       MIR-BNFT-NM-ID = MIR-HID-BNFT-NM-ID;
       MIR-DIS-MEDC-ID = MIR-HID-DIS-MEDC-ID;
       MIR-DIS-GRP-MEDC-ID = MIR-HID-DIS-GRP-MEDC-ID;
       MIR-DIS-MEDC-CAT-CD = MIR-HID-DIS-MEDC-CAT-CD;
       MIR-SUR-MEDC-ID = MIR-HID-SUR-MEDC-ID;
       MIR-SUR-GRP-MEDC-ID = MIR-HID-SUR-GRP-MEDC-ID;
       MIR-SUR-MEDC-CAT-CD = MIR-HID-SUR-MEDC-CAT-CD;
       BRANCH InquiryList;
    }

    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the key will not be populated on the add

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF9351Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-INCID-TYP-CD;
            " " -> MIR-BNFT-TYP-CD;
            " " -> MIR-BNFT-CAT-CD;
            " " -> MIR-BNFT-NM-ID;
            " " -> MIR-DIS-MEDC-ID;
            " " -> MIR-DIS-GRP-MEDC-ID;
            " " -> MIR-DIS-MEDC-CAT-CD;
            " " -> MIR-SUR-MEDC-ID;
            " " -> MIR-SUR-GRP-MEDC-ID;
            " " -> MIR-SUR-MEDC-CAT-CD;
        }
        MIR-HID-QSTN-DTRMN-ID = MIR-HID-QSTN-DTRMN-ID ;

        BRANCH InquiryList;
    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
    {
        Title = STRINGTABLE.IDS_TITLE_BF9354List;
        ButtonBar = "ButtonBarListsCRUD";
        BRANCH DisplayList;
    }


    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.
 
       MIR-HID-QSTN-DTRMN-ID = MIR-HID-QSTN-DTRMN-ID-T[index] ;


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
          MIR-HID-QSTN-DTRMN-ID = MIR-HID-QSTN-DTRMN-ID-T[index] ;
            
          STEP Inquire
          {
              USES P-STEP "BF9310-P";
          }
          MESSAGES-T[0]="";
          MESSAGES-T[1]="";          
          ButtonBar = "ButtonBarOK";

         Title = STRINGTABLE.IDS_TITLE_BF9310Retrieve;
         TitleBar = "TitleBar";
         TitleBarSize = "70";

          STEP Output
          {
              USES S-STEP "BF9352-O";
          }

        MIR-HID-QSTN-DTRMN-ID = MIR-HID-QSTN-DTRMN-ID ;
    
        BRANCH InquiryList;
    }
    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
          MIR-HID-QSTN-DTRMN-ID = MIR-HID-QSTN-DTRMN-ID-T[index] ;
          
          MESSAGES-T[0]="";
          MESSAGES-T[1]="";  
          ButtonBar = "ButtonBarOKCancel";

          STEP RetrieveUpdate
          {
              USES P-STEP "BF9310-P";
          }

         Title = STRINGTABLE.IDS_TITLE_BF9352Update;
         TitleBar = "TitleBar";
         TitleBarSize = "70";

          STEP Edit
          {
               USES S-STEP "BF9352-I";
          }

          IF action == "ACTION_BACK"
          {
               Title = STRINGTABLE.IDS_TITLE_BF9354List;
               ButtonBar = "ButtonBarListsCRUD";
               BRANCH InquiryList;
          }

          IF action == "ACTION_REFRESH"
          BRANCH Edit;

          STEP Update
          {
               USES P-STEP "BF9352-P";
          }

          temp-MSGS-T[1] = MESSAGES-T[1];
          temp-MSGS-T[2] = MESSAGES-T[2];
          temp-MSGS-T[3] = MESSAGES-T[3];
          temp-MSGS-T[4] = MESSAGES-T[4];
          temp-MSGS-T[5] = MESSAGES-T[5];

          IF LSIR-RETURN-CD != "00"
          BRANCH Edit;

          ButtonBar = "ButtonBarOK";

          STEP Retrieve
          {
              USES P-STEP "BF9310-P";
          }

          MESSAGES-T[1] = temp-MSGS-T[1];
          MESSAGES-T[2] = temp-MSGS-T[2];
          MESSAGES-T[3] = temp-MSGS-T[3];
          MESSAGES-T[4] = temp-MSGS-T[4];
          MESSAGES-T[5] = temp-MSGS-T[5];

          STEP Display
          {
               USES S-STEP "BF9352-O";
          }

          MIR-HID-QSTN-DTRMN-ID = MIR-HID-QSTN-DTRMN-ID ;

          BRANCH InquiryList;
    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
          MIR-HID-QSTN-DTRMN-ID = MIR-HID-QSTN-DTRMN-ID-T[index] ;
    
          STEP RetrieveDelete
          {
               USES P-STEP "BF9310-P";
          }

          MESSAGES-T[0]="";
          MESSAGES-T[1]="";  
          ButtonBar = "ButtonBarDeleteCancel";

         Title = STRINGTABLE.IDS_TITLE_BF9353Delete;
         TitleBar = "TitleBar";
         TitleBarSize = "70";

          STEP Confirm
          {
               USES S-STEP "BF9352-O";
          }

          IF action == "ACTION_BACK"
          {
               Title = STRINGTABLE.IDS_TITLE_BF9354List;
               ButtonBar = "ButtonBarListsCRUD";
               BRANCH InquiryList;
          }
          
          STEP Delete
          {
               USES P-STEP "BF9353-P";
          }


          IF LSIR-RETURN-CD != "00"
               BRANCH Confirm;        
                      
        MIR-HID-QSTN-DTRMN-ID = MIR-HID-QSTN-DTRMN-ID ;
        Title = STRINGTABLE.IDS_TITLE_BF9354List;
        ButtonBar = "ButtonBarListsCRUD";        
        BRANCH InquiryList;
    }

  
}
