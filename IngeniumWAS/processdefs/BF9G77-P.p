# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF9G77-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYSD11     CTS      INITIAL VERSION OF KANJI MASTER SCREEN                 *
#*  UYDM28     CTS      UNISYS KANJI MASTER SCREEN CHANGES FOR STREAM 3                                                                            *
#*******************************************************************************

P-STEP BF9G77-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9G77";
        BusinessFunctionName = "Kanji Screen";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9G77";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TUSKM";
        SType = "Text";
        Label = "Policy Id";
    }
##UYDM28 Changes Start
    INOUT MIR-POL-IDENT-CD
    {
      Length = "1";
      CodeSource = "DataModel";
      CodeType = "POL-IDENT-TYP-CD";
      SType = "Selection";
      Label = "Policy Identification Code";
    } 
##UYDM28 Changes Ends
    INOUT MIR-LRG-TYP                            
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Daishu";
    }
    OUT MIR-DTH-BNFY-CTR-IND                   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death Beneficiary Count Indicator";
    }
    OUT MIR-FM-DT                              
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "FM Date";
    }
    OUT MIR-POL-HLDR-NM-KANJI                  
    {
        DisplayOnly;
        Length = "100";
        SType = "Text";
        Label = "Policy holder Long Name Kanji";
    }
    OUT MIR-OWNR-SHRT-NM-KJ                    
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Policy Short Name Kanji";
    }
    OUT MIR-POL-HLDR-NM-KANA                   
    {
        DisplayOnly;
        Length = "100";
        SType = "Text";
        Label = "Policy Holder Name Kana";
    }
    OUT MIR-POL-HLDR-ADDR-KANJI                
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Policy Holder Address kanji";
    }
    OUT MIR-INSRD-NM-KANJI                     
    {
        DisplayOnly;
        Length = "24";
        SType = "Text";
        Label = "Insured Name Kanji";
    }
##UYDM28 Changes Start
    OUT MIR-MAT-AMT-BENE-NM                
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Matured Premium Beneficiary";
    }
##UYDM28 Changes Ends
    OUT MIR-PRXY-BNFY-NM-KANJI                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Insured Name Kanji";
    }
    OUT MIR-PRXY-BNFY-NM-KANA                  
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Proxy Beneficiary Name Kanji";
    }
    OUT MIR-PRXY-BNFY-ADDR-CD                  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Proxy Beneficiary Name Kana";
    }
    OUT MIR-PRXY-BNFY-ADDR-KANJI               
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Proxy Beneficiary Address Kanji";
    }
    OUT MIR-PRXY-BNFY-ADDR-KANA                
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Proxy Beneficiary Address Kana";
    }
    OUT MIR-DTH-BNFY-1-PCT                     
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Death Beneficiary Percentage";
    }
    OUT MIR-DTH-BNFY-1-NM-KANJI                
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    OUT MIR-DTH-BNFY-1-NM-KANA                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    OUT MIR-DTH-BNFY-2-PCT                     
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Death Beneficiary Percentage";
    }
    OUT MIR-DTH-BNFY-2-NM-KANJI                
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    OUT MIR-DTH-BNFY-2-NM-KANA                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    OUT MIR-DTH-BNFY-3-PCT                     
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Death Beneficiary Percentage";
    }
    OUT MIR-DTH-BNFY-3-NM-KANJI                
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    OUT MIR-DTH-BNFY-3-NM-KANA                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    OUT MIR-DTH-BNFY-4-PCT                     
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Death Beneficiary Percentage";
    }
    OUT MIR-DTH-BNFY-4-NM-KANJI                
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    OUT MIR-DTH-BNFY-4-NM-KANA                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    OUT MIR-DTH-BNFY-1-STAT                    
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Death Beneficiary 1 Status";
    }
    OUT MIR-DTH-BNFY-1-ADDR-CD                 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Death Beneficiary 1 Address code";
    }
    OUT MIR-DTH-BNFY-1-ADDR-KJ                 
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Death Beneficiary 1 Address Kanji";
    }
    OUT MIR-DTH-BNFY-1-ADDR-KA                 
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Death Beneficiary 1 Address Kana";
    }
    OUT MIR-CLM-DTH-BNFY-PCT                   
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Claimed Death Beneficiary Percentage";
    }
    OUT MIR-CLM-DTH-BNFY-REL                   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Claimed Death Beneficiary Relationship";
    }
    OUT MIR-CLM-DTH-BNFY-NM-KJ                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Claimed Death Beneficiary Name Kanji";
    }
    OUT MIR-CLM-DTH-BNFY-NM-KA                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Claimed Death Beneficiary Name Kana";
    }
    OUT MIR-CLM-DTH-BNFY-ADDR-CD               
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Claimed Death Beneficiary Address Code";
    }
    OUT MIR-CLM-DTH-BNFY-ADDR-KJ               
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Claimed Death Beneficiary Address Kanji";
    }
    OUT MIR-CLM-DTH-BNFY-ADDR-KA               
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Claimed Death Beneficiary Address Kana";
    }
    OUT MIR-CLM-DTH-BNFY-DOB                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Claimed Death Beneficiary Birth Date";
    }
    OUT MIR-CLM-DTH-BNFY-SEX                   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Claimed Death Beneficiary Sex";
    }
    OUT MIR-BNK-CD                             
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Code";
    }
    OUT MIR-BNK-BR-CD                          
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Bank Branch code";
    }
    OUT MIR-ACCT-TYP-CD                        
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Account Type Code";
    }
    OUT MIR-ACCT-NUM                           
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Account Number";
    }
    OUT MIR-ACCT-HLDR-NM                       
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Account Holder Name";
    }
    OUT MIR-MEDIC-BNFY-NM-KANJI                
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Medical Beneficiary Name Kanji";
    }
    OUT MIR-MEDIC-BNFY-NM-KANA                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Medical Beneficiary Name Kana";
    }
    OUT MIR-MEDIC-BNFY-ADDR-CD                 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Medical Beneficiary Address Code";
    }
    OUT MIR-MEDIC-BNFY-ADDR-KJ                 
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Medical Beneficiary Address Kanji";
    }
    OUT MIR-MEDIC-BNFY-ADDR-KA                 
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Medical Beneficiary Address Kana";
    }
    OUT MIR-DTH-RECPNT-1-DOB                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Death S Recipient 1 Date of Birth";
    }
    OUT MIR-DTH-RECPNT-1-SEX-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death S Recipient 1 Sex";
    }
    OUT MIR-DTH-RECPNT-1-REL-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death S Recipient 1 Relationship";
    }
    OUT MIR-DTH-RECPNT-2-DOB                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Death S Recipient 2 Date of Birth";
    }
    OUT MIR-DTH-RECPNT-2-SEX-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death S Recipient 2 Sex";
    }
    OUT MIR-DTH-RECPNT-2-REL-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death S Recipient 2 Relationship";
    }
    OUT MIR-DTH-RECPNT-3-DOB                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Death S Recipient 3 Date of Birth";
    }
    OUT MIR-DTH-RECPNT-3-SEX-CD                
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Death S Recipient 3 Sex";
    }
    OUT MIR-DTH-RECPNT-3-REL-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death S Recipient 3 Relationship";
    }
    OUT MIR-DTH-RECPNT-4-DOB                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Death S Recipient 4 Date of Birth";
    }
    OUT MIR-DTH-RECPNT-4-SEX-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death S Recipient 4 Sex";
    }
    OUT MIR-DTH-RECPNT-4-REL-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death S Recipient 4 Relationship";
    }
