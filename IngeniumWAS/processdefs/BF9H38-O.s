# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF9H38-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYDM28     CTS      INITIAL VERSION OF UISYS POLICY INQUIRY SCREEN         *
#*                                                                             *
#*******************************************************************************

S-STEP BF9H38-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "INput";
        DelEmptyRows;
        FocusField = "MIR-POL-ID";
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

      IN  MIR-POL-ID
      {
          Key;
          Mandatory;
          Length = "10";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Policy Id";
      }
      IN MIR-LARG-TYP
      {
          Length = "3";
          SType = "Text";
          DBTableName = "TU3P6";
          Label = "Large Type Code";
      }
      IN MIR-TOT-RDR-ADD
      {
          Length = "2";
          SType = "Text";
          DBTableName = "TU3P6";
          Label = "Rider addition";
      }
      IN MIR-CVG-NUM-T[30]
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Coverage number";
          Index = "1";
      }
      IN MIR-RDR-LARG-TYP-T[30]
      {
          Length = "3";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Rider large type";
          Index = "1";
      }
      IN MIR-RDR-CD-T[30]
      {
          Length = "3";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Rider code";
          Index = "1";
      }
      IN MIR-RDR-GRP-CTL-T[30]
      {
          Length = "1";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Rider Group CTL";
          Index = "1";
      }	  
      IN MIR-BENE-PYMT-END-DT-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Benefit payment";
          Index = "1";
      }
      IN MIR-TOT-HDEAS-DUR-T[30]
      {
          Length = "4";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Hospitalized due to a disease";
          Index = "1";
      }
      IN MIR-DEAS-HBENE-ACCUM-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Disease hospitalization benefit accum";
          Index = "1";
      }	  
      IN MIR-TOT-HDSTR-DUR-T[30]
      {
          Length = "4";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Disaster hospitalization benefit Dur";
          Index = "1";
      }
      IN MIR-DSTR-HBENE-ACCUM-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Disaster hospitalization benefit accum";
          Index = "1";
      }
      IN MIR-TOT-HADEAS-DUR-T[30]
      {
          Length = "4";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Hospitalized due to adult diseases";
          Index = "1";
      }
      IN MIR-ADEAS-HBENE-ACCUM-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Adult disease hosp benefit accum";
          Index = "1";
      }
      IN MIR-TOT-HOSP-DUR-T[30]
      {
          Length = "4";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "hospitalization benefit dur";
          Index = "1";
      }
      IN MIR-HBENE-ACCUM-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Hospitalization benefit accum";
          Index = "1";
      }
      IN MIR-DISAB-RT-T[30]
      {
          Length = "4";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Disability rate";
          Index = "1";
      }
      IN MIR-DISAB-BENE-ACCUM-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Disability benefit accum";
          Index = "1";
      }
      IN MIR-CR-HOSP-DUR-T[30]
      {
          Length = "4";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Cancer hospitalization dur";
          Index = "1";
      }
      IN MIR-CR-HBENE-ACCUM-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Cancer hospitalization benefit accum";
          Index = "1";
      }
      IN MIR-TOT-NURS-DUR-T[30]
      {
          Length = "4";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Nursing care";
          Index = "1";
      }
      IN MIR-NURS-BENE-ACCUM-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Nursing care benefit accum";
          Index = "1";
      }
      IN MIR-SURGY-BENE-RT-T[30]
      {
          Length = "3";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Surgery benefit rate";
          Index = "1";
      }
      IN MIR-LTT-BENE-RT-T[30]
      {
          Length = "3";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Long term treatment benefit rt";
          Index = "1";
      }	  
      IN MIR-FMLY-DSTR-DTH-CTL-T[30]
      {
          Length = "1";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Family disaster death ctl";
          Index = "1";
      }
      IN MIR-FMLY-LPS-CTL-T[30]
      {
          Length = "1";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Family Lapse CTL";
          Index = "1";
      }
      IN MIR-FMLY-CLAS-T[30]
      {
          Length = "1";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Family classification";
          Index = "1";
      }
      IN MIR-FMLY-NUM-T[30]
      {
          Length = "2";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Family Number";
          Index = "1";
      }	  
      IN MIR-FMLY-SEX-T[30]
      {
          Length = "1";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Family Gender";
          Index = "1";
      }	  
      IN MIR-FMLY-BTH-DT-T[30]
      {
          Length = "1";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Family Birthdt";
          Index = "1";
      }	  
      IN MIR-RDR-FMLY-NM-CTL-T[30]
      {
          Length = "1";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Rider Family Nm CTL";
          Index = "1";
      }      
	  IN MIR-FMLY-NM-T[30]
      {
          Length = "16";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Family Name";
          Index = "1";
      }
      IN MIR-TOT-CR-SURGY-PMT-T[30]
      {
          Length = "3";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "cancer surgery payment";
          Index = "1";
      }      
      IN MIR-TOT-CR-EXM-TR-PMT-T[30]
      {
          Length = "3";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "cancer medical exam payment";
          Index = "1";
      }      
      IN MIR-RDR-GRP-NUM-T[30]
      {
          Length = "3";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Rider Group number";
          Index = "1";
      }
}
