# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6945-P.p                                                    *
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

P-STEP BF6945-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6945";
        BusinessFunctionName = "Policy Inquiry - Beneficiary Relations";
        BusinessFunctionType = "Relben";
        MirName = "CCWM6945";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

    IN MIR-INSRD-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Insured Client's ID";
    }

    OUT MIR-BNFY-DESGNT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "BNFY-DESGNT-CD";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Designation";
        Index = "1";
    }

    OUT MIR-BNFY-MINR-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TBENE";
        SType = "Indicator";
        Label = "Beneficiary is a minor";
        Index = "1";
    }

    OUT MIR-BNFY-NM-T[20]
    {
        #TLB041 CHANGES START HERE
        #Length = "75";
        Length = "100";
        #TLB041 CHANGES END HERE
        FieldGroup = "Table20";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Beneficiary's Name";
        Index = "1";
    }

    OUT MIR-BNFY-PRCDS-PCT-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TBENE";
        SType = "Percent";
        Label = "Percentage";
        Index = "1";
    }

    OUT MIR-BNFY-REL-INSRD-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "BTOI";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Relation to Insured";
        Index = "1";
    }

    OUT MIR-BNFY-SEQ-NUM-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-BNFY-TYP-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "BNFY-TYP-CD";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Beneficiary Type";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-INSRD-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Insured Client ID";
        Index = "1";
    }
     
    OUT MIR-DV-INSRD-NM-T[20]
    {
        Length = "51";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }
     
    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
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
    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "40";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
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
    
#* MP332B Changes Start Here
   
    OUT MIR-BNFY-SEX-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "BNFY-SEX-CD";
        SType = "Text";
        Label = "Beneficiary's Sex Code";
        Index = "1";        
    }
       
    OUT MIR-BNFY-BTH-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Beneficiary's Date Of Birth";
        Index = "1";        
    }
    
#* MP332B Changes End Here
    
     
}

