# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF1222-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - Address Code is now the driver field                    *
#*                   - JP-ADDR has been replaced by PREFCT-TXT                 *
#*                   - Samakata-bu (ADDR-ADDL) changed to 72 bytes             *
#*                   - Prefecture, City and Nieghborhood added for KA          *
#* M00024   AT       Add Corporate Tax Report Month field  
#* EN001604          - Add Hazardous occupation field                          * 
#* IPCAMC   CTS      - Change the length of Cause of Death field               *
#*                   - Add Cause Description field                             *
#*  C18250  CTS      Display the new TCLIA Kanji samakata-bu field in address  *
#*                   and client inquiry screen                                 *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP334A  CTS      ADDDED CHANGES FOR SUCCESSOR CLIENT CATEGORY  FIELD       *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*  TLCR16  CTS      Change of insured address retention method                *
#*  27550A  CTS      CHANGES DONE FOR RETURN MAIL FLAG CONTROL                 *
#*  23823C  CTS      - CWS EMAIL ADDRESS                                       *
#*  29746F  CTS      CHANGES AS PART OF CERBERUS NEW BUSINESS                  *
#*  CR1866  CTS      CHANGES AS PART OF CR-1866 JIRA                           *
#*******************************************************************************

P-STEP BF1222-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1222";
        BusinessFunctionName = "Client Record Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM0130";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-AGT-ID
    {
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
    }

    INOUT MIR-BEST-TIME-CALL-TXT
    {
        MixedCase;
        Length = "15";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Best Time to Call";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM-T[9]
    {
        MixedCase;
        Length = "50";
        FieldGroup = "Table9";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Accountholder Name";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-ID-T[9]
    {
        Length = "7";
        FieldGroup = "Table9";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-MICR-IND-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
        DBTableName = "TBNKA";
        SType = "Indicator";
        Label = "Cheque from account is MICR-encoded";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-TYP-CD-T[9]
    {
        Length = "40";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TBNKA";
        SType = "Selection";
        Label = "Account Type";
        Index = "1";
    }

    INOUT MIR-BNK-BR-ID-T[9]
    {
        Length = "5";
        FieldGroup = "Table9";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Branch Number";
        Index = "1";
    }

    INOUT MIR-BNK-ID-T[9]
    {
        Length = "4";
        FieldGroup = "Table9";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Number";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-CNTY-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "CTYPC";
        DBTableName = "TCLIA";
        SType = "Selection";
        Label = "County/Parish";
    }

    INOUT MIR-CLI-ADDR-LOC-CD
    {
        Length = "8";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Code";
    }
    
# TLCR16 CHANGES START HERE

    INOUT MIR-INSRD-ADDR-LOC-CD
    {
        Length = "8";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Insured Address Code";
    }
# TLCR16 CHANGES ENDS HERE

    INOUT MIR-CLI-PREFCT-TXT
    {
        MixedCase;
        Length = "11";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
    }

    INOUT MIR-CLI-KA-PREFCT-TXT
    {
        MixedCase;
        Length = "11";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
    }

    INOUT MIR-CLI-KA-CITY-TXT
    {
        MixedCase;
        Length = "30";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
    }

    INOUT MIR-CLI-KA-NGHBRHD-TXT
    {
        MixedCase;
        Length = "30";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Neighborhood";
    }

    INOUT MIR-CLI-ADDR-LN-1-TXT-T[2]
    {
        MixedCase;
        Length = "30";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-2-TXT-T[2]
    {
        MixedCase;
        Length = "30";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-3-TXT-T[2]
    {
        MixedCase;
        Length = "30";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT-T[2]
    {
        MixedCase;
        Length = "60";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Additional Information";
    }

# C18250 changes begin
    INOUT MIR-CLI-ADDR-KJ-TXT-T[2]
    {
        MixedCase;
        Length = "50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Kanji Samakata-bu";
    }
# C18250 changes end

    INOUT MIR-CLI-ADDR-MUN-CD
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "MCPCD";
        DBTableName = "TCLIA";
        SType = "Selection";
        Label = "Municipality";
    }

    INOUT MIR-CLI-ADDR-STAT-CD-T[2]
    {
        Length = "40";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        DBTableName = "TCLIA";
        SType = "Selection";
        Label = "Address Status";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-YR-DUR
    {
        Length = "3";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Years at Address";
    }

    INOUT MIR-CLI-AGE-PROOF-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Proof of age submitted";
    }

    INOUT MIR-CLI-BNK-ACCT-NUM-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    INOUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }

    INOUT MIR-CLI-BTH-LOC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Birth Location";
    }

    INOUT MIR-CLI-CHRTY-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Owner has been identified as a charity";
    }

    INOUT MIR-CLI-CITY-NM-TXT-T[2]
    {
        MixedCase;
        Length = "30";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    INOUT MIR-CLI-CLAS-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLCD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Classification";
    }

    INOUT MIR-CLI-CNFD-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Access to client information is confidential";
    }

    INOUT MIR-CLI-CO-NM-T[2]
    {
	#TLB041 CHANGES START HERE        
        #Length = "50";
	Length = "100";
	#TLB041 CHANGES END HERE
        FieldGroup = "Table4";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Company Name";
        Index = "1";
    }

    INOUT MIR-CLI-COMNT-TXT
    {
        MixedCase;
        Length = "237";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Additional Comments";
    }

    INOUT MIR-CLI-CR-CARD-NUM
    {
        Length = "20";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Chargecard Account Number";
    }

    INOUT MIR-CLI-CR-CARD-TYP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CHGTP";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Chargecard Type";
    }

    INOUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Province/State";
    }

    INOUT MIR-CLI-CTRY-CD
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TCLIA";
        SType = "Selection";
        Label = "Country";
    }

    INOUT MIR-CLI-ADDR-CNTCT-TXT
    {
        MixedCase;
        Length = "50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Phone Number";
    }

    INOUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    INOUT MIR-CLI-DTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Date of Death";
    }

