#*******************************************************************************
#*  Component:   BF9C20-O.s                                                    *
#*  Description: TD Reinstatement Information Inquiry Screen                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLGLR  CTS      Intial Version                                            *
#*  C13892  CTS      ADDED LAPSE DATE                                          *
#*  UYS033  CTS      ADDED NEW FIELD OVERLOAN REPAYMENT DUE DATE               *
#*******************************************************************************

S-STEP BF9C20-O
{
ATTRIBUTES
{
BusinessFunctionType = "Retrieve";
DelEmptyRows;
FocusField = "OKButton";
FocusFrame = "ButtonFrame";
Type = "Output";
}

IN Title;

IN TitleBar;
IN TitleBarSize;

IN ButtonBar;
IN ButtonBarSize;

IN MessageFrame;
IN MessageFrameSize;

OUT action
{
SType="Hidden";
}

     IN MIR-POL-ID-BASE 
     {
        Key;
        DisplayOnly;
        Label = "Policy ID";
        Length = "9";
        SType = "Text";
     }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

     IN MIR-PRCES-DT 
     {
        Key;
        DisplayOnly;
        Label = "Processing Date";
        Length = "10";
        SType = "Date";
     }

     IN MIR-INFO-STAT-CD
     {
        CodeSource = "EDIT";
        CodeType = "ISTAT";
        DisplayOnly;
        Label = "Information status";
        Length = "1";
        SType = "Text";
     }

    #CHANGES FOR UYS033 STARTS
    IN  MIR-LOAN-REPAY-DUE-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Overloan Repayment Due Date";
    }
    #CHANGES FOR UYS033 ENDS
    
     IN MIR-INSRD-CLI-ID 
     {
        DisplayOnly;
        Label = "Insured Client Number";
        Length = "10";
        SType = "Text";
     }

     IN MIR-DV-INSRD-NM 
     {
        DisplayOnly;
        Label = "Insured Name";
        Length = "50";
        SType = "Text";
     }
     
     IN MIR-SELF-DSCLSRE-DT 
     {
        DisplayOnly;
        Label = "Self Disclosure Date";
        Length = "10";
        SType = "Date";
     }
     
     IN MIR-APCHD-LOC-CD 
     {
        CodeSource = "EDIT";
        CodeType = "APLOC";
        DisplayOnly;
        Label = "Approached Loaction";
        Length = "1";
        SType = "Text";
     }
     
     IN MIR-UWG-RSLT-CD 
     {
        CodeSource = "EDIT";
        CodeType = "UWRES";
        DisplayOnly;
        Label = "Underwriting Result";
        Length = "1";
        SType = "Text";
     }
     
     IN MIR-EXCL-INFO-TXT 
     {
        DisplayOnly;
        Label = "Exclusion Information";
        Length = "30";
        SType = "Text";
     }
     
     IN MIR-UWG-DT 
     {
        DisplayOnly;
        Label = "Underwriting Date";
        Length = "10";
        SType = "Date";
     }
     
     IN MIR-OVRDU-PREM-AMT 
     {
        DisplayOnly;
        Label = "Delinquent Premium";
        Length = "15";
        SType = "Currency";
     }
     
     IN MIR-OVRDU-INT-AMT 
     {
        DisplayOnly;
        Label = "Delinquent Interest";
        Length = "15";
        SType = "Currency";
     }
     
     IN MIR-TOT-REQIR-AMT 
     {
        DisplayOnly;
        Label = "Total Amount to be paid";
        Length = "15";
        SType = "Currency";
     }
     
     IN MIR-PREM-DUE-MO-NUM 
     {
        DisplayOnly;
        Label = "Premium Due Month";
        Length = "07";
        SType = "Text";
     }
     
     IN MIR-PREM-DUE-QTY
     {
        DisplayOnly;
        Label = "Number of Times";
        Length = "03";
        SType = "Number";
     }
     
# NWLLR3 CHANGES STARTS HERE     
#     IN MIR-DV-EXP-DT 
     IN MIR-REINST-XPRY-DT
     {
        DisplayOnly;
        Label = "Expiry Date";
        Length = "10";
        SType = "Date";
     }
# NWLLR3 CHANGES ENDS HERE     

     IN MIR-REINST-DT 
     {
        DisplayOnly;
        Label = "Reinstatement Date";
        Length = "10";
        SType = "Date";
     }
     
# C13892 CHANGES STARTS HERE     
     IN MIR-LAPS-DT
     {
        DisplayOnly;
        Label = "Lapse Date";
        Length = "10";
        SType = "Date";
     }
# C13892 CHANGES ENDS HERE
}
     