# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF1220-P.p                                                    *
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
#*  M00024  AT       Add corporate tax report month                            *
#*  EN001604         - Add Hazardous occupation field                          *  
#*                                                                             *
#*  IPCAMC  CTS      - Change the length of Cause of Death field               *
#*                   - Add Cause Description field                             *
#*  C18250  CTS      Display the new TCLIA Kanji samakata-bu field in address  *
#*                   and client inquiry screen                                 *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  R10424  CTS      Changes to add Bank name and Branch name                  *
#*  MP334A  CTS      ADDDED CHANGES FOR SUCCESSOR CLIENT CATEGORY  FIELD       *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*  TLCR16  CTS      Change of insured address retention method                *
#*  27550A  CTS      ADDED CHANGES FOR RETURN MAIL FLAG FIELD                  *
#*  23823C  CTS      CWS Email Address                                         * 
#*  29746F  CTS      CHANGES AS PART OF CERBERUS NEW BUSINESS                  *
#*******************************************************************************

P-STEP BF1220-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1220";
        BusinessFunctionName = "Client Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM0130";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
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

    OUT MIR-AGT-ID
    {
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
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

    OUT MIR-BEST-TIME-CALL-TXT
    {
        Length = "15";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Best Time to Call";
    }

    OUT MIR-BNK-ACCT-HLDR-NM-T[9]
    {
        Length = "50";
        FieldGroup = "Table9";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Accountholder Name";
        Index = "1";
    }

    OUT MIR-BNK-ACCT-ID-T[9]
    {
        Length = "7";
        FieldGroup = "Table9";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    OUT MIR-BNK-ACCT-MICR-IND-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
        DBTableName = "TBNKA";
        SType = "Indicator";
        Label = "Cheque from account is MICR-encoded";
        Index = "1";
    }

    OUT MIR-BNK-ACCT-TYP-CD-T[9]
    {
        Length = "40";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Type";
        Index = "1";
    }

    OUT MIR-BNK-BR-ID-T[9]
    {
        Length = "5";
        FieldGroup = "Table9";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Branch Number";
        Index = "1";
    }

    OUT MIR-BNK-ID-T[9]
    {
        Length = "4";
        FieldGroup = "Table9";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Number";
        Index = "1";
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

    OUT MIR-CLI-ADDR-CNTY-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "CTYPC";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "County/Parish";
    }

    OUT MIR-CLI-ADDR-LN-1-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-LN-2-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-LN-3-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-ADDL-TXT-T[2]
    {
        MixedCase;
        Length = "72";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Samakata-bu";
    }

# C18250 changes begin
    OUT MIR-CLI-ADDR-KJ-TXT-T[2]
    {
        MixedCase;
        Length = "50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Kanji Samakata-bu";
    }
# C18250 changes end

    OUT MIR-CLI-ADDR-MUN-CD
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "MCPCD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Municipality";
    }

    OUT MIR-CLI-ADDR-STAT-CD-T[2]
    {
        Length = "40";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Status";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-YR-DUR
    {
        Length = "3";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Years at Address";
    }

    OUT MIR-CLI-AGE-PROOF-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Proof of age submitted";
    }

    OUT MIR-CLI-BNK-ACCT-NUM-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }

    OUT MIR-CLI-BTH-LOC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Birth Location";
    }

    OUT MIR-CLI-CHRTY-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Owner has been identified as a charity";
    }

    OUT MIR-CLI-CITY-NM-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    OUT MIR-CLI-CLAS-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLCD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Classification";
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

    OUT MIR-CLI-CNFD-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Access to client information is confidential";
    }

    OUT MIR-CLI-CNSLDT-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Last Consolidation Date";
    }

    OUT MIR-CLI-CO-NM-T[2]
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

    OUT MIR-CLI-COMNT-TXT
    {
        Length = "237";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Additional Comments";
    }

    OUT MIR-CLI-CR-CARD-NUM
    {
        Length = "20";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Chargecard Account Number";
    }

    OUT MIR-CLI-CR-CARD-TYP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CHGTP";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Chargecard Type";
    }

    OUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Province/State";
    }

    OUT MIR-CLI-CTRY-CD
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Country";
    }

    OUT MIR-CLI-ADDR-CNTCT-TXT
    {
        Length = "50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Phone Number";
    }

    OUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    OUT MIR-CLI-ADDR-LOC-CD
    {
        Length = "8";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Code";
    }

# TLCR16 CHANGES START HERE

    OUT MIR-INSRD-ADDR-LOC-CD
    {
        Length = "8";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Insured Address Code";
    }
