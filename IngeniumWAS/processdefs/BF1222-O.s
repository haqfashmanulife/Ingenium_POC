# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF1222-O.s                                                    *
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
#*  IPCAMC  CTS      - Change the length of Cause of Death field               *
#*                   - Add Cause Description field                             *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*  27550A  CTS      CHANGES DONE FOR RETURN MAIL FLAG CONTROL                 *
#*  23823C  CTS      - CWS EMAIL ADDRESS                                       *
#*  29746F  CTS      CHANGES AS PART OF CERBERUS NEW BUSINESS                  *
#*  CR1866  CTS      CHANGES AS PART OF CR-1866 JIRA                           *
#*******************************************************************************

S-STEP BF1222-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
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

    IN MIR-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent ID";
    }

    IN MIR-BEST-TIME-CALL-TXT
    {
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Best Time to Call";
    }

    IN MIR-BNK-ACCT-HLDR-NM-T[9]
    {
        DisplayOnly;
        Length = "50";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Accountholder Name";
        Index = "1";
    }

    IN MIR-BNK-ACCT-ID-T[9]
    {
        DisplayOnly;
        Length = "7";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    IN MIR-BNK-ACCT-MICR-IND-T[9]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table9";
        SType = "Indicator";
        Label = "Cheque from account is MICR-encoded";
        Index = "1";
    }

    IN MIR-BNK-ACCT-TYP-CD-T[9]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Text";
        Label = "Account Type";
        Index = "1";
    }

    IN MIR-BNK-BR-ID-T[9]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Branch Number";
        Index = "1";
    }

    IN MIR-BNK-ID-T[9]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Number";
        Index = "1";
    }

    IN MIR-CLI-ADDR-CNTY-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "CTYPC";
        SType = "Text";
        Label = "County/Parish";
    }

    IN MIR-CLI-ADDR-LOC-CD
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Address Code";
    }

    IN MIR-CLI-ADDR-LN-1-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    IN MIR-CLI-ADDR-LN-2-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    IN MIR-CLI-ADDR-LN-3-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    #added for 01AD05

    IN MIR-CLI-PREFCT-TXT
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Prefecture";
    }

    #added for 01AD05

    IN MIR-CLI-KA-PREFCT-TXT
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Prefecture";
    }

    #added for 01AD05

    IN MIR-CLI-KA-CITY-TXT
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "City";
    }

    #added for 01AD05

    IN MIR-CLI-KA-NGHBRHD-TXT
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "Neighborhood";
    }

    IN MIR-CLI-ADDR-MUN-CD
    {
        DisplayOnly;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "MCPCD";
        SType = "Text";
        Label = "Municipality";
    }

    IN MIR-CLI-ADDR-STAT-CD-T[2]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Text";
        Label = "Address Status";
        Index = "1";
    }

    IN MIR-CLI-ADDR-YR-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Years at Address";
    }

    IN MIR-CLI-AGE-PROOF-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Proof of age submitted";
    }

    IN MIR-CLI-BNK-ACCT-NUM-T[9]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    IN MIR-CLI-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }

    IN MIR-CLI-BTH-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        SType = "Text";
        Label = "Birth Location";
    }

    IN MIR-CLI-CHRTY-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Owner has been identified as a charity";
    }

    IN MIR-CLI-CITY-NM-TXT-T[2]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    IN MIR-CLI-CLAS-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLCD";
        SType = "Text";
        Label = "Classification";
    }

    IN MIR-CLI-CNFD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Access to client information is confidential";
    }

    IN MIR-CLI-CO-NM-T[2]
    {
        DisplayOnly;
	#TLB041 CHANGES START HERE        
        #Length = "50";
	Length = "100";
	#TLB041 CHANGES END HERE
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Company Name";
        Index = "1";
    }

    IN MIR-CLI-COMNT-TXT
    {
        DisplayOnly;
        Length = "237";
        SType = "Text";
        Label = "Additional Comments";
    }

    IN MIR-CLI-CR-CARD-NUM
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Chargecard Account Number";
    }

    IN MIR-CLI-CR-CARD-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CHGTP";
        SType = "Text";
        Label = "Chargecard Type";
    }

    IN MIR-CLI-CRNT-LOC-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        SType = "Text";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        Label = "Province/State";
    }

    IN MIR-CLI-CTRY-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country";
    }

    IN MIR-CLI-DTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date of Death";
    }

