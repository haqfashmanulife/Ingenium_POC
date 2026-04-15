# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

#*******************************************************************************
#*  Component:   BF9230-O.s                                                    *
#*  Description: Policy's bank detail enquiry / confirmation screen.           *
#*               Simple client detail preceding bank info.                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HNB001  HIN/AI   NEW BUSINESS SCREENS                                      * 
#*  HIS006  HIN/AI   HIS006 ADDED FILTER FIELDS ON CLI-CRNT-LOC-CD             *
#*  HIS052  HIN/AI   ADD MIR-COMB-BILL-IND                                     *
#*  B10889  HIN/AI   ADD MIR-BNK-BR-NM                                         *
#*******************************************************************************

S-STEP BF9230-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Retrieve";
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
    SType="Hidden";
  }

  IN MIR-POL-ID-BASE
  {
    Key;
    DisplayOnly;
    Length = "9";
    DefaultSession = "MIR-POL-ID-BASE";
    SType = "Text";
    Label = "Policy ID";
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

  IN MIR-POL-APP-FORM-ID
  {
    Key;
    DisplayOnly;
    Length = "15";
    SType = "Text";
    Label = "Application Number";
  }

  IN MIR-POL-CSTAT-CD
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "POL-CSTAT-CD";
    SType = "Text";
    Label = "Current Policy Status";
  }

  IN MIR-DV-PAYR-CLI-ID
  {
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Payor Client ID";
  }

  IN MIR-DV-PAYR-CLI-KANA-NM
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Payor Katakana Name";
  }

  IN MIR-CLI-ADDR-LN-1-TXT
  {
    DisplayOnly;
    Length = "30";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Text";
    Label = "Address";
  }

  IN MIR-CLI-ADDR-LN-2-TXT
  {
    DisplayOnly;
    Length = "30";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Text";
    Label = "Address Line 2";
  }

  IN MIR-CLI-ADDR-LN-3-TXT
  {
    DisplayOnly;
    Length = "30";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Text";
    Label = "Address Line 3";
  }

  IN MIR-CLI-ADDR-ADDL-TXT
  {
    DisplayOnly;
    Length = "72";
    SType = "Text";
    Label = "Samakata-bu";
  }

  IN MIR-CLI-PREFCT-TXT
  {
    DisplayOnly;
    Length = "11";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Text";
    Label = "Prefecture";
  }

  IN MIR-CLI-KA-PREFCT-TXT
  {
    DisplayOnly;
    Length = "11";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Text";
    Label = "Prefecture";
  }

  IN MIR-CLI-KA-CITY-TXT
  {
    DisplayOnly;
    Length = "30";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Text";
    Label = "City";
  }

  IN MIR-CLI-KA-NGHBRHD-TXT
  {
    DisplayOnly;
    Length = "30";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Text";
    Label = "Neighborhood";
  }

  IN MIR-CLI-CITY-NM-TXT
  {
    DisplayOnly;
    Length = "30";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Text";
    Label = "City";
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
    Label = "Prefecture";
  }


  IN MIR-CLI-CTRY-CD
  {
    DisplayOnly;
    Length = "2";
    CodeSource = "XTAB";
    CodeType = "CNTRY";
    SType = "Text";
    Label = "Country";
  }

  IN MIR-CLI-ADDR-CNTCT-TXT
  {
    DisplayOnly;
    Length = "50";
    SType = "Text";
    Label = "Phone Number";
  }

  IN MIR-CLI-ADDR-LOC-CD
  {
    DisplayOnly;
    Length = "8";
    SType = "Text";
    Label = "Address Code";
  }

  IN MIR-CLI-PSTL-CD
  {
    DisplayOnly;
    Length = "9";
    SType = "Text";
    Label = "Postal Code";
  }

  IN MIR-BNK-ID
  {
    DisplayOnly;
    Length = "4";
    SType = "Text";
    Label = "Current Bank Number";
  }

  IN MIR-BNK-BR-ID
  {
    DisplayOnly;
    Length = "5";
    SType = "Text";
    Label = "Current Branch Number";
  }

  IN MIR-BNK-NM
  {
    DisplayOnly;
    Length = "36";
    SType = "Text";
    Label = "Current Bank Name";
  }

	IN MIR-BNK-BR-NM
	{
		DisplayOnly;
		Length = "36";
		SType = "Text";
		Label = "Current Branch Name";
	}

  IN MIR-BNK-ACCT-ID
  {
    DisplayOnly;
    Length = "7";
    SType = "Text";
    Label = "Current Account Number";
  }

  IN MIR-BNK-ACCT-TYP-CD
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "EDIT";
    CodeType = "ACTYP";
    SType = "Text";
    Label = "Current Account Type";
  }

  IN MIR-BNK-ACCT-HLDR-NM
  {
    DisplayOnly;
    Length = "50";
    SType = "Text";
    Label = "Current Accountholder Name";
  }

  IN MIR-ACCT-HLDR-TYP-CD
  {
    DisplayOnly;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "ACCT-HLDR-TYP-CD";
    SType = "Text";
    Label = "Current Account Holder Type";
  }

  IN MIR-COMB-BILL-IND
  {
    DisplayOnly;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "COMB-BILL-IND";
    SType = "Text";
    Label = "Combine Billing Indicator";
  }
    
}
