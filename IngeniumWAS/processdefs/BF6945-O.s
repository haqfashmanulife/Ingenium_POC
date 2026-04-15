# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF6945-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01CL06  BMB      Add Insured CLI-ID and name, remove Coverage Number       *
#*  B00310  WBP      Add Insured Client Id to Selection Area                   *
#*  01CL06  EKM      Remove DefaultSession variable from MIR-INSRD-CLI-ID      *
#*  MP332B  CTS      XML Changes for Money Laundering                          *
#*                                                                             *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*******************************************************************************

S-STEP BF6945-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Relben";
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

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

    IN MIR-INSRD-CLI-ID 
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Insured Client's ID";
    }

    IN MIR-BNFY-DESGNT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "BNFY-DESGNT-CD";
        SType = "Text";
        Label = "Designation";
        Index = "1";
    }

    IN MIR-BNFY-MINR-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Beneficiary is a minor";
        Index = "1";
    }

    IN MIR-BNFY-NM-T[20]
    {
        DisplayOnly;
        #TLB041 CHANGES START HERE
	#Length = "75";
	Length = "100";
        #TLB041 CHANGES END HERE
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Beneficiary's Name";
        Index = "1";
    }

    IN MIR-BNFY-PRCDS-PCT-T[20]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        SType = "Percent";
        Label = "Percentage";
        Index = "1";
    }

    IN MIR-BNFY-REL-INSRD-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "BTOI";
        SType = "Text";
        Label = "Relation to Insured";
        Index = "1";
    }

    IN MIR-BNFY-SEQ-NUM-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-BNFY-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "BNFY-TYP-CD";
        SType = "Text";
        Label = "Beneficiary Type";
        Index = "1";
    }

    IN MIR-CLI-ID-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-INSRD-CLI-ID-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Insured Client ID";
        Index = "1";
    }
     
    IN MIR-DV-INSRD-NM-T[20]
    {
        DisplayOnly;
        Length = "51";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }
     
    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }
    
    #TDMG24 CHANGES START HERE
            IN MIR-PREM-PMT-CMPLT-IND
            {
                DisplayOnly;
                Length = "1";
                SType = "Indicator";
                Label = "Base Policy Premium Payment Completion";
        
            }    
    #TDMG24 CHANGES END HERE    


    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

#* MP332B Changes Start Here
    
    IN MIR-BNFY-SEX-CD-T[20]
    {
         DisplayOnly;
         Length = "1";
         FieldGroup = "Table20";
         CodeSource = "DataModel";
         CodeType = "BNFY-SEX-CD";
         SType = "Text";
         Label = "Beneficiary's Sex Code";
         Index = "1";
    }
   
    IN MIR-BNFY-BTH-DT-T[20]
    {
           DisplayOnly;
           Length = "10";
           FieldGroup = "Table20"; 
           SType = "Date";
           Label = "Beneficiary's Date Of Birth";
           Index = "1";
    }

#* MP332B Changes End Here


}

