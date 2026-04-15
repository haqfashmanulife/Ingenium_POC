# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF9H20-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYDM29  CTS      Unisys Benefit History Inquiry Screen                     *
#*                                                                             *
#*******************************************************************************

S-STEP BF9H20-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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
        Mandatory;
        DisplayOnly;
        Length = "7";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Policy Id";
    }
    
    IN MIR-LARG-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Large type CD";
    }
     
    IN MIR-HIST-NUM-1
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }

    IN MIR-RO-CD-1
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }

    IN MIR-JRNL-DT-1
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
	
    IN MIR-BNFT-CAT-CD-1
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }

    IN MIR-NO-OF-PAYOUT-1
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    IN MIR-DIS-CD-1
    {   
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    IN MIR-HOSP-STRT-DT-1
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    IN MIR-HOSP-END-DT-1
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    IN MIR-NO-OF-ADV-PAYOUT-1
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    IN MIR-NO-OF-EXCLU-DAYS-1
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    IN MIR-NO-OF-PAYOUT-MD-1
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }

    IN MIR-PRCES-CD-1
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    IN MIR-SUR-DT-1
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }

    IN MIR-SUR-CD-1
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }

    IN MIR-SUR-BNFT-MULT-1
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }

    IN MIR-SUR-BNFT-AMT-1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }

    IN MIR-CAN-MNTH-BNFT-AMT-1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }

    IN MIR-HOSP-BNFT-AMT-1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }

    IN MIR-LT-BNFT-AMT-1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }

    IN MIR-LS-DIS-BNFT-AMT-1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }

    IN MIR-DISC-BNFT-AMT-1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }

    IN MIR-RCVR-BNFT-RFND-1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }

    IN MIR-HLTH-BNFT-RFND-1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }

    IN MIR-DISB-BNFT-AMT-1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }

    IN MIR-DISA-GR-1
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }

    IN MIR-DISA-NUM-1
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }

    IN MIR-DISB-FIX-DT-1
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }

    IN MIR-CNFM-CD-1
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }

    IN MIR-FMLY-TYP-RID-CD-1
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }

    IN MIR-FMLY-NM-1
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }

    IN MIR-ACCI-OUT-STRT-DT-1
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }

    IN MIR-ACCI-OUT-END-DT-1
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }

    IN MIR-ACCI-EFF-DT-1
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }

    IN MIR-NO-OF-ACCI-DAYS-1
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }

    IN MIR-NO-OF-ACCI-DAYS-EXCLU-1
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }

    IN MIR-NO-OF-ACCI-BNFT-PAY-DAYS-1
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }

    IN MIR-ACCI-OUT-BNFT-AMT-1
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-OUT-DAYS-EXCLU-1
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-ACCI-CD-1
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }

    IN MIR-CLI-NM-1
    {
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-OUT-START-DT-1
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }

    IN MIR-OUT-END-DT-1
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }

    IN MIR-NO-OF-OP-DAYS-1
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }

    IN MIR-NO-OF-OP-BNFT-PAY-DAYS-1
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }

    IN MIR-OP-BNFT-AMT-1
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-LT-HOSP-DAYS-1
    {
        DisplayOnly;
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }

    IN MIR-NO-OF-LT-HOSP-PAY-DAYS-1
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }

    IN MIR-UW-INFO-1
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }

    IN MIR-CLI-ID-1
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }

    IN MIR-SHRT-HOSP-BNFT-AMT-1
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }

    IN MIR-SHRT-HOSP-PAY-DAYS-1
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }
    
    IN MIR-HIST-NUM-2
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }

    IN MIR-RO-CD-2
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }

    IN MIR-JRNL-DT-2
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
	
    IN MIR-BNFT-CAT-CD-2
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }

    IN MIR-NO-OF-PAYOUT-2
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    IN MIR-DIS-CD-2
    {   
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    IN MIR-HOSP-STRT-DT-2
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    IN MIR-HOSP-END-DT-2
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    IN MIR-NO-OF-ADV-PAYOUT-2
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    IN MIR-NO-OF-EXCLU-DAYS-2
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    IN MIR-NO-OF-PAYOUT-MD-2
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }

    IN MIR-PRCES-CD-2
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    IN MIR-SUR-DT-2
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }

    IN MIR-SUR-CD-2
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }

    IN MIR-SUR-BNFT-MULT-2
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }

    IN MIR-SUR-BNFT-AMT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }

    IN MIR-CAN-MNTH-BNFT-AMT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }

    IN MIR-HOSP-BNFT-AMT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }

    IN MIR-LT-BNFT-AMT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }

    IN MIR-LS-DIS-BNFT-AMT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }

    IN MIR-DISC-BNFT-AMT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }

    IN MIR-RCVR-BNFT-RFND-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }

    IN MIR-HLTH-BNFT-RFND-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }

    IN MIR-DISB-BNFT-AMT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }

    IN MIR-DISA-GR-2
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }

    IN MIR-DISA-NUM-2
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }

    IN MIR-DISB-FIX-DT-2
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }

    IN MIR-CNFM-CD-2
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }

    IN MIR-FMLY-TYP-RID-CD-2
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }

    IN MIR-FMLY-NM-2
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }

    IN MIR-ACCI-OUT-STRT-DT-2
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }

    IN MIR-ACCI-OUT-END-DT-2
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }

    IN MIR-ACCI-EFF-DT-2
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }

    IN MIR-NO-OF-ACCI-DAYS-2
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }

    IN MIR-NO-OF-ACCI-DAYS-EXCLU-2
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }

    IN MIR-NO-OF-ACCI-BNFT-PAY-DAYS-2
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }

    IN MIR-ACCI-OUT-BNFT-AMT-2
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-OUT-DAYS-EXCLU-2
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-ACCI-CD-2
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }

    IN MIR-CLI-NM-2
    {
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-OUT-START-DT-2
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }

    IN MIR-OUT-END-DT-2
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }

    IN MIR-NO-OF-OP-DAYS-2
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }

    IN MIR-NO-OF-OP-BNFT-PAY-DAYS-2
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }

    IN MIR-OP-BNFT-AMT-2
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-LT-HOSP-DAYS-2
    {
        DisplayOnly;
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }

    IN MIR-NO-OF-LT-HOSP-PAY-DAYS-2
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }

    IN MIR-UW-INFO-2
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }

    IN MIR-CLI-ID-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }

    IN MIR-SHRT-HOSP-BNFT-AMT-2
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }

    IN MIR-SHRT-HOSP-PAY-DAYS-2
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }
    
    IN MIR-HIST-NUM-3
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }

    IN MIR-RO-CD-3
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }

    IN MIR-JRNL-DT-3
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
	
    IN MIR-BNFT-CAT-CD-3
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }

    IN MIR-NO-OF-PAYOUT-3
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    IN MIR-DIS-CD-3
    {   
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    IN MIR-HOSP-STRT-DT-3
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    IN MIR-HOSP-END-DT-3
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    IN MIR-NO-OF-ADV-PAYOUT-3
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    IN MIR-NO-OF-EXCLU-DAYS-3
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    IN MIR-NO-OF-PAYOUT-MD-3
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }

    IN MIR-PRCES-CD-3
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    IN MIR-SUR-DT-3
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }

    IN MIR-SUR-CD-3
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }

    IN MIR-SUR-BNFT-MULT-3
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }

    IN MIR-SUR-BNFT-AMT-3
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }

    IN MIR-CAN-MNTH-BNFT-AMT-3
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }

    IN MIR-HOSP-BNFT-AMT-3
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }

    IN MIR-LT-BNFT-AMT-3
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }

    IN MIR-LS-DIS-BNFT-AMT-3
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }

    IN MIR-DISC-BNFT-AMT-3
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }

    IN MIR-RCVR-BNFT-RFND-3
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }

    IN MIR-HLTH-BNFT-RFND-3
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }

    IN MIR-DISB-BNFT-AMT-3
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }

    IN MIR-DISA-GR-3
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }

    IN MIR-DISA-NUM-3
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }

    IN MIR-DISB-FIX-DT-3
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }

    IN MIR-CNFM-CD-3
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }

    IN MIR-FMLY-TYP-RID-CD-3
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }

    IN MIR-FMLY-NM-3
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }

    IN MIR-ACCI-OUT-STRT-DT-3
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }

    IN MIR-ACCI-OUT-END-DT-3
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }

    IN MIR-ACCI-EFF-DT-3
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }

    IN MIR-NO-OF-ACCI-DAYS-3
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }

    IN MIR-NO-OF-ACCI-DAYS-EXCLU-3
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }

    IN MIR-NO-OF-ACCI-BNFT-PAY-DAYS-3
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }

    IN MIR-ACCI-OUT-BNFT-AMT-3
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-OUT-DAYS-EXCLU-3
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-ACCI-CD-3
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }

    IN MIR-CLI-NM-3
    {
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-OUT-START-DT-3
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }

    IN MIR-OUT-END-DT-3
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }

    IN MIR-NO-OF-OP-DAYS-3
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }

    IN MIR-NO-OF-OP-BNFT-PAY-DAYS-3
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }

    IN MIR-OP-BNFT-AMT-3
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-LT-HOSP-DAYS-3
    {
        DisplayOnly;
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }

    IN MIR-NO-OF-LT-HOSP-PAY-DAYS-3
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }

    IN MIR-UW-INFO-3
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }

    IN MIR-CLI-ID-3
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }

    IN MIR-SHRT-HOSP-BNFT-AMT-3
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }

    IN MIR-SHRT-HOSP-PAY-DAYS-3
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }
    
    IN MIR-HIST-NUM-4
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }

    IN MIR-RO-CD-4
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }

    IN MIR-JRNL-DT-4
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
	
    IN MIR-BNFT-CAT-CD-4
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }

    IN MIR-NO-OF-PAYOUT-4
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    IN MIR-DIS-CD-4
    {   
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    IN MIR-HOSP-STRT-DT-4
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    IN MIR-HOSP-END-DT-4
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    IN MIR-NO-OF-ADV-PAYOUT-4
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    IN MIR-NO-OF-EXCLU-DAYS-4
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    IN MIR-NO-OF-PAYOUT-MD-4
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }

    IN MIR-PRCES-CD-4
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    IN MIR-SUR-DT-4
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }

    IN MIR-SUR-CD-4
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }

    IN MIR-SUR-BNFT-MULT-4
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }

    IN MIR-SUR-BNFT-AMT-4
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }

    IN MIR-CAN-MNTH-BNFT-AMT-4
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }

    IN MIR-HOSP-BNFT-AMT-4
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }

    IN MIR-LT-BNFT-AMT-4
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }

    IN MIR-LS-DIS-BNFT-AMT-4
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }

    IN MIR-DISC-BNFT-AMT-4
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }

    IN MIR-RCVR-BNFT-RFND-4
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }

    IN MIR-HLTH-BNFT-RFND-4
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }

    IN MIR-DISB-BNFT-AMT-4
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }

    IN MIR-DISA-GR-4
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }

    IN MIR-DISA-NUM-4
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }

    IN MIR-DISB-FIX-DT-4
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }

    IN MIR-CNFM-CD-4
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }

    IN MIR-FMLY-TYP-RID-CD-4
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }

    IN MIR-FMLY-NM-4
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }

    IN MIR-ACCI-OUT-STRT-DT-4
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }

    IN MIR-ACCI-OUT-END-DT-4
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }

    IN MIR-ACCI-EFF-DT-4
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }

    IN MIR-NO-OF-ACCI-DAYS-4
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }

    IN MIR-NO-OF-ACCI-DAYS-EXCLU-4
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }

    IN MIR-NO-OF-ACCI-BNFT-PAY-DAYS-4
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }

    IN MIR-ACCI-OUT-BNFT-AMT-4
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-OUT-DAYS-EXCLU-4
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-ACCI-CD-4
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }

    IN MIR-CLI-NM-4
    {
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-OUT-START-DT-4
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }

    IN MIR-OUT-END-DT-4
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }

    IN MIR-NO-OF-OP-DAYS-4
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }

    IN MIR-NO-OF-OP-BNFT-PAY-DAYS-4
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }

    IN MIR-OP-BNFT-AMT-4
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-LT-HOSP-DAYS-4
    {
        DisplayOnly;
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }

    IN MIR-NO-OF-LT-HOSP-PAY-DAYS-4
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }

    IN MIR-UW-INFO-4
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }

    IN MIR-CLI-ID-4
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }

    IN MIR-SHRT-HOSP-BNFT-AMT-4
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }

    IN MIR-SHRT-HOSP-PAY-DAYS-4
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }

    IN MIR-HIST-NUM-5
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }

    IN MIR-RO-CD-5
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }

    IN MIR-JRNL-DT-5
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
	
    IN MIR-BNFT-CAT-CD-5
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }

    IN MIR-NO-OF-PAYOUT-5
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    IN MIR-DIS-CD-5
    {   
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    IN MIR-HOSP-STRT-DT-5
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    IN MIR-HOSP-END-DT-5
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    IN MIR-NO-OF-ADV-PAYOUT-5
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    IN MIR-NO-OF-EXCLU-DAYS-5
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    IN MIR-NO-OF-PAYOUT-MD-5
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }

    IN MIR-PRCES-CD-5
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    IN MIR-SUR-DT-5
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }

    IN MIR-SUR-CD-5
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }

    IN MIR-SUR-BNFT-MULT-5
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }

    IN MIR-SUR-BNFT-AMT-5
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }

    IN MIR-CAN-MNTH-BNFT-AMT-5
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }

    IN MIR-HOSP-BNFT-AMT-5
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }

    IN MIR-LT-BNFT-AMT-5
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }

    IN MIR-LS-DIS-BNFT-AMT-5
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }

    IN MIR-DISC-BNFT-AMT-5
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }

    IN MIR-RCVR-BNFT-RFND-5
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }

    IN MIR-HLTH-BNFT-RFND-5
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }

    IN MIR-DISB-BNFT-AMT-5
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }

    IN MIR-DISA-GR-5
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }

    IN MIR-DISA-NUM-5
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }

    IN MIR-DISB-FIX-DT-5
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }

    IN MIR-CNFM-CD-5
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }

    IN MIR-FMLY-TYP-RID-CD-5
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }

    IN MIR-FMLY-NM-5
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }

    IN MIR-ACCI-OUT-STRT-DT-5
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }

    IN MIR-ACCI-OUT-END-DT-5
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }

    IN MIR-ACCI-EFF-DT-5
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }

    IN MIR-NO-OF-ACCI-DAYS-5
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }

    IN MIR-NO-OF-ACCI-DAYS-EXCLU-5
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }

    IN MIR-NO-OF-ACCI-BNFT-PAY-DAYS-5
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }

    IN MIR-ACCI-OUT-BNFT-AMT-5
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-OUT-DAYS-EXCLU-5
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-ACCI-CD-5
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }

    IN MIR-CLI-NM-5
    {
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-OUT-START-DT-5
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }

    IN MIR-OUT-END-DT-5
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }

    IN MIR-NO-OF-OP-DAYS-5
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }

    IN MIR-NO-OF-OP-BNFT-PAY-DAYS-5
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }

    IN MIR-OP-BNFT-AMT-5
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-LT-HOSP-DAYS-5
    {
        DisplayOnly;
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }

    IN MIR-NO-OF-LT-HOSP-PAY-DAYS-5
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }

    IN MIR-UW-INFO-5
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }

    IN MIR-CLI-ID-5
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }

    IN MIR-SHRT-HOSP-BNFT-AMT-5
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }

    IN MIR-SHRT-HOSP-PAY-DAYS-5
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }
   
    IN MIR-HIST-NUM-6
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }

    IN MIR-RO-CD-6
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }

    IN MIR-JRNL-DT-6
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
	
    IN MIR-BNFT-CAT-CD-6
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }

    IN MIR-NO-OF-PAYOUT-6
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    IN MIR-DIS-CD-6
    {   
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    IN MIR-HOSP-STRT-DT-6
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    IN MIR-HOSP-END-DT-6
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    IN MIR-NO-OF-ADV-PAYOUT-6
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    IN MIR-NO-OF-EXCLU-DAYS-6
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    IN MIR-NO-OF-PAYOUT-MD-6
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }

    IN MIR-PRCES-CD-6
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    IN MIR-SUR-DT-6
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }

    IN MIR-SUR-CD-6
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }

    IN MIR-SUR-BNFT-MULT-6
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }

    IN MIR-SUR-BNFT-AMT-6
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }

    IN MIR-CAN-MNTH-BNFT-AMT-6
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }

    IN MIR-HOSP-BNFT-AMT-6
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }

    IN MIR-LT-BNFT-AMT-6
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }

    IN MIR-LS-DIS-BNFT-AMT-6
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }

    IN MIR-DISC-BNFT-AMT-6
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }

    IN MIR-RCVR-BNFT-RFND-6
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }

    IN MIR-HLTH-BNFT-RFND-6
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }

    IN MIR-DISB-BNFT-AMT-6
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }

    IN MIR-DISA-GR-6
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }

    IN MIR-DISA-NUM-6
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }

    IN MIR-DISB-FIX-DT-6
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }

    IN MIR-CNFM-CD-6
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }

    IN MIR-FMLY-TYP-RID-CD-6
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }

    IN MIR-FMLY-NM-6
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }

    IN MIR-ACCI-OUT-STRT-DT-6
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }

    IN MIR-ACCI-OUT-END-DT-6
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }

    IN MIR-ACCI-EFF-DT-6
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }

    IN MIR-NO-OF-ACCI-DAYS-6
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }

    IN MIR-NO-OF-ACCI-DAYS-EXCLU-6
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }

    IN MIR-NO-OF-ACCI-BNFT-PAY-DAYS-6
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }

    IN MIR-ACCI-OUT-BNFT-AMT-6
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-OUT-DAYS-EXCLU-6
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-ACCI-CD-6
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }

    IN MIR-CLI-NM-6
    {
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-OUT-START-DT-6
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }

    IN MIR-OUT-END-DT-6
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }

    IN MIR-NO-OF-OP-DAYS-6
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }

    IN MIR-NO-OF-OP-BNFT-PAY-DAYS-6
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }

    IN MIR-OP-BNFT-AMT-6
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-LT-HOSP-DAYS-6
    {
        DisplayOnly;
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }

    IN MIR-NO-OF-LT-HOSP-PAY-DAYS-6
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }

    IN MIR-UW-INFO-6
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }

    IN MIR-CLI-ID-6
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }

    IN MIR-SHRT-HOSP-BNFT-AMT-6
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }

    IN MIR-SHRT-HOSP-PAY-DAYS-6
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }
    
    IN MIR-HIST-NUM-7
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }

    IN MIR-RO-CD-7
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }

    IN MIR-JRNL-DT-7
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
	
    IN MIR-BNFT-CAT-CD-7
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }

    IN MIR-NO-OF-PAYOUT-7
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    IN MIR-DIS-CD-7
    {   
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    IN MIR-HOSP-STRT-DT-7
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    IN MIR-HOSP-END-DT-7
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    IN MIR-NO-OF-ADV-PAYOUT-7
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    IN MIR-NO-OF-EXCLU-DAYS-7
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    IN MIR-NO-OF-PAYOUT-MD-7
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }

    IN MIR-PRCES-CD-7
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    IN MIR-SUR-DT-7
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }

    IN MIR-SUR-CD-7
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }

    IN MIR-SUR-BNFT-MULT-7
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }

    IN MIR-SUR-BNFT-AMT-7
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }

    IN MIR-CAN-MNTH-BNFT-AMT-7
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }

    IN MIR-HOSP-BNFT-AMT-7
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }

    IN MIR-LT-BNFT-AMT-7
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }

    IN MIR-LS-DIS-BNFT-AMT-7
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }

    IN MIR-DISC-BNFT-AMT-7
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }

    IN MIR-RCVR-BNFT-RFND-7
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }

    IN MIR-HLTH-BNFT-RFND-7
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }

    IN MIR-DISB-BNFT-AMT-7
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }

    IN MIR-DISA-GR-7
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }

    IN MIR-DISA-NUM-7
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }

    IN MIR-DISB-FIX-DT-7
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }

    IN MIR-CNFM-CD-7
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }

    IN MIR-FMLY-TYP-RID-CD-7
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }

    IN MIR-FMLY-NM-7
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }

    IN MIR-ACCI-OUT-STRT-DT-7
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }

    IN MIR-ACCI-OUT-END-DT-7
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }

    IN MIR-ACCI-EFF-DT-7
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }

    IN MIR-NO-OF-ACCI-DAYS-7
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }

    IN MIR-NO-OF-ACCI-DAYS-EXCLU-7
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }

    IN MIR-NO-OF-ACCI-BNFT-PAY-DAYS-7
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }

    IN MIR-ACCI-OUT-BNFT-AMT-7
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-OUT-DAYS-EXCLU-7
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-ACCI-CD-7
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }

    IN MIR-CLI-NM-7
    {
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-OUT-START-DT-7
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }

    IN MIR-OUT-END-DT-7
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }

    IN MIR-NO-OF-OP-DAYS-7
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }

    IN MIR-NO-OF-OP-BNFT-PAY-DAYS-7
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }

    IN MIR-OP-BNFT-AMT-7
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-LT-HOSP-DAYS-7
    {
        DisplayOnly;
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }

    IN MIR-NO-OF-LT-HOSP-PAY-DAYS-7
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }

    IN MIR-UW-INFO-7
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }

    IN MIR-CLI-ID-7
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }

    IN MIR-SHRT-HOSP-BNFT-AMT-7
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }

    IN MIR-SHRT-HOSP-PAY-DAYS-7
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }
    
    IN MIR-HIST-NUM-8
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }

    IN MIR-RO-CD-8
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }

    IN MIR-JRNL-DT-8
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }

    IN MIR-BNFT-CAT-CD-8
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }

    IN MIR-NO-OF-PAYOUT-8
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    IN MIR-DIS-CD-8
    {   
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    IN MIR-HOSP-STRT-DT-8
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    IN MIR-HOSP-END-DT-8
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    IN MIR-NO-OF-ADV-PAYOUT-8
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    IN MIR-NO-OF-EXCLU-DAYS-8
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    IN MIR-NO-OF-PAYOUT-MD-8
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }

    IN MIR-PRCES-CD-8
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    IN MIR-SUR-DT-8
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }

    IN MIR-SUR-CD-8
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }

    IN MIR-SUR-BNFT-MULT-8
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }

    IN MIR-SUR-BNFT-AMT-8
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }

    IN MIR-CAN-MNTH-BNFT-AMT-8
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }

    IN MIR-HOSP-BNFT-AMT-8
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }

    IN MIR-LT-BNFT-AMT-8
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }

    IN MIR-LS-DIS-BNFT-AMT-8
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }

    IN MIR-DISC-BNFT-AMT-8
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }

    IN MIR-RCVR-BNFT-RFND-8
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }

    IN MIR-HLTH-BNFT-RFND-8
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }

    IN MIR-DISB-BNFT-AMT-8
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }

    IN MIR-DISA-GR-8
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }

    IN MIR-DISA-NUM-8
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }

    IN MIR-DISB-FIX-DT-8
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }

    IN MIR-CNFM-CD-8
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }

    IN MIR-FMLY-TYP-RID-CD-8
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }

    IN MIR-FMLY-NM-8
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }

    IN MIR-ACCI-OUT-STRT-DT-8
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }

    IN MIR-ACCI-OUT-END-DT-8
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }

    IN MIR-ACCI-EFF-DT-8
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }

    IN MIR-NO-OF-ACCI-DAYS-8
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }

    IN MIR-NO-OF-ACCI-DAYS-EXCLU-8
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }

    IN MIR-NO-OF-ACCI-BNFT-PAY-DAYS-8
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }

    IN MIR-ACCI-OUT-BNFT-AMT-8
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-OUT-DAYS-EXCLU-8
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-ACCI-CD-8
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }

    IN MIR-CLI-NM-8
    {
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-OUT-START-DT-8
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }

    IN MIR-OUT-END-DT-8
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }

    IN MIR-NO-OF-OP-DAYS-8
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }

    IN MIR-NO-OF-OP-BNFT-PAY-DAYS-8
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }

    IN MIR-OP-BNFT-AMT-8
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-LT-HOSP-DAYS-8
    {
        DisplayOnly;
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }

    IN MIR-NO-OF-LT-HOSP-PAY-DAYS-8
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }

    IN MIR-UW-INFO-8
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }

    IN MIR-CLI-ID-8
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }

    IN MIR-SHRT-HOSP-BNFT-AMT-8
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }

    IN MIR-SHRT-HOSP-PAY-DAYS-8
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }

    IN MIR-HIST-NUM-9
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }

    IN MIR-RO-CD-9
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }

    IN MIR-JRNL-DT-9
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
	
    IN MIR-BNFT-CAT-CD-9
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }

    IN MIR-NO-OF-PAYOUT-9
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    IN MIR-DIS-CD-9
    {   
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    IN MIR-HOSP-STRT-DT-9
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    IN MIR-HOSP-END-DT-9
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    IN MIR-NO-OF-ADV-PAYOUT-9
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    IN MIR-NO-OF-EXCLU-DAYS-9
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    IN MIR-NO-OF-PAYOUT-MD-9
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }

    IN MIR-PRCES-CD-9
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    IN MIR-SUR-DT-9
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }

    IN MIR-SUR-CD-9
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }

    IN MIR-SUR-BNFT-MULT-9
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }

    IN MIR-SUR-BNFT-AMT-9
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }

    IN MIR-CAN-MNTH-BNFT-AMT-9
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }

    IN MIR-HOSP-BNFT-AMT-9
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }

    IN MIR-LT-BNFT-AMT-9
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }

    IN MIR-LS-DIS-BNFT-AMT-9
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }

    IN MIR-DISC-BNFT-AMT-9
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }

    IN MIR-RCVR-BNFT-RFND-9
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }

    IN MIR-HLTH-BNFT-RFND-9
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }

    IN MIR-DISB-BNFT-AMT-9
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }

    IN MIR-DISA-GR-9
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }

    IN MIR-DISA-NUM-9
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }

    IN MIR-DISB-FIX-DT-9
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }

    IN MIR-CNFM-CD-9
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }

    IN MIR-FMLY-TYP-RID-CD-9
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }

    IN MIR-FMLY-NM-9
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }

    IN MIR-ACCI-OUT-STRT-DT-9
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }

    IN MIR-ACCI-OUT-END-DT-9
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }

    IN MIR-ACCI-EFF-DT-9
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }

    IN MIR-NO-OF-ACCI-DAYS-9
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }

    IN MIR-NO-OF-ACCI-DAYS-EXCLU-9
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }

    IN MIR-NO-OF-ACCI-BNFT-PAY-DAYS-9
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }

    IN MIR-ACCI-OUT-BNFT-AMT-9
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-OUT-DAYS-EXCLU-9
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-ACCI-CD-9
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }

    IN MIR-CLI-NM-9
    {
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-OUT-START-DT-9
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }

    IN MIR-OUT-END-DT-9
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }

    IN MIR-NO-OF-OP-DAYS-9
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }

    IN MIR-NO-OF-OP-BNFT-PAY-DAYS-9
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }

    IN MIR-OP-BNFT-AMT-9
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-LT-HOSP-DAYS-9
    {
        DisplayOnly;
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }

    IN MIR-NO-OF-LT-HOSP-PAY-DAYS-9
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }

    IN MIR-UW-INFO-9
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }

    IN MIR-CLI-ID-9
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }

    IN MIR-SHRT-HOSP-BNFT-AMT-9
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }

    IN MIR-SHRT-HOSP-PAY-DAYS-9
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }

    IN MIR-HIST-NUM-10
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "History Number";
    }

    IN MIR-RO-CD-10
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "RO Code";
    }

    IN MIR-JRNL-DT-10
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TU3BH";
        SType = "Text";
        Label = "Journal Date";
    }
	
    IN MIR-BNFT-CAT-CD-10
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Benefit Category";
    }

    IN MIR-NO-OF-PAYOUT-10
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payouts";
    }
    
    IN MIR-DIS-CD-10
    {   
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Disease Code";
    }
    
    IN MIR-HOSP-STRT-DT-10
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization Start Date";
    }
    
    IN MIR-HOSP-END-DT-10
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Hospitalization End Date";
    }
    
    IN MIR-NO-OF-ADV-PAYOUT-10
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Advance Payouts";
    }
    
    IN MIR-NO-OF-EXCLU-DAYS-10
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Excluded Days";
    }
    IN MIR-NO-OF-PAYOUT-MD-10
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Number of Payout Months or Days";
    }

    IN MIR-PRCES-CD-10
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Processing";
    }
    
    IN MIR-SUR-DT-10
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Surgery Date";
    }

    IN MIR-SUR-CD-10
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Surgery Code";
    }

    IN MIR-SUR-BNFT-MULT-10
    {
        DisplayOnly;
        Length = "05";
        SType = "Text";
        Label = "Surgery Benefit Multiplier";
    }

    IN MIR-SUR-BNFT-AMT-10
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Surgery Benefit Amount";
    }

    IN MIR-CAN-MNTH-BNFT-AMT-10
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Cancer Treatment Monthly Benefit Amount";
    }

    IN MIR-HOSP-BNFT-AMT-10
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Hospitalization Benefit Amount";
    }

    IN MIR-LT-BNFT-AMT-10
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Long Term Benefit Amount";
    }

    IN MIR-LS-DIS-BNFT-AMT-10
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Life Style Disease Benefit Amount";
    }

    IN MIR-DISC-BNFT-AMT-10
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Discharge Benefit Amount";
    }

    IN MIR-RCVR-BNFT-RFND-10
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Recovery Benefit Refund";
    }

    IN MIR-HLTH-BNFT-RFND-10
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Health Benefit Refund";
    }

    IN MIR-DISB-BNFT-AMT-10
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Disability Benefit Amount";
    }

    IN MIR-DISA-GR-10
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Grade";
    }

    IN MIR-DISA-NUM-10
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Disability Number";
    }

    IN MIR-DISB-FIX-DT-10
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Disability Fixation Date";
    }

    IN MIR-CNFM-CD-10
    {
        DisplayOnly;
        Length = "01";
        SType = "Text";
        Label = "Confirmation";
    }

    IN MIR-FMLY-TYP-RID-CD-10
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Family Type Rider Code";
    }

    IN MIR-FMLY-NM-10
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Family Name";
    }

    IN MIR-ACCI-OUT-STRT-DT-10
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient Start Date";
    }

    IN MIR-ACCI-OUT-END-DT-10
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accidental Outpatient End Date";
    }

    IN MIR-ACCI-EFF-DT-10
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Accident Effective Date";
    }

    IN MIR-NO-OF-ACCI-DAYS-10
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days";
    }

    IN MIR-NO-OF-ACCI-DAYS-EXCLU-10
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accident Days Excluded";
    }

    IN MIR-NO-OF-ACCI-BNFT-PAY-DAY-10
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Accidental Benefit Payout Days";
    }

    IN MIR-ACCI-OUT-BNFT-AMT-10
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-OUT-DAYS-EXCLU-10
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Accidental Outpatient Benefit Amount";
    }

    IN MIR-ACCI-CD-10
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Accident Code";
    }

    IN MIR-CLI-NM-10
    {
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-OUT-START-DT-10
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient Start Date";
    }

    IN MIR-OUT-END-DT-10
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Outpatient End Date";
    }

    IN MIR-NO-OF-OP-DAYS-10
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Days";
    }

    IN MIR-NO-OF-OP-BNFT-PAY-DAYS-10
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Outpatient Benefit Payout Days";
    }

    IN MIR-OP-BNFT-AMT-10
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Outpatient Benefit Amount";
    }

    IN MIR-NO-OF-LT-HOSP-DAYS-10
    {
        DisplayOnly;
        Length = "04";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Days";
    }

    IN MIR-NO-OF-LT-HOSP-PAY-DAYS-10
    {
        DisplayOnly;
        Length = "03";
        SType = "Text";
        Label = "Number of Long Term Hospitalization Benefit Payout Days";
    }

    IN MIR-UW-INFO-10
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Underwriting Information";
    }

    IN MIR-CLI-ID-10
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }

    IN MIR-SHRT-HOSP-BNFT-AMT-10
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Short Term Hospitalization Benefit Amount";
    }

    IN MIR-SHRT-HOSP-PAY-DAYS-10
    {
        DisplayOnly;
        Length = "02";
        SType = "Text";
        Label = "Number of Short Term Hospitalization Benefit Payout Days";
    }

    INOUT MIR-HIST-NUM
    {
      Length = "2";
      SType = "Text";
    }

    INOUT MIR-JRNL-DT
    {
      Length = "8";
      SType = "Text";
    }

    INOUT MIR-RO-CD
    {
      Length = "3";
      SType = "Text";
    }
}
