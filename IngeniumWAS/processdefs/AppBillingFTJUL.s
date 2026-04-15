# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppBillingFTJUL.s                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  017797  612J     Correct POL-SNDRY-AMT LENGTH                              *
#*  02BL63  KRW      ADD POL-BT-BILL-DLAY-IND                                  *
#*  M161CA  CTS      ADD INIT-PMT-TYP-CD                                       *
#*  MP168A  CTS      ADD PLAN-INIT-PMT-TYP-CD                                  *
#*                                                                             *
#*  Q11521  CTS      ADDED SUB TYPE CODE FOR PLAN-INIT-PMT-TYP-CD              *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M271O1  CTS      CHANGES DONE AS PART OF FRA                               *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  NV3N01  CTS      CHANGES DONE AS PART OF SULV3                             *
#*  29746F  CTS      CERBERUS CHANGES IN APPLICATION ENTRY SCREEN-BILLING      *
#*                   DETAILS                                                   *
#*  CR1866  CTS      CHANGES AS PART OF CR-1866 JIRA                           *
#*******************************************************************************

S-STEP AppBillingFTJUL
{
    ATTRIBUTES
    {
        FocusField = "MIR-POL-SNDRY-AMT";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    IN BannerBar;

    IN BannerBarSize;

    IN BannerProductID
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
    }

    IN BannerPolicyID;

    IN BannerPrimaryInsured;


    # input policy id values to this s step for the filtered
    # selection box, csom4902 to work.  Pageserver only looks
    # @ the s step to determine how to build the page.  Even though
    # the policy id information will be passed around implicitly,
    # it must be passed in explicitly for pageserver.

    IN MIR-POL-ID-BASE;

    IN MIR-POL-ID-SFX;

    OUT action
    {
        SType = "Hidden";
    }

    INOUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-POL-SNDRY-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        Label = "Sundry Amount:";
        SType = "Currency";
        Length = "13";
    }

    INOUT MIR-DV-SBOX-CD-T
    {
        #M161CA START
        #Label = "Billing Method/Frequency:";
        Label = "Billing Method(Subsequent Premium)/Frequency:";
        #M161CA START
        SType = "Selection";
        Length = "30";
        Mandatory;
        CodeSource = "CSOM4901";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
    }

    OUT MIR-POL-BILL-TYP-CD
    {
        SType = "Hidden";
    }

    OUT MIR-POL-BILL-MODE-CD
    {
        SType = "Hidden";
    }
    #M161CA START
    INOUT MIR-INIT-PMT-TYP-CD
    {
        Mandatory;
        SType = "Selection";
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";
        Label = "Payment Route (First Premium)";
    }
    #M161CA END
    #MP168A START
    INOUT MIR-PLAN-INIT-PMT-TYP-CD
    {
        Mandatory;
        SType = "Selection";
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";
        #Q11521 START
        CodeSubType = "PLAN";
        #Q11521 STOP
        Label = "First Premium Payment Route(Planned)";
    }
    #MP168A END

#NV3N01 CHANGES START HERE
    INOUT MIR-MTHLY-STD-PREM-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "Monthly Standard Premium";
        SType = "Currency";
        Length = "15";
    }