# IPCAMC CHANGES START HERE
    IN MIR-CLI-DTH-REASN-CD
    {
        Length = "3";
        SType = "Text";
        Label = "Cause of Death";
    }

    IN MIR-CLI-DTH-REASN-TXT
    {
        Length = "40";
        CodeSource = "CSOM9A38";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-DTH-REASN-CD";
        DefaultConstant = "NO";
        SType = "TextArea";
        Label = "Cause Description";
    }
# IPCAMC CHANGES END HERE 

    IN MIR-CLI-EMPL-YR-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Years with Employer";
    }

    IN MIR-CLI-EMPLR-LOC-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        SType = "Text";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        Label = "Province/State";
    }

    IN MIR-CLI-EMPLR-NM-T[2]
    {
        DisplayOnly;
        Length = "50";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Current Employer Name";
        Index = "1";
    }

    IN MIR-CLI-ENTR-CO-NM-T[2]
    {
        DisplayOnly;
	#TLB041 CHANGES START HERE        
        #Length = "50";
	Length = "100";
	#TLB041 CHANGES END HERE
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Company Name";
        Index = "1";
    }

    IN MIR-CLI-ENTR-GIV-NM-T[2]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    IN MIR-CLI-ENTR-PREV-GIV-NM-T[6]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    IN MIR-CLI-ENTR-PREV-SUR-NM-T[6]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    IN MIR-CLI-ENTR-SUR-NM-T[2]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    IN MIR-CLI-GIV-NM-T[2]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    IN MIR-CLI-INCM-EARN-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "INCCD";
        SType = "Text";
        Label = "Income Class";
    }

    IN MIR-CLI-LANG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Correspondence Language";
    }

    IN MIR-CLI-LEGIT-DUP-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Legitimate duplicate - Do not consolidate";
    }

    IN MIR-CLI-MAIL-TITL-TXT
    {
        DisplayOnly;
        Length = "15";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        SType = "Text";
        Label = "Title";
    }

    IN MIR-CLI-MARIT-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "MARST";
        SType = "Text";
        Label = "Marital Status";
    }

    IN MIR-CLI-MIB-IND-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-MIB-IND-CD";
        SType = "Text";
        Label = "MIB Indicator";
    }

    IN MIR-CLI-MID-INIT-NM-T[2]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Initial";
        Index = "1";
    }

    IN MIR-CLI-OCCP-CLAS-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        SType = "Text";
        Label = "Occupation Class";
    }

    IN MIR-CLI-PIN-RESET-TXT
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Reset Identification";
    }

    IN MIR-CLI-PREV-ADDR-CNTY-CD-T[4]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "CTYPC";
        SType = "Text";
        Label = "County/Parish";
        Index = "1";
    }

    #added for 01AD05

    IN MIR-CLI-PREV-ADDR-LOC-CD-T[4]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address Code";
        Index = "1";
    }
 
    IN MIR-CLI-PREV-ADDR-LN-1-TXT-T[4]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    IN MIR-CLI-PREV-ADDR-LN-2-TXT-T[4]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    #added for 01AD05

    IN MIR-CLI-PREV-PREFCT-TXT[4]
    {
        DisplayOnly;
        Length = "11";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    #added for 01AD05

    IN MIR-CLI-PREV-KA-PREFCT-TXT
    {
        DisplayOnly;
        Length = "11";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    #added for 01AD05

    IN MIR-CLI-PREV-KA-CITY-TXT
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    #added for 01AD05

    IN MIR-CLI-PREV-KA-NGHBRHD-TXT
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Neighborhood";
        Index = "1";
    }
 
    IN MIR-CLI-PREV-ADDR-MUN-CD-T[4]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "MCPCD";
        SType = "Text";
        Label = "Municipality";
        Index = "1";
    }

    IN MIR-CLI-PREV-ADDR-YR-DUR-T[4]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Years at Address";
        Index = "1";
    }

    IN MIR-CLI-PREV-CITY-NM-TXT-T[4]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    IN MIR-CLI-PREV-CRNT-LOC-CD-T[4]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        SType = "Text";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        Label = "Province/State";
        Index = "1";
    }

    IN MIR-CLI-PREV-CTRY-CD-T[4]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country";
        Index = "1";
    }

    IN MIR-CLI-PREV-DCLN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Declined Date";
    }

    IN MIR-CLI-PREV-DCLN-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Client previously declined by company";
    }

    IN MIR-CLI-PREV-EMPLR-NM-T[2]
    {
        DisplayOnly;
        Length = "50";
        FieldGroup = "Table8";
        SType = "Text";
        Label = "Previous Employer Name";
        Index = "1";
    }

    IN MIR-CLI-PREV-MID-NM-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Initial";
        Index = "1";
    }

    IN MIR-CLI-PREV-PSTL-CD-T[4]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    IN MIR-CLI-PREV-RES-NUM-T[4]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    IN MIR-CLI-PREV-RES-TYP-CD-T[4]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "RESD";
        SType = "Text";
        Label = "Residence Type";
        Index = "1";
    }

    IN MIR-CLI-PREV-SFX-NM-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "SUFFX";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-CLI-PREV-TITL-TXT-T[6]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        SType = "Text";
        Label = "Title";
        Index = "1";
    }

    IN MIR-CLI-PRPS-RETIR-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Proposed Retirement Date";
    }

    IN MIR-CLI-PRST-RT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Persistency Rate";
    }

    IN MIR-CLI-PSTL-CD-T[2]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    IN MIR-CLI-RES-NUM-T[2]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    IN MIR-CLI-RES-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "RESD";
        SType = "Text";
        Label = "Residence Type";
    }

    IN MIR-CLI-SELF-EMPL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Self-employed";
    }

    IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-CLI-CORP-TAX-RPT-MO
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Tax Report Month";
    }

    IN MIR-CLI-SFX-NM
    {
        DisplayOnly;
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "SUFFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CLI-SMKR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        SType = "Text";
        Label = "Smoker";
    }

    IN MIR-CLI-STMT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Statement Date";
    }

    IN MIR-CLI-SUR-NM-T[2]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    IN MIR-CLI-TAX-ID
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    IN MIR-CLI-TXEMP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-TXEMP-CD";
        SType = "Text";
        Label = "Tax Exempt";
    }

    IN MIR-CLI-UIC-QUALF-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "UIC Qualified";
    }

    IN MIR-CLI-WRK-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-CD";
        SType = "Text";
        Label = "Worked/Period";
    }

    IN MIR-CLI-WRK-DUR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-DUR-CD";
        SType = "Text";
        Label = "Worked/Period";
    }

    IN MIR-CLI-WRK-PT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Part-time";
    }

    IN MIR-CLI-WRK-QTY
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Hours Worked";
    }

    IN MIR-CLI-WRK-RES-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Work at Home";
    }

    #Added "Hazardous occupation field" for EN001604.
    IN MIR-HZRD-OCCP-CD 
    {
	CodeSource = "EDIT";
	CodeType = "HZDCD";
	DisplayOnly;
	Label = "Hazardous Occupation Code";
	Length = "1";
	SType = "Text";
	}

    IN MIR-DV-AGT-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Name";
    }

    IN MIR-DV-BTH-JP-DT-DY-TXT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Birth Days In Emperor Format";
    }

    IN MIR-DV-BTH-JP-DT-EMPRR-NM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Emperor Name";
    }

    IN MIR-DV-BTH-JP-DT-MO-TXT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Birth Months In Emperor Format";
    }

    IN MIR-DV-BTH-JP-DT-YR-TXT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Birth Years in Emperor Format";
    }

    IN MIR-DV-DTH-JP-DT-DY-TXT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Death Days In Emperor Format";
    }

    IN MIR-DV-DTH-JP-DT-EMPRR-NM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Emperor Name";
    }

    IN MIR-DV-DTH-JP-DT-MO-TXT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Death Months In Emperor Format";
    }

    IN MIR-DV-DTH-JP-DT-YR-TXT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Death Years in Emperor Format";
    }

    IN MIR-DV-UPDT-ADDR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Update previous address";
    }

    IN MIR-DV-UPDT-NM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Update previous name";
    }

    IN MIR-EMPLR-ADDR-1-TXT-T[2]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Current Employer Address";
        Index = "1";
    }

    IN MIR-EMPLR-ADDR-2-TXT-T[2]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Current Employer Address";
        Index = "1";
    }

    IN MIR-OCCP-ID
    {
        DisplayOnly;
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        SType = "Text";
        Label = "Occupation";
    }

    IN MIR-PREV-EMPL-YR-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Number of Years with Employer";
    }

    IN MIR-UNMTCH-MAIL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Unmatched mail";
    }

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-ADDR-STAT-CHNG-DT-T[2]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table5";
        SType = "Date";
        Label = "Address Status Changed Date";
        Index = "1";
    }

    IN MIR-AGT-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-STAT-CD";
        SType = "Text";
        Label = "Agent Status";
    }

    IN MIR-BNK-NM-T[9]
    {
        DisplayOnly;
        Length = "36";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Name";
        Index = "1";
    }

    IN MIR-CLI-ADDR-CHNG-DT-T[2]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table5";
        SType = "Date";
        Label = "Address Changed Date";
        Index = "1";
    }

    IN MIR-CLI-CLAS-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Classification Change Date";
    }

    IN MIR-CLI-CMPLT-CCAS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Clear case processing attempted";
    }

    IN MIR-CLI-CNSLDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Consolidation Date";
    }

    IN MIR-CLI-NM-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Client Name Change Date";
    }

    IN MIR-CLI-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Suspense Amount";
    }

    IN MIR-CLI-SUSP-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Suspense Change Date";
    }

    IN MIR-CLI-SUSP-CRCY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Suspense Amount Currency";
    }

    IN MIR-CLI-UWGDECN-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        SType = "Text";
        Label = "Underwriting Decision";
    }

    IN MIR-CLI-UWGDECN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "UW Decision Changed Date";
    }

    IN MIR-CLI-UWGDECN-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        SType = "Text";
        Label = "Decision Type";
    }

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-DV-CLI-PREV-NM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Client has a previous name(s)";
    }

    IN MIR-DV-PREV-ADDR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Previous Address";
    }

    IN MIR-PREV-CNSLDT-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Previous Consolidated Client Number";
    }

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Client Record";
    }

    IN MIR-SUSP-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-UW-USER-1-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "1st Underwriter Initials";
    }

    IN MIR-UW-USER-2-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "2nd Underwriter Initials";
    }

    IN MIR-UWG-WRKSHT-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Worksheet Number";
    }
