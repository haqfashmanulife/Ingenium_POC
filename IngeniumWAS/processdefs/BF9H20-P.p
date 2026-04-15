# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:17 PM EDT

#*******************************************************************************
#*  Component:   BF9H20-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYDM29  CTS      Unisys Benefit History Inquiry Screen                     *
#*                                                                             *
#*******************************************************************************

P-STEP BF9H20-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9H20";
        BusinessFunctionName = "Unisys Benefit History Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9H20";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID
    {
        Key;
        Mandatory;
        Length = "7";
        DBTableName = "TU3BH";
        DefaultSession = "MIR-POL-ID";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    INOUT MIR-LARG-TYP-CD
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Large type CD";
    }
     
    OUT MIR-HIST-NUM-1
    {
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }

    OUT MIR-RO-CD-1
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }

    OUT MIR-JRNL-DT-1
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
	
    OUT MIR-BNFT-CAT-CD-1
    {
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }

    OUT MIR-NO-OF-PAYOUT-1
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    OUT MIR-DIS-CD-1
    {
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    OUT MIR-HOSP-STRT-DT-1
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    OUT MIR-HOSP-END-DT-1
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    OUT MIR-NO-OF-ADV-PAYOUT-1
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    OUT MIR-NO-OF-EXCLU-DAYS-1
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }

    OUT MIR-NO-OF-PAYOUT-MD-1
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }

    OUT MIR-PRCES-CD-1
    {
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }

    OUT MIR-SUR-DT-1
    {
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }

    OUT MIR-SUR-CD-1
    {
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }

    OUT MIR-SUR-BNFT-MULT-1
    {
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }

    OUT MIR-SUR-BNFT-AMT-1
    {
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }

    OUT MIR-CAN-MNTH-BNFT-AMT-1
    {
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }

    OUT MIR-HOSP-BNFT-AMT-1
    {
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }

    OUT MIR-LT-BNFT-AMT-1
    {
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }

    OUT MIR-LS-DIS-BNFT-AMT-1
    {
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }

    OUT MIR-DISC-BNFT-AMT-1
    {
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }

    OUT MIR-RCVR-BNFT-RFND-1
    {
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }

    OUT MIR-HLTH-BNFT-RFND-1
    {
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }

    OUT MIR-DISB-BNFT-AMT-1
    {
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }

    OUT MIR-DISA-GR-1
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }

    OUT MIR-DISA-NUM-1
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }

    OUT MIR-DISB-FIX-DT-1
    {
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }

    OUT MIR-CNFM-CD-1
    {
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }

    OUT MIR-FMLY-TYP-RID-CD-1
    {
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }

    OUT MIR-FMLY-NM-1
    {
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }

    OUT MIR-ACCI-OUT-STRT-DT-1
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }

    OUT MIR-ACCI-OUT-END-DT-1
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }

    OUT MIR-ACCI-EFF-DT-1
    {
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }

    OUT MIR-NO-OF-ACCI-DAYS-1
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }

    OUT MIR-NO-OF-ACCI-DAYS-EXCLU-1
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }

    OUT MIR-NO-OF-ACCI-BNFT-PAY-DAYS-1
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }

    OUT MIR-ACCI-OUT-BNFT-AMT-1
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    OUT MIR-NO-OF-OUT-DAYS-EXCLU-1
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    OUT MIR-ACCI-CD-1
    {
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }

    OUT MIR-CLI-NM-1
    {
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }

    OUT MIR-OUT-START-DT-1
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }

    OUT MIR-OUT-END-DT-1
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }

    OUT MIR-NO-OF-OP-DAYS-1
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }

    OUT MIR-NO-OF-OP-BNFT-PAY-DAYS-1
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }

    OUT MIR-OP-BNFT-AMT-1
    {
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }

    OUT MIR-NO-OF-LT-HOSP-DAYS-1
    {
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }

    OUT MIR-NO-OF-LT-HOSP-PAY-DAYS-1
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }

    OUT MIR-UW-INFO-1
    {
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }

    OUT MIR-CLI-ID-1
    {
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }

    OUT MIR-SHRT-HOSP-BNFT-AMT-1
    {
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }
    OUT MIR-SHRT-HOSP-PAY-DAYS-1
    {
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }

    OUT MIR-HIST-NUM-2
    {
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }
    
    OUT MIR-RO-CD-2
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }
    
    OUT MIR-JRNL-DT-2
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
    
    OUT MIR-BNFT-CAT-CD-2
    {
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }
    
    OUT MIR-NO-OF-PAYOUT-2
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    OUT MIR-DIS-CD-2
    {
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    OUT MIR-HOSP-STRT-DT-2
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    OUT MIR-HOSP-END-DT-2
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    OUT MIR-NO-OF-ADV-PAYOUT-2
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    OUT MIR-NO-OF-EXCLU-DAYS-2
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    
    OUT MIR-NO-OF-PAYOUT-MD-2
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }
    
    OUT MIR-PRCES-CD-2
    {
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    OUT MIR-SUR-DT-2
    {
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }
    
    OUT MIR-SUR-CD-2
    {
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }
    
    OUT MIR-SUR-BNFT-MULT-2
    {
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }
    
    OUT MIR-SUR-BNFT-AMT-2
    {
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }
    
    OUT MIR-CAN-MNTH-BNFT-AMT-2
    {
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }
    
    OUT MIR-HOSP-BNFT-AMT-2
    {
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }
    
    OUT MIR-LT-BNFT-AMT-2
    {
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }
    
    OUT MIR-LS-DIS-BNFT-AMT-2
    {
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }
    
    OUT MIR-DISC-BNFT-AMT-2
    {
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }
    
    OUT MIR-RCVR-BNFT-RFND-2
    {
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }
    
    OUT MIR-HLTH-BNFT-RFND-2
    {
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }
    
    OUT MIR-DISB-BNFT-AMT-2
    {
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }
    
    OUT MIR-DISA-GR-2
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }
    
    OUT MIR-DISA-NUM-2
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }
    
    OUT MIR-DISB-FIX-DT-2
    {
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }
    
    OUT MIR-CNFM-CD-2
    {
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }
    
    OUT MIR-FMLY-TYP-RID-CD-2
    {
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }
    
    OUT MIR-FMLY-NM-2
    {
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }
    
    OUT MIR-ACCI-OUT-STRT-DT-2
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }
    
    OUT MIR-ACCI-OUT-END-DT-2
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }
    
    OUT MIR-ACCI-EFF-DT-2
    {
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-2
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-EXCLU-2
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }
    
    OUT MIR-NO-OF-ACCI-BNFT-PAY-DAYS-2
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }
    
    OUT MIR-ACCI-OUT-BNFT-AMT-2
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-OUT-DAYS-EXCLU-2
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-ACCI-CD-2
    {
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }
    
    OUT MIR-CLI-NM-2
    {
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }
    
    OUT MIR-OUT-START-DT-2
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }
    
    OUT MIR-OUT-END-DT-2
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }
    
    OUT MIR-NO-OF-OP-DAYS-2
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }
    
    OUT MIR-NO-OF-OP-BNFT-PAY-DAYS-2
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }
    
    OUT MIR-OP-BNFT-AMT-2
    {
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-LT-HOSP-DAYS-2
    {
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }
    
    OUT MIR-NO-OF-LT-HOSP-PAY-DAYS-2
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }
    
    OUT MIR-UW-INFO-2
    {
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }
    
    OUT MIR-CLI-ID-2
    {
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }
    
    OUT MIR-SHRT-HOSP-BNFT-AMT-2
    {
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }
    
    OUT MIR-SHRT-HOSP-PAY-DAYS-2
    {
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }

    OUT MIR-HIST-NUM-3
    {
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }
    
    OUT MIR-RO-CD-3
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }
    
    OUT MIR-JRNL-DT-3
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
    
    OUT MIR-BNFT-CAT-CD-3
    {
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }
    
    OUT MIR-NO-OF-PAYOUT-3
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    OUT MIR-DIS-CD-3
    {
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    OUT MIR-HOSP-STRT-DT-3
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    OUT MIR-HOSP-END-DT-3
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    OUT MIR-NO-OF-ADV-PAYOUT-3
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    OUT MIR-NO-OF-EXCLU-DAYS-3
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    
    OUT MIR-NO-OF-PAYOUT-MD-3
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }
    
    OUT MIR-PRCES-CD-3
    {
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    OUT MIR-SUR-DT-3
    {
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }
    
    OUT MIR-SUR-CD-3
    {
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }
    
    OUT MIR-SUR-BNFT-MULT-3
    {
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }
    
    OUT MIR-SUR-BNFT-AMT-3
    {
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }
    
    OUT MIR-CAN-MNTH-BNFT-AMT-3
    {
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }
    
    OUT MIR-HOSP-BNFT-AMT-3
    {
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }
    
    OUT MIR-LT-BNFT-AMT-3
    {
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }
    
    OUT MIR-LS-DIS-BNFT-AMT-3
    {
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }
    
    OUT MIR-DISC-BNFT-AMT-3
    {
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }
    
    OUT MIR-RCVR-BNFT-RFND-3
    {
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }
    
    OUT MIR-HLTH-BNFT-RFND-3
    {
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }
    
    OUT MIR-DISB-BNFT-AMT-3
    {
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }
    
    OUT MIR-DISA-GR-3
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }
    
    OUT MIR-DISA-NUM-3
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }
    
    OUT MIR-DISB-FIX-DT-3
    {
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }
    
    OUT MIR-CNFM-CD-3
    {
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }
    
    OUT MIR-FMLY-TYP-RID-CD-3
    {
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }
    
    OUT MIR-FMLY-NM-3
    {
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }
    
    OUT MIR-ACCI-OUT-STRT-DT-3
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }
    
    OUT MIR-ACCI-OUT-END-DT-3
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }
    
    OUT MIR-ACCI-EFF-DT-3
    {
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-3
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-EXCLU-3
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }
    
    OUT MIR-NO-OF-ACCI-BNFT-PAY-DAYS-3
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }
    
    OUT MIR-ACCI-OUT-BNFT-AMT-3
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-OUT-DAYS-EXCLU-3
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-ACCI-CD-3
    {
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }
    
    OUT MIR-CLI-NM-3
    {
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }
    
    OUT MIR-OUT-START-DT-3
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }
    
    OUT MIR-OUT-END-DT-3
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }
    
    OUT MIR-NO-OF-OP-DAYS-3
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }
    
    OUT MIR-NO-OF-OP-BNFT-PAY-DAYS-3
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }
    
    OUT MIR-OP-BNFT-AMT-3
    {
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-LT-HOSP-DAYS-3
    {
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }
    
    OUT MIR-NO-OF-LT-HOSP-PAY-DAYS-3
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }
    
    OUT MIR-UW-INFO-3
    {
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }
    
    OUT MIR-CLI-ID-3
    {
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }
    
    OUT MIR-SHRT-HOSP-BNFT-AMT-3
    {
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }
    
    OUT MIR-SHRT-HOSP-PAY-DAYS-3
    {
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }
    
    OUT MIR-HIST-NUM-4
    {
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }
    
    OUT MIR-RO-CD-4
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }
    
    OUT MIR-JRNL-DT-4
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
    
    OUT MIR-BNFT-CAT-CD-4
    {
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }
    
    OUT MIR-NO-OF-PAYOUT-4
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    OUT MIR-DIS-CD-4
    {
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    OUT MIR-HOSP-STRT-DT-4
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    OUT MIR-HOSP-END-DT-4
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    OUT MIR-NO-OF-ADV-PAYOUT-4
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    OUT MIR-NO-OF-EXCLU-DAYS-4
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    
    OUT MIR-NO-OF-PAYOUT-MD-4
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }
    
    OUT MIR-PRCES-CD-4
    {
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    OUT MIR-SUR-DT-4
    {
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }
    
    OUT MIR-SUR-CD-4
    {
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }
    
    OUT MIR-SUR-BNFT-MULT-4
    {
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }
    
    OUT MIR-SUR-BNFT-AMT-4
    {
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }
    
    OUT MIR-CAN-MNTH-BNFT-AMT-4
    {
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }
    
    OUT MIR-HOSP-BNFT-AMT-4
    {
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }
    
    OUT MIR-LT-BNFT-AMT-4
    {
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }
    
    OUT MIR-LS-DIS-BNFT-AMT-4
    {
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }
    
    OUT MIR-DISC-BNFT-AMT-4
    {
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }
    
    OUT MIR-RCVR-BNFT-RFND-4
    {
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }
    
    OUT MIR-HLTH-BNFT-RFND-4
    {
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }
    
    OUT MIR-DISB-BNFT-AMT-4
    {
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }
    
    OUT MIR-DISA-GR-4
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }
    
    OUT MIR-DISA-NUM-4
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }
    
    OUT MIR-DISB-FIX-DT-4
    {
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }
    
    OUT MIR-CNFM-CD-4
    {
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }
    
    OUT MIR-FMLY-TYP-RID-CD-4
    {
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }
    
    OUT MIR-FMLY-NM-4
    {
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }
    
    OUT MIR-ACCI-OUT-STRT-DT-4
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }
    
    OUT MIR-ACCI-OUT-END-DT-4
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }
    
    OUT MIR-ACCI-EFF-DT-4
    {
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-4
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-EXCLU-4
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }
    
    OUT MIR-NO-OF-ACCI-BNFT-PAY-DAYS-4
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }
    
    OUT MIR-ACCI-OUT-BNFT-AMT-4
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-OUT-DAYS-EXCLU-4
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-ACCI-CD-4
    {
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }
    
    OUT MIR-CLI-NM-4
    {
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }
    
    OUT MIR-OUT-START-DT-4
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }
    
    OUT MIR-OUT-END-DT-4
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }
    
    OUT MIR-NO-OF-OP-DAYS-4
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }
    
    OUT MIR-NO-OF-OP-BNFT-PAY-DAYS-4
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }
    
    OUT MIR-OP-BNFT-AMT-4
    {
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-LT-HOSP-DAYS-4
    {
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }
    
    OUT MIR-NO-OF-LT-HOSP-PAY-DAYS-4
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }
    
    OUT MIR-UW-INFO-4
    {
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }
    
    OUT MIR-CLI-ID-4
    {
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }
    
    OUT MIR-SHRT-HOSP-BNFT-AMT-4
    {
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }
    
    OUT MIR-SHRT-HOSP-PAY-DAYS-4
    {
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }
     
    OUT MIR-HIST-NUM-5
    {
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }
    
    OUT MIR-RO-CD-5
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }
    
    OUT MIR-JRNL-DT-5
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
    
    OUT MIR-BNFT-CAT-CD-5
    {
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }
    
    OUT MIR-NO-OF-PAYOUT-5
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    OUT MIR-DIS-CD-5
    {
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    OUT MIR-HOSP-STRT-DT-5
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    OUT MIR-HOSP-END-DT-5
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    OUT MIR-NO-OF-ADV-PAYOUT-5
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    OUT MIR-NO-OF-EXCLU-DAYS-5
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    
    OUT MIR-NO-OF-PAYOUT-MD-5
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }
    
    OUT MIR-PRCES-CD-5
    {
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    OUT MIR-SUR-DT-5
    {
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }
    
    OUT MIR-SUR-CD-5
    {
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }
    
    OUT MIR-SUR-BNFT-MULT-5
    {
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }
    
    OUT MIR-SUR-BNFT-AMT-5
    {
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }
    
    OUT MIR-CAN-MNTH-BNFT-AMT-5
    {
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }
    
    OUT MIR-HOSP-BNFT-AMT-5
    {
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }
    
    OUT MIR-LT-BNFT-AMT-5
    {
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }
    
    OUT MIR-LS-DIS-BNFT-AMT-5
    {
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }
    
    OUT MIR-DISC-BNFT-AMT-5
    {
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }
    
    OUT MIR-RCVR-BNFT-RFND-5
    {
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }
    
    OUT MIR-HLTH-BNFT-RFND-5
    {
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }
    
    OUT MIR-DISB-BNFT-AMT-5
    {
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }
    
    OUT MIR-DISA-GR-5
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }
    
    OUT MIR-DISA-NUM-5
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }
    
    OUT MIR-DISB-FIX-DT-5
    {
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }
    
    OUT MIR-CNFM-CD-5
    {
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }
    
    OUT MIR-FMLY-TYP-RID-CD-5
    {
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }
    
    OUT MIR-FMLY-NM-5
    {
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }
    
    OUT MIR-ACCI-OUT-STRT-DT-5
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }
    
    OUT MIR-ACCI-OUT-END-DT-5
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }
    
    OUT MIR-ACCI-EFF-DT-5
    {
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-5
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-EXCLU-5
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }
    
    OUT MIR-NO-OF-ACCI-BNFT-PAY-DAYS-5
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }
    
    OUT MIR-ACCI-OUT-BNFT-AMT-5
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-OUT-DAYS-EXCLU-5
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-ACCI-CD-5
    {
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }
    
    OUT MIR-CLI-NM-5
    {
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }
    
    OUT MIR-OUT-START-DT-5
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }
    
    OUT MIR-OUT-END-DT-5
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }
    
    OUT MIR-NO-OF-OP-DAYS-5
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }
    
    OUT MIR-NO-OF-OP-BNFT-PAY-DAYS-5
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }
    
    OUT MIR-OP-BNFT-AMT-5
    {
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-LT-HOSP-DAYS-5
    {
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }
    
    OUT MIR-NO-OF-LT-HOSP-PAY-DAYS-5
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }
    
    OUT MIR-UW-INFO-5
    {
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }
    
    OUT MIR-CLI-ID-5
    {
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }
    
    OUT MIR-SHRT-HOSP-BNFT-AMT-5
    {
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }
    
    OUT MIR-SHRT-HOSP-PAY-DAYS-5
    {
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }
    
    OUT MIR-HIST-NUM-6
    {
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }
    
    OUT MIR-RO-CD-6
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }
    
    OUT MIR-JRNL-DT-6
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
    
    OUT MIR-BNFT-CAT-CD-6
    {
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }
    
    OUT MIR-NO-OF-PAYOUT-6
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    OUT MIR-DIS-CD-6
    {
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    OUT MIR-HOSP-STRT-DT-6
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    OUT MIR-HOSP-END-DT-6
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    OUT MIR-NO-OF-ADV-PAYOUT-6
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    OUT MIR-NO-OF-EXCLU-DAYS-6
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    
    OUT MIR-NO-OF-PAYOUT-MD-6
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }
    
    OUT MIR-PRCES-CD-6
    {
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    OUT MIR-SUR-DT-6
    {
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }
    
    OUT MIR-SUR-CD-6
    {
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }
    
    OUT MIR-SUR-BNFT-MULT-6
    {
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }
    
    OUT MIR-SUR-BNFT-AMT-6
    {
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }
    
    OUT MIR-CAN-MNTH-BNFT-AMT-6
    {
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }
    
    OUT MIR-HOSP-BNFT-AMT-6
    {
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }
    
    OUT MIR-LT-BNFT-AMT-6
    {
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }
    
    OUT MIR-LS-DIS-BNFT-AMT-6
    {
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }
    
    OUT MIR-DISC-BNFT-AMT-6
    {
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }
    
    OUT MIR-RCVR-BNFT-RFND-6
    {
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }
    
    OUT MIR-HLTH-BNFT-RFND-6
    {
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }
    
    OUT MIR-DISB-BNFT-AMT-6
    {
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }
    
    OUT MIR-DISA-GR-6
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }
    
    OUT MIR-DISA-NUM-6
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }
    
    OUT MIR-DISB-FIX-DT-6
    {
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }
    
    OUT MIR-CNFM-CD-6
    {
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }
    
    OUT MIR-FMLY-TYP-RID-CD-6
    {
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }
    
    OUT MIR-FMLY-NM-6
    {
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }
    
    OUT MIR-ACCI-OUT-STRT-DT-6
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }
    
    OUT MIR-ACCI-OUT-END-DT-6
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }
    
    OUT MIR-ACCI-EFF-DT-6
    {
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-6
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-EXCLU-6
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }
    
    OUT MIR-NO-OF-ACCI-BNFT-PAY-DAYS-6
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }
    
    OUT MIR-ACCI-OUT-BNFT-AMT-6
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-OUT-DAYS-EXCLU-6
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-ACCI-CD-6
    {
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }
    
    OUT MIR-CLI-NM-6
    {
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }
    
    OUT MIR-OUT-START-DT-6
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }
    
    OUT MIR-OUT-END-DT-6
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }
    
    OUT MIR-NO-OF-OP-DAYS-6
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }
    
    OUT MIR-NO-OF-OP-BNFT-PAY-DAYS-6
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }
    
    OUT MIR-OP-BNFT-AMT-6
    {
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-LT-HOSP-DAYS-6
    {
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }
    
    OUT MIR-NO-OF-LT-HOSP-PAY-DAYS-6
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }
    
    OUT MIR-UW-INFO-6
    {
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }
    
    OUT MIR-CLI-ID-6
    {
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }
    
    OUT MIR-SHRT-HOSP-BNFT-AMT-6
    {
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }
    
    OUT MIR-SHRT-HOSP-PAY-DAYS-6
    {
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }
    
    OUT MIR-HIST-NUM-7
    {
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }
    
    OUT MIR-RO-CD-7
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }
    
    OUT MIR-JRNL-DT-7
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
    
    OUT MIR-BNFT-CAT-CD-7
    {
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }
    
    OUT MIR-NO-OF-PAYOUT-7
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    OUT MIR-DIS-CD-7
    {
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    OUT MIR-HOSP-STRT-DT-7
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    OUT MIR-HOSP-END-DT-7
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    OUT MIR-NO-OF-ADV-PAYOUT-7
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    OUT MIR-NO-OF-EXCLU-DAYS-7
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    
    OUT MIR-NO-OF-PAYOUT-MD-7
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }
    
    OUT MIR-PRCES-CD-7
    {
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    OUT MIR-SUR-DT-7
    {
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }
    
    OUT MIR-SUR-CD-7
    {
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }
    
    OUT MIR-SUR-BNFT-MULT-7
    {
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }
    
    OUT MIR-SUR-BNFT-AMT-7
    {
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }
    
    OUT MIR-CAN-MNTH-BNFT-AMT-7
    {
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }
    
    OUT MIR-HOSP-BNFT-AMT-7
    {
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }
    
    OUT MIR-LT-BNFT-AMT-7
    {
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }
    
    OUT MIR-LS-DIS-BNFT-AMT-7
    {
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }
    
    OUT MIR-DISC-BNFT-AMT-7
    {
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }
    
    OUT MIR-RCVR-BNFT-RFND-7
    {
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }
    
    OUT MIR-HLTH-BNFT-RFND-7
    {
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }
    
    OUT MIR-DISB-BNFT-AMT-7
    {
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }
    
    OUT MIR-DISA-GR-7
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }
    
    OUT MIR-DISA-NUM-7
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }
    
    OUT MIR-DISB-FIX-DT-7
    {
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }
    
    OUT MIR-CNFM-CD-7
    {
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }
    
    OUT MIR-FMLY-TYP-RID-CD-7
    {
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }
    
    OUT MIR-FMLY-NM-7
    {
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }
    
    OUT MIR-ACCI-OUT-STRT-DT-7
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }
    
    OUT MIR-ACCI-OUT-END-DT-7
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }
    
    OUT MIR-ACCI-EFF-DT-7
    {
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-7
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-EXCLU-7
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }
    
    OUT MIR-NO-OF-ACCI-BNFT-PAY-DAYS-7
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }
    
    OUT MIR-ACCI-OUT-BNFT-AMT-7
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-OUT-DAYS-EXCLU-7
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-ACCI-CD-7
    {
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }
    
    OUT MIR-CLI-NM-7
    {
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }
    
    OUT MIR-OUT-START-DT-7
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }
    
    OUT MIR-OUT-END-DT-7
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }
    
    OUT MIR-NO-OF-OP-DAYS-7
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }
    
    OUT MIR-NO-OF-OP-BNFT-PAY-DAYS-7
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }
    
    OUT MIR-OP-BNFT-AMT-7
    {
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-LT-HOSP-DAYS-7
    {
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }
    
    OUT MIR-NO-OF-LT-HOSP-PAY-DAYS-7
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }
    
    OUT MIR-UW-INFO-7
    {
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }
    
    OUT MIR-CLI-ID-7
    {
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }
    
    OUT MIR-SHRT-HOSP-BNFT-AMT-7
    {
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }
    
    OUT MIR-SHRT-HOSP-PAY-DAYS-7
    {
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }
    
     
    OUT MIR-HIST-NUM-8
    {
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }
    
    OUT MIR-RO-CD-8
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }
    
    OUT MIR-JRNL-DT-8
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
    
    OUT MIR-BNFT-CAT-CD-8
    {
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }
    
    OUT MIR-NO-OF-PAYOUT-8
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    OUT MIR-DIS-CD-8
    {
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    OUT MIR-HOSP-STRT-DT-8
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    OUT MIR-HOSP-END-DT-8
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    OUT MIR-NO-OF-ADV-PAYOUT-8
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    OUT MIR-NO-OF-EXCLU-DAYS-8
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    
    OUT MIR-NO-OF-PAYOUT-MD-8
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }
    
    OUT MIR-PRCES-CD-8
    {
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    OUT MIR-SUR-DT-8
    {
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }
    
    OUT MIR-SUR-CD-8
    {
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }
    
    OUT MIR-SUR-BNFT-MULT-8
    {
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }
    
    OUT MIR-SUR-BNFT-AMT-8
    {
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }
    
    OUT MIR-CAN-MNTH-BNFT-AMT-8
    {
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }
    
    OUT MIR-HOSP-BNFT-AMT-8
    {
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }
    
    OUT MIR-LT-BNFT-AMT-8
    {
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }
    
    OUT MIR-LS-DIS-BNFT-AMT-8
    {
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }
    
    OUT MIR-DISC-BNFT-AMT-8
    {
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }
    
    OUT MIR-RCVR-BNFT-RFND-8
    {
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }
    
    OUT MIR-HLTH-BNFT-RFND-8
    {
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }
    
    OUT MIR-DISB-BNFT-AMT-8
    {
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }
    
    OUT MIR-DISA-GR-8
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }
    
    OUT MIR-DISA-NUM-8
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }
    
    OUT MIR-DISB-FIX-DT-8
    {
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }
    
    OUT MIR-CNFM-CD-8
    {
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }
    
    OUT MIR-FMLY-TYP-RID-CD-8
    {
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }
    
    OUT MIR-FMLY-NM-8
    {
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }
    
    OUT MIR-ACCI-OUT-STRT-DT-8
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }
    
    OUT MIR-ACCI-OUT-END-DT-8
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }
    
    OUT MIR-ACCI-EFF-DT-8
    {
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-8
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-EXCLU-8
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }
    
    OUT MIR-NO-OF-ACCI-BNFT-PAY-DAYS-8
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }
    
    OUT MIR-ACCI-OUT-BNFT-AMT-8
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-OUT-DAYS-EXCLU-8
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-ACCI-CD-8
    {
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }
    
    OUT MIR-CLI-NM-8
    {
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }
    
    OUT MIR-OUT-START-DT-8
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }
    
    OUT MIR-OUT-END-DT-8
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }
    
    OUT MIR-NO-OF-OP-DAYS-8
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }
    
    OUT MIR-NO-OF-OP-BNFT-PAY-DAYS-8
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }
    
    OUT MIR-OP-BNFT-AMT-8
    {
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-LT-HOSP-DAYS-8
    {
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }
    
    OUT MIR-NO-OF-LT-HOSP-PAY-DAYS-8
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }
    
    OUT MIR-UW-INFO-8
    {
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }
    
    OUT MIR-CLI-ID-8
    {
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }
    
    OUT MIR-SHRT-HOSP-BNFT-AMT-8
    {
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }
    
    OUT MIR-SHRT-HOSP-PAY-DAYS-8
    {
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }
    
    OUT MIR-HIST-NUM-9
    {
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }
    
    OUT MIR-RO-CD-9
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }
    
    OUT MIR-JRNL-DT-9
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
    
    OUT MIR-BNFT-CAT-CD-9
    {
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }
    
    OUT MIR-NO-OF-PAYOUT-9
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    OUT MIR-DIS-CD-9
    {
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    OUT MIR-HOSP-STRT-DT-9
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    OUT MIR-HOSP-END-DT-9
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    OUT MIR-NO-OF-ADV-PAYOUT-9
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    OUT MIR-NO-OF-EXCLU-DAYS-9
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    
    OUT MIR-NO-OF-PAYOUT-MD-9
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }
    
    OUT MIR-PRCES-CD-9
    {
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    OUT MIR-SUR-DT-9
    {
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }
    
    OUT MIR-SUR-CD-9
    {
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }
    
    OUT MIR-SUR-BNFT-MULT-9
    {
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }
    
    OUT MIR-SUR-BNFT-AMT-9
    {
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }
    
    OUT MIR-CAN-MNTH-BNFT-AMT-9
    {
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }
    
    OUT MIR-HOSP-BNFT-AMT-9
    {
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }
    
    OUT MIR-LT-BNFT-AMT-9
    {
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }
    
    OUT MIR-LS-DIS-BNFT-AMT-9
    {
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }
    
    OUT MIR-DISC-BNFT-AMT-9
    {
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }
    
    OUT MIR-RCVR-BNFT-RFND-9
    {
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }
    
    OUT MIR-HLTH-BNFT-RFND-9
    {
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }
    
    OUT MIR-DISB-BNFT-AMT-9
    {
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }
    
    OUT MIR-DISA-GR-9
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }
    
    OUT MIR-DISA-NUM-9
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }
    
    OUT MIR-DISB-FIX-DT-9
    {
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }
    
    OUT MIR-CNFM-CD-9
    {
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }
    
    OUT MIR-FMLY-TYP-RID-CD-9
    {
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }
    
    OUT MIR-FMLY-NM-9
    {
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }
    
    OUT MIR-ACCI-OUT-STRT-DT-9
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }
    
    OUT MIR-ACCI-OUT-END-DT-9
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }
    
    OUT MIR-ACCI-EFF-DT-9
    {
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-9
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-EXCLU-9
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }
    
    OUT MIR-NO-OF-ACCI-BNFT-PAY-DAYS-9
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }
    
    OUT MIR-ACCI-OUT-BNFT-AMT-9
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-OUT-DAYS-EXCLU-9
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-ACCI-CD-9
    {
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }
    
    OUT MIR-CLI-NM-9
    {
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }
    
    OUT MIR-OUT-START-DT-9
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }
    
    OUT MIR-OUT-END-DT-9
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }
    
    OUT MIR-NO-OF-OP-DAYS-9
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }
    
    OUT MIR-NO-OF-OP-BNFT-PAY-DAYS-9
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }
    
    OUT MIR-OP-BNFT-AMT-9
    {
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-LT-HOSP-DAYS-9
    {
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }
    
    OUT MIR-NO-OF-LT-HOSP-PAY-DAYS-9
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }
    
    OUT MIR-UW-INFO-9
    {
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }
    
    OUT MIR-CLI-ID-9
    {
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }
    
    OUT MIR-SHRT-HOSP-BNFT-AMT-9
    {
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }
    
    OUT MIR-SHRT-HOSP-PAY-DAYS-9
    {
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }
    
    OUT MIR-HIST-NUM-10
    {
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }
    
    OUT MIR-RO-CD-10
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }
    
    OUT MIR-JRNL-DT-10
    {
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
    
    OUT MIR-BNFT-CAT-CD-10
    {
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }
    
    OUT MIR-NO-OF-PAYOUT-10
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    OUT MIR-DIS-CD-10
    {
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    OUT MIR-HOSP-STRT-DT-10
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    OUT MIR-HOSP-END-DT-10
    {
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    OUT MIR-NO-OF-ADV-PAYOUT-10
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    OUT MIR-NO-OF-EXCLU-DAYS-10
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    
    OUT MIR-NO-OF-PAYOUT-MD-10
    {
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }
    
    OUT MIR-PRCES-CD-10
    {
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    OUT MIR-SUR-DT-10
    {
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }
    
    OUT MIR-SUR-CD-10
    {
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }
    
    OUT MIR-SUR-BNFT-MULT-10
    {
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }
    
    OUT MIR-SUR-BNFT-AMT-10
    {
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }
    
    OUT MIR-CAN-MNTH-BNFT-AMT-10
    {
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }
    
    OUT MIR-HOSP-BNFT-AMT-10
    {
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }
    
    OUT MIR-LT-BNFT-AMT-10
    {
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }
    
    OUT MIR-LS-DIS-BNFT-AMT-10
    {
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }
    
    OUT MIR-DISC-BNFT-AMT-10
    {
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }
    
    OUT MIR-RCVR-BNFT-RFND-10
    {
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }
    
    OUT MIR-HLTH-BNFT-RFND-10
    {
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }
    
    OUT MIR-DISB-BNFT-AMT-10
    {
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }
    
    OUT MIR-DISA-GR-10
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }
    
    OUT MIR-DISA-NUM-10
    {
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }
    
    OUT MIR-DISB-FIX-DT-10
    {
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }
    
    OUT MIR-CNFM-CD-10
    {
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }
    
    OUT MIR-FMLY-TYP-RID-CD-10
    {
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }
    
    OUT MIR-FMLY-NM-10
    {
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }
    
    OUT MIR-ACCI-OUT-STRT-DT-10
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }
    
    OUT MIR-ACCI-OUT-END-DT-10
    {
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }
    
    OUT MIR-ACCI-EFF-DT-10
    {
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-10
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }
    
    OUT MIR-NO-OF-ACCI-DAYS-EXCLU-10
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }
    
    OUT MIR-NO-OF-ACCI-BNFT-PAY-DAY-10
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }
    
    OUT MIR-ACCI-OUT-BNFT-AMT-10
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-OUT-DAYS-EXCLU-10
    {
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }
    
    OUT MIR-ACCI-CD-10
    {
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }
    
    OUT MIR-CLI-NM-10
    {
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }
    
    OUT MIR-OUT-START-DT-10
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }
    
    OUT MIR-OUT-END-DT-10
    {
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }
    
    OUT MIR-NO-OF-OP-DAYS-10
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }
    
    OUT MIR-NO-OF-OP-BNFT-PAY-DAYS-10
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }
    
    OUT MIR-OP-BNFT-AMT-10
    {
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }
    
    OUT MIR-NO-OF-LT-HOSP-DAYS-10
    {
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }
    
    OUT MIR-NO-OF-LT-HOSP-PAY-DAYS-10
    {
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }
    
    OUT MIR-UW-INFO-10
    {
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }
    
    OUT MIR-CLI-ID-10
    {
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }
    
    OUT MIR-SHRT-HOSP-BNFT-AMT-10
    {
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }
    
    OUT MIR-SHRT-HOSP-PAY-DAYS-10
    {
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }
    
    INOUT MIR-POL-CTR
    {
        Length = "02";
        SType = "number";
        Label = "Policy Count";
    }    

    INOUT MIR-POL-ID-T[5]
    {
        Length = "08";
        SType = "Text";
        FieldGroup = "Table05";
        Label = "Policy ID";
        Index = "1";
    }

    INOUT MIR-LARG-TYP-CD-T[5]
    {
        Length = "03";
        SType = "Text";
        FieldGroup = "Table05";
        Label = "Large Type Code";
        Index = "1";
    }

    INOUT MIR-SMAL-TYP-CD-T[5]
    {
        Length = "03";
        SType = "Text";
        FieldGroup = "Table05";
        Label = "Small Type Code";
        Index = "1";
    }

    INOUT MIR-HIST-NUM
    {
      Length = "2";
      SType = "Text";
      Label = "History Number";
    }

    INOUT MIR-JRNL-DT
    {
      Length = "8";
      SType = "Text";
      Label = "Journal Date";
    }

    INOUT MIR-RO-CD
    {
      Length = "3";
      SType = "Text";
      Label = "RO Code";
    }
}