##UYDM28 Changes Start
    OUT MIR-FAM-RDR-OYT-SPS-NM                
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Spouse Family 1 year term rider　Spouse(Name)";
    }
    OUT MIR-FAM-RDR-OYT-CH1-NM
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "1 Child Family 1 year 1 Child(Name)";
    }
    OUT MIR-FAM-RDR-OYT-CH2-NM
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "1 Child Family 1 year 2 Child(Name)";
    }
    OUT MIR-FAM-RDR-OYT-CH3-NM
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "1 Child Family 1 year 3 Child(Name)";
    }
    OUT MIR-FAM-RDR-OYT-CH4-NM
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "1 Child Family 1 year 4 Child(Name)";
    }
    OUT MIR-FAM-RDR-OYT-CH5-NM
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "1 Child Family 1 year 5 Child(Name)";
    }
    OUT MIR-FAM-RDR-OYT-CH6-NM
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "1 Child Family 1 year 6 Child(Name)";
    }
    OUT MIR-FAM-RDR-OYT-CH7-NM
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "1 Child Family 1 year 7 Child(Name)";
    }
    OUT MIR-FAM-RDR-OYT-CH8-NM
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "1 Child Family 1 year 8 Child(Name)";
    }	
    OUT MIR-FAM-RDR-OYT-CH9-NM
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "1 Child Family 1 year 9 Child(Name)";
    }
    OUT MIR-FAM-RDR-OYT-CH10-NM
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "1 Child Family 1 year 10 Child(Name)";		
    }	
    OUT MIR-ANTY-RECPNT-NM-KANJI                
    {
        DisplayOnly;
        Length = "100";
        SType = "Text";
        Label = "Annuity Beneficiary Name Kanji";
    }
    OUT MIR-ANTY-RECPNT-NM-KANA                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Annuity Beneficiary Name Kana";
    }
    OUT MIR-ANTY-BNFY-ADDR-CD                 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Annuity Beneficiary Address Code";
    }
    OUT MIR-ANTY-BNFY-ADDR-KANJI                 
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Annuity Beneficiary Address Kanji";
    }
    OUT MIR-ANTY-BNFY-ADDR-KANA                 
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Annuity Beneficiary Address Kana";
    }
    OUT MIR-ANTY-RECPT-LIFE-DT                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Annuity/Maturity S Recipient, Date of Birth";
    }
    OUT MIR-ANTY-RECPNT-SEX-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity/Maturity S Recipient, gender";
    }
    OUT MIR-ANTY-RECPNT-CTL-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity Recipient CTL";
    }
    OUT MIR-ANTY-RECPNT-REL-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity/Maturity S Recipient Relationship";
    }
##UYDM28 Changes Ends
}  