#27550A CHANGES START HERE
    IN MIR-RETRN-MAIL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Return Mail Flag";
    }
#27550A CHANGES END HERE 
#23823C CHANGES START HERE
    IN MIR-CWS-EMAIL-ADDR-TXT
    {
        DisplayOnly;
        Length = "80";
        SType = "Text";
        Label = "CWS Registrant Email Address";
    }
#23823C CHANGES END HERE
#29746F CHANGES START
    IN MIR-PAYO-BNK-ACCT-NUM-T[9]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    IN MIR-PAYO-BNK-ID-T[9]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Number";
        Index = "1";
    }

    IN MIR-PAYO-BNK-BR-ID-T[9]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Number";
        Index = "1";
    }

    IN MIR-PAYO-SUB-BR-ID-T[9]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Number";
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

    IN MIR-PAYO-BNK-BR-NM-T[9]
    {
        DisplayOnly;
        Length = "36";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Branch Name";
        Index = "1";
    }

    IN MIR-PAYO-BNK-ACCT-ID-T[9]
    {
        DisplayOnly;
    #CR1866 CHANGES START HERE   
    #   Length = "7";
        Length = "17";
    #CR1866 CHANGES END HERE  
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    IN MIR-PAYO-BNK-ACCT-TYP-CD-T[9]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Text";
        Label = "Account Type";
        Index = "1";
    }

    IN MIR-PAYO-ACCT-MICR-IND-T[9]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table9";
        SType = "Indicator";
        Label = "Cheque from account is MICR-encoded";
        Index = "1";
    }

    IN MIR-PAYO-BNK-ACCT-HLDR-NM-T[9]
    {
        DisplayOnly;
        Length = "50";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Accountholder Name";
        Index = "1";
    }
#29746F CHANGES END
}