# IPCAMC CHANGES START HERE
    INOUT MIR-CLI-DTH-REASN-CD
    {
        Length = "3";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Cause of Death";
    }

    INOUT MIR-CLI-DTH-REASN-TXT
    {
        Length = "40";       
        DBTableName = "TCLI";
        SType = "TextArea";
        Label = "Cause Description";
    }
# IPCAMC CHANGES END HERE 
    INOUT MIR-CLI-EMPL-YR-DUR
    {
        Length = "2";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Years with Employer";
    }

    INOUT MIR-CLI-EMPLR-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Province/State";
    }

    INOUT MIR-CLI-EMPLR-NM-T[2]
    {
        Length = "50";
        FieldGroup = "Table7";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Current Employer Name";
        Index = "1";
    }

    INOUT MIR-CLI-ENTR-CO-NM-T[2]
    {
        MixedCase;
	#TLB041 CHANGES START HERE        
        #Length = "50";
	Length = "100";
	#TLB041 CHANGES END HERE
        FieldGroup = "Table4";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Company Name";
        Index = "1";
    }

    INOUT MIR-CLI-ENTR-GIV-NM-T[2]
    {
        MixedCase;
        Length = "25";
        FieldGroup = "Table3";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    OUT MIR-CLI-ENTR-PREV-GIV-NM-T[6]
    {
        MixedCase;
        Length = "25";
        FieldGroup = "Table1";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    OUT MIR-CLI-ENTR-PREV-SUR-NM-T[6]
    {
        MixedCase;
        Length = "25";
        FieldGroup = "Table1";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    INOUT MIR-CLI-ENTR-SUR-NM-T[2]
    {
        MixedCase;
        Length = "25";
        FieldGroup = "Table3";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    INOUT MIR-CLI-GIV-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table3";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    INOUT MIR-CLI-INCM-EARN-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "INCCD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Income Class";
    }

    INOUT MIR-CLI-LANG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Correspondence Language";
    }

    INOUT MIR-CLI-LEGIT-DUP-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Legitimate duplicate - Do not consolidate";
    }

    INOUT MIR-CLI-MAIL-TITL-TXT
    {
        Length = "15";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Title";
    }

    INOUT MIR-CLI-MARIT-STAT-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "MARST";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Marital Status";
    }

    INOUT MIR-CLI-MIB-IND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-MIB-IND-CD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "MIB Indicator";
    }

    INOUT MIR-CLI-MID-INIT-NM-T[2]
    {
        Length = "1";
        FieldGroup = "Table3";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Initial";
        Index = "1";
    }

    INOUT MIR-CLI-OCCP-CLAS-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Occupation Class";
    }
  
    INOUT MIR-CLI-PIN-RESET-TXT
    {
        Length = "25";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Reset Identification";
    }

    OUT MIR-CLI-PREV-ADDR-CNTY-CD-T[4]
    {
        Length = "3";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "CTYPC";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "County/Parish";
        Index = "1";
    }

    OUT MIR-CLI-PREV-ADDR-LOC-CD-T[4]
    {
        Length = "8";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Code";
        Index = "1";
    }

    OUT MIR-CLI-PREV-PREFCT-TXT-T[4]
    {
        MixedCase;
        Length = "11";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    OUT MIR-CLI-PREV-KA-PREFCT-TXT-T[4]
    {
        MixedCase;
        Length = "11";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    OUT MIR-CLI-PREV-KA-CITY-TXT-T[4]
    {
        MixedCase;
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    OUT MIR-CLI-PREV-KA-NGHBRHD-TXT-T[4]
    {
        MixedCase;
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Neighborhood";
        Index = "1";
    }
 
    OUT MIR-CLI-PREV-ADDR-LN-1-TXT-T[4]
    {
        MixedCase;
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-PREV-ADDR-LN-2-TXT-T[4]
    {
        MixedCase;
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-PREV-ADDR-LN-3-TXT-T[4]
    {
        MixedCase;
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-PREV-ADDR-ADDL-TXT-T[4]
    {
        MixedCase;
        Length = "60";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Additional Information";
        Index = "1";
    }

    OUT MIR-CLI-PREV-ADDR-MUN-CD-T[4]
    {
        Length = "4";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "MCPCD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Municipality";
        Index = "1";
    }

    OUT MIR-CLI-PREV-ADDR-YR-DUR-T[4]
    {
        Length = "3";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Years at Address";
        Index = "1";
    }

    INOUT MIR-CLI-PREV-CITY-NM-TXT-T[4]
    {
        MixedCase;
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    OUT MIR-CLI-PREV-CRNT-LOC-CD-T[4]
    {
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Province/State";
        Index = "1";
    }

    OUT MIR-CLI-PREV-CTRY-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Country";
        Index = "1";
    }

    OUT MIR-CLI-PREV-CNTCT-TXT-T[4]
    {
        MixedCase;
        Length = "50";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Phone Number";
        Index = "1";
    }

    INOUT MIR-CLI-PREV-DCLN-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Declined Date";
    }

    INOUT MIR-CLI-PREV-DCLN-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Client previously declined by company";
    }

    INOUT MIR-CLI-PREV-EMPLR-NM-T[2]
    {
        Length = "50";
        FieldGroup = "Table8";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Previous Employer Name";
        Index = "1";
    }

    OUT MIR-CLI-PREV-MID-NM-T[6]
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Initial";
        Index = "1";
    }

    OUT MIR-CLI-PREV-PSTL-CD-T[4]
    {
        Length = "9";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    OUT MIR-CLI-PREV-RES-NUM-T[4]
    {
        Length = "5";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    OUT MIR-CLI-PREV-RES-TYP-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "RESD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Residence Type";
        Index = "1";
    }

    OUT MIR-CLI-PREV-SFX-NM-T[6]
    {
        Length = "10";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "SUFFX";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-CLI-PREV-TITL-TXT-T[6]
    {
        Length = "15";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        DBTableName = "TPRNM";
        SType = "Text";
        Label = "Title";
        Index = "1";
    }

    INOUT MIR-CLI-PRPS-RETIR-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Proposed Retirement Date";
    }

    INOUT MIR-CLI-PRST-RT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCLI";
        SType = "Percent";
        Label = "Persistency Rate";
    }

    INOUT MIR-CLI-RES-NUM-T[2]
    {
        Length = "5";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    INOUT MIR-CLI-RES-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "RESD";
        DBTableName = "TCLIA";
        SType = "Selection";
        Label = "Residence Type";
    }

    INOUT MIR-CLI-SELF-EMPL-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Self-employed";
    }

    INOUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Sex";
    }
     
    INOUT MIR-CLI-CORP-TAX-RPT-MO
    {
        Length = "2";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Report Month";
    }

    INOUT MIR-CLI-SFX-NM
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "SUFFX";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Suffix";
    }

    INOUT MIR-CLI-SMKR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Smoker";
    }

    INOUT MIR-CLI-STMT-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Statement Date";
    }

    INOUT MIR-CLI-SUR-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table3";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }
    INOUT MIR-CLI-TAX-ID
    {
        Length = "9";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    INOUT MIR-CLI-TXEMP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-TXEMP-CD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Tax Exempt";
    }

    INOUT MIR-CLI-UIC-QUALF-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "UIC Qualified";
    }

    INOUT MIR-CLI-WRK-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-CD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Worked/Period";
    }

    INOUT MIR-CLI-WRK-DUR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-DUR-CD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Worked/Period";
    }

    INOUT MIR-CLI-WRK-PT-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Part-time";
    }

    INOUT MIR-CLI-WRK-QTY
    {
        Length = "5";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Hours Worked";
    }

    INOUT MIR-CLI-WRK-RES-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Work at Home";
    }
    
   # Add Hazardous occupation code field for EN001604
    INOUT MIR-HZRD-OCCP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "HZDCD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Hazardous Occupation Code";
    }        

    INOUT MIR-DV-AGT-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Name";
    }

    INOUT MIR-DV-UPDT-ADDR-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Update previous address";
    }

    INOUT MIR-DV-UPDT-NM-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Update previous name";
    }

    INOUT MIR-EMPLR-ADDR-1-TXT-T[2]
    {
        MixedCase;
        Length = "25";
        FieldGroup = "Table6";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Current Employer Address";
        Index = "1";
    }

    INOUT MIR-EMPLR-ADDR-2-TXT-T[2]
    {
        MixedCase;
        Length = "25";
        FieldGroup = "Table6";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Current Employer Address";
        Index = "1";
    }

    INOUT MIR-OCCP-ID
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Occupation";
    }

    INOUT MIR-PREV-EMPL-YR-DUR
    {
        Length = "3";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Number of Years with Employer";
    }

    INOUT MIR-UNMTCH-MAIL-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Unmatched mail";
    }
     
    IN MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-ADDR-STAT-CHNG-DT-T[2]
    {
        Length = "10";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Date";
        Label = "Address Status Changed Date";
        Index = "1";
    }

    OUT MIR-AGT-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-STAT-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent Status";
    }

    OUT MIR-BNK-NM-T[9]
    {
        Length = "36";
        FieldGroup = "Table9";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-CHNG-DT-T[2]
    {
        Length = "10";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Date";
        Label = "Address Changed Date";
        Index = "1";
    }

    OUT MIR-CLI-CLAS-CHNG-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Classification Change Date";
    }

    OUT MIR-CLI-CMPLT-CCAS-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Clear case processing attempted";
    }

    OUT MIR-CLI-CNSLDT-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Last Consolidation Date";
    }

    OUT MIR-CLI-NM-CHNG-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Client Name Change Date";
    }

    OUT MIR-CLI-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TCLI";
        SType = "Currency";
        Label = "Suspense Amount";
    }

    OUT MIR-CLI-SUSP-CHNG-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Suspense Change Date";
    }

    OUT MIR-CLI-SUSP-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Suspense Amount Currency";
    }

    OUT MIR-CLI-UWGDECN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Underwriting Decision";
    }

    OUT MIR-CLI-UWGDECN-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "UW Decision Changed Date";
    }

    OUT MIR-CLI-UWGDECN-TYP-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Decision Type";
    }

    OUT MIR-DV-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
    }

    OUT MIR-DV-CLI-PREV-NM-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Client has a previous name(s)";
    }

    OUT MIR-DV-PREV-ADDR-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Previous Address";
    }

    OUT MIR-PREV-CNSLDT-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Previous Consolidated Client Number";
    }

    OUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Client Record";
    }

    OUT MIR-SUSP-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-UW-USER-1-ID
    {
        Length = "8";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "1st Underwriter Initials";
    }

    OUT MIR-UW-USER-2-ID
    {
        Length = "8";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "2nd Underwriter Initials";
    }

    OUT MIR-UWG-WRKSHT-NUM
    {
        Length = "2";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Worksheet Number";
    }

    OUT MIR-CLI-PSTL-CD-R-5-8
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Hidden";
    }
