# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT

#*******************************************************************************
#*  Component:   BF9185-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02PR55  DPK      New Screen                                                *
#*  PR006I  BMB      Changes for ManuMed rider renewals                        *
#*  RP2009  CTS      Changes for Medical Re-pricing Renewals                   *    
#*  RPL009  CTS      Changes for Limited Pay                                   *
#*  MP142B  CTS      Changes for Rider Renewal Quote Details Screen Changes    *
#*  M213L1  CTS      Changes for RUM                                           *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  C23814  CTS      COMMENTED M241A3 CODE CHANGES FOR PERFORMANCE ISSUE       *
#*  018395  CTS      CHANGES DONE FOR TRAD RIDER RENEWAL                       *
#*  TDM21C  CTS      CHANGES DONE FOR AUTOMATIC RIDER RENEWAL                  *
#*  UY3001  CTS      STREAM 3 CHANGES                                          * 
#*******************************************************************************
S-STEP BF9185-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    Type = "Input";
    FocusField = "MIR-POL-ID-BASE";
    FocusFrame = "ContentFrame";
  }

  IN Title;

  IN TitleBar;
  IN TitleBarSize;

  IN ButtonBar;
  IN ButtonBarSize;

  IN MessageFrame;
  IN MessageFrameSize;

#* these are set here for the filter fields    *

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

  INOUT MIR-EFF-DT
  {
    Key;
    Length = "10";
    SType = "Date";
    Label = "Effective Date";
  }

  IN MIR-DV-OWN-CLI-NM
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Owner Name";
  }

  IN MIR-POL-SNDRY-AMT
  {
    DisplayOnly;
    Signed;
    Length = "15";
    SType = "Currency";
    Label = "Sundry Amount";
  }

# 018395 CHANGES START HERE
  IN MIR-POL-MPREM-AMT
  {
    DisplayOnly;   
    Signed;
    Length = "15";
    DBTableName = "TPOL";
    SType = "Currency";
    Label = "Trad modal Amount";
  }
  IN MIR-ADV-PMT-AMT
  {
    DisplayOnly;
    Signed;
    Length = "15";
    SType = "Currency";
    Label = "Advance Premium";
  }
# 018395 CHANGES END HERE

  IN MIR-POL-BILL-MODE-CD
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "POL-BILL-MODE-CD";
    SType = "Text";
    Label = "Premium Mode";
  }
   
#*  PR006I  start position for more...      *
  INOUT MIR-SCR-SUB
  {
    Length = "3";
    SType = "Numeric";
    Label = "CVG Start";
  }
 
  IN MIR-CVG-NUM-T[109]
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Text";
    Label = "Coverage Number";
  }
   
  IN MIR-INSRD-CLI-ID-T[109] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Text";
    Label = "Insured Client Id";
  }

#*  PR006I  Filter changes for ManuMed rider renewals    *

  IN MIR-PLAN-ID-T[109]
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table109";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Rider Name";
    Index = "1";
  }
  
