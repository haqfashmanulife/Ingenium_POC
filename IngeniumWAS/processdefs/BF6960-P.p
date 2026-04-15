# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6960-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD25  BMB      Add a new field to control display of more than 20 cvgs   *
#*  02BL63  KRW      ADD POL-BT-BILL-DLAY-IND                                  *
#*  02PR55  RNL      ADD MAT-XPRY-REASN-CD                                     *
#*  M00011  ROC      OUTSTANDING DISBURSEMENTS, ADD FIELDS:                    *
#*                      OS-DISB-SURR-AMT, OS-DISB-MAT-AMT, OS-DISB-DTH-AMT     *
#*                      OS-DISB-CLM-AMT, OS-DISB-AD-AMT                        *
#*  M161CA  CTS      ADDITION OF NEW FIELD INIT-PMT-TYP-CD                     *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP245R  CTS      CHANGES FOR BILLING & OS AMT FIELDS - SPWL POLICIES       *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M319O1  CTS      FXWL Foreign Currency Formatting                          *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UYSD11  CTS      ADDIITION OF UNISYS MIGRATION TYPE CODE                   *
#*******************************************************************************

P-STEP BF6960-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6960";
        BusinessFunctionName = "Policy Inquiry - Summary";
        BusinessFunctionType = "Summary";
        MirName = "CCWM6960";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
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

#01AD25 - Add in the coverage number
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }
 
    OUT MIR-CVG-APS-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-APS-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Attending Physician Statement";
        Index = "1";
    }

    OUT MIR-CVG-CLM-LTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Total Claims Paid";
    }

    OUT MIR-CVG-CLM-YTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Claims Paid Year to Date";
    }

    OUT MIR-CVG-CSTAT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-CVG-EKG-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-EKG-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Electro-cardiogram (EKG)";
        Index = "1";
    }

    OUT MIR-CVG-FREE-LK-FND-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-FREE-LK-FND-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Free Look Fund Type";
        Index = "1";
    }

    OUT MIR-CVG-HO-SPCMN-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-HO-SPCMN-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Head Office Specimen";
        Index = "1";
    }

    OUT MIR-CVG-INSPC-RPT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-INSPC-RPT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Inspection Report";
        Index = "1";
    }

    OUT MIR-CVG-INTRNL-EXAM-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-INTRNL-EXAM-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Medical by Internist or Specialist";
        Index = "1";
    }

    OUT MIR-CVG-ISS-EFF-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    OUT MIR-CVG-MAT-XPRY-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Coverage Maturity / Expiry Date";
        Index = "1";
    }

    OUT MIR-CVG-MPREM-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Mode Premium";
        Index = "1";
    }

    OUT MIR-CVG-NMED-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-NMED-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Non-medical";
        Index = "1";
    }

    OUT MIR-CVG-NOTI-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Notify Date";
        Index = "1";
    }

    OUT MIR-CVG-NOTI-REASN-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "NOTRE";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Notify Reason";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-CVG-PHYS-EXAM-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-PHYS-EXAM-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Medical Examination";
        Index = "1";
    }

    OUT MIR-CVG-PMED-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-PMED-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Paramedical";
        Index = "1";
    }

    OUT MIR-CVG-PREM-CHNG-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Premium Change Date";
        Index = "1";
    }

    OUT MIR-CVG-STRS-EKG-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-STRS-EKG-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Stress Electro-cardiogram";
        Index = "1";
    }

    OUT MIR-CVG-WP-LTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Total Premiums Waived";
    }

    OUT MIR-CVG-WP-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Waiver of Premium Amounts Paid Year to Date";
    }

    OUT MIR-CVG-XRAY-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-XRAY-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "X-ray";
        Index = "1";
    }

    OUT MIR-DV-MAX-LOAN-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Loan Value Amount";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-POL-CSV-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }

    OUT MIR-FREE-LK-FND-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Free Look Fund Required";
    }

    OUT MIR-LATST-ACTV-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Transaction Date";
    }

    OUT MIR-MAT-XPRY-REASN-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "MAT-XPRY-REASN-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Maturity/Expiry Reason";
        Index = "1";
    }

    OUT MIR-NXT-ACTV-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "NXT-ACTV-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Next Activity Type";
    }

    OUT MIR-PLAN-ID-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
#MP245R CHANGES START
#CodeType = "POL-BILL-MODE-CD";
      CodeType = "POL-DV-BILL-MODE-CD";
#MP245R CHANGES ENDS
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
    }

    OUT MIR-POL-BILL-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        #M161CA START
        #Label = "Billing Type";
        Label = "Billing Type(Subsequent Premium)";
        #M161CA END
    }

    #M161CA START
    OUT MIR-INIT-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment Route (First Premium)";
    }
    #M161CA END
    OUT MIR-POL-BT-BILL-DLAY-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Bank Transfer Billing Delay";
    }

    OUT MIR-POL-COMNT-TXT
    {
        Length = "50";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Comments";
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

#UYSD11 CHANGES START HERE

    OUT MIR-USYS-MIGR-POL-IND
    {    
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Migrated Policy";
    }

# UYSD11 CHANGES END HERE

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-POL-DIV-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Dividend Option";
    }

    OUT MIR-POL-MISC-SUSP-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    OUT MIR-POL-NXT-ACTV-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Next Activity Date";
    }

    OUT MIR-POL-OS-DISB-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

    OUT MIR-OS-DISB-SURR-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    OUT MIR-OS-DISB-MAT-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    OUT MIR-OS-DISB-DTH-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    OUT MIR-OS-DISB-CLM-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    OUT MIR-OS-DISB-AD-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }

    OUT MIR-POL-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Paid to Date";
    }

    OUT MIR-POL-PREM-DSCNT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "3";
        DBTableName = "TPOL";
        SType = "Percent";
        Label = "Policy Discount Percentage";
    }

    OUT MIR-POL-PREM-SUSP-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Suspense";
    }

    OUT MIR-PREV-FILE-MAINT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Maintain Date";
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

    OUT MIR-UWG-REQIR-ESTB-IND-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Underwriting requirements have been established";
        Index = "1";
    }

    OUT MIR-UWG-USER-DEFN-1-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Miscellaneous UW Requirement (1)";
        Index = "1";
    }

    OUT MIR-UWG-USER-DEFN-2-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Miscellaneous UW Requirement (2)";
        Index = "1";
    }

    OUT MIR-UWG-USER-DEFN-3-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Miscellaneous UW Requirement (3)";
        Index = "1";
    }

    OUT MIR-UWG-USER-DEFN-4-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Miscellaneous UW Requirement (4)";
        Index = "1";
    }

    OUT MIR-UWG-USER-DEFN-5-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Miscellaneous UW Requirement (5)";
        Index = "1";
    }
#M245B2 CHANGES START HERE       
    INOUT MIR-POL-CRCY-CD
    {
      
      Length = "2";
      SType = "Hidden";
      Label = "Currency";
  }  
#M245B2 CHANGES END HERE 
#MP245R CHANGES START HERE 
    INOUT MIR-OS-DISB-CRCY-CD
    {
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
    }    
#MP245R CHANGES END HERE 
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
#M319O1 CHANGES START HERE  
         
    INOUT MIR-PMT-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M319O1 CHANGES END HERE
#UYS133 CHANGES START
    OUT MIR-PD-GR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END
}

