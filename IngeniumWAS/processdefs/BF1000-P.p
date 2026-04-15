# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF1000-P.p                                                    *
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

P-STEP BF1000-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1000";
        BusinessFunctionName = "Client Inquiry - General";
        BusinessFunctionType = "General";
        MirName = "CCWM5050";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    OUT MIR-CLI-ADDR-LN-1-TXT
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-CLI-ADDR-LN-1-TXT-2
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address 1";
    }

    OUT MIR-CLI-ADDR-LN-2-TXT
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address 2";
    }

    OUT MIR-CLI-ADDR-LN-2-TXT-2
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address 2";
    }

    OUT MIR-CLI-ADDR-LN-3-TXT
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address 3";
    }

    OUT MIR-CLI-ADDR-ADDL-TXT
    {
        MixedCase;
        Length = "60";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Additional Information";
    }

    OUT MIR-CLI-ADDR-LN-3-TXT-2
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address 3";
    }

   # removed for P00768 
    
   #OUT MIR-CLI-ADDR-ADDL-TXT-2
   #{
   #    MixedCase;
   #    Length = "60";
   #    DBTableName = "TCLIA";
   #    SType = "Text";
   #    Label = "Additional Information";
   #}

    OUT MIR-CLI-ADDR-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Status";
    }

    OUT MIR-CLI-ADDR-STAT-CD-2
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Status";
    }

    OUT MIR-CLI-ADDR-TYP-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Address Type";
        Index = "1";
    }

    OUT MIR-CLI-AGE-PROOF-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Proof of age submitted";
    }

    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }

    OUT MIR-CLI-CLAS-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "CLCD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Classification";
    }

    OUT MIR-CLI-CNTCT-ID-TXT
    {
        Length = "12";
        DBTableName = "TCLIC";
        SType = "Text";
        Label = "Home Phone";
    }

    OUT MIR-CLI-CNTCT-ID-TXT-2
    {
        Length = "12";
        DBTableName = "TCLIC";
        SType = "Text";
        Label = "Business Phone";
    }

    OUT MIR-CLI-ADDR-CNTCT-TXT
    {
        Length = "50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Phone Number";
    }

   # removed for P00768 
  
   #OUT MIR-CLI-JP-ADDR-CD
   #{
   #    Length = "11";
   #    DBTableName = "TCLIA";
   #    SType = "Text";
   #    Label = "Address Code";
   #}
   #
   #OUT MIR-CLI-JP-ADDR-CD-2
   #{
   #    Length = "11";
   #    DBTableName = "TCLIA";
   #    SType = "Text";
   #    Label = "Address Code";
   #}

    OUT MIR-CLI-LANG-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Correspondence Language";
    }

    OUT MIR-CLI-OCCP-CLAS-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Occupation Class";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-CLI-SMKR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Smoker";
    }

    OUT MIR-CLI-STMT-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Statement Date";
    }

    OUT MIR-CLI-SUSP-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TCLI";
        SType = "Currency";
        Label = "Suspense Amount";
    }

    OUT MIR-CLI-TAX-ID
    {
        Length = "9";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    OUT MIR-CLI-TXEMP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-TXEMP-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Exempt";
    }

    OUT MIR-CVG-CSTAT-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-CVG-ISS-EFF-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-CVG-SPND-CSTAT-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Suspended Coverage Status";
        Index = "1";
    }

    OUT MIR-DV-CLI-ADDR-LN-4-TXT
    {
        Length = "35";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-DV-CLI-ADDR-LN-4-TXT-2
    {
        Length = "35";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Address 4";
    }

    OUT MIR-DV-CLI-ADDR-LN-5-TXT
    {
        Length = "35";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-DV-CLI-ADDR-LN-5-TXT-2
    {
        Length = "35";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Address 5";
    }

    OUT MIR-DV-CLI-ADDR-LN-6-TXT
    {
        Length = "35";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-DV-CLI-ADDR-LN-6-TXT-2
    {
        Length = "35";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Address 5";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        #TLB041 CHANGES START HERE 
        #Length = "75";
        Length = "100";
        #TLB041 CHANGES END HERE
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-OWN-CLI-NM-2
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name 2";
    }

    OUT MIR-OCCP-ID
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Occupation";
    }

    OUT MIR-POL-CLI-REL-SUB-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-SUB-CD";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Policy / Client Relationship Type (2)";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE-T[12]
    {
        Length = "9";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-POL-SPND-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Suspend Status";
        Index = "1";
    }

    OUT MIR-REL-DESC-TXT-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        DBTableName = "TRL";
        SType = "Text";
        Label = "Policy / Client Relationship Type";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