#*  MP142B  -  Added One more Filter field "MIR-CVG-RENW-PLAN-ID" for displaying the Override Renewal Plan for a Term Riders *  

  INOUT temp-DV-CVG-PLAN-ID-1
  {
    Length = "40";
    FieldGroup = "Table109";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[1]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[1]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-1";
    SType = "Selection";
    Label = "New Rider";
    Index = "1";
  }

  INOUT temp-DV-CVG-PLAN-ID-2
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[2]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[2]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-2";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-3
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[3]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[3]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-3";
    SType = "Selection";
    Label = "New Rider";
  }

  INOUT temp-DV-CVG-PLAN-ID-4
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[4]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[4]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-4";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    

  INOUT temp-DV-CVG-PLAN-ID-5
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[5]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[5]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-5";
    SType = "Selection";
    Label = "New Rider";
  }
                    
  INOUT temp-DV-CVG-PLAN-ID-6
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[6]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[6]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-6";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-7
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[7]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[7]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-7";
    SType = "Selection";
    Label = "New Rider";
  }
                    
  INOUT temp-DV-CVG-PLAN-ID-8
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[8]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[8]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-8";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-9
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[9]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[9]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-9";
    SType = "Selection";
    Label = "New Rider";
  }
                    
  INOUT temp-DV-CVG-PLAN-ID-10
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[10]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[10]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-10";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-11
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[11]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[11]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-11";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-12
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[12]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[12]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-12";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-13
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[13]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[13]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-13";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-14
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[14]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[14]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-14";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-15
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[15]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[15]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-15";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-16
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[16]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[16]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-16";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-17
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[17]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[17]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-17";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-18
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[18]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[18]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-18";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-19
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[19]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[19]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-19";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-20
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[20]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[20]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-20";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-21
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[21]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[21]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-21";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-22
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[22]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[22]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-22";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-23
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[23]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[23]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-23";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-24
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[24]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[24]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-24";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-25
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[25]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[25]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-25";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-26
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[26]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[26]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-26";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-27
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[27]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[27]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-27";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-28
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[28]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[28]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-28";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-29
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[29]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[29]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-29";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-30
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[30]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[30]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-30";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-31
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[31]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[31]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-31";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-32
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[32]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[32]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-32";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-33
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[33]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[33]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-33";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-34
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[34]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[34]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-34";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-35
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[35]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[35]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-35";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-36
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[36]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[36]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-36";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-37
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[37]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[37]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-37";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-38
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[38]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[38]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-38";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-39
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[39]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[39]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-39";
    SType = "Selection";
    Label = "New Rider";
  }
   
  INOUT temp-DV-CVG-PLAN-ID-40
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[40]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[40]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-40";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-41
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[41]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[41]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-41";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-42
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[42]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[42]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-42";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-43
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[43]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[43]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-43";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-44
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[44]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[44]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-44";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-45
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[45]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[45]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-45";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-46
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[46]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[46]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-46";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-47
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[47]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[47]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-47";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-48
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[48]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[48]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-48";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-49
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[49]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[49]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-49";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-50
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[50]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[50]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-50";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-51
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[51]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[51]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-51";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-52
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[52]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[52]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-52";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-53
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[53]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[53]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-53";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-54
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[54]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[54]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-54";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-55
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[55]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[55]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-55";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-56
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[56]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[56]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-56";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-57
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[57]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[57]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-57";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-58
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[58]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[58]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-58";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-59
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[59]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[59]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-59";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-60
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[60]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[60]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-60";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-61
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[61]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[61]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-61";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-62
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[62]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[62]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-62";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-63
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[63]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[63]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-63";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-64
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[64]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[64]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-64";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-65
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[65]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[65]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-65";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-66
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[66]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[66]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-66";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-67
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[67]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[67]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-67";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-68
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[68]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[68]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-68";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-69
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[69]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[69]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-69";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-70
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[70]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[70]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-70";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-71
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[71]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[71]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-71";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-72
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[72]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[72]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-72";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-73
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[73]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[73]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-73";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-74
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[74]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[74]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-74";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-75
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[75]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[75]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-75";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-76
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[76]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[76]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-76";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-77
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[77]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[77]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-77";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-78
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[78]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[78]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-78";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-79
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[79]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[79]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-79";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-80
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[80]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[80]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-80";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-81
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[81]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[81]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-81";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-82
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[82]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[82]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-82";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-83
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[83]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[83]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-83";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-84
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[84]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[84]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-84";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-85
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[85]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[85]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-85";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-86
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[86]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[86]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-86";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-87
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[87]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[87]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-87";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-88
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[88]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[88]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-88";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-89
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[89]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[89]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-89";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-90
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[90]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[90]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-90";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-91
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[91]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[91]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-91";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-92
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[92]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[92]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-92";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-93
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[93]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[93]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-93";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-94
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[94]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[94]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-94";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-95
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[95]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[95]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-95";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-96
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[96]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[96]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-96";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-97
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[97]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[97]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-97";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-98
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[98]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[98]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-98";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-99
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[99]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[99]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-99";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-100
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[100]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[100]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-100";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-101
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[101]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[101]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-101";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-102
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[102]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[102]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-102";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-103
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[103]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[103]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-103";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-104
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[104]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[104]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-104";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-105
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[105]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[105]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-105";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-106
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[106]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[106]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-106";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-107
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[107]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[107]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-107";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-108
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[108]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[108]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-108";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    
  INOUT temp-DV-CVG-PLAN-ID-109
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9188";
    FilterFields = "3";
    FilterField1 = "MIR-PLAN-ID-T[109]";
    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[109]";
    FilterField3 = "temp-DV-CVG-PLAN-ID-109";
    SType = "Selection";
    Label = "New Rider";
  }
                                                                                                                    

