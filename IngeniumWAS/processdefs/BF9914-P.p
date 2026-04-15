#*******************************************************************************
#*  Component:   BF9914-P.p                                                    *
#*  Description: CUSTOMER/PROSPECT SEARCH                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP0026  CTS      Initial version                                           *
#*  MP0054  CTS      YEAR,MONTH AND DAY FIELDS ADDED                           *
#*******************************************************************************
P-STEP BF9914-P
{
  ATTRIBUTES
  {
    BusinessFunctionId = "9914";
    BusinessFunctionType = "List";
    MirName = "CCWM9914";
  }
  OUT LSIR-RETURN-CD;
  OUT MIR-RETRN-CD;
  IN MIR-PRCES-DT
  {
    DefaultSession = "LSIR-PRCES-DT";
    Key;
    Label = "Date";
    Length = "10";
    SType = "Date";
  }
  IN MIR-DV-RO-SO-CD
  {
    DBTableName = "Derived";
    Key;
    Label = "RO-SO Code";
    Length = "10";
    SType = "Text";
  }
  IN MIR-AGT-ID
  {
    DBTableName = "TAG";
    DefaultSession = "MIR-AGT-ID";
    Key;
    Label = "PA Code";
    Length = "6";
    SType = "Text";
  }
  IN MIR-AGT-NM
  {
    DBTableName = "TCLNC";
    Key;
    Label = "PA Name";
    Length = "50";
    SType = "Text";
  }
  INOUT MIR-SRCH-TYP-CD
  {
    Label = "";
    Length = "1";
    SType = "YesNo";
  }
  INOUT MIR-SRCH-CD
  {
    Label = "";
    Length = "6";
    SType = "YesNoUnanswered";
  }
  INOUT MIR-GIV-NM-KA
  {
    MixedCase;
    DBTableName = "TCUST";
    Label = "First Name Kana";
    Length = "50";
    SType = "Text";
  }
  INOUT MIR-SUR-NM-KA
  {
    MixedCase;
    DBTableName = "TCUST";
    Label = "Last Name Kana";
    Length = "50";
    SType = "Text";
  }
  INOUT MIR-GIV-NM-KJ
  {
    MixedCase;
    DBTableName = "TCUST";
    Label = "First Name Kanji";
    Length = "50";
    SType = "Text";
  }
  INOUT MIR-SUR-NM-KJ
  {
    MixedCase;
    DBTableName = "TCUST";
    Label = "Last Name Kanji";
    Length = "50";
    SType = "Text";
  }
  
  # Code changes for MP0054 starts here 
  
  INOUT MIR-DV-CLI-BTH-YR-FROM
  {
    DBTableName = "Derived";
    Label = "YYYY";
    Length = "4";
    SType = "Text";
  }
  INOUT MIR-DV-CLI-BTH-YR-TO
  {
    
    DBTableName = "Derived";
    Label = "YYYY";
    Length = "4";
    SType = "Text";
  }
  INOUT MIR-DV-CLI-BTH-MO-FROM
  {
    CodeSource = "DataModel";
    CodeType = "FT-SRCH-MOB";
    DBTableName = "Derived";
    Label = "MM";
    Length = "2";
    SType = "Selection";
  }
  INOUT MIR-DV-CLI-BTH-MO-TO
  {
    CodeSource = "DataModel";
    CodeType = "FT-SRCH-MOB";
    DBTableName = "Derived";
    Label = "MM";
    Length = "2";
    SType = "Selection";
  }
  INOUT MIR-DV-CLI-BTH-DY-FROM
  {
      CodeSource = "DataModel";
      CodeType = "FT-SRCH-DOB";
      DBTableName = "Derived";
      Label = "DD";
      Length = "2";
      SType = "Selection";
  }
  INOUT MIR-DV-CLI-BTH-DY-TO
  {
      CodeSource = "DataModel";
      CodeType = "FT-SRCH-DOB";
      DBTableName = "Derived";
      Label = "DD";
      Length = "2";
      SType = "Selection";
  }
  
  # Code changes for MP0054 ends here 
  
  INOUT MIR-PRT1-CLI-PSTL-CD
  {
    DBTableName = "TCUST";
    Label = "Postal Code";
    Length = "3";
    SType = "Text";
  }
  INOUT MIR-PRT2-CLI-PSTL-CD
  {
    DBTableName = "TCUST";
    Label = "Postal Code";
    Length = "7";
    SType = "Text";
  }
  INOUT MIR-PROD-CD
  {
    DBTableName = "TCUST";
    Label = "Product Code";
    Length = "30";
    SType = "Text";
  }
  INOUT MIR-POL-ID
  {
    DBTableName = "TCUST";
    Label = "Policy Id";
    Length = "30";
    SType = "Text";
  }
  INOUT MIR-HID-GIV-NM-KA
  {
    MixedCase;    
    DBTableName = "TCUST";
    Label = "";
    Length = "50";
    SType = "Hidden";
  }
  INOUT MIR-HID-SUR-NM-KA
  {
    MixedCase;
    DBTableName = "TCUST";
    Label = "";
    Length = "50";
    SType = "Hidden";
  }
  INOUT MIR-CLI-BTH-DT
  {
    DBTableName = "TCUST";
    Label = "";
    Length = "10";
    SType = "Hidden";
  }
  INOUT MIR-SEQ-NUM
  {
    DBTableName = "Derived";
    Label = "";
    Length = "3";
    SType = "Hidden";
  }
  OUT MIR-DV-CLI-NUM-T[50]
  {
    DBTableName = "Derived";
    FieldGroup = "Table50";
    Index = "1";
    Label = "No.";
    Length = "3";
    SType = "Number";
  }
  OUT MIR-DV-CLI-NM-KA-T[50]
  {
    DBTableName = "Derived";
    FieldGroup = "Table50";
    Index = "1";
    Label = "Name Kana";
    Length = "101";
    SType = "Text";
  }
  OUT MIR-DV-CLI-NM-KJ-T[50]
  {
    DBTableName = "Derived";
    FieldGroup = "Table50";
    Index = "1";
    Label = "Name Kanji";
    Length = "101";
    SType = "Text";
  }
  OUT MIR-CLI-BTH-DT-T[50]
  {
    DBTableName = "TCUST";
    FieldGroup = "Table50";
    Index = "1";
    Label = "Date of Birth";
    Length = "10";
    SType = "Date";
  }
  OUT MIR-CLI-CRT-ADD-T[50]
  {
    DBTableName = "TCUST";
    FieldGroup = "Table50";
    Index = "1";
    Label = "Address";
    Length = "201";
    SType = "Text";
  }
  OUT MIR-PSTL-CD-T[50]
  {
    DBTableName = "TCUST";
    FieldGroup = "Table50";
    Index = "1";
    Label = "Postal Code";
    Length = "16";
    SType = "Text";
  }
  OUT MIR-PREV-UPDT-TS-T[50]
  {
    DBTableName = "TPROS";
    FieldGroup = "Table50";
    Index = "1";
    Label = "Last Update";
    Length = "26";
    SType = "Text";
  }

}
