# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:34 PM EDT

#*******************************************************************************
#*  Component:   BF1054-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01CL06  KRW      Designate Beneficiary by Insured                          *
#*  B00050  DPK      Removed Mandatory for Insured Client Id and added         *
#*                   Insured Client Name to List display                       *
#*  B00205  BMB      Remove CVG fields from display - this value will be 00    *
#*  B00310  WBP      Added Insured Client Id to the List Display               *
#*  01CL06  EKM      Remove DefaultSession variable from MIR-INSRD-CLI-ID      *
#*  NWLANR  CTS      Add Annuity Period Field                                  *
#*  MP332B  CTS      XML Changes for Money Laundering                          *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*******************************************************************************

S-STEP BF1054-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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

#UY3004 CHANGES START
    INOUT Dispolval
    {
        SType = "Hidden";
    }

    INOUT Dissfxval
    {
        SType = "Hidden";
    }
#UY3004 CHANGES END

    INOUT MIR-BNFY-SEQ-NUM
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-INSRD-CLI-ID
    {
        Key;
        Length = "10";
        SType = "Text";
        Label = "Insured's Client Id";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Mandatory;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-BNFY-DESGNT-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "BNFY-DESGNT-CD";
        SType = "Text";
        Label = "Designation";
        Index = "1";
    }

    IN MIR-BNFY-NM-T[12]
    {
        DisplayOnly;
        #TLB041 CHANGES START HERE
        #Length = "54";
        Length = "100";	
	#TLB041 CHANGES END HERE
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Beneficiary's Name";
        Index = "1";
    }

    IN MIR-BNFY-PRCDS-PCT-T[12]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table12";
        SType = "Percent";
        Label = "Percentage";
        Index = "1";
    }

    IN MIR-BNFY-REL-INSRD-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "BTOI";
        SType = "Text";
        Label = "Relation to Insured";
        Index = "1";
    }

    IN MIR-BNFY-SEQ-NUM-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-BNFY-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "BNFY-TYP-CD";
        Link;
        SType = "Text";
        Label = "Beneficiary Type";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-CLI-ID-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-INSRD-CLI-NM-T[12]
    {
        DisplayOnly;
        Length = "54";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Insured Client's Name";
        Index = "1";
    }

    IN MIR-INSRD-CLI-ID-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Insured Client's Id";
        Index = "1";
    }

#* NWLANR Changes Start Here

    IN MIR-BNFY-ANTY-PERI-CD-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";    
        CodeSource = "DataModel";
        CodeType = "BNFY-ANTY-PERI-CD";
        SType = "Text";
        Label = "Annuity Period";
        Index = "1";
    }
    
#* NWLANR Changes End Here    

#* MP332B Changes Start Here

    IN MIR-BNFY-SEX-CD-T[12]
    {
         DisplayOnly;
         Length = "1";
         FieldGroup = "Table12";
         CodeSource = "DataModel";
         CodeType = "BNFY-SEX-CD";
         SType = "Text";
         Label = "Beneficiary's Sex Code";
         Index = "1";
    }
   
    IN MIR-BNFY-BTH-DT-T[12]
    {
           DisplayOnly;
           Length = "10";
           FieldGroup = "Table12"; 
           SType = "Date";
           Label = "Beneficiary's Date Of Birth";
           Index = "1";
    }

#* MP332B Changes End Here

}

