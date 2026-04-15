#*******************************************************************************
#*  Component:   BF9B50-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP161N  CTS      Underwriting Guidance Tool                                *
#*  Q10433  CTS      CHANGES FOR RBC COUNT AND PLATELET COUNT                  *
#*  M16139  CTS      CR 39 CHANGES FOR MP161N                                  *
#*******************************************************************************

S-STEP BF9B50-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Input";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    INOUT MIR-PLAN-FAMILY-ID
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "PLAN-FAMILY-ID";
        SType = "Selection";
        Label = "Plan Family";
    }

    INOUT MIR-UW-FORM-ID
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "UW-FORM-ID";
        SType = "Selection";
        Label = "UW Condition";
    }

    INOUT MIR-CLI-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-SEX-CD";
        SType = "Selection";
        Label = "Client Gender";
    }

    INOUT MIR-CLI-AGE
    {
        Length = "4";
        Decimals = "1";
        SType = "Number";
        Label = "Age";
    }

    INOUT MIR-SMOKER-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-ABNM-CD";
        SType = "Selection";
        Label = "Smoking status";
    }

    INOUT MIR-CLI-HT
    {
        Length = "4";
        Decimals = "1";
        SType = "Number";
        Label = "Height";
    }

    INOUT MIR-CLI-WT
    {
        Length = "4";
        Decimals = "1";
        SType = "Number";
        Label = "Weight";
    }

    INOUT MIR-WAIST-CIR
    {
        Length = "4";
        SType = "Number";
        Label = "Abdominal circumference";
    }

    INOUT MIR-EYE-OBSERV-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-OBS-CD";        
        SType = "Selection";
        Label = "Eye Sight Observation";
    }

    INOUT MIR-LFT-EYE-CORR
    {
        Length = "4";
        Decimals = "1";
        SType = "Number";
        Label = "Left Eye Correction";
    }

    INOUT MIR-RHT-EYE-CORR
    {
        Length = "4";
        Decimals = "1";
        SType = "Number";
        Label = "Right Eye Correction";
    }

    INOUT MIR-LFT-EAR-KHZ
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-OBS-CD";         
        SType = "Selection";
        Label = "LeftEarKHZ";
    }

    INOUT MIR-LFT-EAR-4KHZ
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-OBS-CD";         
        SType = "Selection";
        Label = "LeftEar4KHZ";
    }

    INOUT MIR-RHT-EAR-KHZ
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-OBS-CD";
        SType = "Selection";
        Label = "RightEarKHZ";
    }

    INOUT MIR-RHT-EAR-4KHZ
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-OBS-CD";
        SType = "Selection";
        Label = "RightEar4KHZ";
    }

    INOUT MIR-SIST-BP
    {
        Length = "3";
        SType = "Number";
        Label = "BP SystolicBP";
    }

    INOUT MIR-DIAST-BP
    {
        Length = "3";
        SType = "Number";
        Label = "BP DiastolicBP";
    }

    INOUT MIR-URIC-PRO
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-POS-NEG-1-CD"; 
        SType = "Selection";
        Label = "Uric Protein";
    }

    INOUT MIR-URIC-SUG
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-POS-NEG-2-CD";
        SType = "Selection";
        Label = "Urinal Sugar";
    }

    INOUT MIR-URIC-OB
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-POS-NEG-2-CD";
        SType = "Selection";
        Label = "Urinary Occult blood";
    }

    INOUT MIR-HT-VALU
    {
        Length = "4";
        Decimals = "1";
        SType = "Number";
        Label = "Ht (hematocrit)";
    }

    INOUT MIR-HB-CD
    {
        Length = "1";
        CodeSource = "DataModel";
#M16139 CHANGES START
#       CodeType = "UW-OBS-CD";
        CodeType = "UW-OBS-2-CD";
#M16139 CHANGES START         
        SType = "Selection";
        Label = "hemoglobin Observation";
    }

    INOUT MIR-HB-VALU
    {
        Length = "7";
        Decimals = "1";
        SType = "Number";
        Label = "hemoglobin value";
    }

    INOUT MIR-RBC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-OBS-2-CD";        
        SType = "Selection";
        Label = "RBC Observation";
    }

    INOUT MIR-RBC-VALU
    {
#Q10433 CHNAGES START
#       Length = "2";
#       Decimals = "2";
        Length = "3";
#Q10433 CHNAGES END
        SType = "Number";
        Label = "RBC Value";
    }

    INOUT MIR-AST-VALU
    {
        Length = "4";
        SType = "Number";
        Label = "Liver AST value";
    }

    INOUT MIR-AST-MAX
    {
        Length = "4";
        SType = "Number";
        Label = "Liver AST max";
    }

    INOUT MIR-ALT-VALU
    {
        Length = "4";
        SType = "Number";
        Label = "Liver ALT value";
    }

    INOUT MIR-ALT-MAX
    {
        Length = "4";
        SType = "Number";
        Label = "Liver ALT max";
    }

    INOUT MIR-GT-VALU
    {
        Length = "4";
        SType = "Number";
        Label = "Liver Gamma value";
    }    

    INOUT MIR-GT-MAX
    {
        Length = "4";
        SType = "Number";
        Label = "Liver Gamma max";
    }    

    INOUT MIR-TOT-CHOL
    {
        Length = "4";
        SType = "Number";
        Label = "Total cholesterol";
    }    

    INOUT MIR-HDL-CHOL
    {
        Length = "4";
        SType = "Number";
        Label = "HDL cholesterol";
    }    

    INOUT MIR-LDL-CHOL
    {
        Length = "4";
        SType = "Number";
        Label = "LDL cholesterol";
    }    

    INOUT MIR-NEU-LIPID
    {
        Length = "4";
        SType = "Number";
        Label = "Neutral lipid";
    }    

    INOUT MIR-CHST-XRAY-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-OBS-CD";        
        SType = "Selection";
        Label = "Chest X-ray";
    }    

    INOUT MIR-ECG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-OBS-CD";        
        SType = "Selection";
        Label = "ECG";
    }    

    INOUT MIR-STOM-XRAY-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-OBS-CD";        
        SType = "Selection";
        Label = "Stomach X-ray";
    }    

    INOUT MIR-ABD-ECO-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-OBS-CD";        
        SType = "Selection";
        Label = "Abdominal echography";
    }    

    INOUT MIR-FO-BLD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-POS-NEG-3-CD";
        SType = "Selection";
        Label = "Fecal occult blood test ";
    }    

    INOUT MIR-OCU-FUND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-OBS-CD";        
        SType = "Selection";
        Label = "Ocular fundus examination";
    }    

    INOUT MIR-HBA1C-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-BLD-SUG-CD";
        SType = "Selection";
        Label = "Blood sugar code";
    }    

    INOUT MIR-HBA1C-VALU
    {
        Length = "4";
        Decimals = "1";
        SType = "Number";
        Label = "Blood sugar value";
    }    

    INOUT MIR-WHTBC-VALU
    {
        Length = "6";
        SType = "Number";
        Label = "White blood cell count";
    }    

    INOUT MIR-PLT-VALU
    {
#Q10433 CHNAGES START
#       Length = "6";        
        Length = "3";
        Decimals = "1";
#Q10433 CHNAGES END
        SType = "Number";
        Label = "Platelet count";
    }    

    INOUT MIR-HBS-ANT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-POS-NEG-4-CD";
        SType = "Selection";
        Label = "HBs antigen";
    }    

    INOUT MIR-HCV-ANT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-POS-NEG-4-CD";
        SType = "Selection";
        Label = "HCV antibody";
    }    

    INOUT MIR-OTHR-ABNM-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-ABNM-CD";
        SType = "Selection";
        Label = "Other abnormality";
    }    
   
}