#M245B2 CHANGES START HERE    
    INOUT MIR-POL-CRCY-CD
       {
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
   }
 #M245B2 CHANGES END HERE
#MP334A CHANGES START HERE    
    INOUT MIR-BPSS-MTCH-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "BPSS-MTCH-CD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Successor Category";
    } 
#MP334A CHANGES END HERE 
#27550A CHANGES START HERE    
    INOUT MIR-RETRN-MAIL-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Return Mail Flag";        
    } 
    IN MIR-WEB-SERV-CALL-IND
    {
        Length ="1";
        SType = "Indicator";
        Label = "Webservice Indicator";
    }
#27550A CHANGES END HERE  
#23823C CHANGES START HERE    
    INOUT MIR-CWS-EMAIL-ADDR-TXT
    {
        MixedCase;
        Length = "80";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "CWS Registrant Email Address";        
    } 
#23823C CHANGES END HERE 
#29746F CHANGES START
    INOUT MIR-PAYO-BNK-ACCT-NUM-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    INOUT MIR-PAYO-BNK-ID-T[9]
    {
        Length = "4";
        FieldGroup = "Table9";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank Number";
        Index = "1";
    }

    INOUT MIR-PAYO-BNK-BR-ID-T[9]
    {
        Length = "5";
        FieldGroup = "Table9";
        DBTableName = "TBNKA";
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

    INOUT MIR-PAYO-BNK-NM-T[9]
    {
        Length = "36";
        FieldGroup = "Table9";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
        Index = "1";
    }

    INOUT MIR-PAYO-BNK-BR-NM-T[9]
    {
        Length = "36";
        FieldGroup = "Table9";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name";
        Index = "1";
    }

    INOUT MIR-PAYO-BNK-ACCT-ID-T[9]
    {
    #CR1866 CHANGES START HERE   
    #   Length = "7";
        Length = "17";
    #CR1866 CHANGES END HERE  
        FieldGroup = "Table9";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    INOUT MIR-PAYO-BNK-ACCT-TYP-CD-T[9]
    {
        Length = "3";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        DBTableName = "TBNKA";
        SType = "Selection";
        Label = "Account Type";
        Index = "1";
    }

    INOUT MIR-PAYO-ACCT-MICR-IND-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
        DBTableName = "TBNKA";
        SType = "Indicator";
        Label = "Cheque from account is MICR-encoded";
        Index = "1";
    }

    INOUT MIR-PAYO-BNK-ACCT-HLDR-NM-T[9]
    {
        Length = "50";
        FieldGroup = "Table9";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Accountholder Name";
        Index = "1";
    }
#29746F CHANGES END
}

