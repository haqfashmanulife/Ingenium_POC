# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF9G77-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYSD11     CTS      INITIAL VERSION OF KANJI MASTER SCREEN                 *
#*                                                                             *
#*******************************************************************************

S-STEP BF9G77-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-ID";
        FocusFrame = "ContentFrame";
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

    IN MIR-POL-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DBTableName = "TUSKM";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-LRG-TYP                            
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Daishu";
    }
    IN MIR-DTH-BNFY-CTR-IND                   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death Beneficiary Count Indicator";
    }
    IN MIR-FM-DT                              
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "FM Date";
    }
    IN MIR-POL-HLDR-NM-KANJI                  
    {
        DisplayOnly;
        Length = "100";
        SType = "Text";
        Label = "Policy holder Long Name Kanji";
    }
    IN MIR-OWNR-SHRT-NM-KJ                    
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Policy Short Name Kanji";
    }
    IN MIR-POL-HLDR-NM-KANA                   
    {
        DisplayOnly;
        Length = "100";
        SType = "Text";
        Label = "Policy Holder Name Kana";
    }
    IN MIR-POL-HLDR-ADDR-KANJI                
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Policy Holder Address kanji";
    }
    IN MIR-INSRD-NM-KANJI                     
    {
        DisplayOnly;
        Length = "24";
        SType = "Text";
        Label = "Insured Name Kanji";
    }
    IN MIR-PRXY-BNFY-NM-KANJI                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Insured Name Kanji";
    }
    IN MIR-PRXY-BNFY-NM-KANA                  
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Proxy Beneficiary Name Kanji";
    }
    IN MIR-PRXY-BNFY-ADDR-CD                  
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Proxy Beneficiary Name Kana";
    }
    IN MIR-PRXY-BNFY-ADDR-KANJI               
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Proxy Beneficiary Address Kanji";
    }
    IN MIR-PRXY-BNFY-ADDR-KANA                
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Proxy Beneficiary Address Kana";
    }
    IN MIR-DTH-BNFY-1-PCT                     
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Death Beneficiary Percentage";
    }
    IN MIR-DTH-BNFY-1-NM-KANJI                
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    IN MIR-DTH-BNFY-1-NM-KANA                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    IN MIR-DTH-BNFY-2-PCT                     
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Death Beneficiary Percentage";
    }
    IN MIR-DTH-BNFY-2-NM-KANJI                
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    IN MIR-DTH-BNFY-2-NM-KANA                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    IN MIR-DTH-BNFY-3-PCT                     
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Death Beneficiary Percentage";
    }
    IN MIR-DTH-BNFY-3-NM-KANJI                
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    IN MIR-DTH-BNFY-3-NM-KANA                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    IN MIR-DTH-BNFY-4-PCT                     
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Death Beneficiary Percentage";
    }
    IN MIR-DTH-BNFY-4-NM-KANJI                
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    IN MIR-DTH-BNFY-4-NM-KANA                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Death Beneficiary Name Kanji";
    }
    IN MIR-DTH-BNFY-1-STAT                    
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Death Beneficiary 1 Status";
    }
    IN MIR-DTH-BNFY-1-ADDR-CD                 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Death Beneficiary 1 Address code";
    }
    IN MIR-DTH-BNFY-1-ADDR-KJ                 
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Death Beneficiary 1 Address Kanji";
    }
    IN MIR-DTH-BNFY-1-ADDR-KA                 
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Death Beneficiary 1 Address Kana";
    }
    IN MIR-CLM-DTH-BNFY-PCT                   
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Claimed Death Beneficiary Percentage";
    }
    IN MIR-CLM-DTH-BNFY-REL                   
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Claimed Death Beneficiary Relationship";
    }
    IN MIR-CLM-DTH-BNFY-NM-KJ                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Claimed Death Beneficiary Name Kanji";
    }
    IN MIR-CLM-DTH-BNFY-NM-KA                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Claimed Death Beneficiary Name Kana";
    }
    IN MIR-CLM-DTH-BNFY-ADDR-CD               
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Claimed Death Beneficiary Address Code";
    }
    IN MIR-CLM-DTH-BNFY-ADDR-KJ               
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Claimed Death Beneficiary Address Kanji";
    }
    IN MIR-CLM-DTH-BNFY-ADDR-KA               
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Claimed Death Beneficiary Address Kana";
    }
    IN MIR-CLM-DTH-BNFY-DOB                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Claimed Death Beneficiary Birth Date";
    }
    IN MIR-CLM-DTH-BNFY-SEX                   
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Claimed Death Beneficiary Sex";
    }
    IN MIR-BNK-CD                             
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Code";
    }
    IN MIR-BNK-BR-CD                          
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Bank Branch code";
    }
    IN MIR-ACCT-TYP-CD                        
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Account Type Code";
    }
    IN MIR-ACCT-NUM                           
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Account Number";
    }
    IN MIR-ACCT-HLDR-NM                       
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Account Holder Name";
    }
    IN MIR-MEDIC-BNFY-NM-KANJI                
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Medical Beneficiary Name Kanji";
    }
    IN MIR-MEDIC-BNFY-NM-KANA                 
    {
        DisplayOnly;
        Length = "32";
        SType = "Text";
        Label = "Medical Beneficiary Name Kana";
    }
    IN MIR-MEDIC-BNFY-ADDR-CD                 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Medical Beneficiary Address Code";
    }
    IN MIR-MEDIC-BNFY-ADDR-KJ                 
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Medical Beneficiary Address Kanji";
    }
    IN MIR-MEDIC-BNFY-ADDR-KA                 
    {
        DisplayOnly;
        Length = "64";
        SType = "Text";
        Label = "Medical Beneficiary Address Kana";
    }
    IN MIR-DTH-RECPNT-1-DOB                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Death S Recipient 1 Date of Birth";
    }
    IN MIR-DTH-RECPNT-1-SEX-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death S Recipient 1 Sex";
    }
    IN MIR-DTH-RECPNT-1-REL-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death S Recipient 1 Relationship";
    }
    IN MIR-DTH-RECPNT-2-DOB                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Death S Recipient 2 Date of Birth";
    }
    IN MIR-DTH-RECPNT-2-SEX-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death S Recipient 2 Sex";
    }
    IN MIR-DTH-RECPNT-2-REL-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death S Recipient 2 Relationship";
    }
    IN MIR-DTH-RECPNT-3-DOB                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Death S Recipient 3 Date of Birth";
    }
    IN MIR-DTH-RECPNT-3-SEX-CD                
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Death S Recipient 3 Sex";
    }
    IN MIR-DTH-RECPNT-3-REL-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death S Recipient 3 Relationship";
    }
    IN MIR-DTH-RECPNT-4-DOB                   
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Death S Recipient 4 Date of Birth";
    }
    IN MIR-DTH-RECPNT-4-SEX-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death S Recipient 4 Sex";
    }
    IN MIR-DTH-RECPNT-4-REL-CD                
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Death S Recipient 4 Relationship";
    }
}