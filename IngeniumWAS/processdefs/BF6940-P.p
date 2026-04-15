# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6940-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD05  BMB      Remove JP-ADDR-CD                                         *
#*  B00189  DPK      Removed Owner's Relationship to Insured                   *
#*  B00222  BMB      Fix label for Samakata-bu                                 *
#*                   removed MIR-CLI-ADDR-ADDL-TXT-2,                          *
#*                           MIR-CLI-ADDR-CHNG-DT-2,                           *
#*                           MIR-CLI-ADDR-STAT-CD-2                            *
#*  B10590  YUC      DISPLAY KANJI NAME   09AUG02  Add KANJI field             *
#*  P00577  TC       ADD RELATIONSHIP TYPE CODE                                *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*******************************************************************************

P-STEP BF6940-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6940";
        BusinessFunctionName = "Policy Inquiry - Policy Relationship";
        BusinessFunctionType = "Relpol";
        MirName = "CCWM6940";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CLI-ADDR-CHNG-DT
    {
        Length = "10";
        DBTableName = "TCLIA";
        SType = "Date";
        Label = "Address Changed Date";
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
        Label = "Address";
    }

    OUT MIR-CLI-ADDR-LN-2-TXT
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-CLI-ADDR-LN-2-TXT-2
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-CLI-ADDR-LN-3-TXT
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-CLI-ADDR-ADDL-TXT
    {
        MixedCase;
        Length = "72";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Samakata-bu";
    }

    OUT MIR-CLI-ADDR-LN-3-TXT-2
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-DV-CLI-ADDR-LN-4-TXT
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-DV-CLI-ADDR-LN-4-TXT-2
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-DV-CLI-ADDR-LN-5-TXT
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-DV-CLI-ADDR-LN-5-TXT-2
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-DV-CLI-ADDR-LN-6-TXT
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-DV-CLI-ADDR-LN-6-TXT-2
    {
        Length = "35";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-CLI-ADDR-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Status";
    }

    OUT MIR-CLI-ADDR-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Type";
    }

    OUT MIR-CLI-ID-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-CNTCT-TXT
    {
        Length = "50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Phone Number";
    }

    OUT MIR-DV-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Mailing Name";
    }

    OUT MIR-DV-CLI-NM-2
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Mailing Name";
    }

    OUT MIR-DV-CLI-NM-2-T[12]
    {
        Length = "75";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Name";
        Index = "1";
    }

    OUT MIR-DV-CLI-NM-T[12]
    {
        Length = "75";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Name";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-OWN-CLI-NM-KJ
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
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

    OUT MIR-POL-CLI-REL-TYP-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Policy / Client Relationship Type";
        Index = "1";
    }

    OUT MIR-ACT-POL-CLI-REL-TYP-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-TYP-CD";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Actual Policy / Client Relationship Type";
        Index = "1";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }
    #TDMG24 CHANGES START HERE
    OUT MIR-PREM-PMT-CMPLT-IND
 {
 
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Base Policy Premium Payment Completion";
 
 }    
#TDMG24 CHANGES END HERE     

    OUT MIR-POL-INS-PURP-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Purpose of Insurance";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

}

