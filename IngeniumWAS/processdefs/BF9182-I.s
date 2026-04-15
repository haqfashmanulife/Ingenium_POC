# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT

#*******************************************************************************
#*  Component:   BF9182-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* PR006I   BMB      Created for ManuMed Rider Switches                        *
#*                 - rows explicitly defined so drop down boxes work in arrays *
#* M00037   CLB      Add new face amount field to screen                       *
#* RP2010   CTS      Add SubTable 4 value to the screen                        *
#* RPL010   CTS      Add SubTable 3 value to the screen                        *
#* M213L1   CTS      CHANGES FOR RUM                                           *
#*******************************************************************************
S-STEP BF9182-I
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


  OUT action
  {
    SType="Hidden";
  }

  OUT index
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

  IN MIR-EFF-DT
  {
    Key;
    DisplayOnly;
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

  IN MIR-POL-BILL-MODE-CD
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "POL-BILL-MODE-CD";
    SType = "Text";
    Label = "Premium Mode";
  }

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

#* RP2010 PASS SWITCH EFFECTIVE DATE INSTEAD OF RENEWAL DATE *


  INOUT temp-PLAN-ID-1
  {
    Length = "40";
    FieldGroup = "Table109";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[1]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[1]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
    Index = "1";
  }

  INOUT temp-PLAN-ID-2
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[2]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[2]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-3
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[3]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[3]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-4
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[4]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[4]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }


  INOUT temp-PLAN-ID-5
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[5]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[5]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-6
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[6]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[6]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-7
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[7]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[7]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-8
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[8]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[8]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-9
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[9]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[9]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-10
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[10]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[10]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-11
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[11]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[11]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-12
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[12]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[12]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-13
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[13]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[13]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-14
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[14]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[14]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-15
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[15]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[15]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-16
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[16]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[16]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-17
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[17]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[17]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-18
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[18]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[18]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-19
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[19]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[19]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-20
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[20]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[20]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-21
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[21]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[21]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-22
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[22]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[22]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-23
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[23]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[23]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-24
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[24]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[24]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-25
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[25]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[25]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-26
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[26]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[26]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-27
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[27]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[27]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-28
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[28]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[28]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-29
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[29]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[29]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-30
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[30]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[30]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-31
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[31]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[31]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-32
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[32]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[32]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-33
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[33]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[33]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-34
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[34]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[34]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-35
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[35]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[35]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-36
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[36]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[36]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-37
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[37]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[37]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-38
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[38]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[38]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-39
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[39]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[39]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-40
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[40]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[40]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-41
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[41]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[41]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-42
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[42]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[42]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-43
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[43]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[43]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-44
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[44]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[44]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-45
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[45]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[45]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-46
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[46]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[46]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-47
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[47]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[47]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-48
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[48]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[48]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-49
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[49]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[49]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-50
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[50]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[50]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-51
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[51]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[51]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-52
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[52]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[52]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-53
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[53]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[53]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-54
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[54]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[54]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-55
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[55]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[55]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-56
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[56]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[56]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-57
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[57]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[57]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-58
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[58]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[58]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-59
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[59]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[59]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-60
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[60]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[60]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-61
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[61]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[61]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-62
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[62]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[62]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-63
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[63]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[63]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-64
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[64]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[64]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-65
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[65]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[65]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-66
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[66]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[66]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-67
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[67]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[67]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-68
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[68]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[68]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-69
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[69]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[69]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-70
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[70]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[70]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-71
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[71]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[71]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-72
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[72]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[72]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-73
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[73]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[73]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-74
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[74]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[74]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-75
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[75]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[75]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-76
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[76]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[76]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-77
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[77]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[77]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-78
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[78]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[78]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-79
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[79]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[79]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-80
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[80]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[80]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-81
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[81]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[81]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-82
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[82]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[82]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-83
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[83]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[83]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-84
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[84]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[84]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-85
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[85]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[85]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-86
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[86]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[86]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-87
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[87]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[87]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-88
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[88]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[88]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-89
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[89]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[89]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-90
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[90]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[90]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-91
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[91]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[91]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-92
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[92]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[92]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-93
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[93]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[93]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-94
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[94]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[94]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-95
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[95]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[95]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-96
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[96]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[96]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-97
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[97]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[97]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-98
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[98]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[98]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-99
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[99]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[99]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-100
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[100]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[100]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-101
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[101]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[101]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-102
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[102]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[102]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-103
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[103]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[103]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-104
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[104]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[104]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-105
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[105]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[105]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-106
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[106]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[106]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-107
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[107]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[107]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-108
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[108]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[108]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }

  INOUT temp-PLAN-ID-109
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "CSOM9189";
    FilterFields = "2";
    FilterField1 = "MIR-PLAN-ID-T[109]";
#    FilterField2 = "MIR-CVG-PREM-CHNG-DT-T[109]";
    FilterField2 = "MIR-EFF-DT";
    SType = "Selection";
    Label = "Rider";
  }


  INOUT MIR-CVG-STBL-1-CD-T[109]
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "STB1";
    SType = "Selection";
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

  INOUT MIR-DV-CVG-FACE-AMT-T[109]
  {
    Length = "15";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "New Face Amount";
  }

  IN MIR-CVG-MPREM-AMT-T[109]
  {
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table109";
    Index = "1";
    SType = "Currency";
    Label = "Modal Premium";
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

  INOUT MIR-CVG-STBL-2-CD-T[109]
  {
    Length = "40";
    FieldGroup = "Table109";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "STB2";
    SType = "Selection";
    Label = "Benefit Limit";
  }

  IN MIR-CVG-PREM-CHNG-DT-T[109]
  {
    Length = "10";
    FieldGroup = "Table109";
    DBTableName = "TCVG";
    SType = "Date";
    Label = "Premium Change Date";
    Index = "1";
  }
#* Adding the new field sub Table 3 *
  INOUT MIR-CVG-STBL-3-CD-T[109]
    {
        Length = "5";
        FieldGroup = "Table109";
        Index = "1";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Selection";
        Label = "Sub Table 3";
  }
#* End of the field Sub Table 3 *
  INOUT MIR-CVG-STBL-4-CD-T[109]
  {
      Length = "40";
      FieldGroup = "Table109";
      Index = "1";
      CodeSource = "EDIT";
      CodeType = "STB4";
      SType = "Selection";
      Label = "Sub Table 4";
  }
#M213L1 CHANGES STARTS HERE 

  IN MIR-CVG-PRIM-GR-ID-T[109]
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table109";
    DBTableName = "TCVG";
    SType = "Text";
    Label = "Group ID";
    Index = "1";
  }
    
#M213L1 CHANGES ENDS HERE   
}
