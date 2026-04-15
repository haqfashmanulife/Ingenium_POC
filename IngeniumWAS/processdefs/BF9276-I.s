# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9276-I.s                                                    *
#*  Description: Add Exclusion/Adjustment                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HCL106  HIN/CL   ADJUDICATORS DECISION PART A & B (HCL106A)                 *
#* HCCL05  HIN/CL   Pick-up Facility                                           *
#* RP2CLA  CTS      ADD MULTIPLIER AS PART OF CANCER LUMPSUM                   *
#* BU3283  CTS      CHANGED THE ATTRIBUTE "decimals" TO "Decimals" FOR THE     *
#*                  FIELD MIR-CLBD-MULTR-FCT                                   *
#* MP143F  CTS     CHANGES TO ADD ADVANCED MEDICAL BENEFIT AMOUNT FIELD        * 
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#* UY3023  CTS      MEDICAL CLAIM                                              *
#*******************************************************************************
S-STEP BF9276-I
{
ATTRIBUTES
{
                BusinessFunctionType = "Create";
                Type = "Create";
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

OUT action
{
SType="Hidden";
}

        IN MIR-DV-EXCL-ADJ-IND
        {
                SType="Hidden";
        }


IN MIR-CLM-ID
{
Key;
DisplayOnly;
Length = "8";
                DefaultSession = "MIR-CLM-ID";
SType = "Text";
Label = "Master Claim ID";
}

IN MIR-DV-INS-CLI-NM
{
        Key;
DisplayOnly;
Length = "75";
SType = "Text";
Label = "Insured Name";
}

IN MIR-CLMA-CLM-STAT-CD
{
Key;
DisplayOnly;
Length = "40";
CodeSource = "DataModel";
CodeType = "CLMA-CLM-STAT-CD";
SType = "Text";
Label = "Master Claim Status";
}

IN MIR-CLMA-INSRD-CLI-ID
{
Key;
DisplayOnly;
Length = "10";
SType = "Text";
Label = "Insured Client ID";
}

IN MIR-CLI-BTH-DT
{
Key;
DisplayOnly;
Length = "10";
SType = "Date";
Label = "Date of Birth";
}


IN MIR-CLI-SEX-CD
{
Key;
DisplayOnly;
Length = "40";
CodeSource = "DataModel";
CodeType = "CLI-SEX-CD";
SType = "Text";
Label = "Sex";
}

IN MIR-INS-MORAL-RISK-IND
{
Key;
DisplayOnly;
Length = "1";
SType = "Indicator";
Label = "Insured Moral Risk";
}

IN MIR-CLAIM-NOTE-IND
{
Key;
DisplayOnly;
Length = "1";
SType = "Indicator";
Label = "Claim Note";
}


IN MIR-LIFE-INS-CLM-IND
{
Key;
DisplayOnly;
Length = "1";
SType = "Indicator";
Label = "Life Insurance Claim Involved";
}

IN MIR-BNFT-NM-ID
{
Key;
DisplayOnly;
Length = "40";
CodeSource = "EDIT";
CodeType = "BENNM";
SType = "Text";
Label = "Benefit Name";
}

    IN MIR-SERV-BR-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Servicing Branch";
    }

      IN MIR-PLAN-ID
      {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Rider Name";
  }
    IN MIR-BNFT-STAT-CD
    {
    Key;
    DisplayOnly;
    Length = "4";
    CodeSource = "DataModel";
    CodeType = "CLBN-BNFT-STAT-CD";
    SType = "Text";
    Label = "Benefit Claim Status";
}

    IN MIR-CLMA-ASSOC-CLM-ID
    {
        Key;
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Associated Master Claim";
    }

    IN MIR-CLMA-HIST-CLM-IND
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Historical Claim";
    }

#UYSDMC CHANGES STARTS HERE
    IN MIR-CLMA-USYS-CLM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Unisys Claim";
    }
#UYSDMC CHANGES ENDS HERE
    IN MIR-POL-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
}



    INOUT MIR-EXCL-STRT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Start Date";
    }

    INOUT MIR-EXCL-END-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Start Date";
    }


    INOUT MIR-ADJ-STRT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Start Date";
    }

    INOUT MIR-ADJ-END-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Start Date";
    }

  INOUT MIR-EXCL-REASN-CD
   {
        Length = "40";
        CodeSource = "CSOM4990";
        FilterFields = "1";
        FilterField1 = "MIR-DV-EXCL-ADJ-IND";
        Index = "1";
        SType = "Selection";
        Label = "Exclusion Reason Code";
   }


  INOUT MIR-ADJ-REASN-CD
   {
        Length = "40";
        CodeSource = "CSOM4990";
        FilterFields = "1";
        FilterField1 = "MIR-DV-EXCL-ADJ-IND";
        Index = "1";
        SType = "Selection";
        Label = "Adjustment Reason Code";
   }
   
#*UY3023 CHANGES STARTS

  INOUT MIR-DISAB-ADJ-RAT
   {
        Length = "5";
        Index = "1";
        SType = "Text";
        Label = "(For Disability Benefit) Adjustment Ratio";
   }
   
  INOUT MIR-DISAB-MULTR-FCT
   {
        Length = "3";
        Index = "1";
        SType = "Text";
        Label = "(For Disability Benefit) Adjustment Multiplier";
   }   
#*UY3023 CHANGES ENDS

#*RP2CLA CHANGES START
  INOUT MIR-CLBD-MULTR-FCT
     {
          Length = "7";
#BU3283 CHANGES START          
#         decimals = "1";
          Decimals = "1";
#BU3283 CHANGES END          
          CodeSource = "EDIT";
          CodeType = "MULTR";
          SType = "Selection";
          Label = "Multiplier";
     }
#* RP2CLA CHANGES END
#* MP143F CHANGES START
  INOUT MIR-ADV-MEDIC-BNFT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Advanced Medical Benefit Amount";
    }
#* MP143F CHANGES END

}