# TLCR16 CHANGES ENDS HERE 

    OUT MIR-CLI-PREFCT-TXT
    {
        Length = "11";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
    }

    OUT MIR-CLI-KA-PREFCT-TXT
    {
        Length = "11";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
    }

    OUT MIR-CLI-KA-CITY-TXT
    {
        Length = "30";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
    }

    OUT MIR-CLI-KA-NGHBRHD-TXT
    {
        Length = "30";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Neighborhood";
    }

    OUT MIR-CLI-DTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Date of Death";
    }

# IPCAMC CHANGES START HERE
    OUT MIR-CLI-DTH-REASN-CD
    {
        Length = "3";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Cause of Death";
    }

    OUT MIR-CLI-DTH-REASN-TXT
    {
        Length = "40";
        DBTableName = "TCLI";
        SType = "TextArea";
        Label = "Cause Description";
    }
# IPCAMC CHANGES END HERE 

    OUT MIR-CLI-EMPL-YR-DUR
    {
        Length = "2";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Years with Employer";
    }

    OUT MIR-CLI-EMPLR-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Province/State";
    }

    OUT MIR-CLI-EMPLR-NM-T[2]
    {
        Length = "50";
        FieldGroup = "Table7";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Current Employer Name";
        Index = "1";
    }

    OUT MIR-CLI-ENTR-CO-NM-T[2]
    {
        Mandatory;
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

    OUT MIR-CLI-ENTR-GIV-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table3";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    OUT MIR-CLI-ENTR-PREV-GIV-NM-T[6]
    {
        Length = "25";
        FieldGroup = "Table1";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    OUT MIR-CLI-ENTR-PREV-SUR-NM-T[6]
    {
        Length = "25";
        FieldGroup = "Table1";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    OUT MIR-CLI-ENTR-SUR-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table3";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    OUT MIR-CLI-GIV-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table3";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    OUT MIR-CLI-INCM-EARN-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "INCCD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Income Class";
    }

    OUT MIR-CLI-LANG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Correspondence Language";
    }

    OUT MIR-CLI-LEGIT-DUP-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Legitimate duplicate - Do not consolidate";
    }

    OUT MIR-CLI-MAIL-TITL-TXT
    {
        Length = "15";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Title";
    }

    OUT MIR-CLI-MARIT-STAT-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "MARST";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Marital Status";
    }

    OUT MIR-CLI-MIB-IND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-MIB-IND-CD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "MIB Indicator";
    }

    OUT MIR-CLI-MID-INIT-NM-T[2]
    {
        Length = "1";
        FieldGroup = "Table3";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Initial";
        Index = "1";
    }

    OUT MIR-CLI-NM-CHNG-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Client Name Change Date";
    }

    OUT MIR-CLI-OCCP-CLAS-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Occupation Class";
    }

    OUT MIR-CLI-PIN-RESET-TXT
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

    OUT MIR-CLI-PREV-ADDR-LN-1-TXT-T[4]
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-PREV-ADDR-LN-2-TXT-T[4]
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-PREV-ADDR-LN-3-TXT-T[4]
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-PREV-ADDR-ADDL-TXT-T[4]
    {
        Length = "72";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Samakata-bu";
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

    OUT MIR-CLI-PREV-CITY-NM-TXT-T[4]
    {
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

    OUT MIR-CLI-PREV-CNTCT-TXT-T[4]
    {
        Length = "50";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Phone Number";
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
        Length = "11";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    OUT MIR-CLI-PREV-KA-PREFCT-TXT-T[4]
    {
        Length = "11";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    OUT MIR-CLI-PREV-KA-CITY-TXT-T[4]
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    OUT MIR-CLI-PREV-KA-NGHBRHD-TXT-T[4]
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Neighborhood";
        Index = "1";
    }

    OUT MIR-CLI-PREV-DCLN-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Declined Date";
    }

    OUT MIR-CLI-PREV-DCLN-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Client previously declined by company";
    }

    OUT MIR-CLI-PREV-EMPLR-NM-T[2]
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
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Title";
        Index = "1";
    }

    OUT MIR-CLI-PRPS-RETIR-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Proposed Retirement Date";
    }

    OUT MIR-CLI-PRST-RT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCLI";
        SType = "Percent";
        Label = "Persistency Rate";
    }

    OUT MIR-CLI-RES-NUM-T[2]
    {
        Length = "5";
        FieldGroup = "Table4";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    OUT MIR-CLI-RES-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "RESD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Residence Type";
    }

    OUT MIR-CLI-SELF-EMPL-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Self-employed";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
     
    OUT MIR-CLI-CORP-TAX-RPT-MO
    {
        Length = "2";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Report Month";
    }

    OUT MIR-CLI-SFX-NM
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "SUFFX";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CLI-SMKR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Smoker";
    }

    OUT MIR-CLI-STMT-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Statement Date";
    }

    OUT MIR-CLI-SUR-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table3";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
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

    OUT MIR-CLI-TAX-ID
    {
        Length = "9";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    OUT MIR-CLI-TXEMP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-TXEMP-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Exempt";
    }

    OUT MIR-CLI-UIC-QUALF-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "UIC Qualified";
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

    OUT MIR-CLI-WRK-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Worked/Period";
    }

    OUT MIR-CLI-WRK-DUR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-DUR-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Worked/Period";
    }

    OUT MIR-CLI-WRK-PT-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Part-time";
    }

    OUT MIR-CLI-WRK-QTY
    {
        Length = "5";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Hours Worked";
    }

    OUT MIR-CLI-WRK-RES-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Work at Home";
    }

    # Add Hazardous occupation code field for EN001604
    OUT MIR-HZRD-OCCP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "HZDCD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Hazardous Occupation Code";
    }    

    OUT MIR-DV-AGT-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Name";
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

    OUT MIR-DV-UPDT-ADDR-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Update previous address";
    }

    OUT MIR-DV-UPDT-NM-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Update previous name";
    }

    OUT MIR-EMPLR-ADDR-1-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table6";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Current Employer Address";
        Index = "1";
    }

    OUT MIR-EMPLR-ADDR-2-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table6";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Current Employer Address";
        Index = "1";
    }

    OUT MIR-OCCP-ID
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Occupation";
    }

    OUT MIR-PREV-CNSLDT-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Previous Consolidated Client Number";
    }

    OUT MIR-PREV-EMPL-YR-DUR
    {
        Length = "3";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Number of Years with Employer";
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

    OUT MIR-UNMTCH-MAIL-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Unmatched mail";
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
#M245B2 CHANGES START HERE    
    INOUT MIR-POL-CRCY-CD
       {
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
   }
#M245B2 CHANGES END HERE
# R10424 changes begin
  OUT MIR-BNK-BR-NM-T[9]
    {
        Length = "36";
        FieldGroup = "Table9";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name";
        Index = "1";
    }
# R10424 changes begin    
#MP334A CHANGES START HERE    
  OUT MIR-BPSS-MTCH-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "BPSS-MTCH-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Successor Category";
    } 
