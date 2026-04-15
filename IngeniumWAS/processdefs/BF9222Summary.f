#*******************************************************************************
#*  Component:   BF9222Summary.f                                               *
#*  Description:   UL Medical Claim Summary Sheet Display                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* EN0003888 CTS   INITIAL VERSION                                             *
#*  MP300C  CTS      IN UL MEDICAL CLAIM SUMMARY SCREEN WE ARE NOT DISPLAYING  *
#*                   BLANK POL_ID AS PART OF ETC.LOGIC IS PRESENT IN WHILE LOOP*
#*******************************************************************************

INCLUDE "BF9222-I.s";
INCLUDE "BF9222-P.p";
INCLUDE "BF9222-O.s";


PROCESS BF9222Summary
{
    Title = STRINGTABLE.IDS_TITLE_BF9222Summary;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    FocusFrame = "contentFrame";
    FocusField = "MIR-CLM-ID";

    # Display the Screen to input the Master Claim ID

    STEP KeyFields-S
    {
        USES S-STEP "BF9222-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH KeyFields-S;



    # Display Summary Sheet                

    STEP Retrieve
    {
        USES P-STEP "BF9222-P";
    }

    IF LSIR-RETURN-CD != "00" 
        BRANCH KeyFields-S;
      
        index1 = 1;
        index2 = 1;
        WHILE (index1 <= 50)
        {
           IF  MIR-POL-ID2-T[index1] != ""
             {      
                MIR-SCRN-POL-ID-T[index2] = MIR-POL-ID2-T[index1];
                MIR-SCRN-PRE-LCD-CHK-IND-T[index2] = MIR-PRE-LCD-CHK-IND-T[index1];
                index2 = index2 +1;
                index1 = index1 +1;
             }
             index1 = index1 +1;
          }        

    MIR-POL-ID1-T[1] = SUBSTRING (MIR-POL-ID1-T[1],1,7);    
    MIR-POL-ID1-T[2] = SUBSTRING (MIR-POL-ID1-T[2],1,7);
    MIR-POL-ID1-T[3] = SUBSTRING (MIR-POL-ID1-T[3],1,7);
    MIR-POL-ID1-T[4] = SUBSTRING (MIR-POL-ID1-T[4],1,7);    
    MIR-POL-ID1-T[5] = SUBSTRING (MIR-POL-ID1-T[5],1,7);
    MIR-POL-ID1-T[6] = SUBSTRING (MIR-POL-ID1-T[6],1,7);
    MIR-POL-ID1-T[7] = SUBSTRING (MIR-POL-ID1-T[7],1,7);    
    MIR-POL-ID1-T[8] = SUBSTRING (MIR-POL-ID1-T[8],1,7);
    MIR-POL-ID1-T[9] = SUBSTRING (MIR-POL-ID1-T[9],1,7);    
    MIR-POL-ID1-T[10] = SUBSTRING (MIR-POL-ID1-T[10],1,7);
    MIR-POL-ID1-T[11] = SUBSTRING (MIR-POL-ID1-T[11],1,7);
    MIR-POL-ID1-T[12] = SUBSTRING (MIR-POL-ID1-T[12],1,7);    
    MIR-POL-ID1-T[13] = SUBSTRING (MIR-POL-ID1-T[13],1,7);
    MIR-POL-ID1-T[14] = SUBSTRING (MIR-POL-ID1-T[14],1,7);
    MIR-POL-ID1-T[15] = SUBSTRING (MIR-POL-ID1-T[15],1,7);    
    MIR-POL-ID1-T[16] = SUBSTRING (MIR-POL-ID1-T[16],1,7); 
    MIR-POL-ID1-T[17] = SUBSTRING (MIR-POL-ID1-T[17],1,7);    
    MIR-POL-ID1-T[18] = SUBSTRING (MIR-POL-ID1-T[18],1,7);
    MIR-POL-ID1-T[19] = SUBSTRING (MIR-POL-ID1-T[19],1,7);
    MIR-POL-ID1-T[20] = SUBSTRING (MIR-POL-ID1-T[20],1,7);    
    MIR-POL-ID1-T[21] = SUBSTRING (MIR-POL-ID1-T[21],1,7);
    MIR-POL-ID1-T[22] = SUBSTRING (MIR-POL-ID1-T[22],1,7);
    MIR-POL-ID1-T[23] = SUBSTRING (MIR-POL-ID1-T[23],1,7);    
    MIR-POL-ID1-T[24] = SUBSTRING (MIR-POL-ID1-T[24],1,7);
    MIR-POL-ID1-T[25] = SUBSTRING (MIR-POL-ID1-T[25],1,7);    
    MIR-POL-ID1-T[26] = SUBSTRING (MIR-POL-ID1-T[26],1,7);
    MIR-POL-ID1-T[27] = SUBSTRING (MIR-POL-ID1-T[27],1,7);
    MIR-POL-ID1-T[28] = SUBSTRING (MIR-POL-ID1-T[28],1,7);    
    MIR-POL-ID1-T[29] = SUBSTRING (MIR-POL-ID1-T[29],1,7);
    MIR-POL-ID1-T[30] = SUBSTRING (MIR-POL-ID1-T[30],1,7);     

    MIR-POL-ID2-T[1] = SUBSTRING (MIR-POL-ID2-T[1],1,7);    
    MIR-POL-ID2-T[2] = SUBSTRING (MIR-POL-ID2-T[2],1,7);
    MIR-POL-ID2-T[3] = SUBSTRING (MIR-POL-ID2-T[3],1,7);
    MIR-POL-ID2-T[4] = SUBSTRING (MIR-POL-ID2-T[4],1,7);    
    MIR-POL-ID2-T[5] = SUBSTRING (MIR-POL-ID2-T[5],1,7);
    MIR-POL-ID2-T[6] = SUBSTRING (MIR-POL-ID2-T[6],1,7);
    MIR-POL-ID2-T[7] = SUBSTRING (MIR-POL-ID2-T[7],1,7);    
    MIR-POL-ID2-T[8] = SUBSTRING (MIR-POL-ID2-T[8],1,7);
    MIR-POL-ID2-T[9] = SUBSTRING (MIR-POL-ID2-T[9],1,7);    
    MIR-POL-ID2-T[10] = SUBSTRING (MIR-POL-ID2-T[10],1,7);
    MIR-POL-ID2-T[11] = SUBSTRING (MIR-POL-ID2-T[11],1,7);
    MIR-POL-ID2-T[12] = SUBSTRING (MIR-POL-ID2-T[12],1,7);    
    MIR-POL-ID2-T[13] = SUBSTRING (MIR-POL-ID2-T[13],1,7);
    MIR-POL-ID2-T[14] = SUBSTRING (MIR-POL-ID2-T[14],1,7);
    MIR-POL-ID2-T[15] = SUBSTRING (MIR-POL-ID2-T[15],1,7);    
    MIR-POL-ID2-T[16] = SUBSTRING (MIR-POL-ID2-T[16],1,7); 
    MIR-POL-ID2-T[17] = SUBSTRING (MIR-POL-ID2-T[17],1,7);    
    MIR-POL-ID2-T[18] = SUBSTRING (MIR-POL-ID2-T[18],1,7);
    MIR-POL-ID2-T[19] = SUBSTRING (MIR-POL-ID2-T[19],1,7);
    MIR-POL-ID2-T[20] = SUBSTRING (MIR-POL-ID2-T[20],1,7);    
    MIR-POL-ID2-T[21] = SUBSTRING (MIR-POL-ID2-T[21],1,7);
    MIR-POL-ID2-T[22] = SUBSTRING (MIR-POL-ID2-T[22],1,7);
    MIR-POL-ID2-T[23] = SUBSTRING (MIR-POL-ID2-T[23],1,7);    
    MIR-POL-ID2-T[24] = SUBSTRING (MIR-POL-ID2-T[24],1,7);
    MIR-POL-ID2-T[25] = SUBSTRING (MIR-POL-ID2-T[25],1,7);    
    MIR-POL-ID2-T[26] = SUBSTRING (MIR-POL-ID2-T[26],1,7);
    MIR-POL-ID2-T[27] = SUBSTRING (MIR-POL-ID2-T[27],1,7);
    MIR-POL-ID2-T[28] = SUBSTRING (MIR-POL-ID2-T[28],1,7);    
    MIR-POL-ID2-T[29] = SUBSTRING (MIR-POL-ID2-T[29],1,7);
    MIR-POL-ID2-T[30] = SUBSTRING (MIR-POL-ID2-T[30],1,7); 
    
    MIR-SCRN-POL-ID[1] = SUBSTRING (MIR-SCRN-POL-ID-T[1],1,7);
    MIR-SCRN-POL-ID[2] = SUBSTRING (MIR-SCRN-POL-ID-T[2],1,7);
    MIR-SCRN-POL-ID[3] = SUBSTRING (MIR-SCRN-POL-ID-T[3],1,7); 
    MIR-SCRN-POL-ID[4] = SUBSTRING (MIR-SCRN-POL-ID-T[4],1,7);
    MIR-SCRN-POL-ID[5] = SUBSTRING (MIR-SCRN-POL-ID-T[5],1,7);
    MIR-SCRN-POL-ID[6] = SUBSTRING (MIR-SCRN-POL-ID-T[6],1,7); 
    MIR-SCRN-POL-ID[7] = SUBSTRING (MIR-SCRN-POL-ID-T[7],1,7);
    MIR-SCRN-POL-ID[8] = SUBSTRING (MIR-SCRN-POL-ID-T[8],1,7);
    MIR-SCRN-POL-ID[9] = SUBSTRING (MIR-SCRN-POL-ID-T[9],1,7); 
    MIR-SCRN-POL-ID[10] = SUBSTRING (MIR-SCRN-POL-ID-T[10],1,7);   
    MIR-SCRN-POL-ID[11] = SUBSTRING (MIR-SCRN-POL-ID-T[11],1,7);
    MIR-SCRN-POL-ID[12] = SUBSTRING (MIR-SCRN-POL-ID-T[12],1,7);
    MIR-SCRN-POL-ID[13] = SUBSTRING (MIR-SCRN-POL-ID-T[13],1,7); 
    MIR-SCRN-POL-ID[14] = SUBSTRING (MIR-SCRN-POL-ID-T[14],1,7);
    MIR-SCRN-POL-ID[15] = SUBSTRING (MIR-SCRN-POL-ID-T[15],1,7);
    MIR-SCRN-POL-ID[16] = SUBSTRING (MIR-SCRN-POL-ID-T[16],1,7); 
    MIR-SCRN-POL-ID[17] = SUBSTRING (MIR-SCRN-POL-ID-T[17],1,7);
    MIR-SCRN-POL-ID[18] = SUBSTRING (MIR-SCRN-POL-ID-T[18],1,7);
    MIR-SCRN-POL-ID[19] = SUBSTRING (MIR-SCRN-POL-ID-T[19],1,7); 
    MIR-SCRN-POL-ID[20] = SUBSTRING (MIR-SCRN-POL-ID-T[20],1,7);  
    MIR-SCRN-POL-ID[21] = SUBSTRING (MIR-SCRN-POL-ID-T[21],1,7);   
    MIR-SCRN-POL-ID[22] = SUBSTRING (MIR-SCRN-POL-ID-T[22],1,7);
    MIR-SCRN-POL-ID[23] = SUBSTRING (MIR-SCRN-POL-ID-T[23],1,7);
    MIR-SCRN-POL-ID[24] = SUBSTRING (MIR-SCRN-POL-ID-T[24],1,7); 
    MIR-SCRN-POL-ID[25] = SUBSTRING (MIR-SCRN-POL-ID-T[25],1,7);
    MIR-SCRN-POL-ID[26] = SUBSTRING (MIR-SCRN-POL-ID-T[26],1,7);
    MIR-SCRN-POL-ID[27] = SUBSTRING (MIR-SCRN-POL-ID-T[27],1,7); 
    MIR-SCRN-POL-ID[28] = SUBSTRING (MIR-SCRN-POL-ID-T[28],1,7);
    MIR-SCRN-POL-ID[29] = SUBSTRING (MIR-SCRN-POL-ID-T[29],1,7);
    MIR-SCRN-POL-ID[30] = SUBSTRING (MIR-SCRN-POL-ID-T[30],1,7);    
     
    
    Title = STRINGTABLE.IDS_TITLE_BF9222Summary;
    STEP DisplayList
    {
        USES S-STEP "BF9222-O";
    }

    IF action == "ACTION_BACK"
        EXIT;
  

}