# IN MIR-CVG-ISS-EFF-DT-T[109]
# {
#   DisplayOnly;
#   Length = "10";
#   FieldGroup = "Table109";
#   SType = "Date";
#   Label = "Rider Issue Date";
#   Index = "1";
# }
 
  IN MIR-CVG-STBL-1-CD-T[109]
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
#*C23814 changes START here*
#* M241A3 changes START here*  
    CodeSource = "CSOM9D29";        
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T"; 
    FilterField2 = "MIR-CVG-STBL-1-CD-T";
#    CodeSource = "EDIT";
#    CodeType = "STB1";
#* M241A3 changes END here*
    CodeSource = "EDIT";
    CodeType = "STB1";
#*C23814 changes END here*
    SType = "Text";
    Label = "Duration";
  }

  IN MIR-DV-INSRD-CLI-NM-T[109]
  {
    DisplayOnly;
    Length = "75";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Text";
    Label = "Insured's Name";
  }

  IN MIR-CVG-FACE-AMT-T[109]
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "Current Face Amount";
  }

  IN MIR-CVG-MPREM-AMT-T[109]
  {
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "Current Modal Premium";
  }

  INOUT MIR-DV-CVG-FACE-AMT-T[109]
  {
    Length = "15";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "New Face Amount";
  }

  IN MIR-DV-CVG-MPREM-AMT-T[109]
  {
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "New Modal Premium";
  }
   
  IN MIR-DV-CVG-RENEW-CD-T[109]
  {
    Length = "01";
    FieldGroup = "Table109";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Rider Renewal Code";
    Index = "1";
  }
#UY3001 CHANGES STARTS
    IN MIR-DV-BASE-RENW-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Base renewal indicator";
    }
#UY3001 CHANGES ENDS
#*  PR006I  changes for ManuMed rider renewals    *
                                                
  IN MIR-CVG-STBL-2-CD-T[109]
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table109";
    CodeSource = "EDIT";
    CodeType = "STB2";
    DBTableName = "TCVG";
    SType = "Text";
    Label = "Benefit Limit";
    Index = "1";
  }
 
  INOUT MIR-DV-CVG-STBL-1-CD-T[109]
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table109";
#*C23814 changes START here*
#* M241A3 changes START here*  
#    CodeSource = "EDIT";
#    CodeType = "STB1";
#    CodeSource = "CSOM9D27";        
#    FilterFields = "1";
#    FilterField1 = "MIR-DV-CVG-PLAN-ID-T"; 
#* M241A3 changes END here* 
    CodeSource = "EDIT";
    CodeType = "STB1";
#*C23814 changes END here*
    DBTableName = "TCVG";
    SType = "Selection";
    Label = "New Duration";
    Index = "1";
  }
 
  INOUT MIR-DV-CVG-STBL-2-CD-T[109]
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table109";
    CodeSource = "EDIT";
    CodeType = "STB2";
    DBTableName = "TCVG";
    SType = "Selection";
    Label = "New Benefit Limit";
    Index = "1";
  }
  