#MP334A CHANGES END HERE
# 27550A CHANGES START HERE
  OUT MIR-RETRN-MAIL-IND
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
# 27550A CHANGES END HERE  
# 23823C CHANGES START HERE
  OUT MIR-CWS-EMAIL-ADDR-TXT
    {
         Length = "80";
         DBTableName = "TCLI";
         SType = "Text";
         Label = "CWS Registrant Email Address";
     }
# 23823C CHANGES END HERE
#29746F CHANGES START
    OUT MIR-PAYO-BNK-ACCT-NUM-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    OUT MIR-PAYO-BNK-ID-T[9]
    {
        Length = "4";
        FieldGroup = "Table9";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank Number";
        Index = "1";
    }

    OUT MIR-PAYO-BNK-BR-ID-T[9]
    {
        Length = "5";
        FieldGroup = "Table9";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Branch Number";
        Index = "1";
    }

    OUT MIR-PAYO-SUB-BR-ID-T[9]
    {
        Length = "5";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Sub Branch Number";
        Index = "1";
    }

    OUT MIR-PAYO-BNK-NM-T[9]
    {
        Length = "36";
        FieldGroup = "Table9";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
        Index = "1";
    }

    OUT MIR-PAYO-BNK-BR-NM-T[9]
    {
        Length = "36";
        FieldGroup = "Table9";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name";
        Index = "1";
    }

    OUT MIR-PAYO-BNK-ACCT-ID-T[9]
    {
        Length = "7";
        FieldGroup = "Table9";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    OUT MIR-PAYO-BNK-ACCT-TYP-CD-T[9]
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

    OUT MIR-PAYO-ACCT-MICR-IND-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
        DBTableName = "TBNKA";
        SType = "Indicator";
        Label = "Cheque from account is MICR-encoded";
        Index = "1";
    }

    OUT MIR-PAYO-BNK-ACCT-HLDR-NM-T[9]
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

