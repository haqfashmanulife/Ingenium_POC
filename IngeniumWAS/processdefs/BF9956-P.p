# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF9956-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  PIRAEX  CTS      PIRA INGENIUM DATA EXTRACT                                *
#*  ACU080  CTS      ADD KANJI NAME FOR POLICY HOLDER(COMPANY)                 *
#*  ACU139  CTS      ADD MATURITY/EXPIRY REASON CODE AT RIDER LEVEL            *
#*  IPDDEX  CTS      ADD IPDD RIDER FILEDS AT CLIENT LEVEL AND RIDER LEVEL     *
#*  RPL017  CTS      ADD SUBTABLE CODE 3 AND SUBTABLE CODE 4 FIELDS AT RIDER   *
#*                   LEVEL                                                     *
#*  MP213T  CTS      ADDED CVG NUM, GROUP ID, AUTO PREM CHNG IND               *
#*  M21307  CTS      ADDED MAT XPRY DATE                                       *
#*******************************************************************************
P-STEP BF9956-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9956";
        BusinessFunctionName = "Policy Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9956";
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
        Label = "Policy ID";
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

    INOUT MIR-SERV-AGT-ID
    {
        Length = "6";
        Mandatory;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent ID";
    }

    MIR-POL-INFO
    {
        OUT MIR-POL-APP-FORM-ID
        {
            Length = "15";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "Application Number";
        }

        OUT MIR-POL-ISS-EFF-DT
        {
            Length = "10";
            DBTableName = "TPOL";
            SType = "Date";
            Label = "Policy Issue Date";
        }

        OUT MIR-PLAN-ID
        {
            Length = "6";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "Plan";
        }

        OUT MIR-PROD-APP-TYP-CD
        {
            Length = "2";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "Product Application Type";
        }

        OUT MIR-POL-ASIGN-IND
        {
            Length = "1";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "Policy Assigned Indicator";
        }

        OUT MIR-APPL-CTL-PRCES-DT
        {
            Length = "10";
            DBTableName = "TMAST";
            SType = "Date";
            Label = "System Date";
        }

        OUT MIR-INSRD-NO
        {
            Length = "2";
            DBTableName = "Derived";
            SType = "Text";
            Label = "Insured Number";
        }
#  MP213T CHANGES STARTS HERE         
        OUT MIR-AUTO-PREM-CHNG-IND
        {
            Length = "1";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "Auto Premium Change Indicator";
        }        
#  MP213T CHANGES ENDS HERE           
    }

    MIR-PREM-INFO
    {
        OUT MIR-POL-BILL-TYP-CD
        {
            Length = "1";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "Policy Billing Method";
        }

        OUT MIR-CLI-GR-TYP-CD
        {
            Length = "1";
            DBTableName = "TCLIG";
            SType = "Text";
            Label = "Group Size";
        }

        OUT MIR-POL-BILL-MODE-CD
        {
            Length = "2";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "Policy Billing Frequency";
        }

        OUT MIR-POL-SNDRY-AMT
        {
            Length = "13";
            DBTableName = "TPOL";
            SType = "Currency";
            Label = "Sundry Payment Amount";
        }

        OUT MIR-POL-CV-EX-ESC-AMT
        {
            Length = "17";
            DBTableName = "Derived";
            SType = "Currency";
            Label = "Cash Value Less ESC";
        }

        OUT MIR-TOT-SA-PREM-AMT
        {
            Length = "15";
            DBTableName = "Derived";
            SType = "Currency";
            Label = "SA Regular Premium";
        }
    }

    MIR-OWNER-INFO
    {
        OUT MIR-CLI-ID
        {
            Length = "10";
            DBTableName = "TCLI";
            SType = "Text";
            Label = "Client ID";
        }

        OUT MIR-CLI-CO-ENTR-NM
        {
            Length = "50";
            DBTableName = "TCLNC";
            SType = "Text";
            Label = "Company Name";
        }

        OUT MIR-KJ-CO-ENTR-NM
        {
            Length = "50";
            DBTableName = "TCLNC";
            SType = "Text";
            Label = "Kanji Company Name";
        }

        OUT MIR-KA-SUR-NM
        {
            Length = "25";
            DBTableName = "TCLNC";
            SType = "Text";
            Label = "Kana Sur Name";
        }

        OUT MIR-KA-GIV-NM
        {
            Length = "25";
            DBTableName = "TCLNC";
            SType = "Text";
            Label = "Kana Given Name";
        }

        OUT MIR-KJ-SUR-NM
        {
            Length = "25";
            DBTableName = "TCLNC";
            SType = "Text";
            Label = "Kanji Sur Name";
        }

        OUT MIR-KJ-GIV-NM
        {
            Length = "25";
            DBTableName = "TCLNC";
            SType = "Text";
            Label = "Kanji Giv Name";
        }

        OUT MIR-CLI-SEX-CD
        {
            Length = "1";
            DBTableName = "TCLI";
            SType = "Text";
            Label = "Sex";
        }

        OUT MIR-CLI-BTH-DT
        {
            Length = "10";
            DBTableName = "TCLI";
            SType = "Text";
            Label = "Birth Date";
        }

        OUT MIR-CLI-ADDR-LOC-CD
        {
            Length = "8";
            DBTableName = "TCLIA";
            SType = "Text";
            Label = "Address Code";
        }

        OUT MIR-CLI-PSTL-CD
        {
            Length = "9";
            DBTableName = "TCLIA";
            SType = "Text";
            Label = "Postal Code";
        }

        OUT MIR-CLI-PREFCT-TXT
        {
            Length = "11";
            DBTableName = "TCLIA";
            SType = "Text";
            Label = "Prefecture";
        }

        OUT MIR-CLI-CITY-NM-TXT
        {
            Length = "30";
            DBTableName = "TCLIA";
            SType = "Text";
            Label = "City";
        }

        OUT MIR-CLI-ADDR-LN-1-TXT
        {
            Length = "30";
            DBTableName = "TCLIA";
            SType = "Text";
            Label = "Address";
        }

        OUT MIR-CLI-ADDR-ADDL-TXT
        {
            Length = "60";
            DBTableName = "TCLIA";
            SType = "Text";
            Label = "Samakata-bu";
        }

        OUT MIR-CLI-CNTCT-ID-TXT
        {
            Length = "50";
            DBTableName = "TCLIC";
            SType = "Text";
            Label = "Identification Code";
        }
    }

    MIR-INSRD-INFO-G[9]
    {
        ATTRIBUTES
        {
            GenRows = "9";
        }

        OUT MIR-CLI-ID-T
        {
            Length = "10";
            DBTableName = "TCLI";
            SType = "Text";
            Label = "Client ID";
        }

        OUT MIR-STCKR-ID-T
        {
            Length = "11";
            DBTableName = "TCLIU";
            SType = "Text";
            Label = "Sticker Number";
        }

        OUT MIR-CLI-CO-ENTR-NM-T
        {
            Length = "50";
            DBTableName = "TCLNC";
            SType = "Text";
            Label = "Company Name";
        }

        OUT MIR-KA-SUR-NM-T
        {
            Length = "25";
            DBTableName = "TCLI";
            SType = "Text";
            Label = "Kana Sur Name";
        }

        OUT MIR-KA-GIV-NM-T
        {
            Length = "25";
            DBTableName = "TCLI";
            SType = "Text";
            Label = "Kana Giv Name";
        }

        OUT MIR-KJ-SUR-NM-T
        {
            Length = "25";
            DBTableName = "TCLI";
            SType = "Text";
            Label = "Kanji Sur Name";
        }

        OUT MIR-KJ-GIV-NM-T
        {
            Length = "25";
            DBTableName = "TCLI";
            SType = "Text";
            Label = "Kanji Giv Name";
        }

        OUT MIR-CLI-SEX-CD-T
        {
            Length = "1";
            DBTableName = "TCLI";
            SType = "Text";
            Label = "Sex";
        }

        OUT MIR-CLI-BTH-DT-T
        {
            Length = "10";
            DBTableName = "TCLI";
            SType = "Date";
            Label = "Birth Date";
        }

        OUT MIR-BASE-INSRD-CD-T
        {
            Length = "1";
            DBTableName = "Derived";
            SType = "Text";
            Label = "Insured for Policy";
        }

        OUT MIR-OWNR-REL-INSR-CD-T
        {
            Length = "1";
            DBTableName = "TCLIU";
            SType = "Text";
            Label = "Relationship of Insured to Policy Owner";
        }

        OUT MIR-CLI-TCB-IND-T
        {
            Length = "1";
            DBTableName = "TCLIU";
            SType = "Text";
            Label = "Terminal Care Benefit";
        }

        OUT MIR-CLI-LNB-IND-T
        {
            Length = "1";
            DBTableName = "TCLIU";
            SType = "Text";
            Label = "Living Needs Benefit";
        }

        OUT MIR-CLI-ADDR-LOC-CD-T
        {
            Length = "9";
            DBTableName = "TCLIA";
            SType = "Text";
            Label = "Address Code";
        }

        OUT MIR-CLI-PSTL-CD-T
        {
            Length = "11";
            DBTableName = "TCLIA";
            SType = "Text";
            Label = "Postal Code";
        }

        OUT MIR-CLI-PREFCT-TXT-T
        {
            Length = "30";
            DBTableName = "TCLIA";
            SType = "Text";
            Label = "Prefecture";
        }

        OUT MIR-CLI-CITY-NM-TXT-T
        {
            Length = "30";
            DBTableName = "TCLIA";
            SType = "Text";
            Label = "City";
        }

        OUT MIR-CLI-ADDR-LN-1-TXT-T
        {
            Length = "50";
            DBTableName = "TCLIA";
            SType = "Text";
            Label = "Address";
        }

        OUT MIR-CLI-ADDR-ADDL-TXT-T
        {
            Length = "60";
            DBTableName = "TCLIA";
            SType = "Text";
            Label = "Samakata-bu";
        }

        OUT MIR-CLI-CNTCT-ID-TXT-T
        {
            Length = "50";
            DBTableName = "TCLIA";
            SType = "Text";
            Label = "Contact Information";
        }

        OUT MIR-BNFY-REL-INSRD-CD-T
        {
            Length = "5";
            DBTableName = "TBENE";
            SType = "Text";
            Label = "Beneficiary's Relation to Insured";
        }

        OUT MIR-BNFY-COMP-NM-T
        {
            Length = "54";
            DBTableName = "Derived";
            SType = "Text";
            Label = "Beneficiary's Name";
        }

        OUT MIR-BNFY-SUR-NM-T
        {
            Length = "27";
            DBTableName = "Derived";
            SType = "Text";
            Label = "Beneficiary's Sur Name";
        }

        OUT MIR-BNFY-GIV-NM-T
        {
            Length = "27";
            DBTableName = "Derived";
            SType = "Text";
            Label = "Beneficiary's Given Name";
        }

        OUT MIR-BNFY-PRCDS-PCT-T
        {
            Length = "3";
            DBTableName = "TBENE";
            SType = "Number";
            Label = "Percentage";
        }

        OUT MIR-BNFY-REL-INSRD-CD1-T
        {
            Length = "5";
            DBTableName = "TBENE";
            SType = "Text";
            Label = "Proxy Beneficiary's Relation to Insured";
        }

        OUT MIR-BNFY-SUR-NM1-T
        {
            Length = "27";
            DBTableName = "Derived";
            SType = "Text";
            Label = "Proxy Beneficiary's Sur Name";
        }

        OUT MIR-BNFY-GIV-NM1-T
        {
            Length = "27";
            DBTableName = "Derived";
            SType = "Text";
            Label = "Proxy Beneficiary's Given Name";
        }
#IPDDEX
        OUT MIR-BNFY-REL-INSRD-CD2-T
        {
            Length = "5";
            DBTableName = "TBENE";
            SType = "Text";
            Label = "Death Monthly Benefit Beneficiary's Relation to Insured";
        }
#IPDDEX
        OUT MIR-BNFY-COMP-NM2-T
        {
            Length = "54";
            DBTableName = "Derived";
            SType = "Text";
            Label = "Death Monthly Beneficiary Company's Name";
        }
#IPDDEX
        OUT MIR-BNFY-SUR-NM2-T
        {
            Length = "27";
            DBTableName = "Derived";
            SType = "Text";
            Label = "Death Monthly Benefit Beneficiary's Sur Name";
        }
#IPDDEX
        OUT MIR-BNFY-GIV-NM2-T
        {
            Length = "27";
            DBTableName = "Derived";
            SType = "Text";
            Label = "Death Monthly Benefit Beneficiary's Given Name";
        }
#IPDDEX
        OUT MIR-BNFY-PRCDS-PCT2-T
        {
            Length = "3";
            DBTableName = "TBENE";
            SType = "Number";
            Label = "Death Monthly Benefit Percentage";
        }
    }

    MIR-RIDER-INFO-G[99]
    {
        ATTRIBUTES
        {
            GenRows = "99";
        }

        OUT MIR-CVG-PLAN-ID-T
        {
            Length = "6";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "Plan";
        }

        OUT MIR-CVG-FACE-AMT-T
        {
            Length = "15";
            DBTableName = "TCVG";
            SType = "Currency";
            Label = "Face Amount";
        }

        OUT MIR-CVG-STBL-1-CD-T
        {
            Length = "2";
            DBTableName = "TCVG";
            SType = "Text";
            Label = "Sub-table 1";
        }

        OUT MIR-CVG-STBL-2-CD-T
        {
            Length = "3";
            DBTableName = "TCVG";
            SType = "Text";
            Label = "Sub-table 2";
        }

        OUT MIR-CVG-STBL-3-CD-T
        {
            Length = "5";
            DBTableName = "TCVG";
            SType = "Text";
            Label = "Sub-table 3";
        }

        OUT MIR-CVG-STBL-4-CD-T
        {
            Length = "2";
            DBTableName = "TCVG";
            SType = "Text";
            Label = "Sub-table 4";
        }

        OUT MIR-CVG-BASIC-PREM-AMT-T
        {
            Length = "13";
            DBTableName = "TCVG";
            SType = "Currency";
            Label = "Annual Premium";
        }

        OUT MIR-CVG-ISS-EFF-DT-T
        {
            Length = "10";
            DBTableName = "TCVG";
            SType = "Date";
            Label = "Issue Date";
        }

        OUT MIR-CVG-ME-PREM-AMT-T
        {
            Length = "13";
            DBTableName = "TCVG";
            SType = "Currency";
            Label = "Multiple / Mortality Extra Premium";
        }

        OUT MIR-CVG-CSTAT-CD-T
        {
            Length = "3";
            DBTableName = "TCVG";
            SType = "Text";
            Label = "Coverage Status";
        }

        OUT MIR-CVG-CLI-ID-T
        {
            Length = "10";
            DBTableName = "TCLI";
            SType = "Text";
            Label = "Client ID";
        }

        OUT MIR-CVG-ALLOC-AMT-T
        {
            Length = "15";
            DBTableName = "Derived";
            SType = "Currency";
            Label = "Coverage Level SA Premium";
        }

        OUT MIR-MAT-XPRY-REASN-CD-T
        {
            Length = "2";
            SType = "Text";
            Label = "Maturity/Expiry Reason";
        }
#IPDDEX
        OUT MIR-PRES-CNVR-FACE-AMT-T
        {
            Length = "15";
            DBTableName = "TCVG";
            SType = "Currency";
            Label = "Present Converted Face Amount";
        }
#IPDDEX
        OUT MIR-GP-CNVR-FACE-AMT-T
        {
            Length = "15";
            DBTableName = "Derived";
            SType = "Currency";
            Label = "Converted Face Amount for Guarantee Period";
        }
#  MP213T CHANGES STARTS HERE           
        OUT MIR-CVG-NUM-T
        {
            Length = "2"; 
            DBTableName = "TCVG";
            SType = "Text";
            Label = "Coverage Number";
        }
        
        OUT MIR-CVG-PRIM-GR-ID-T
        {
            Length = "2"; 
	    DBTableName = "TCVG";
	    SType = "Text";
            Label = "Primary Group ID";
        }
#  MP213T CHANGES ENDS HERE  
#  M21307 CHANGES STARTS HERE           
        OUT MIR-CVG-MAT-XPRY-DT-T
        {
            Length = "10"; 
	    DBTableName = "TCVG";
	    SType = " Date ";
            Label = "Coverage Maturity Expiry Date";
        }

#  M21307 CHANGES ENDS HERE          
    }
}