#****** RP2009 Changes starts here ******
  
  IN MIR-CVG-STBL-4-CD-T [109]
  { 
    DisplayOnly;
    Length = "02";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "STB4";
    DBTableName = "TCVG";
    SType = "Text";
    Label = "Sub table 4";
  }

  INOUT MIR-DV-CVG-STBL-4-CD-T[109]
  {
    Length = "02";
    FieldGroup = "Table109";
    CodeSource = "EDIT";
    CodeType = "STB4";
    DBTableName = "TCVG";
    SType = "Selection";
    Label = "New Sub table 4";
    Index = "1";
  }
  
#****** RP2009 Changes end here ******

#****** RPL009 Changes start here ******

IN MIR-CVG-STBL-3-CD-T [109]
  { 
    DisplayOnly;
    Length = "05";
    FieldGroup = "Table109";
    Index = "1";
#*C23814 changes START here*
#* M241A3 changes START here* 
#    CodeSource = "CSOM9D30";        
#    FilterFields = "2";
#    FilterField1 = "MIR-PLAN-ID-T";
#    FilterField2 = "MIR-CVG-STBL-3-CD-T";
#    CodeSource = "EDIT";
#    CodeType = "STB3";
#* M241A3 changes END here*
    CodeSource = "EDIT";
    CodeType = "STB3";
#*C23814 changes END here*
    DBTableName = "TCVG";
    SType = "Text";
    Label = "Sub table 3";
  }

  INOUT MIR-DV-CVG-STBL-3-CD-T[109]
  {
    Length = "05";
    FieldGroup = "Table109";
#*C23814 changes START here*
#* M241A3 changes START here* 
#    CodeSource = "CSOM9D28";        
#    FilterFields = "1";
#    FilterField1 = "MIR-DV-CVG-PLAN-ID-T";
#    CodeSource = "EDIT";
#    CodeType = "STB3";
#* M241A3 changes END here*
    CodeSource = "EDIT";
    CodeType = "STB3";
#*C23814 changes END here*
    DBTableName = "TCVG";
    SType = "Selection";
    Label = "New Sub table 3";
    Index = "1";
   }

#****** RPL009 Changes end here ******
 INOUT MIR-IGNORE-ERROR-IND-T[109]
     {
        Length = "1";
        FieldGroup = "Table109";
        SType = "Indicator";
        Label = "Ignore Error";
        Index = "1";
     }

  IN MIR-CVG-PREM-CHNG-DT-T[109]
  {
    Length = "10";
    FieldGroup = "Table109";
    DBTableName = "TCVG";
    SType = "Date";
    Label = "Next Renewal Date";
    Index = "1";
  }
  #MP142B CHANGES START HERE
  IN MIR-FACE-AMT-CHNG-OK-T[109]
  {
    Length = "01";
    FieldGroup = "Table109";
    DBTableName = "Derived";
    SType = "Text";
    Index = "1";
  }
  #MP142B CHANGES END HERE   
#* M213L1 CHANGES STARTS HERE 
  IN MIR-CVG-PRIM-GR-ID-T[109]
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Text";
    Label = "Group ID";
  }
  
#018395 CHANGES STARTS HERE
  IN  MIR-DV-CVG-RENW-IND-T[109]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Hidden";
    Label = "Renewal indicator";
  }
#018395 CHANGES ends HERE
#TDM21C CHANGES STARTS HERE
  IN  MIR-DV-AUTO-RENW-IND-T[109]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Hidden";
    Label = "Auto Renewal indicator";
  }
#TDM21C CHANGES  ENDS HERE
#* M213L1 CHANGES ENDS HERE  
#*C23814 changes START here*
#* M241A3 changes START here*
#INOUT MIR-DV-CVG-PLAN-ID-T[109]
#{
#    Length = "40";
#    FieldGroup = "Table109";
#    Index = "1";
#    SType = "Selection";
#    Label = "New Rider"; 
#} 
#* M241A3 changes END here*
#*C23814 changes END here*
}
