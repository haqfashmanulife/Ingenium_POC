# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF9E24-P.p                                                    *
#*  Description: Policy Inquiry Webservice                                     *
#*******************************************************************************
#*  UY3148  CTS      INITIAL VERSION                                           *
#*******************************************************************************

P-STEP BF9E24-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E24";
        BusinessFunctionName = "Policy Inquiry (Main)";
        BusinessFunctionType = "WSTypChgPrcs";
        MirName = "CCWM9E24";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }
    
    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }    

    IN MIR-LRG-PROD-CD
    {
        Length ="3";
        SType = "Text";
        Label = "Insurance Type";
    }

    IN MIR-TYPE-CHG
    {
        Length ="1";
        SType = "Text";
        Label = "TypeChange Type";
    }

    OUT MIR-SMALL-TYP-CD
    {
        Length = "3";
        SType = "Text";
        Label = "Small Type Code";
    }
    OUT MIR-UNISYS-TRANS-CD
    {
        Length = "1";
        SType = "Text";
        Label = "Unisys Transaction Code";
    }
    OUT MIR-PRCES-DT
    {
        Length = "8";
        SType = "Date";
        Label = "Process Date";
    }
    OUT MIR-OWN-LNM-KA
    {
        Length = "16";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Policyholder Last Name(Kana)";
    }
    OUT MIR-OWN-FNM-KA
    {
        Length = "16";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Policyholder First Name(Kana)";
    }
    OUT MIR-OWN-BTH-DT
    {
        Length = "8";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Policyholder Date of Birth";
    }
    OUT MIR-OWN-SEX-CD
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Policyholder Sex";
    }
    OUT MIR-INSRD-LNM-KA
    {
        Length = "16";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Last name (Kana)";
    }
    OUT MIR-INSRD-FNM-KA
    {
        Length = "16";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured First Name (Kana)";
    }
    OUT MIR-INSRD-BTH-DT
    {
        Length = "8";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Insured Date of Birth";
    }
    OUT MIR-INSRD-SEX-CD
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Sex";
    }
    OUT MIR-CVG-RT-AGE
    {
        Length ="2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Insured Age";
    }
    OUT MIR-GRP-EMP-CD
    {
        Length = "6";
        SType = "Text";
        Label = "Employee Code ";
    }
    OUT MIR-CHECK-DIGIT
    {
        Length ="1";
        SType = "Number";
        Label = "Check Digit";
    }
    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "8";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Issue Date of the Policy";
    }
    OUT MIR-PROPOSED-EFF-DT
    {
        Length = "8";
        SType = "Date";
        Label = "Proposed Effective Date";
    }
    OUT MIR-POL-PERIOD
    {
        Length = "2";
        SType = "Text";
        Label = "Policy Period`";
    }
    OUT MIR-CVG-STBL-4-CD
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Medical Insurance Type";
    }
    OUT MIR-TOTAL-PRM
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Total Premiun Amount";
    }
    OUT MIR-PREM-PYMT-MTHD
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Premium Payment Method";
    }
    OUT MIR-BASE-DLY-BNFT-AMT 
    {
        Signed;
        Length = "15";
        SType = "Currency";
        DBTableName = "TCVG";
        Label = "Base Daily Benefit Amount";
    }
    OUT MIR-BASE-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Base Premiun Amount";
    }
    OUT MIR-RDR-ADLT-HOSP-BNFT-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        DBTableName = "TCVG";
        Label = "Rider Adult Hospital Benefit Amount";
    }
    OUT MIR-RDR-ADLT-HOSP-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Rider Adult Hospital Premium Amount";
    }
    OUT MIR-RDR-DISCHARGE-BNFT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Rider Discharge Benefit Amount";
    }
    OUT MIR-RDR-DISCHARGE-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Rider Discharge Premium Amount";
    }
    OUT MIR-RDR-OUTPAT-BNFT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Rider OutPatient Benefit Amount";
    }
    OUT MIR-RDR-OUTPAT-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Rider OutPatient Premium Amount";
    }
    OUT MIR-RDR-ACCDT-BNFT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Rider Accident Outpat Benefit Amount";
    }
    OUT MIR-RDR-ACCDT-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Rider Accident Outpat Premium Amount";
    }
    OUT MIR-RDR-DREAD-DIS-BNFT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Rider Dread Disease Benefit Amount";
    }
    OUT MIR-RDR-DREAD-DIS-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Rider Dread Disease Premium Amount";
    }
    OUT MIR-RDR-LNG-TRM-BNFT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Rider Long Term Benefit Amount";
    }
    OUT MIR-RDR-LNG-TRM-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Rider Long Term Premium Amount";
    }
    OUT MIR-RDR-NON-PAR-SVNG-PREM
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Rider Nonpar Interest Premium Ammount";
    }
    OUT MIR-POL-XPRY-DT
    {
        Length ="8";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Expiry Date";
    }
    OUT MIR-CREATOR-NME 
    {
        Length = "16";
        SType = "Text";
        Label = "Creator Name";
    }
    OUT MIR-ONLINE-ERROR-CD
    {
        Length = "5";
        SType = "Number";
        Label = "Online Error Code";
    }
    OUT MIR-ERROR-MESSAGE
    {
        Length = "10";
        SType = "Text";
        Label = "Error Message";
    }
}