# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1000-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P00768  CLB      Remove fields made obsolete by 01AD05:                    *
#*                   MIR-CLI-ADDR-ADDL-TXT-2                                   *
#*                   MIR-CLI-JP-ADDR-CD                                        *
#*                   MIR-CLI-JP-ADDR-CD-2, to eliminate error messages.        *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*******************************************************************************

S-STEP BF1000-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "General";
        Type = "Output";
        DelEmptyRows;
        FocusField = "moreButton";
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

    INOUT MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }


    #LOC014 increased length 29 to 35

    IN MIR-CLI-ADDR-LN-1-TXT
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-CLI-ADDR-LN-1-TXT-2
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address 1";
    }

    IN MIR-CLI-ADDR-LN-2-TXT
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address 2";
    }

    IN MIR-CLI-ADDR-LN-2-TXT-2
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address 2";
    }

    IN MIR-CLI-ADDR-LN-3-TXT
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address 3";
    }

    IN MIR-CLI-ADDR-LN-3-TXT-2
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address 3";
    }

    IN MIR-CLI-ADDR-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Text";
        Label = "Address Status";
    }

    IN MIR-CLI-ADDR-STAT-CD-2
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Text";
        Label = "Address Status";
    }

    IN MIR-CLI-ADDR-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Address Type";
        Index = "1";
    }

    IN MIR-CLI-AGE-PROOF-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Proof of age submitted";
    }

    IN MIR-CLI-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }

    IN MIR-CLI-CLAS-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "CLCD";
        SType = "Text";
        Label = "Classification";
    }

    IN MIR-CLI-CNTCT-ID-TXT
    {
        DisplayOnly;
        Length = "12";
        SType = "Text";
        Label = "Home Phone";
    }

    IN MIR-CLI-CNTCT-ID-TXT-2
    {
        DisplayOnly;
        Length = "12";
        SType = "Text";
        Label = "Business Phone";
    }

  # removed for P00768
   
  # IN MIR-CLI-JP-ADDR-CD
  # {
  #     DisplayOnly;
  #     Length = "11";
  #     SType = "Text";
  #     Label = "Address Code";
  # }
  #
  # IN MIR-CLI-JP-ADDR-CD-2
  # {
  #     DisplayOnly;
  #     Length = "11";
  #     SType = "Text";
  #     Label = "Address Code";
  # }

    IN MIR-CLI-LANG-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Correspondence Language";
    }

    IN MIR-CLI-OCCP-CLAS-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        SType = "Text";
        Label = "Occupation Class";
    }

    IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-CLI-SMKR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        SType = "Text";
        Label = "Smoker";
    }

    IN MIR-CLI-STMT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Statement Date";
    }

    IN MIR-CLI-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Suspense Amount";
    }

    IN MIR-CLI-TAX-ID
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    IN MIR-CLI-TXEMP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-TXEMP-CD";
        SType = "Text";
        Label = "Tax Exempt";
    }

    IN MIR-CVG-CSTAT-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-ISS-EFF-DT-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-CVG-SPND-CSTAT-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Suspended Coverage Status";
        Index = "1";
    }


    #LOC014 increased length 29 to 35

    IN MIR-DV-CLI-ADDR-LN-4-TXT
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-DV-CLI-ADDR-LN-4-TXT-2
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address 4";
    }

    IN MIR-DV-CLI-ADDR-LN-5-TXT
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-DV-CLI-ADDR-LN-5-TXT-2
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address 5";
    }


    #added for LOC014

    IN MIR-DV-CLI-ADDR-LN-6-TXT
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-DV-CLI-ADDR-LN-6-TXT-2
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address 5";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        #TLB041 CHANGES START HERE  
        #Length = "75";
        Length = "100";
        #TLB041 CHANGES END HERE
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-OWN-CLI-NM-2
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name 2";
    }

    IN MIR-OCCP-ID
    {
        DisplayOnly;
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        SType = "Text";
        Label = "Occupation";
    }

    IN MIR-POL-CLI-REL-SUB-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-SUB-CD";
        SType = "Text";
        Label = "Policy / Client Relationship Type (2)";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[12]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-POL-SPND-IND-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Indicator";
        Label = "Suspend Status";
        Index = "1";
    }

    IN MIR-REL-DESC-TXT-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Policy / Client Relationship Type";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    # added for func LOC006

    IN MIR-CLI-ADDR-CNTCT-TXT
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Phone Number";
    }

    #added for LOC014

    IN MIR-CLI-ADDR-ADDL-TXT
    {
        DisplayOnly;
        Length = "60";
        SType = "Text";
        Label = "Additional Information";
    }

  # removed for P00768

  # IN MIR-CLI-ADDR-ADDL-TXT
  # {
  #     DisplayOnly;
  #     Length = "60";
  #     SType = "Text";
  #     Label = "Additional Information";
  # }

}

