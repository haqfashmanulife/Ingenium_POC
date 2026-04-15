# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1054-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01CL06  KRW      Designate Beneficiary by Insured                          *
#*  B00050  DPK      Removed Mandatory for Insured Client Id and added         *
#*                   Insured Client name to List display                       *
#*  B00205  BMB      Remove CVG fields from display - this value will be 00    *
#*  B00310  WBP      Add Insured Client Id to Display                          *
#*  01CL06  EKM      Remove DefaultSession variable from MIR-INSRD-CLI-ID      *
#*  NWLANR  CTS      Add Annuity Period Field                                  *
#*  MP332B  CTS      XML Changes for Money Laundering                          *  
#*  MP332C  CTS      INGENIUM ESB CHANGES                                      *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*******************************************************************************

P-STEP BF1054-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1054";
        BusinessFunctionName = "Beneficiary Information List";
        BusinessFunctionType = "List";
        MirName = "CCWM5100";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BNFY-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-INSRD-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured's Client Id";
    }

    INOUT MIR-POL-ID-BASE
    {
        Mandatory;
        Key;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Mandatory;
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-BNFY-DESGNT-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "BNFY-DESGNT-CD";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Designation";
        Index = "1";
    }

    OUT MIR-BNFY-NM-T[12]
    {
        #TLB041 CHANGES START HERE
        #Length = "54";
        Length = "100";	
	#TLB041 CHANGES END HERE
        FieldGroup = "Table12";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Beneficiary's Name";
        Index = "1";
    }

    OUT MIR-BNFY-PRCDS-PCT-T[12]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table12";
        DBTableName = "TBENE";
        SType = "Percent";
        Label = "Percentage";
        Index = "1";
    }

    OUT MIR-BNFY-REL-INSRD-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "BTOI";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Relation to Insured";
        Index = "1";
    }

    OUT MIR-BNFY-SEQ-NUM-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-BNFY-TYP-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "BNFY-TYP-CD";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Beneficiary Type";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-INSRD-CLI-NM-T[12]
    {
        Length = "54";
        FieldGroup = "Table12";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Insured Client's Name";
        Index = "1";
    }
     
    OUT MIR-INSRD-CLI-ID-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Client's Id";
        Index = "1";
    }
    
#* NWLANR Changes Start Here

    OUT MIR-BNFY-ANTY-PERI-CD-T[12]
    {
        Length = "2";
        FieldGroup = "Table12"; 
        CodeSource = "DataModel";
        CodeType = "BNFY-ANTY-PERI-CD";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Annuity Period";
        Index = "1";
    }
    
#* NWLANR Changes End Here 

#* MP332B Changes Start Here
    
    OUT MIR-BNFY-SEX-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "BNFY-SEX-CD";
        SType = "Text";
        Label = "Beneficiary's Sex Code";
        Index = "1";

    }
       
    OUT MIR-BNFY-BTH-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Beneficiary's Date Of Birth";
        Index = "1";
    }
    
#* MP332B Changes End Here

#* MP332C CHANGES STARTS HERE
    OUT MIR-BNFY-ADDR-LOC-CD-T[12]
    { 
        FieldGroup = "Table12";
        Length = "8";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Address Code";
        Index = "1";
    }

    OUT MIR-BNFY-PSTL-CD-T[12]
    {
        Length = "9";
        FieldGroup = "Table12";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Postal Code";
        Index = "1";
    }
    
    OUT MIR-BNFY-PREFCT-TXT-T[12]
    {
        Length = "11";
        FieldGroup = "Table12";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Address(Prefecture)";
        Index = "1";
    }

    OUT MIR-BNFY-CITY-NM-TXT-T[12]
    {
        Length = "30";
        FieldGroup = "Table12";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Address(City)";
        Index = "1";
    }
    
    OUT MIR-BNFY-ADDR-LN-1-TXT-T[12]
    {
        Length = "30";
        FieldGroup = "Table12";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Address(Neighborhood)";
        Index = "1";
    }
    
    OUT MIR-BNFY-KA-PREFCT-TXT-T[12]
    {
        Length = "11";
        FieldGroup = "Table12";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Address Kana(Prefecture)";
        Index = "1";
    }
    
    OUT  MIR-BNFY-KA-CITY-TXT-T[12]
    {
        Length = "30";
        FieldGroup = "Table12";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Address Kana(City)";
        Index = "1";
    }
    
    OUT  MIR-BNFY-KA-NGHBRHD-TXT-T[12]
    {
        Length = "30";
        FieldGroup = "Table12";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Address Kana(Neighborhood)";
        Index = "1";
    }
    
    OUT  MIR-BNFY-ADDR-ADDL-TXT-T[12]
    {
        Length = "50";    
        FieldGroup = "Table12";
        DBTableName = "TBENE";
        SType = "Text";    
        Label = "Samakata-bu";
        Index = "1";
    }
       
#* MP332C CHANGES ENDS HERE


}

