# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF6960-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD25  BMB      Add a new field to control display of more than 20 cvgs   *
#*                   Focusfield is the more button...                          *
#*  02BL63  KRW      ADD POL-BT-BILL-DLAY-IND                                  *
#*  02PR55  RNL      ADD MAT-XPRY-REASN-CD                                     *
#*  M00011  ROC      OUTSTANDING DISBURSEMENTS, ADD FIELDS:                    *
#*                      OS-DISB-SURR-AMT, OS-DISB-MAT-AMT, OS-DISB-DTH-AMT     *
#*                      OS-DISB-CLM-AMT, OS-DISB-AD-AMT                        *
#*  M161CA  CTS      ADDITION OF NEW FIELD INIT-PMT-TYP-CD                     *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP245R  CTS      CHANGES FOR BILLING FIELDS & OS AMT FIELDS - SPWL POLICIES*
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M319O1  CTS      FXWL Currency Code Changes                                *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UYSD11  CTS      ADDIITION OF UNISYS MIGRATION TYPE CODE                   *
#*******************************************************************************

S-STEP BF6960-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Summary";
        Type = "Output";
        DelEmptyRows;
        FocusField = "moreButton";
        FocusFrame = "ButtonFrame";
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

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
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
 
    IN MIR-CVG-APS-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-APS-CD";
        SType = "Text";
        Label = "Attending Physician Statement";
        Index = "1";
    }

    IN MIR-CVG-CLM-LTD-AMT
    {
#M245B2 CHANGES START HERE
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Claims Paid";
    }

    IN MIR-CVG-CLM-YTD-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Claims Paid Year to Date";
    }

    IN MIR-CVG-CSTAT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-EKG-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-EKG-CD";
        SType = "Text";
        Label = "Electro-cardiogram (EKG)";
        Index = "1";
    }

    IN MIR-CVG-FREE-LK-FND-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-FREE-LK-FND-CD";
        SType = "Text";
        Label = "Free Look Fund Type";
        Index = "1";
    }

    IN MIR-CVG-HO-SPCMN-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-HO-SPCMN-CD";
        SType = "Text";
        Label = "Head Office Specimen";
        Index = "1";
    }

    IN MIR-CVG-INSPC-RPT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-INSPC-RPT-CD";
        SType = "Text";
        Label = "Inspection Report";
        Index = "1";
    }

    IN MIR-CVG-INTRNL-EXAM-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-INTRNL-EXAM-CD";
        SType = "Text";
        Label = "Medical by Internist or Specialist";
        Index = "1";
    }

    IN MIR-CVG-ISS-EFF-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    IN MIR-CVG-MAT-XPRY-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Coverage Maturity / Expiry Date";
        Index = "1";
    }

    IN MIR-CVG-MPREM-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE  
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Mode Premium";
        Index = "1";
    }

    IN MIR-CVG-NMED-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-NMED-CD";
        SType = "Text";
        Label = "Non-medical";
        Index = "1";
    }

    IN MIR-CVG-NOTI-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Notify Date";
        Index = "1";
    }

    IN MIR-CVG-NOTI-REASN-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "NOTRE";
        SType = "Text";
        Label = "Notify Reason";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-CVG-PHYS-EXAM-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-PHYS-EXAM-CD";
        SType = "Text";
        Label = "Medical Examination";
        Index = "1";
    }

    IN MIR-CVG-PMED-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-PMED-CD";
        SType = "Text";
        Label = "Paramedical";
        Index = "1";
    }

    IN MIR-CVG-PREM-CHNG-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Premium Change Date";
        Index = "1";
    }

    IN MIR-CVG-STRS-EKG-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-STRS-EKG-CD";
        SType = "Text";
        Label = "Stress Electro-cardiogram";
        Index = "1";
    }

    IN MIR-CVG-WP-LTD-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Premiums Waived";
    }

    IN MIR-CVG-WP-YTD-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Waiver of Premium Amounts Paid Year to Date";
    }

    IN MIR-CVG-XRAY-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-XRAY-CD";
        SType = "Text";
        Label = "X-ray";
        Index = "1";
    }

    IN MIR-DV-MAX-LOAN-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Loan Value Amount";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-POL-CSV-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }

    IN MIR-FREE-LK-FND-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Free Look Fund Required";
    }

    IN MIR-LATST-ACTV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Transaction Date";
    }

    IN MIR-MAT-XPRY-REASN-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "MAT-XPRY-REASN-CD";
        SType = "Text";
        Label = "Maturity/Expiry Reason";
        Index = "1";
    }

    IN MIR-NXT-ACTV-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "NXT-ACTV-TYP-CD";
        SType = "Text";
        Label = "Next Activity Type";
    }

    IN MIR-PLAN-ID-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
