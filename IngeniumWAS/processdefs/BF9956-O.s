# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF9956-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  PIRAEX  CTS      PIRA INGENIUM DATA EXTRACT                                *
#*  ACU080  CTS      ADD KANJI NAME FOR POLICY HOLDER(COMPANY)                 *
#*  ACU139  CTS      ADD MATURITY/EXPIRY REASON CODE AT RIDER LEVEL            *
#*  IPDDEX  CTS      ADD IPDD RIDER FILEDS AT CLIENT LEVEL AND RIDER LEVEL     *
#*  RPL017  CTS      ADD SUBTABLE CODE 3 ANd SUBTABLE CODE 4 FIELDS AT RIDER   *
#*                   LEVEL                                                     *
#*******************************************************************************
S-STEP BF9956-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Retrieve";
    DelEmptyRows;
    FocusField = "OKButton";
    FocusFrame = "ButtonFrame";
    Type = "Output";
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
    SType="Hidden";
  }

  IN MIR-POL-ID-BASE
  {
    DefaultSession = "MIR-POL-ID-BASE";
    DisplayOnly;
    Key;
    Label = "Policy ID";
    Length = "9";
    SType = "Text";
  }

  IN MIR-POL-ID-SFX
  {
    DefaultSession = "MIR-POL-ID-SFX";
    DisplayOnly;
    Key;
    Label = "Suffix";
    Length = "1";
    SType = "Text";
  }

  IN MIR-SERV-AGT-ID
  {
    DisplayOnly;
    Label = "Servicing Agent ID";
    Length = "6";
    SType = "Text";
  }

  MIR-POL-INFO
  {
    IN MIR-POL-APP-FORM-ID
    {
      DisplayOnly;
      Label = "Application Number";
      Length = "15";
      SType = "Text";
    }
    IN MIR-POL-ISS-EFF-DT
    {
      DisplayOnly;
      Label = "Policy Issue Date";
      Length = "10";
      SType = "Date";
    }
    IN MIR-PLAN-ID
    {
      DisplayOnly;
      Label = "Plan";
      Length = "6";
      SType = "Text";
    }
    IN MIR-PROD-APP-TYP-CD
    {
      DisplayOnly;
      Label = "Product Application Type";
      Length = "2";
      SType = "Text";
    }
    IN MIR-POL-ASIGN-IND
    {
      DisplayOnly;
      Label = "Policy Assigned Indicator";
      Length = "1";
      SType = "Text";
    }
    IN MIR-APPL-CTL-PRCES-DT
    {
      DisplayOnly;
      Label = "System Date";
      Length = "10";
      SType = "Date";
    }
    IN MIR-INSRD-NO
    {
      DisplayOnly;
      Label = "Insured Number";
      Length = "2";
      SType = "Text";
    }
  }

  MIR-PREM-INFO
  {
    IN MIR-POL-BILL-TYP-CD
    {
      DisplayOnly;
      Label = "Policy Billing Method";
      Length = "1";
      SType = "Text";
    }
    IN MIR-CLI-GR-TYP-CD
    {
      DisplayOnly;
      Label = "Group Size";
      Length = "1";
      SType = "Text";
    }
    IN MIR-POL-BILL-MODE-CD
    {
      DisplayOnly;
      Label = "Policy Billing Frequency";
      Length = "2";
      SType = "Text";
    }
    IN MIR-POL-SNDRY-AMT
    {
      DisplayOnly;
      Label = "Sundry Payment Amount";
      Length = "13";
      SType = "Currency";
    }
    IN MIR-POL-CV-EX-ESC-AMT
    {
      DisplayOnly;
      Label = "Cash Value Less ESC";
      Length = "17";
      SType = "Currency";
    }
    IN MIR-TOT-SA-PREM-AMT
    {
      DisplayOnly;
      Label = "SA Regular Premium";
      Length = "15";
      SType = "Currency";
    }
  }

  MIR-OWNER-INFO
  {
    IN MIR-CLI-ID
    {
      DisplayOnly;
      Label = "Client ID";
      Length = "10";
      SType = "Text";
    }
    IN MIR-CLI-CO-ENTR-NM
    {
      DisplayOnly;
      Label = "Company Name";
      Length = "50";
      SType = "Text";
    }
    IN MIR-KJ-CO-ENTR-NM
    {
      DisplayOnly;
      Label = "Kanji Company Name";
      Length = "50";
      SType = "Text";
    }
    IN MIR-KA-SUR-NM
    {
      DisplayOnly;
      Label = "Kana Sur Name";
      Length = "25";
      SType = "Text";
    }
    IN MIR-KA-GIV-NM
    {
      DisplayOnly;
      Label = "Kana Given Name";
      Length = "25";
      SType = "Text";
    }
    IN MIR-KJ-SUR-NM
    {
      DisplayOnly;
      Label = "Kanji Sur Name";
      Length = "25";
      SType = "Text";
    }
    IN MIR-KJ-GIV-NM
    {
      DisplayOnly;
      Label = "Kanji Giv Name";
      Length = "25";
      SType = "Text";
    }
    IN MIR-CLI-SEX-CD
    {
      DisplayOnly;
      Label = "Sex";
      Length = "1";
      SType = "Text";
    }
    IN MIR-CLI-BTH-DT
    {
      DisplayOnly;
      Label = "Birth Date";
      Length = "10";
      SType = "Text";
    }
    IN MIR-CLI-ADDR-LOC-CD
    {
      DisplayOnly;
      Label = "Address Code";
      Length = "8";
      SType = "Text";
    }
    IN MIR-CLI-PSTL-CD
    {
      DisplayOnly;
      Label = "Postal Code";
      Length = "9";
      SType = "Text";
    }
    IN MIR-CLI-PREFCT-TXT
    {
      DisplayOnly;
      Label = "Prefecture";
      Length = "11";
      SType = "Text";
    }
    IN MIR-CLI-CITY-NM-TXT
    {
      DisplayOnly;
      Label = "City";
      Length = "30";
      SType = "Text";
    }
    IN MIR-CLI-ADDR-LN-1-TXT
    {
      DisplayOnly;
      Label = "Address";
      Length = "30";
      SType = "Text";
    }
    IN MIR-CLI-ADDR-ADDL-TXT
    {
      DisplayOnly;
      Label = "Samakata-bu";
      Length = "60";
      SType = "Text";
    }
    IN MIR-CLI-CNTCT-ID-TXT
    {
      DisplayOnly;
      Label = "Identification Code";
      Length = "50";
      SType = "Text";
    }
  }

  MIR-INSRD-INFO-G[9]
  {
    ATTRIBUTES
    {
      GenRows = "0";
    }
    IN MIR-CLI-ID-T
    {
      DisplayOnly;
      Label = "Client ID";
      Length = "10";
      SType = "Text";
    }
    IN MIR-STCKR-ID-T
    {
      DisplayOnly;
      Label = "Sticker Number";
      Length = "11";
      SType = "Text";
    }
    IN MIR-CLI-CO-ENTR-NM-T
    {
      DisplayOnly;
      Label = "Company Name";
      Length = "50";
      SType = "Text";
    }
    IN MIR-KA-SUR-NM-T
    {
      DisplayOnly;
      Label = "Kana Sur Name";
      Length = "25";
      SType = "Text";
    }
    IN MIR-KA-GIV-NM-T
    {
      DisplayOnly;
      Label = "Kana Giv Name";
      Length = "25";
      SType = "Text";
    }
    IN MIR-KJ-SUR-NM-T
    {
      DisplayOnly;
      Label = "Kanji Sur Name";
      Length = "25";
      SType = "Text";
    }
    IN MIR-KJ-GIV-NM-T
    {
      DisplayOnly;
      Label = "Kanji Giv Name";
      Length = "25";
      SType = "Text";
    }
    IN MIR-CLI-SEX-CD-T
    {
      DisplayOnly;
      Label = "Sex";
      Length = "1";
      SType = "Text";
    }
    IN MIR-CLI-BTH-DT-T
    {
      DisplayOnly;
      Label = "Birth Date";
      Length = "10";
      SType = "Date";
    }
    IN MIR-BASE-INSRD-CD-T
    {
      DisplayOnly;
      Label = "Insured for Policy";
      Length = "1";
      SType = "Text";
    }
    IN MIR-OWNR-REL-INSR-CD-T
    {
      DisplayOnly;
      Label = "Relationship of Insured to Policy Owner";
      Length = "1";
      SType = "Text";
    }
    IN MIR-CLI-TCB-IND-T
    {
      DisplayOnly;
      Label = "Terminal Care Benefit";
      Length = "1";
      SType = "Text";
    }
    IN MIR-CLI-LNB-IND-T
    {
      DisplayOnly;
      Label = "Living Needs Benefit";
      Length = "1";
      SType = "Text";
    }
    IN MIR-CLI-ADDR-LOC-CD-T
    {
      DisplayOnly;
      Label = "Address Code";
      Length = "9";
      SType = "Text";
    }
    IN MIR-CLI-PSTL-CD-T
    {
      DisplayOnly;
      Label = "Postal Code";
      Length = "11";
      SType = "Text";
    }
    IN MIR-CLI-PREFCT-TXT-T
    {
      DisplayOnly;
      Label = "Prefecture";
      Length = "30";
      SType = "Text";
    }
    IN MIR-CLI-CITY-NM-TXT-T
    {
      DisplayOnly;
      Label = "City";
      Length = "30";
      SType = "Text";
    }
    IN MIR-CLI-ADDR-LN-1-TXT-T
    {
      DisplayOnly;
      Label = "Address";
      Length = "50";
      SType = "Text";
    }
    IN MIR-CLI-ADDR-ADDL-TXT-T
    {
      DisplayOnly;
      Label = "Samakata-bu";
      Length = "60";
      SType = "Text";
    }
    IN MIR-CLI-CNTCT-ID-TXT-T
    {
      DisplayOnly;
      Label = "Contact Information";
      Length = "50";
      SType = "Text";
    }
    IN MIR-BNFY-REL-INSRD-CD-T
    {
      DisplayOnly;
      Label = "Beneficiary's Relation to Insured";
      Length = "5";
      SType = "Text";
    }
    IN MIR-BNFY-COMP-NM-T
    {
      DisplayOnly;
      Label = "Beneficiary's Name";
      Length = "54";
      SType = "Text";
    }
    IN MIR-BNFY-SUR-NM-T
    {
      DisplayOnly;
      Label = "Beneficiary's Sur Name";
      Length = "27";
      SType = "Text";
    }
    IN MIR-BNFY-GIV-NM-T
    {
      DisplayOnly;
      Label = "Beneficiary's Given Name";
      Length = "27";
      SType = "Text";
    }
    IN MIR-BNFY-PRCDS-PCT-T
    {
      DisplayOnly;
      Label = "Percentage";
      Length = "3";
      SType = "Number";
    }
    IN MIR-BNFY-REL-INSRD-CD1-T
    {
      DisplayOnly;
      Label = "Proxy Beneficiary's Relation to Insured";
      Length = "5";
      SType = "Text";
    }
    IN MIR-BNFY-SUR-NM1-T
    {
      DisplayOnly;
      Label = "Proxy Beneficiary's Sur Name";
      Length = "27";
      SType = "Text";
    }
    IN MIR-BNFY-GIV-NM1-T
    {
      DisplayOnly;
      Label = "Proxy Beneficiary's Given Name";
      Length = "27";
      SType = "Text";
    }
#IPDDEX
    IN MIR-BNFY-REL-INSRD-CD2-T
    {
      DisplayOnly;
      Label = "Death Monthly Benefit Beneficiary's Relation to Insured";
      Length = "5";
      SType = "Text";
    }
#IPDDEX
    IN MIR-BNFY-COMP-NM2-T
    {
      DisplayOnly;
      Label = "Death Monthly Beneficiary Company's Name";
      Length = "54";
      SType = "Text";
    }
#IPDDEX
    IN MIR-BNFY-SUR-NM2-T
    {
      DisplayOnly;
      Label = "Death Monthly Benefit Beneficiary's Sur Name";
      Length = "27";
      SType = "Text";
    }
#IPDDEX
    IN MIR-BNFY-GIV-NM2-T
    {
      DisplayOnly;
      Label = "Death Monthly Benefit Beneficiary's Given Name";
      Length = "27";
      SType = "Text";
    }
#IPDDEX
    IN MIR-BNFY-PRCDS-PCT2-T
    {
      DisplayOnly;
      Label = "Death Monthly Benefit Percentage";
      Length = "3";
      SType = "Number";
    }
  }

  MIR-RIDER-INFO-G[99]
  {
    ATTRIBUTES
    {
      GenRows = "0";
    }
    IN MIR-CVG-PLAN-ID-T
    {
      DisplayOnly;
      Label = "Plan";
      Length = "6";
      SType = "Text";
    }
    IN MIR-CVG-FACE-AMT-T
    {
      DisplayOnly;
      Label = "Face Amount";
      Length = "15";
      SType = "Currency";
    }
    IN MIR-CVG-STBL-1-CD-T
    {
      DisplayOnly;
      Label = "Sub-table 1";
      Length = "2";
      SType = "Text";
    }
    IN MIR-CVG-STBL-2-CD-T
    {
      DisplayOnly;
      Label = "Sub-table 2";
      Length = "3";
      SType = "Text";
    }
#*  RPL017- PIRA e-Links changes start
    IN MIR-CVG-STBL-3-CD-T
    {
      DisplayOnly;
      Label = "Sub-table 3";
      Length = "5";
      SType = "Text";
    }
    IN MIR-CVG-STBL-4-CD-T
    {
      DisplayOnly;
      Label = "Sub-table 4";
      Length = "2";
      SType = "Text";
    }
#*  RPL017- PIRA e-Links changes end
    IN MIR-CVG-BASIC-PREM-AMT-T
    {
      DisplayOnly;
      Label = "Annual Premium";
      Length = "13";
      SType = "Currency";
    }
    IN MIR-CVG-ISS-EFF-DT-T
    {
      DisplayOnly;
      Label = "Issue Date";
      Length = "10";
      SType = "Date";
    }
    IN MIR-CVG-ME-PREM-AMT-T
    {
      DisplayOnly;
      Label = "Multiple / Mortality Extra Premium";
      Length = "13";
      SType = "Currency";
    }
    IN MIR-CVG-CSTAT-CD-T
    {
      DisplayOnly;
      Label = "Coverage Status";
      Length = "3";
      SType = "Text";
    }
    IN MIR-CVG-CLI-ID-T
    {
      DisplayOnly;
      Label = "Client ID";
      Length = "10";
      SType = "Text";
    }
    IN MIR-CVG-ALLOC-AMT-T
    {
      DisplayOnly;
      Label = "Coverage Level SA Premium";
      Length = "15";
      SType = "Currency";
    }
                IN MIR-MAT-XPRY-REASN-CD-T
                {
                        DisplayOnly;
                        Length = "2";
                        SType = "Text";
                        Label = "Maturity/Expiry Reason";
                }
#IPDDEX
          IN MIR-PRES-CNVR-FACE-AMT-T
          {
                Length = "15";
                DBTableName = "TCVG";
                SType = "Currency";
                Label = "Present Converted Face Amount";
          }
#IPDDEX
          IN MIR-GP-CNVR-FACE-AMT-T
          {
                Length = "15";
                DBTableName = "Derived";
                SType = "Currency";
                Label = "Converted Face Amount for Guarantee Period";
          }

  }
}
