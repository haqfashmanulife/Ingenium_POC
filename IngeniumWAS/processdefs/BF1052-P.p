# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1052-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01CL06  KRW      Designate Beneficiary by Insured                          *
#*  B00205  BMB      Remove CVG fields from display - this value will be 00    *
#*  01CL06  EKM      Remove DefaultSession variable from MIR-INSRD-CLI-ID      *
#*  NWLANR  CTS      Add Annuity Period Field                                  *
#*  MP332B  CTS      XML Changes for Money Laundering                          *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*******************************************************************************

P-STEP BF1052-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1052";
        BusinessFunctionName = "Beneficiary Information Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM5100";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BNFY-DESGNT-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "BNFY-DESGNT-CD";
        DBTableName = "TBENE";
        SType = "Selection";
        Label = "Designation";
    }

    INOUT MIR-BNFY-MINR-IND
    {
        Length = "1";
        DBTableName = "TBENE";
        SType = "Indicator";
        Label = "Beneficiary is a minor";
    }

    INOUT MIR-BNFY-NM
    {
        MixedCase;
        #TLB041 CHANGES START HERE 
        #Length = "54";
        Length = "100";	
	#TLB041 CHANGES END HERE
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Beneficiary's Name";
    }

    INOUT MIR-BNFY-PRCDS-PCT
    {
        Mandatory;
        Length = "3";
        Decimals = "0";
        DBTableName = "TBENE";
        SType = "Percent";
        Label = "Percentage";
    }

    INOUT MIR-BNFY-REL-INSRD-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BTOI";
        DBTableName = "TBENE";
        SType = "Selection";
        Label = "Relation to Insured";
    }

    INOUT MIR-BNFY-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BNFY-TYP-CD";
        DBTableName = "TBENE";
        SType = "Selection";
        Label = "Beneficiary Type";
    }

    INOUT MIR-CLI-ADDR-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TBENE";
        SType = "Selection";
        Label = "Address Type";
    }

    INOUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-CVG-NUM
    {
        Mandatory;
        Length = "2";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DV-BNFY-UPDT-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Update beneficiary name automatically based on client number entered";
    }

    IN MIR-BNFY-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-INSRD-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured's Client Id";
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

#* NWLANR Changes Start Here

    INOUT MIR-BNFY-ANTY-PERI-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "BNFY-ANTY-PERI-CD";
        DBTableName = "TBENE";
        SType = "Selection";
        Label = "Annuity Period";
    }
#* NWLANR Changes End Here 

#* MP332B Changes Start Here

    INOUT MIR-BNFY-KA-NM
    {
        #TLB041 CHANGES START HERE 
        #Length = "50";
        Length = "100";	
	#TLB041 CHANGES END HERE
        SType = "Text";
        Label = "Beneficiary's Kana Name";
    }
        
    INOUT MIR-BNFY-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BNFY-SEX-CD";
        SType = "Selection";
        Label = "Beneficiary's Sex Code";
    }
       
    INOUT MIR-BNFY-BTH-DT
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TBENE";
        Label = "Beneficiary's Date Of Birth";
    }
    
    OUT MIR-BNFY-BTH-JP-DT-DY-TXT
    {
        Length = "2";
        SType = "Text";
        Label = "Birth Days In Emperor Format";
    }

    OUT MIR-BNFY-BTH-JP-DT-MO-TXT
    {
        Length = "2";
        SType = "Text";
        Label = "Birth Months In Emperor Format";
    }

    OUT MIR-BNFY-BTH-JP-DT-YR-TXT
    {
        Length = "2";
        SType = "Text";
        Label = "Birth Years in Emperor Format";
    }   
    
# MP332B Changes End Here 

}

