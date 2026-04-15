# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppIndivCreateFTJUL.s                                         *
#*  Description: Cloned from BF1222-I.s                                        *
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
#*                                                                             *
#* 04/2001  GW       remove unwanted fields for AppIndivCreateFTJUL            *
#*  B00599  WBP      Add Occupation and Occupation Class                       *
#*  B00616  WBP      Remove Initial from Names                                 *
#*  M00024  AT       Add corporate tax report month                            *
#*  BU3283  CTS      REPLACING SType= 'Selection' by SType= 'Text' for the     * 
#*                   field MIR-CLI-CRNT-LOC-CD                                 *
#*  TL0588  CTS      Change of insured address retention method                *
#*******************************************************************************

S-STEP AppIndivCreateFTJUL
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Create";
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

    #added for 01AD05

    INOUT MIR-CLI-ADDR-LOC-CD
    {
        Length = "8";
        SType = "Text";
        Label = "Address Code";
    }
	
    #added for TL0588

    IN MIR-INSRD-ADDR-LOC-CD
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

    IN MIR-CLI-CLAS-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Client Class Change Date";
    }

    INOUT MIR-CLI-CO-NM-T[2]
    {
        Length = "50";
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

    INOUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DefaultConstant = "JP";
#BU3283 CHANGES START
#       SType = "Selection";
        SType = "Text";
#BU3283 CHANGES END        
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        Label = "Province";
    }

    INOUT MIR-CLI-CTRY-CD
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DefaultSession = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Country";
    }

    INOUT MIR-CLI-ENTR-CO-NM-T[2]
    {
        Length = "50";
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

    INOUT MIR-CLI-LANG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Correspondence Language";
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

    INOUT MIR-CLI-OCCP-CLAS-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        SType = "Selection";
        Label = "Occupation Class";
    }

    INOUT MIR-OCCP-ID
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        SType = "Selection";
        Label = "Occupation";
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

    INOUT MIR-CLI-PREV-EMPLR-NM-T[2]
    {
        Length = "50";
        FieldGroup = "Table8";
        SType = "Text";
        Label = "Previous Employer Name";
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

    INOUT MIR-PREV-EMPL-YR-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Number of Years with Employer";
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

    IN MIR-AGT-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-STAT-CD";
        SType = "Text";
        Label = "Agent Status";
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

    OUT MIR-BNK-ACCT-HLDR-NM-T[9]
    {
        MixedCase;
        Length = "50";
        FieldGroup = "Table9";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Accountholder Name";
        Index = "1";
    }

    OUT MIR-BNK-ACCT-ID-T[9]
    {
        Length = "17";
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
        SType = "Selection";
        Label = "Account Type";
        Index = "1";
    }

}