#NV3N01 CHANGES END HERE 

    INOUT MIR-POL-PAC-DRW-DY
    {
        Label = "Draw Day:";
        SType = "Selection";
        Length = "30";
        Mandatory;
        CodeSource = "CSOM4910";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
    }

    IN PayorName
    {
        DisplayOnly;
        Label = " Payor Name";
        SType = "Text";
        Length = "50";
    }

    IN MIR-DV-PAYR-CLI-ID
    {
        DisplayOnly;
        Label = "Payor Client ID";
        SType = "Text";
        Length = "10";
    }

    OUT AddCompanyPayorLink
    {
        Label = "Add Company Payor";
        Link;
        SType = "Text";
        Action = "GoToCompanySearch";
    }

    INOUT MIR-ACCT-HLDR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-HLDR-TYP-CD";
        SType = "Selection";
        Label = "Bank Account Holder Type";
    }    

    INOUT MIR-COMB-BILL-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMB-BILL-IND";
        SType = "Selection";
        Label = "Combine Billing Indicator";
    }    

    INOUT MIR-BNK-ID-T[9]
    {
        Length = "4";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Number";
        Index = "1";
    }

    INOUT MIR-BNK-BR-ID-T[9]
    {
        Length = "5";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Branch Number";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-ID-T[9]
    {
        Label = "Account";
        FieldGroup = "Table1";
        SType = "Text";
        Length = "15";
        Index = "1";
    }

    IN MIR-BNK-NM-T[9]
    {
        Label = "Bank Name";
        FieldGroup = "Table1";
        SType = "Text";
        DisplayOnly;
        Length = "20";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM-T[9]
    {
        Label = "Account Holder";
        FieldGroup = "Table1";
        SType = "Text";
        Length = "50";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-TYP-CD-T[9]
    {
        Label = "Account Type";
        FieldGroup = "Table1";
        SType = "Selection";
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-MICR-IND-T[9]
    {
        Label = "MICR Indicator";
        FieldGroup = "Table1";
        SType = "Indicator";
        Index = "1";
    }


    # RADIO BUTTON TO TRACK SPECIAL FREQUENCY
    # REQUESTED.

    INOUT SFYesNo
    {
        SType = "YesNo";
        Label = "Special Frequency Requested?";
        DefaultConstant = "N";
    }

    INOUT MIR-DV-LBILL-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "List Bill Client ID";
    }

    IN MIR-DV-LBILL-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "ListBill Name";
    }

    INOUT MIR-POL-LBILL-DRW-DY
    {
        Label = "Listbill Draw Day:";
        SType = "Selection";
        Length = "30";
        Mandatory;
        CodeSource = "CSOM4910";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
    }

    INOUT MIR-POL-SFB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-SFB-CD";
        SType = "Selection";
        Label = "Number of Special Frequency Bills produced Annually";
    }

    INOUT MIR-SFB-END-DT
    {
        Length = "10";
        SType = "Date";
        Label = "SFB End Date";
    }

    INOUT MIR-SFB-GP-END-DT-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "SFB Gap End Date";
    }

    INOUT MIR-SFB-GP-STRT-DT-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "SFB Gap Start Date";
    }

    INOUT MIR-SFB-SEMI-MTHLY-DY
    {
        Label = "Alternate Listbill Draw Day:";
        SType = "Selection";
        Length = "30";
        Mandatory;
        CodeSource = "CSOM4910";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
    }

    INOUT MIR-SFB-STRT-DT
    {
        Length = "10";
        Mandatory;
        SType = "Date";
        Label = "SFB Start Date";
    }

    INOUT MIR-POL-BT-BILL-DLAY-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Bank Transfer Billing Delay";
    }
#M245B2 CHANGES START HERE     
      IN MIR-POL-CRCY-CD
        {
     
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
        }
#M245B2 CHANGES END HERE    
#M271O1 CHANGES START HERE   
       INOUT MIR-PREM-CRCY-CD
       {
                      
           Length = "2";
           SType = "Hidden";
           Label = "Currency";
       }
   #M271O1 CHANGES END HERE 
#UYS133 CHANGES START
    INOUT MIR-PD-GR-TYP-CD
    {
        SType = "Text";
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        Label = "PD group size";
    }
#UYS133 CHANGES END

#29746F CHANGE START

    INOUT MIR-CPN-PAYO-JPY-BNFT-IND 
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY Benefit Rider";
    } 

    INOUT MIR-CPN-AUTO-PAYO-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Automatic Payout Rider";
    }

    INOUT MIR-PAYO-BNK-ID-T[9]
    {
        Length = "4";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Number";
        Index = "1";
    }

    INOUT MIR-PAYO-BNK-BR-ID-T[9]
    {
        Length = "5";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Branch Number";
        Index = "1";
    }

    INOUT MIR-PAYO-SUB-BR-ID-T[9]
    {
        Length = "5";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Sub Branch Number";
        Index = "1";
    }

    INOUT MIR-PAYO-BNK-ACCT-ID-T[9]
    {
    #CR1866 CHANGES START HERE   
    #   Length = "7";
        Length = "17";
    #CR1866 CHANGES END HERE  
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    IN MIR-PAYO-BNK-NM-T[9]
    {
        DisplayOnly;
        Length = "36";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Name";
        Index = "1";
    }

    INOUT MIR-PAYO-BNK-ACCT-HLDR-NM-T[9]
    {
        Label = "Accountholder Name";
        FieldGroup = "Table9";
        SType = "Text";
        Length = "50";
        Index = "1";
    }

    INOUT MIR-PAYO-BNK-ACCT-TYP-CD-T[9]
    {
        Label = "Account Type";
        FieldGroup = "Table9";
        SType = "Selection";
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        Index = "1";
    }

    INOUT MIR-PAYO-ACCT-MICR-IND-T[9]
    {
        Label = "MICR Indicator";
        FieldGroup = "Table9";
        SType = "Indicator";
        Index = "1";
    }
#29746F CHANGES END	

}

