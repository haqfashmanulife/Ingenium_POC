# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:34 PM EDT

#*******************************************************************************
#*  Component:   BF1050-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01Cl06  KRW      Designate beneficiary by Insured                          *
#*  B00205  BMB      Remove CVG fields from display - this value will be 00    *
#*  01CL06  EKM      Remove DefaultSession variable from MIR-INSRD-CLI-ID      *
#*  NWLANR  CTS      Add Annuity Period Field                                  *
#*  MP332B  CTS      XML Changes for Money Laundering                          *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*******************************************************************************

S-STEP BF1050-O
{
    ATTRIBUTES
    {
        Type = "Output";
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

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-BNFY-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-INSRD-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Insured's Client Id";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-BNFY-DESGNT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "BNFY-DESGNT-CD";
        SType = "Text";
        Label = "Designation";
    }

    IN MIR-BNFY-MINR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Beneficiary is a minor";
    }

    IN MIR-BNFY-NM
    {
        DisplayOnly;
        #TLB041 CHANGES START HERE
        #Length = "54";
        Length = "100";
        #TLB041 CHANGES END HERE
        SType = "Text";
        Label = "Beneficiary's Name";
    }

    IN MIR-BNFY-PRCDS-PCT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Percentage";
    }

    IN MIR-BNFY-REL-INSRD-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BTOI";
        SType = "Text";
        Label = "Relation to Insured";
    }

    IN MIR-BNFY-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BNFY-TYP-CD";
        SType = "Text";
        Label = "Beneficiary Type";
    }

    IN MIR-CLI-ADDR-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Address Type";
    }

    IN MIR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number";
    }

#* NWLANR Changes Start Here

    IN MIR-BNFY-ANTY-PERI-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "BNFY-ANTY-PERI-CD";
        SType = "Text";
 	Label = "Annuity Period"; 
    }
    
#* NWLANR Changes End Here

#* MP332B Changes Start Here
    
    IN MIR-BNFY-KA-NM
    {
         DisplayOnly;
         #TLB041 CHANGES START HERE
         #Length = "50";
         Length = "100";	
	 #TLB041 CHANGES END HERE
         SType = "Text";
         Label = "Beneficiary's Kana Name";
    }
 
    IN MIR-BNFY-SEX-CD
    {
         DisplayOnly;
         Length = "1";
         CodeSource = "DataModel";
         CodeType = "BNFY-SEX-CD";
         SType = "Text";
         Label = "Beneficiary's Sex Code";
    }
   
    IN MIR-BNFY-BTH-DT
    {
           DisplayOnly;
           Length = "10";
           SType = "Date";
           Label = "Beneficiary's Date Of Birth";
    }

#* MP332B Changes End Here

}

