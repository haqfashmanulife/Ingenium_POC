# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF1222-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016110  6.0.2J   Postal Code Default Selection Box                         *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - Address Code is now the driver field                    *
#*                   - JP-ADDR has been replaced by PREFCT-TXT                 *
#*                   - Samakata-bu (ADDR-ADDL) changed to 72 bytes             *
#*                   - Prefecture, City and Nieghborhood added for KA          *
#*                   - Postal Code Selection Box removed                       *
#*  M00024  AT       Add corporate tax report month                            *
#*  EN001604         - Add Hazardous occupation field                          *  
#*                                                                             *
#*  IPCAMC  CTS      - Change the length of Cause of Death field               *
#*                   - Add Cause Description field                             *
#*  ABF420  CTS      - Changes done to display 'Cause Description' field as    *
#*                     non-editable field                                      *
#*  MP334A  CTS      - ADDDED CHANGES FOR SUCCESSOR CLIENT CATEGORY  FIELD     *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*  TLCR16  CTS      Change of insured address retention method                *
#*  27550A  CTS      CHANGES DONE FOR RETURN MAIL FLAG CONTROL
#*  23823C  CTS      -  CWS EMAIL ADDRESS                                      *
#*  29746F  CTS      CHANGES AS PART OF CERBERUS NEW BUSINESS                  *
#*  CR1866  CTS      CHANGES AS PART OF CR-1866 JIRA                           *
#*******************************************************************************

S-STEP BF1222-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-CLI-MAIL-TITL-TXT";
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

    INOUT MIR-AGT-ID
    {
        Length = "6";
        SType = "Text";
        Label = "Agent ID";
    }

    INOUT MIR-BEST-TIME-CALL-TXT
    {
        Length = "15";
        SType = "Text";
        Label = "Best Time to Call";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM-T[9]
    {
        Length = "50";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Accountholder Name";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-ID-T[9]
    {
        Length = "7";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-MICR-IND-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
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
        SType = "Selection";
        Label = "Account Type";
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

    INOUT MIR-BNK-ID-T[9]
    {
        Length = "4";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Number";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-CNTY-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "CTYPC";
        SType = "Selection";
        Label = "County/Parish";
    }

    #added for 01AD05

    INOUT MIR-CLI-ADDR-LOC-CD
    {
        Length = "8";
        SType = "Text";
        Label = "Address Code";
    }
    
    #added for TLCR16
    
    INOUT MIR-INSRD-ADDR-LOC-CD
    {
        Length = "8";
        SType = "Text";
        Label = "Insured Address Code";
    }

    IN MIR-CLI-ADDR-LN-1-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-2-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-3-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    #added for 01AD05

    IN MIR-CLI-PREFCT-TXT
    {
        Length = "11";
        SType = "Text";
        Label = "Prefecture";
    }
 
    #added for 01AD05

    IN MIR-CLI-KA-PREFCT-TXT
    {
        Length = "11";
        SType = "Text";
        Label = "Prefecture";
    }

    #added for 01AD05

    IN MIR-CLI-KA-CITY-TXT
    {
        Length = "30";
        SType = "Text";
        Label = "City";
    }

    #added for 01AD05

    IN MIR-CLI-KA-NGHBRHD-TXT
    {
        Length = "30";
        SType = "Text";
        Label = "Neighborhood";
    }
 
    INOUT MIR-CLI-ADDR-MUN-CD
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "MCPCD";
        SType = "Selection";
        Label = "Municipality";
    }

    INOUT MIR-CLI-ADDR-STAT-CD-T[2]
    {
        Length = "40";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Selection";
        Label = "Address Status";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-YR-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Years at Address";
    }

    INOUT MIR-CLI-AGE-PROOF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Proof of age submitted";
    }

    INOUT MIR-CLI-BNK-ACCT-NUM-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    INOUT MIR-CLI-BTH-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }

    INOUT MIR-CLI-BTH-LOC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        SType = "Selection";
        Label = "Birth Location";
    }

    INOUT MIR-CLI-CHRTY-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Owner has been identified as a charity";
    }

    IN MIR-CLI-CITY-NM-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    INOUT MIR-CLI-CLAS-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLCD";
        SType = "Selection";
        Label = "Classification";
    }

    INOUT MIR-CLI-CNFD-IND
    {
        Length = "1";
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
        SType = "Text";
        Label = "Company Name";
        Index = "1";
    }

    INOUT MIR-CLI-COMNT-TXT
    {
        Length = "237";
        SType = "Text";
        Label = "Additional Comments";
    }

    INOUT MIR-CLI-CR-CARD-NUM
    {
        Length = "20";
        SType = "Text";
        Label = "Chargecard Account Number";
    }

    INOUT MIR-CLI-CR-CARD-TYP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CHGTP";
        SType = "Selection";
        Label = "Chargecard Type";
    }


    #added default for LOC014

    INOUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DefaultSession = "MIR-USER-SESN-CTRY-CD";
        SType = "Text";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        Label = "Province/State";
    }

    INOUT MIR-CLI-CTRY-CD
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Country";
    }

    INOUT MIR-CLI-DTH-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Date of Death";
    }