#MP245R CHANGES START
#CodeType = "POL-BILL-MODE-CD";
      CodeType = "POL-DV-BILL-MODE-CD";
#MP245R CHANGES ENDS
        SType = "Text";
        Label = "Premium Mode";
    }

    IN MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        #M161CA START
        #Label = "Billing Type";
        Label = "Billing Type(Subsequent Premium)";
        #M161CA END
    }

    #M161CA START
    IN MIR-INIT-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment Route (First Premium)";
    }
    #M161CA END
    IN MIR-POL-BT-BILL-DLAY-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Bank Transfer Billing Delay";
    }

    IN MIR-POL-COMNT-TXT
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Policy Comments";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }
    #TDMG24 CHANGES START HERE
            IN MIR-PREM-PMT-CMPLT-IND
            {
                DisplayOnly;
                Length = "1";
                SType = "Indicator";
                Label = "Base Policy Premium Payment Completion";
        
            }    
    #TDMG24 CHANGES END HERE    

# UYSD11 CHANGES BEGINS HERE
    IN MIR-USYS-MIGR-POL-IND
    {    
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Migrated Policy";
    }
# UYSD11 CHANGES ENDS HERE

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-DIV-OPT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Text";
        Label = "Policy Dividend Option";
    }

    IN MIR-POL-MISC-SUSP-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE      
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M319O1 CHANGES END HERE        
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    IN MIR-POL-NXT-ACTV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Activity Date";
    }

    IN MIR-POL-OS-DISB-AMT
    {
#MP245R CHANGES START HERE
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

    IN MIR-OS-DISB-SURR-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    IN MIR-OS-DISB-MAT-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    IN MIR-OS-DISB-DTH-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    IN MIR-OS-DISB-CLM-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    IN MIR-OS-DISB-AD-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }

    IN MIR-POL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Paid to Date";
    }

    IN MIR-POL-PREM-DSCNT-PCT
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "3";
        SType = "Percent";
        Label = "Policy Discount Percentage";
    }

    IN MIR-POL-PREM-SUSP-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Premium Suspense";
    }

    IN MIR-PREV-FILE-MAINT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Maintain Date";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-UWG-REQIR-ESTB-IND-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Underwriting requirements have been established";
        Index = "1";
    }

    IN MIR-UWG-USER-DEFN-1-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        SType = "Text";
        Label = "Miscellaneous UW Requirement (1)";
        Index = "1";
    }

    IN MIR-UWG-USER-DEFN-2-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        SType = "Text";
        Label = "Miscellaneous UW Requirement (2)";
        Index = "1";
    }

    IN MIR-UWG-USER-DEFN-3-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        SType = "Text";
        Label = "Miscellaneous UW Requirement (3)";
        Index = "1";
    }

    IN MIR-UWG-USER-DEFN-4-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        SType = "Text";
        Label = "Miscellaneous UW Requirement (4)";
        Index = "1";
    }

    IN MIR-UWG-USER-DEFN-5-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
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
#MP245R CHANGES STARTS HERE     
   INOUT MIR-OS-DISB-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }               
#MP245R CHANGES ENDS HERE
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
    IN MIR-PD-GR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END
}

