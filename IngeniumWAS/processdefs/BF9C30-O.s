# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9C30-O.s                                                    *
#*  Description: UW Summary Screen                                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  R11837  CTS     Initial Revision                                           *
#*******************************************************************************

S-STEP BF9C30-O
{
  ATTRIBUTES
  {
     BusinessFunctionType = "Retrieve";
     DelEmptyRows;
     FocusField = "OKButton";
     FocusFrame = "ButtonFrame";
     Type = "Output";
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

  IN MIR-POL-ID
  {
     DefaultSession = "MIR-POL-ID-BASE";
     DisplayOnly;
     Key;
     Label = "Policy ID";
     Length = "10";
     SType = "Text";
  }

  IN MIR-CLI-ID
  {
     DefaultSession = "MIR-CLI-ID";
     DisplayOnly;
     Key;
     Label = "Client Id";
     Length = "10";
     SType = "Text";
  }

  IN MIR-DV-INSRD-CLI-NM
  {
     DisplayOnly;
     Label = "Insured Name(Kana)";
     Length = "75";
     SType = "Text";
  }

  IN MIR-UWFD-POL-ID-T[20]
  {
     DisplayOnly;
     Label = "Policy Number";
     FieldGroup = "Table1";      
     Length = "02";
     SType = "Text";
     Index = "1";       
  }
  
  IN MIR-UWFD-CVG-NUM-T[20]
  {
      DisplayOnly;
      Label = "Coverage Number";
      FieldGroup = "Table1";         
      Length = "02";
      SType = "Text";
      Index = "1";     
  }

  IN MIR-UWFD-PLAN-ID-T[20]
  {
     DisplayOnly;
     Length = "40";
     CodeSource = "EDIT";
     CodeType = "PLAN";
     FieldGroup = "Table1";    
     SType = "Text";
     Label = "Rider Name";
     Index = "1";    
  }

  IN MIR-UWFD-CVG-FACE-AMT-T[20]
  {
     CurrencyCode = "MIR-UWFD-POL-CRCY-CD";
     DisplayOnly;
     Signed;
     Length = "16";
     FieldGroup = "Table1";
     SType = "Currency";
     Label = "Face Amount";
     Index = "1";
  }

  IN MIR-UWFD-UW-NOTE-T[20]
  {
     Label = "Underwriter Note";
     Length = "10";
     SType = "Text";
     FieldGroup = "Table1"; 
     Index = "1";    
  }

  INOUT MIR-UWFD-CVG-WP-IND-T[20]
  {
     DisplayOnly;
     Length = "1";
     FieldGroup = "Table1";    
     SType = "Indicator";
     Label = "STATE OF ADDITION OF 3DD WOP RIDER";
     Index = "1";
  }

  IN MIR-UWFD-CVG-STBL-1-CD-T[20]
  {
     Length = "40";
     FieldGroup = "Table1";
     CodeSource = "CSOM9D29";        
     FilterFields = "2";
     FilterField1 = "MIR-UWFD-PLAN-ID-T"; 
     FilterField2 = "MIR-UWFD-CVG-STBL-1-CD-T";
     DBTableName = "TCVG";
     SType = "Text";
     Label = "Duration";
     Index = "1";
  }

  IN MIR-DTH-PREV-DIS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - Previous";
  }

  IN MIR-DTH-BLD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - Build";
  }

  IN MIR-DTH-CRNT-DIS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - Current";
  }

  IN MIR-DTH-PULSE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - PULSE";
  }

  IN MIR-DTH-BD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - BD";
  }

  IN MIR-DTH-URINE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - URINE";
  }

  IN MIR-DTH-BLOOD-SUGAR-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - BLOOD SUGAR";
  }

  IN MIR-DTH-LIVER-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - LIVER";
  }

  IN MIR-DTH-LIPID-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - LIPID";
  }

  IN MIR-DTH-ANEM-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - ANEM";
  }

  IN MIR-DTH-ECG-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - ECG";
  }

  IN MIR-DTH-ADJ-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "Death - ADJUST";
  }

  IN MIR-DTH-TOT-AMT-CHNG-IND
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Death - Total";
  }

  IN MIR-DTH-PREV-DIS-CD
  {
     DisplayOnly;
     Label = "Death - Previous";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-CRNT-DIS-CD
  {
     DisplayOnly;
     Label = "Death - Current";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-BLD-CD
  {
     DisplayOnly;
     Label = "Death - Build";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-PULSE-CD
  {
     DisplayOnly;
     Label = "Death - Pulse";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-BD-CD
  {
     DisplayOnly;
     Label = "Death - BD";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-URINE-CD
  {
     DisplayOnly;
     Label = "Death - Urine";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-BLOOD-SUGAR-CD
  {
     DisplayOnly;
     Label = "Death - Sugar";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-LIVER-CD
  {
     DisplayOnly;
     Label = "Death - Liver";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-LIPID-CD
  {
     DisplayOnly;
     Label = "Death - Lipid";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-ANEM-CD
  {
    DisplayOnly;
    Label = "Death - Anemia";
    Length = "03";
    SType = "Text";
  }

  IN MIR-DTH-ECG-CD
  {
     DisplayOnly;
     Label = "Death - ECG";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-ADJ-CD
  {
     DisplayOnly;
     Label = "Death - Adjust";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-STD-CD
  {
     DisplayOnly;
     Label = "Death - Standard";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DTH-TOT-AMT
  {
     DisplayOnly;
     Label = "Death - Total";
     Length = "05";
     SType = "Text";
  }

  IN MIR-CON-PREV-DIS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - Previous";
  }

  IN MIR-CON-BLD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - Build";
  }

  IN MIR-CON-CRNT-DIS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - Current";
  }

  IN MIR-CON-PULSE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - PULSE";
  }

  IN MIR-CON-BD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - BD";
  }

 IN MIR-CON-URINE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - URINE";
  }

  IN MIR-CON-BLOOD-SUGAR-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - BLOOD SUGAR";
  }

  IN MIR-CON-LIVER-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - LIVER";
  }

  IN MIR-CON-LIPID-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - LIPID";
  }

  IN MIR-CON-ANEM-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - ANEM";
  }

  IN MIR-CON-ECG-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - ECG";
  }

  IN MIR-CON-ADJ-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "S- - ADJUST";
  }

  IN MIR-CON-TOT-AMT-CHNG-IND
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "S - Total";
    }

  IN MIR-CON-PREV-DIS-CD
  {
     DisplayOnly;
     Label = "S - Previous";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-CRNT-DIS-CD
  {
     DisplayOnly;
     Label = "S - Current";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-BLD-CD
  {
     DisplayOnly;
     Label = "S - Build";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-PULSE-CD
  {
     DisplayOnly;
     Label = "S - Pulse";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-BD-CD
  {
     DisplayOnly;
     Label = "S - BD";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-URINE-CD
  {
     DisplayOnly;
     Label = "S - Urine";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-BLOOD-SUGAR-CD
  {
     DisplayOnly;
     Label = "S - Sugar";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-LIVER-CD
  {
     DisplayOnly;
     Label = "S - Liver";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-LIPID-CD
  {
     DisplayOnly;
     Label = "S - Lipid";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-ANEM-CD
  {
     DisplayOnly;
     Label = "S - Anemia";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-ECG-CD
  {
     DisplayOnly;
     Label = "S - ECG";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-ADJ-CD
  {
     DisplayOnly;
     Label = "S - Adjust";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-STD-CD
  {
     DisplayOnly;
     Label = "S - Standard";
     Length = "03";
     SType = "Text";
  }

  IN MIR-CON-TOT-AMT
  {
     DisplayOnly;
     Label = "S - Total";
     Length = "05";
     SType = "Text";
   }

  IN MIR-MEDIC-PREV-DIS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - Previous";
  }

  IN MIR-MEDIC-BLD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - Build";
  }

  IN MIR-MEDIC-CRNT-DIS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - Current";
  }

  IN MIR-MEDIC-PULSE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - PULSE";
  }

  IN MIR-MEDIC-BD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - BD";
  }

  IN MIR-MEDIC-URINE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - URINE";
  }

  IN MIR-MEDIC-BLOOD-SUGAR-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - BLOOD SUGAR";
  }

  IN MIR-MEDIC-LIVER-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - LIVER";
  }

  IN MIR-MEDIC-LIPID-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - LIPID";
  }

  IN MIR-MEDIC-ANEM-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - ANEM";
  }

  IN MIR-MEDIC-ECG-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - ECG";
  }

  IN MIR-MEDIC-ADJ-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "MEDIC - ADJUST";
  }

  IN MIR-MEDIC-TOT-AMT-CHNG-IND
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "MEDIC - Total";
  }

  IN MIR-MEDIC-PREV-DIS-CD
  {
     DisplayOnly;
     Label = "Hospital - Previous";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-CRNT-DIS-CD
  {
     DisplayOnly;
     Label = "Hospital - Current";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-BLD-CD
  {
     DisplayOnly;
     Label = "Hospital - Build";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-PULSE-CD
  {
     DisplayOnly;
     Label = "Hospital - Pulse";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-BD-CD
  {
     DisplayOnly;
     Label = "Hospital - BD";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-URINE-CD
  {
     DisplayOnly;
     Label = "Hospital - Urine";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-BLOOD-SUGAR-CD
  {
     DisplayOnly;
     Label = "Hospital - Sugar";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-LIVER-CD
  {
     DisplayOnly;
     Label = "Hospital - Liver";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-LIPID-CD
  {
     DisplayOnly;
     Label = "Hospital - Lipid";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-ANEM-CD
  {
     DisplayOnly;
     Label = "Hospital - Anemia";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-ECG-CD
  {
     DisplayOnly;
     Label = "Hospital - ECG";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-ADJ-CD
  {
     DisplayOnly;
     Label = "Hospital - Adjust";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-STD-CD
  {
     DisplayOnly;
     Label = "Hospital - Standard";
     Length = "03";
     SType = "Text";
  }

  IN MIR-MEDIC-TOT-AMT
  {
     DisplayOnly;
     Label = "Hospital - Total";
     Length = "05";
     SType = "Text";
  }

  IN MIR-EXCL-PREV-DIS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- Previous";
  }

  IN MIR-EXCL-BLD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- Build";
  }

  IN MIR-EXCL-CRNT-DIS-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- Current";
  }

  IN MIR-EXCL-PULSE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- PULSE";
  }

  IN MIR-EXCL-BD-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- BD";
  }

  IN MIR-EXCL-URINE-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- URINE";
  }

  IN MIR-EXCL-BLOOD-SUGAR-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- BLOOD SUGAR";
  }

  IN MIR-EXCL-LIVER-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- LIVER";
  }

  IN MIR-EXCL-LIPID-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- LIPID";
  }

  IN MIR-EXCL-ANEM-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- ANEM";
  }

  IN MIR-EXCL-ECG-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- ECG";
  }

  IN MIR-EXCL-ADJ-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "EXCL- ADJUST";
  }

  IN MIR-EXCL-TOT-AMT-CHNG-IND
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "EXCL - Total";
  }

  IN MIR-EXCL-PREV-DIS-CD
  {
     DisplayOnly;
     Label = "Exclusion - Previous";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-CRNT-DIS-CD
  {
     DisplayOnly;
     Label = "Exclusion - Current";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-BLD-CD
  {
     DisplayOnly;
     Label = "Exclusion - Build";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-PULSE-CD
  {
     DisplayOnly;
     Label = "Exclusion - Pulse";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-BD-CD
  {
     DisplayOnly;
     Label = "Exclusion - BD";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-URINE-CD
  {
     DisplayOnly;
     Label = "Exclusion - Urine";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-BLOOD-SUGAR-CD
  {
     DisplayOnly;
     Label = "Exclusion - Sugar";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-LIVER-CD
  {
     DisplayOnly;
     Label = "Exclusion - Liver";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-LIPID-CD
  {
     DisplayOnly;
     Label = "Exclusion - Lipid";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-ANEM-CD
  {
     DisplayOnly;
     Label = "Exclusion - Anemia";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-ECG-CD
  {
     DisplayOnly;
     Label = "Exclusion - ECG";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-ADJ-CD
  {
     DisplayOnly;
     Label = "Exclusion - Adjust";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-STD-CD
  {
     DisplayOnly;
     Label = "Exclusion - Standard";
     Length = "03";
      SType = "Text";
  }

  IN MIR-EXCL-TOT-AMT
  {
     DisplayOnly;
     Label = "Exclusion - Total";
     Length = "05";
     SType = "Text";
  }

  IN MIR-MLJ-HLTH-ASSESS-CD
  {
     DisplayOnly;
     Label = "MLJ Decision";
     CodeSource = "EDIT";
     CodeType = "CLDEC";
     Length = "02";
     SType = "Text";
  }


  IN MIR-REINS-HLTH-ASSESS-CD
  {
     DisplayOnly;
     Label = "Re-insurer Decision";
     CodeSource = "EDIT";
     CodeType = "CLDEC";
     Length = "02";
     SType = "Text";
  }

  IN MIR-EXCL-BODY-PART-1-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  IN MIR-EXCL-BODY-PART-2-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  IN MIR-EXCL-BODY-PART-3-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  IN MIR-EXCL-BODY-PART-4-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  IN MIR-EXCL-BODY-PART-5-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  IN MIR-EXCL-BODY-PART-6-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  IN MIR-EXCL-BODY-PART-7-CHNG-IND
  {
     Length = "01";
     DisplayOnly;
     SType = "Indicator";
     Label = "REINS DECISION";
  }

  IN MIR-EXCL-BODY-PART-1-CD
  {
     DisplayOnly;
     Label = "Parts of Body - 1";
     CodeSource = "EDIT";
     CodeType = "XCLUD";
     Length = "05";
     SType = "Text";
  }

  IN MIR-EXCL-BODY-PART-2-CD
  {
     DisplayOnly;
     Label = "Parts of Body - 2";
     CodeSource = "EDIT";
     CodeType = "XCLUD";
     Length = "05";
     SType = "Text";
  }

  IN MIR-EXCL-BODY-PART-3-CD
  {
     DisplayOnly;
     Label = "Parts of Body - 3";
     CodeSource = "EDIT";
     CodeType = "XCLUD";
     Length = "05";
     SType = "Text";
  }

  IN MIR-EXCL-BODY-PART-4-CD
  {
     DisplayOnly;
     Label = "Parts of Body - 4";
     CodeSource = "EDIT";
     CodeType = "XCLUD";
     Length = "05";
     SType = "Text";
  }

  IN MIR-EXCL-BODY-PART-5-CD
  {
     DisplayOnly;
     Label = "Parts of Body - 5";
     CodeSource = "EDIT";
     CodeType = "XCLUD";
     Length = "05";
     SType = "Text";
  }

  IN MIR-EXCL-BODY-PART-6-CD
  {
     DisplayOnly;
     Label = "Parts of Body - 6";
     CodeSource = "EDIT";
     CodeType = "XCLUD";
     Length = "03";
     SType = "Text";
  }

  IN MIR-EXCL-BODY-PART-7-CD
  {
     DisplayOnly;
     Label = "Parts of Body - 7";
     CodeSource = "EDIT";
     CodeType = "XCLUD";
     Length = "03";
     SType = "Text";
  }

  IN MIR-DISABL-NOT-COVD-IND
  {
     DisplayOnly;
     Label = "Specific disability not covered";
     Length = "01";
     SType = "Indicator";
  }
  INOUT MIR-DISABL-NOT-COVD-CHNG-IND
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Specific disability not covered";
  }

  IN MIR-REASN-1-CD-CHNG-IND
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Reason Code -1";
  }

  IN MIR-REASN-1-CD
  {
     DisplayOnly;
     Label = "Reason Code -1";
     Length = "03";
     SType = "Text";
  }

  IN MIR-REASN-2-CD-CHNG-IND
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Reason Code -2";
  }

  IN MIR-REASN-2-CD
  {
     DisplayOnly;
     Label = "Reason Code -2";
     Length = "03";
     SType = "Text";
  }

  IN MIR-REASN-3-CD-CHNG-IND
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Reason Code -3";
  }

  IN MIR-REASN-3-CD
  {
     DisplayOnly;
     Label = "Reason Code -3";
     Length = "03";
     SType = "Text";
  }

  IN MIR-REASN-4-CD-CHNG-IND
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Reason Code -4";
  }

  IN MIR-REASN-4-CD
  {
     DisplayOnly;
     Label = "Reason Code -4";
     Length = "03";
     SType = "Text";
  }

  IN MIR-REASN-5-CD-CHNG-IND
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Reason Code -5";
  }

  IN MIR-REASN-5-CD
  {
     DisplayOnly;
     Label = "Reason Code -5";
     Length = "03";
     SType = "Text";
  }

  INOUT MIR-CI-FRST-DFCT-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -1";
  }

  IN MIR-FRST-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

  INOUT MIR-CI-FRST-DFCT-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -2";
  }

  IN MIR-FRST-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

  INOUT MIR-CI-FRST-ELAPS-YRS-DUR
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Elapsed Years";
  }

  IN MIR-FRST-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }


  INOUT MIR-CI-FRST-SURGY-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 1";
  }

  IN MIR-FRST-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-FRST-SURGY-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 2";
    }

  IN MIR-FRST-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-FRST-SURGY-3-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 3";
  }

  IN MIR-FRST-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-FRST-ADDL-INFO-TXT
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Additional Info";
  }

  IN MIR-FRST-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-SEC-DFCT-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -1";
  }

  IN MIR-SEC-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

  INOUT MIR-CI-SEC-DFCT-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -2";
  }

  IN MIR-SEC-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

  INOUT MIR-CI-SEC-ELAPS-YRS-DUR
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Elapsed Years";
  }

  IN MIR-SEC-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-SEC-SURGY-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 1";
  }

  IN MIR-SEC-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-SEC-SURGY-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 2";
  }

  IN MIR-SEC-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-SEC-SURGY-3-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 3";
  }

  IN MIR-SEC-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-SEC-ADDL-INFO-TXT
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Reason Code -5";
  }

  IN MIR-SEC-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-THRD-DFCT-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -1";
  }

  IN MIR-THRD-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

  INOUT MIR-CI-THRD-DFCT-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -2";
  }
  IN MIR-THRD-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

  INOUT MIR-CI-THRD-ELAPS-YRS-DUR
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Elapsed Years";
  }
  IN MIR-THRD-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-THRD-SURGY-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 1";
  }

  IN MIR-THRD-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-THRD-SURGY-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 2";
  }
  IN MIR-THRD-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-THRD-SURGY-3-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 3";
  }

  IN MIR-THRD-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-THRD-ADDL-INFO-TXT
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Additional Info";
  }

  IN MIR-THRD-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-FRTH-DFCT-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Reason Code -5";
  }

  IN MIR-FRTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

  INOUT MIR-CI-FRTH-DFCT-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -2";
  }

  IN MIR-FRTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

  INOUT MIR-CI-FRTH-ELAPS-YRS-DUR
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Elapsed Years";
  }

  IN MIR-FRTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-FRTH-SURGY-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 1";
  }

  IN MIR-FRTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-FRTH-SURGY-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 2";
  }

  IN MIR-FRTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-FRTH-SURGY-3-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 3";
  }

  IN MIR-FRTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }


  INOUT MIR-CI-FRTH-ADDL-INFO-TXT
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Additional Info";
  }

  IN MIR-FRTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-FIFTH-DFCT-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -1";
  }

  IN MIR-FIFTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

  INOUT MIR-CI-FIFTH-DFCT-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -2";
    }

  IN MIR-FIFTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

  INOUT MIR-CI-FIFTH-ELAPS-YRS-DUR
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Elapsed Years";
  }

  IN MIR-FIFTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-FIFTH-SURGY-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 1";
  }

  IN MIR-FIFTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-FIFTH-SURGY-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 2";
  }

  IN MIR-FIFTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-FIFTH-SURGY-3-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 3";
  }

  IN MIR-FIFTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-FIFTH-ADDL-INFO-TXT
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Additional Info";
  }

  IN MIR-FIFTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-SIXTH-DFCT-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -1";
  }

  IN MIR-SIXTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

  INOUT MIR-CI-SIXTH-DFCT-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -2";
  }

  IN MIR-SIXTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

  INOUT MIR-CI-SIXTH-ELAPS-YRS-DUR
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Elapsed Years";
  }

  IN MIR-SIXTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }


  INOUT MIR-CI-SIXTH-SURGY-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 1";
  }

  IN MIR-SIXTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-SIXTH-SURGY-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 2";
  }

  IN MIR-SIXTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-SIXTH-SURGY-3-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 3";
  }

  IN MIR-SIXTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-SIXTH-ADDL-INFO-TXT
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Additional Info";
    }

  IN MIR-SIXTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-SVNTH-DFCT-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -1";
  }

  IN MIR-SVNTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

  INOUT MIR-CI-SVNTH-DFCT-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -2";
  }

  IN MIR-SVNTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

  INOUT MIR-CI-SVNTH-ELAPS-YRS-DUR
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Elapsed Years";
  }

  IN MIR-SVNTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-SVNTH-SURGY-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 1";
  }

  IN MIR-SVNTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-SVNTH-SURGY-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 2";
  }

  IN MIR-SVNTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-SVNTH-SURGY-3-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 3";
  }

  IN MIR-SVNTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-SVNTH-ADDL-INFO-TXT
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Additional Info";
  }

  IN MIR-SVNTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-EIGTH-DFCT-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -1";
  }

  IN MIR-EIGTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

  INOUT MIR-CI-EIGTH-DFCT-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -2";
  }

  IN MIR-EIGTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

  INOUT MIR-CI-EIGTH-ELAPS-YRS-DUR
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Elapsed Years";
  }

  IN MIR-EIGTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-EIGTH-SURGY-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 1";
  }

  IN MIR-EIGTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-EIGTH-SURGY-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 2";
  }

  IN MIR-EIGTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-EIGTH-SURGY-3-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 3";
  }

  IN MIR-EIGTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-EIGTH-ADDL-INFO-TXT
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Additional Info";
  }

  IN MIR-EIGTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-NINTH-DFCT-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -1";
  }

  IN MIR-NINTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

  INOUT MIR-CI-NINTH-DFCT-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -2";
  }

  IN MIR-NINTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

  INOUT MIR-CI-NINTH-ELAPS-YRS-DUR
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Elapsed Years";
  }

  IN MIR-NINTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-NINTH-SURGY-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 1";
  }

  IN MIR-NINTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-NINTH-SURGY-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 2";
  }

  IN MIR-NINTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-NINTH-SURGY-3-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 3";
  }

  IN MIR-NINTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-NINTH-ADDL-INFO-TXT
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Additional Info";
  }

  IN MIR-NINTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "20";
     SType = "Text";
  }

  INOUT MIR-CI-TENTH-DFCT-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -1";
  }

  IN MIR-TENTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

  INOUT MIR-CI-TENTH-DFCT-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Defect Code -2";
  }

  IN MIR-TENTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

  INOUT MIR-CI-TENTH-ELAPS-YRS-DUR
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Elapsed Years";
  }

  IN MIR-TENTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-TENTH-SURGY-1-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 1";
  }

  IN MIR-TENTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-TENTH-SURGY-2-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 2";
  }

  IN MIR-TENTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-TENTH-SURGY-3-CD
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Surgery Code - 3";
  }

  IN MIR-TENTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

  INOUT MIR-CI-TENTH-ADDL-INFO-TXT
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Additional Info";
  }

  IN MIR-TENTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "20";
     SType = "Text";
  }

  IN MIR-DV-UW-NM-T[20]
  {
     DisplayOnly;
     Label = "User";
     Length = "75";
     SType = "Text";
  }

  IN MIR-CREAT-DT-T[20]
  {
     DisplayOnly;
     Label = "Creation Day";
     Length = "75";
     SType = "Text";
  }

  IN MIR-UW-COMNT-TXT-T[20]
  {
     DisplayOnly;
     Label = "UW Note";
     Length = "200";
     SType = "Text";
  }

  IN MIR-DOCTOR-CMNT-TXT-T[20]
  {
     DisplayOnly;
     Label = "DR Commment";
     Length = "200";
     SType = "Text";
  }

  INOUT MIR-PHYS-COND-TXT-CHNG-IND
  {
     Length = "01";
     DBTableName = "Derived";
     SType = "Indicator";
     Label = "Physical Conditions";
  }

  IN MIR-PHYS-COND-TXT
  {
     DisplayOnly;
     Label = "Physical Conditions";
     Length = "400";
     SType = "TextArea";
  }

  IN MIR-UW-COMNT-TXT
  {
     DisplayOnly;
     Label = "UW Note";
     Length = "200";
     SType = "TextArea";
  }

  IN MIR-DOCTOR-CMNT-TXT
  {
     DisplayOnly;
     Label  = "DR Commment";
     Length = "200";
     SType  = "TextArea";
  }

  INOUT MIR-POL-CRCY-CD
  {
     Length = "2";
     SType = "Hidden";
     Label = "Currency";
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

  IN MIR-CLI-UWGDECN-TYP-CD
  {
     DisplayOnly;
     Length = "2";
     CodeSource = "EDIT";
     CodeType = "CLDEC";
     SType = "Text";
     Label = "Decision Type";
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

  IN MIR-AMEX-REC-TYP-CD-T[20]
  {
     DisplayOnly;
     Length = "2";
     FieldGroup = "Table2";
     CodeSource = "DataModel";
     CodeType = "AMEX-REC-TYP-CD";
     SType = "Text";
     Label = "Record Type";
     Index = "1";
  }

  IN MIR-AMEX-SEQ-NUM-T[20]
  {
     DisplayOnly;
     Length = "2";
     FieldGroup = "Table2";
     SType = "Text";
     Label = "Sequence Number";
     Index = "1";
  }

  IN MIR-AMEX-TRXN-DT-T[20]
  {
     DisplayOnly;
     Length = "10";
     FieldGroup = "Table2";
     SType = "Date";
     Label = "Date Created";
     Index = "1";
  }
  IN MIR-DOC-ID-T[20]
  {
     DisplayOnly;
     Length = "40";
     FieldGroup = "Table2";
     KeyColumn;
     CodeSource = "EDIT";
     CodeType = "DOCM";
     Link;
     SType = "Text";
     Label = "Document Name";
     Action = "SelectItem";
     Index = "1";
  }
  
  IN MIR-ISS-REQIR-ID-T[20]
  {
     DisplayOnly;
     Length = "40";
     FieldGroup = "Table3";
     KeyColumn;
     CodeSource = "EDIT";
     CodeType = "REQTC";
     Link;
     SType = "Text";
     Label = "Requirement";
     Action = "SelectItem";
     Index = "1";
  }

  IN MIR-ISS-REQIR-TYP-CD-T[20]
  {
     DisplayOnly;
     Length = "1";
     FieldGroup = "Table3";
     CodeSource = "DataModel";
     CodeType = "REQIR-TYP-CD";
     SType = "Text";
     Label = "Requirement Needed For";
     Index = "1";
  }

  IN MIR-ISS-PREV-UPDT-DT-T[20]
  {
      DisplayOnly;
      Length = "10";
      FieldGroup = "Table3";
      SType = "Date";
      Label = "Status Date";
      Index = "1";
  }

  IN MIR-ISS-CPREQ-SEQ-NUM-T[20]
  {
     DisplayOnly;
     Length = "3";
     FieldGroup = "Table3";
     SType = "Text";
     Label = "Sequence Number";
     Index = "1";
  }

  IN MIR-ISS-CPREQ-STAT-CD-T[20]
  {
     DisplayOnly;
     Length = "3";
     FieldGroup = "Table3";
     CodeSource = "DataModel";
     CodeType = "CPREQ-STAT-CD";
     SType = "Text";
     Label = "Requirement Status";
     Index = "1";
  }

  IN MIR-ISS-USER-ID-T[20]
  {
     DisplayOnly;
     Length = "8";
     FieldGroup = "Table3";
     SType = "Text";
     Label = "Updated By";
     Index = "1";
  }

  IN MIR-UW-REQIR-ID-T[20]
  {
     DisplayOnly;
     Length = "40";
     FieldGroup = "Table4";
     KeyColumn;
     CodeSource = "EDIT";
     CodeType = "REQTC";
     Link;
     SType = "Text";
     Label = "Requirement";
     Action = "SelectItem";
     Index = "1";
  }

  IN MIR-UW-REQIR-TYP-CD-T[20]
  {
     DisplayOnly;
     Length = "1";
     FieldGroup = "Table4";
     CodeSource = "DataModel";
     CodeType = "REQIR-TYP-CD";
     SType = "Text";
     Label = "Requirement Needed For";
     Index = "1";
  }

  IN MIR-UW-PREV-UPDT-DT-T[20]
  {
     DisplayOnly;
     Length = "10";
     FieldGroup = "Table4";
     SType = "Date";
     Label = "Status Date";
     Index = "1";
  }

  IN MIR-UW-CPREQ-SEQ-NUM-T[20]
  {
     DisplayOnly;
     Length = "3";
     FieldGroup = "Table4";
     SType = "Text";
     Label = "Sequence Number";
     Index = "1";
  }

  IN MIR-UW-CPREQ-STAT-CD-T[20]
  {
     DisplayOnly;
     Length = "3";
     FieldGroup = "Table4";
     CodeSource = "DataModel";
     CodeType = "CPREQ-STAT-CD";
     SType = "Text";
     Label = "Requirement Status";
     Index = "1";
  } 

  IN MIR-UW-USER-ID-T[20]
  {
     DisplayOnly;
     Length = "8";
     FieldGroup = "Table4";
     SType = "Text";
     Label = "Updated By";
     Index = "1";
  } 

  IN MIR-UW-POL-ID-BASE-T[50]
  {
     DisplayOnly;
     Length = "9";
     FieldGroup = "Table5";
     KeyColumn;
     SType = "Text";
     Label = "Policy Id";
     Index = "1";
  }

  IN MIR-UW-PLAN-ID-T[50]
  {
     DisplayOnly;
     Length = "40";
     FieldGroup = "Table5";
     CodeSource = "EDIT";
     CodeType = "PLAN";
     SType = "Text";
     Label = "Type of Plan";
     Index = "1";
  }
  IN MIR-UW-CVG-SUPP-BNFT-CD-T[50]
  {
     DisplayOnly;
     Length = "1";
     FieldGroup = "Table5";
     CodeSource = "DataModel";
     CodeType = "CVG-SUPP-BNFT-CD";
     SType = "Text";
     Label = "Supplementary Benefit";
     Index = "1";
  }
  IN MIR-UW-CVG-REINS-IND-T[50]
  {
     Length = "1";
     FieldGroup = "Table5";
     DBTableName = "TCVG";
     SType = "Indicator";
     Label = "Reinsured";
     Index = "1";
  }

  IN MIR-UW-CVG-REINS-CO-ID-T[50]
  {
     Length = "2";
     FieldGroup = "Table5";
     CodeSource = "EDIT";
     CodeType = "REINS";
     DBTableName = "TCVG";
     SType = "Text";
     Label = "Reinsurance Company";
     Index = "1";
  }

  IN MIR-UW-CVG-REINS-TRTY-NUM-T[50]
  {
     Length = "3";
     FieldGroup = "Table5";
     CodeSource = "EDIT";
     CodeType = "TRTNM";
     DBTableName = "TCVG";
     SType = "Text";
     Label = "Treaty Number";
     Index = "1";
  }

  IN MIR-UW-CVG-REINS-CED-PCT-T[50]
  {
     Length = "3";    
     FieldGroup = "Table5";    
     CodeSource = "EDIT";    
     CodeType = "CDPCT";
     DBTableName = "TCVG";
     SType = "Text";    
     Label = "Ceding Percentage";    
     Index = "1";    
  }

  IN MIR-UW-CVG-UWGDECN-CD-T[50]
  {
     DisplayOnly;
     Length = "2";
     FieldGroup = "Table5";
     CodeSource = "DataModel";
     CodeType = "CVG-UWGDECN-CD";
     SType = "Text";
     Label = "Coverage Decision";
     Index = "1";
  }

  IN MIR-UW-CVG-ME-DUR-T[50]
  {
     DisplayOnly;
     Length = "3";
     CodeSource = "DataModel";
     CodeType = "CVG-ME-DUR";
     FieldGroup = "Table5";
     SType = "Text";
     Label = "Multiple Rating Duration";
     Index = "1";
  }

  IN MIR-UW-CVG-ME-FCT-T[50]
  {
     DisplayOnly;
     Signed;
     Length = "3";
     Decimals = "2";
     FieldGroup = "Table5";
     SType = "Number";
     Label = "Rating";
     Index = "1";
  }

  IN MIR-UW-CVG-ME-REASN-CD-T[50]
  {
     DisplayOnly;
     Length = "1";
     FieldGroup = "Table5";
     CodeSource = "EDIT";
     CodeType = "RMULT";
     SType = "Text";
     Label = "Multiple Rating Reason";
     Index = "1";
  }

  IN MIR-UW-CVG-NUM-T[50]
  {
     DisplayOnly;
     Length = "2";
     FieldGroup = "Table5";
     SType = "Text";
     Label = "Coverage Number";
     Index = "1";
  }
  IN MIR-UW-CVG-LIEN-DUR-T[50]
  {
     DisplayOnly;
     Length = "1";
     CodeSource = "DataModel";
     CodeType = "CVG-LIEN-DUR";
     FieldGroup = "Table5";
     SType = "Selection";
     Label = "Lien Duration";
     Index = "1";
  }

  IN MIR-UW-SSTD-AGE-ADD-DUR-T[50]
  {
     DisplayOnly;
     FieldGroup = "Table5";
     Length = "2";
     Decimals = "0";
     DBTableName = "TCVG";
     SType = "Number";
     Label = "Substandard Age Duration";
  }

  IN MIR-CVG-WP-IND
  {
     DisplayOnly;
     Length = "1";
     SType = "Indicator";
     Label = "WP Ind";
  }

  INOUT MIR-CVG-NUM
  {
      Length = "2";
      DBTableName = "TCVG";
      SType = "Text";
      Label = "Coverage Number";
  }

  INOUT MIR-UWFD-POL-CRCY-CD
  {
     Length = "2";
     SType = "Hidden";
     Label = "Currency";
  }     

  OUT index
  {
      SType = "Hidden";
  }

}