# IPCAMC CHANGES START HERE
    INOUT MIR-CLI-DTH-REASN-CD
    {
        Length = "3";
        SType = "Text";
        Label = "Cause of Death";
    }

    INOUT MIR-CLI-DTH-REASN-TXT
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "CSOM9A38";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-DTH-REASN-CD";
        DefaultConstant = "NO";
        SType = "TextArea";
        Label = "Cause Description";
    }
# IPCAMC CHANGES END HERE 
    INOUT MIR-CLI-EMPL-YR-DUR
    {
        Length = "2";
        SType = "Text";
        Label = "Years with Employer";
    }

    INOUT MIR-CLI-EMPLR-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        SType = "Selection";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        Label = "Province/State";
    }

    INOUT MIR-CLI-EMPLR-NM-T[2]
    {
        Length = "50";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Current Employer Name";
        Index = "1";
    }

    INOUT MIR-CLI-ENTR-CO-NM-T[2]
    {
	#TLB041 CHANGES START HERE        
        #Length = "50";
	Length = "100";
	#TLB041 CHANGES END HERE
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Company Name";
        Index = "1";
    }

    INOUT MIR-CLI-ENTR-GIV-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    IN MIR-CLI-ENTR-PREV-GIV-NM-T[6]
    {
        Length = "25";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    IN MIR-CLI-ENTR-PREV-SUR-NM-T[6]
    {
        Length = "25";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    INOUT MIR-CLI-ENTR-SUR-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    INOUT MIR-CLI-GIV-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    INOUT MIR-CLI-INCM-EARN-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "INCCD";
        SType = "Selection";
        Label = "Income Class";
    }

    INOUT MIR-CLI-LANG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Correspondence Language";
    }

    INOUT MIR-CLI-LEGIT-DUP-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Legitimate duplicate - Do not consolidate";
    }

    INOUT MIR-CLI-MAIL-TITL-TXT
    {
        Length = "15";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        SType = "Selection";
        Label = "Title";
    }

    INOUT MIR-CLI-MARIT-STAT-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "MARST";
        SType = "Selection";
        Label = "Marital Status";
    }

    INOUT MIR-CLI-MIB-IND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-MIB-IND-CD";
        SType = "Selection";
        Label = "MIB Indicator";
    }

    INOUT MIR-CLI-MID-INIT-NM-T[2]
    {
        Length = "1";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Initial";
        Index = "1";
    }

    INOUT MIR-CLI-OCCP-CLAS-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        SType = "Selection";
        Label = "Occupation Class";
    }

    INOUT MIR-CLI-PIN-RESET-TXT
    {
        Length = "25";
        SType = "Text";
        Label = "Reset Identification";
    }

    #added for 01AD05
    
    IN MIR-CLI-PREV-ADDR-LOC-CD-T[4]
    {
        Length = "8";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address Code";
        Index = "1";
    }
 
    IN MIR-CLI-PREV-ADDR-CNTY-CD-T[4]
    {
        Length = "3";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "CTYPC";
        SType = "Text";
        Label = "County/Parish";
        Index = "1";
    }

    IN MIR-CLI-PREV-ADDR-LN-1-TXT-T[4]
    {
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    IN MIR-CLI-PREV-ADDR-LN-2-TXT-T[4]
    {
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    IN MIR-CLI-PREV-ADDR-MUN-CD-T[4]
    {
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
        Length = "3";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Years at Address";
        Index = "1";
    }

    IN MIR-CLI-PREV-CITY-NM-TXT-T[4]
    {
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    #added for 01AD05

    IN MIR-CLI-PREV-PREFCT-TXT-T[4]
    {
        Length = "11";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    #added for 01AD05

    IN MIR-CLI-PREV-KA-PREFCT-TXT-T[4]
    {
        Length = "11";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    #added for 01AD05

    IN MIR-CLI-PREV-KA-CITY-TXT-T[4]
    {
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    #added for 01AD05

    IN MIR-CLI-PREV-KA-NGHBRHD-TXT-T[4]
    {
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Neighborhood";
        Index = "1";
    }


    #changed for AP0036

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


    #changed for AP0036

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


    # added for LOC006

    IN MIR-CLI-PREV-CNTCT-TXT-T[4]
    {
        Length = "50";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Phone Number";
        Index = "1";
    }

    INOUT MIR-CLI-PREV-DCLN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Declined Date";
    }

    INOUT MIR-CLI-PREV-DCLN-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Client previously declined by company";
    }

    INOUT MIR-CLI-PREV-EMPLR-NM-T[2]
    {
        Length = "50";
        FieldGroup = "Table8";
        SType = "Text";
        Label = "Previous Employer Name";
        Index = "1";
    }

    IN MIR-CLI-PREV-MID-NM-T[6]
    {
        Length = "1";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Initial";
        Index = "1";
    }

    IN MIR-CLI-PREV-PSTL-CD-T[4]
    {
        Length = "9";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    IN MIR-CLI-PREV-RES-NUM-T[4]
    {
        Length = "5";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    IN MIR-CLI-PREV-RES-TYP-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "RESD";
        SType = "Text";
        Label = "Residence Type";
        Index = "1";
    }


    # added next 4 for LOC014

    IN MIR-CLI-PREV-ADDR-LN-3-TXT-T[4]
    {
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    #changed length for 01AD05
     
    IN MIR-CLI-PREV-ADDR-ADDL-TXT-T[4]
    {
        Length = "72";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Samakata-bu";
        Index = "1";
    }

    IN MIR-CLI-PREV-SFX-NM-T[6]
    {
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
        Length = "15";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        SType = "Text";
        Label = "Title";
        Index = "1";
    }

    INOUT MIR-CLI-PRPS-RETIR-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Proposed Retirement Date";
    }

    INOUT MIR-CLI-PRST-RT
    {
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Persistency Rate";
    }


    #changed for LOC014

    INOUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    INOUT MIR-CLI-RES-NUM-T[2]
    {
        Length = "5";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    INOUT MIR-CLI-RES-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "RESD";
        SType = "Selection";
        Label = "Residence Type";
    }

    INOUT MIR-CLI-SELF-EMPL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Self-employed";
    }

    INOUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }
     
    INOUT MIR-CLI-CORP-TAX-RPT-MO
    {
        Length = "2";
        SType = "Text";
        Label = "Tax Report Month";
    }

    INOUT MIR-CLI-SFX-NM
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "SUFFX";
        SType = "Selection";
        Label = "Suffix";
    }

    INOUT MIR-CLI-SMKR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        SType = "Selection";
        Label = "Smoker";
    }

    INOUT MIR-CLI-STMT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Statement Date";
    }

    INOUT MIR-CLI-SUR-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }


    INOUT MIR-CLI-TAX-ID
    {
        Length = "9";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    INOUT MIR-CLI-TXEMP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-TXEMP-CD";
        SType = "Selection";
        Label = "Tax Exempt";
    }

    INOUT MIR-CLI-UIC-QUALF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "UIC Qualified";
    }

    INOUT MIR-CLI-WRK-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-CD";
        SType = "Selection";
        Label = "Worked/Period";
    }

    INOUT MIR-CLI-WRK-DUR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-DUR-CD";
        SType = "Selection";
        Label = "Worked/Period";
    }

    INOUT MIR-CLI-WRK-PT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Part-time";
    }

    INOUT MIR-CLI-WRK-QTY
    {
        Length = "5";
        SType = "Text";
        Label = "Hours Worked";
    }

    INOUT MIR-CLI-WRK-RES-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Work at Home";
    }

    #Added "Hazardous occupation field" for EN001604
    INOUT MIR-HZRD-OCCP-CD
    {
	CodeSource = "EDIT";
	CodeType = "HZDCD";
	Label = "Hazardous Occupation Code";
	Length = "1";
	SType = "Selection";
    }


    INOUT MIR-DV-AGT-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Name";
    }

    INOUT MIR-DV-UPDT-ADDR-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Update previous address";
    }

    INOUT MIR-DV-UPDT-NM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Update previous name";
    }

    INOUT MIR-EMPLR-ADDR-1-TXT-T[2]
    {
        Length = "25";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Current Employer Address";
        Index = "1";
    }

    INOUT MIR-EMPLR-ADDR-2-TXT-T[2]
    {
        Length = "25";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Current Employer Address";
        Index = "1";
    }

    INOUT MIR-OCCP-ID
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        SType = "Selection";
        Label = "Occupation";
    }

    INOUT MIR-PREV-EMPL-YR-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Number of Years with Employer";
    }

    INOUT MIR-UNMTCH-MAIL-IND
    {
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

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Client Record";
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

    IN MIR-CLI-NM-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Client Name Change Date";
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

    IN MIR-ADDR-STAT-CHNG-DT-T[2]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table5";
        SType = "Date";
        Label = "Address Status Changed Date";
        Index = "1";
    }

    IN MIR-DV-PREV-ADDR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Previous Address";
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

    IN MIR-AGT-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-STAT-CD";
        SType = "Text";
        Label = "Agent Status";
    }

    IN MIR-CLI-CLAS-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Classification Change Date";
    }

    IN MIR-CLI-CNSLDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Consolidation Date";
    }

    IN MIR-PREV-CNSLDT-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Previous Consolidated Client Number";
    }


    # added for LOC006

    INOUT MIR-CLI-ADDR-CNTCT-TXT
    {
        Length = "50";
        SType = "Text";
        Label = "Phone Number";
    }


    #added for LOC014
    #changed length for 01AD05
     
    INOUT MIR-CLI-ADDR-ADDL-TXT-T[2]
    {
        Length = "72";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Samakata-bu";
        Index = "1";
    }
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
        SType = "Indicator";
        Label = "Return Mail Flag";        
    } 
