#*******************************************************************************
#*  Component:   PayoPolCreate                                                 *
#*  Description:  PAYOUT POLICY CREATION                                       *
#*                                                                             *
#*******************************************************************************
#*  CHG#    DATE      AUTH   DESCRIPTION                                       *
#*                                                                             *
#*  MP280X  13NOV15   CTS    PAYOUT POLICY CREATION                            *
#*  Q70176  31DES15   CTS    PYOUT  POLICY CHANGES FORCOVERAGE UPDATE SCREEN   *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

INCLUDE "BF9F91-I.s";
INCLUDE "BF8001-P.p";
INCLUDE "BF8002Update-P.p";
INCLUDE "BF8002NB-I.s";
INCLUDE "BF8000NB-O.s";
INCLUDE "BF8000-P.p";
INCLUDE "BF0942-I.s";
INCLUDE "BF0940-O.s";
INCLUDE "BF0940-P.p";
INCLUDE "BF0942-P.p";
INCLUDE "BF8020-P.p";
INCLUDE "BF8022NB-I.s";
INCLUDE "BF8020NB-O.s";

PROCESS PayoPolCreate
{

    # Set the values that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_PayoPolCreate;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF9F91-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Set the APP-CTL-NB to indicate this is a New Business policy

    MIR-POL-APPL-CTL-CD = "NB";

    # Pass the Policy Source as default value for Payout Policy
    MIR-POL-CNVR-TYP-CD = "P1";
    
    MIR-PROD-APP-TYP-CD = "P1";
    MIR-APP-FORM-TYP-ID = "L";

    # Create the new record and retrieve it to get the system defaults

    STEP Create
    {
        USES P-STEP "BF8001-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    SESSION.MIR-POL-ID-BASE = MIR-POL-ID-BASE;
    SESSION.MIR-POL-ID-SFX = MIR-POL-ID-SFX;
#UY3049 CHANGES STARTS
    IF  MIR-PAYO-CHK-IND == "Y"
    {
       MIR-STR3-PAYO-IND ="Y";
       MIR-10-POL-ID = MIR-POL-ID-BASE + MIR-POL-ID-SFX;
    }
#UY3049 CHANGES ENDS
    # Retrieve the record just created

    STEP Retrievepolicy
    {
        USES P-STEP "BF8000-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    # Edit the new record
   
    
    Title = STRINGTABLE.IDS_TITLE_BF8002Update;
    
    STEP Editpolicy
    {
        USES S-STEP "BF8002NB-I";
    }

    IF action == "ACTION_REFRESH"
        BRANCH Editpolicy;

    IF action == "ACTION_BACK"
        EXIT;

    # Update the record who's data was just entered and perform diagnostics.

    STEP Update
    {
        USES P-STEP "BF8002Update-P";
    }

    STEP DiagnosticsOutput
    {
        USES P-STEP "BF8000-P";
        ATTRIBUTES
        {
            Explicit;
            GetMessages = "NO";
        }

        MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
        MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
        MIR-POL-CSTAT-CD <- MIR-POL-CSTAT-CD;
        MIR-POL-NXT-ACTV-DT <- MIR-POL-NXT-ACTV-DT;
        MIR-NXT-ACTV-TYP-CD <- MIR-NXT-ACTV-TYP-CD;
        MIR-POL-APP-CMPLT-DT <- MIR-POL-APP-CMPLT-DT;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Editpolicy;

    # Display the output of the update process

    ButtonBar="AppButtonBar";

    STEP Output
    {
        USES S-STEP "BF8000NB-O";
    }

    IF action == "ACTION_PREVIOUS"
    {
        BRANCH Editpolicy;
    }
        
    # Enter the key(s) for the value that you'd like to create

    # Retrieve the record for coverage update
    
    MIR-GLOB-CRCY-CD= "JP";
    MIR-CVG-NUM= "01";
#UY3049 CHANGES STARTS
    IF  MIR-PAYO-CHK-IND == "Y"
    {
       MIR-STR3-PAYO-IND ="Y";
       MIR-10-POL-ID = MIR-POL-ID-BASE + MIR-POL-ID-SFX;
    }
#UY3049 CHANGES ENDS
    STEP Retrievecvg
    {
       USES P-STEP "BF8020-P";
    }

    IF LSIR-RETURN-CD != "00"
       BRANCH Output;

    Title = STRINGTABLE.IDS_TITLE_BF8022Update;

    # Q70176 CHANGES STARTS HERE
    MIR-PLAN-LIST-CD = "F";
    # Q70176 CHANGES ENDS HERE  
    
    STEP Editcvg
    {   
       USES S-STEP "BF8022NB-I";
    }
      
    IF action == "ACTION_REFRESH"
    {
       BRANCH Editcvg;
    }

    IF action == "ACTION_PREVIOUS"
    {
       BRANCH Retrievepolicy; 
    }
  
    STEP Updatecvg
    {
       USES P-STEP "BF8022Update-P";
    }
  
    STEP DiagnosticsOutput1
    {
        USES P-STEP "BF8020-P";
        ATTRIBUTES
        {
            Explicit;
            GetMessages = "NO";
        }
  
        MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
        MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
        MIR-CVG-NUM -> MIR-CVG-NUM;
        MIR-CVG-CSTAT-CD <- MIR-CVG-CSTAT-CD;
        MIR-CVG-AD-XPRY-DT <- MIR-CVG-AD-XPRY-DT;
        MIR-CVG-WP-XPRY-DT <- MIR-CVG-WP-XPRY-DT;
        MIR-CVG-CNVR-XPRY-DT <- MIR-CVG-CNVR-XPRY-DT;
        MIR-DV-INSRD-CLI-NM <- MIR-DV-INSRD-CLI-NM;
        MIR-POL-MPREM-AMT <- MIR-POL-MPREM-AMT;
        MIR-POL-PD-TO-DT-NUM <- MIR-POL-PD-TO-DT-NUM;
        MIR-POL-CVG-REC-CTR <- MIR-POL-CVG-REC-CTR;
        MIR-POL-CSTAT-CD <- MIR-POL-CSTAT-CD;
        MIR-POL-BILL-MODE-CD <- MIR-POL-BILL-MODE-CD;
        MIR-CVG-CSN-REC-CTR <- MIR-CVG-CSN-REC-CTR;
    }
  
    IF LSIR-RETURN-CD != "00"
       BRANCH Editcvg;
      
    STEP Output1
    {
       USES S-STEP "BF8020NB-O";    
    }

    IF action == "ACTION_PREVIOUS"
    {
       BRANCH Editcvg;
    }
              
    # Retrieve the record 
    Title = STRINGTABLE.IDS_TITLE_BF0942Update;
    
    MIR-POL-PAYO-NUM = "00001";
#UY3049 CHANGES STARTS
    IF  MIR-PAYO-CHK-IND == "Y"
    {
       MIR-STR3-PAYO-IND ="Y";
       MIR-10-POL-ID = MIR-POL-ID-BASE + MIR-POL-ID-SFX;
    }  
#UY3049 CHANGES ENDS
    STEP Retrievepayoupdt
    {
        USES P-STEP "BF0940-P";
        "Y" -> MIR-DV-PAYO-UPDT-IND;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Output1;
           
    STEP Edit
    {
       USES S-STEP "BF0942-I";
       "0" -> index;
    }

    IF action == "ACTION_PREVIOUS"
    {
        BRANCH Retrievecvg;       
    }

    #  If no fund was selected from the list to be the Source Fund, 
    #  skip this step.

    IF index == "0"
        BRANCH Update2;



    # Select the source fund from the list of funds and move the information from 
    # the table into the Source Coverage and Fund

    MIR-CVG-NUM = MIR-DEST-CVG-NUM-T[index];
    MIR-FND-ID = MIR-DEST-FND-ID-T[index];

    # Blanking out the Allocation Code field will cause the entire row to be deleted.
    # Blank out any allocation amount to avoid confusion on totals.

    MIR-CDI-ALLOC-AMT-T[index] = blank;
    MIR-CDI-ALLOC-CD-T[index] = blank;


    # Update the record who's data was just entered.

    STEP Update2
    {
        USES P-STEP "BF0942-P";
    }

    IF LSIR-RETURN-CD != "00"        
        BRANCH Edit;

    # Display the output of the update process
    
    ButtonBar = "ButtonBarOK";

    STEP Output2
    {
        USES S-STEP "BF0940-O";
    }
}