#27550A CHANGES END HERE 
#23823C CHANGES START HERE    
    IN  MIR-CWS-EMAIL-ADDR-TXT
    {
        DisplayOnly;
        Length = "80";
        SType = "Text";
        Label = "CWS Registrant Email Address";        
    } 
#23823C CHANGES END HERE 
#29746F CHANGES START
    INOUT MIR-PAYO-BNK-ACCT-NUM-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
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
        Label = "Bank Number";
        Index = "1";
    }

    INOUT MIR-PAYO-SUB-BR-ID-T[9]
    {
        Length = "5";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Number";
        Index = "1";
    }

    INOUT MIR-PAYO-BNK-NM-T[9]
    {
        Length = "36";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Name";
        Index = "1";
    }

    INOUT MIR-PAYO-BNK-BR-NM-T[9]
    {
        Length = "36";
        FieldGroup = "Table9";
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
        SType = "Selection";
        Label = "Account Type";
        Index = "1";
    }

    INOUT MIR-PAYO-ACCT-MICR-IND-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
        SType = "Indicator";
        Label = "Cheque from account is MICR-encoded";
        Index = "1";
    }

    INOUT MIR-PAYO-BNK-ACCT-HLDR-NM-T[9]
    {
        Length = "50";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Accountholder Name";
        Index = "1";
    }
#29746F CHANGES END
}

