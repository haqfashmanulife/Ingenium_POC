# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF9H38-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYDM28   CTS      INITIAL VERSION OF UNISYS POLICY INQUIRY SCREEN          *
#*                                                                             *
#*******************************************************************************

P-STEP BF9H38-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9H38";
        BusinessFunctionName = "Benefit Details";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9H38";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

      INOUT MIR-POL-ID
      {
          Key;
          Mandatory;
          Length = "10";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Policy Id";
      }
      INOUT MIR-LARG-TYP
      {
          Length = "3";
          SType = "Text";
          DBTableName = "TU3P6";
          Label = "Large Type Code";
      }
      OUT MIR-TOT-RDR-ADD
      {
          Length = "2";
          SType = "Text";
          DBTableName = "TU3P6";
          Label = "Rider addition";
      }
      OUT MIR-CVG-NUM-T[30]
      {
          DisplayOnly;
          Length = "2";
          SType = "Text";
          Label = "Coverage number";
          Index = "1";
      }
      OUT MIR-RDR-LARG-TYP-T[30]
      {
          Length = "3";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Rider large type";
          Index = "1";
      }
      OUT MIR-RDR-CD-T[30]
      {
          Length = "3";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Rider code";
          Index = "1";
      }
      OUT MIR-RDR-GRP-CTL-T[30]
      {
          Length = "1";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Rider Group CTL";
          Index = "1";
      }	  
      OUT MIR-BENE-PYMT-END-DT-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Benefit payment";
          Index = "1";
      }
      OUT MIR-TOT-HDEAS-DUR-T[30]
      {
          Length = "4";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Hospitalized due to a disease";
          Index = "1";
      }
      OUT MIR-DEAS-HBENE-ACCUM-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Disease hospitalization benefit accum";
          Index = "1";
      }	  
      OUT MIR-TOT-HDSTR-DUR-T[30]
      {
          Length = "4";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Disaster hospitalization benefit Dur";
          Index = "1";
      }
      OUT MIR-DSTR-HBENE-ACCUM-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Disaster hospitalization benefit accum";
          Index = "1";
      }
      OUT MIR-TOT-HADEAS-DUR-T[30]
      {
          Length = "4";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Hospitalized due to adult diseases";
          Index = "1";
      }
      OUT MIR-ADEAS-HBENE-ACCUM-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Adult disease hosp benefit accum";
          Index = "1";
      }
      OUT MIR-TOT-HOSP-DUR-T[30]
      {
          Length = "4";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "hospitalization benefit dur";
          Index = "1";
      }
      OUT MIR-HBENE-ACCUM-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Hospitalization benefit accum";
          Index = "1";
      }
      OUT MIR-DISAB-RT-T[30]
      {
          Length = "4";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Disability rate";
          Index = "1";
      }
      OUT MIR-DISAB-BENE-ACCUM-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Disability benefit accum";
          Index = "1";
      }
      OUT MIR-CR-HOSP-DUR-T[30]
      {
          Length = "4";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Cancer hospitalization dur";
          Index = "1";
      }
      OUT MIR-CR-HBENE-ACCUM-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Cancer hospitalization benefit accum";
          Index = "1";
      }
      OUT MIR-TOT-NURS-DUR-T[30]
      {
          Length = "4";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Nursing care";
          Index = "1";
      }
      OUT MIR-NURS-BENE-ACCUM-T[30]
      {
          Length = "8";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Nursing care benefit accum";
          Index = "1";
      }
      OUT MIR-SURGY-BENE-RT-T[30]
      {
          Length = "3";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Surgery benefit rate";
          Index = "1";
      }
      OUT MIR-LTT-BENE-RT-T[30]
      {
          Length = "3";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Long term treatment benefit rt";
          Index = "1";
      }	  
      OUT MIR-FMLY-DSTR-DTH-CTL-T[30]
      {
          Length = "1";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Family disaster death ctl";
          Index = "1";
      }
      OUT MIR-FMLY-LPS-CTL-T[30]
      {
          Length = "1";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Family Lapse CTL";
          Index = "1";
      }
      OUT MIR-FMLY-CLAS-T[30]
      {
          Length = "1";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Family classification";
          Index = "1";
      }
      OUT MIR-FMLY-NUM-T[30]
      {
          Length = "2";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Family Number";
          Index = "1";
      }	  
      OUT MIR-FMLY-SEX-T[30]
      {
          Length = "1";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Family Gender";
          Index = "1";
      }	  
      OUT MIR-FMLY-BTH-DT-T[30]
      {
          Length = "1";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Family Birthdt";
          Index = "1";
      }	  
      OUT MIR-RDR-FMLY-NM-CTL-T[30]
      {
          Length = "1";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Rider Family Nm CTL";
          Index = "1";
      }      
      OUT MIR-FMLY-NM-T[30]
      {
          Length = "16";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Family Name";
          Index = "1";
      }
      OUT MIR-TOT-CR-SURGY-PMT-T[30]
      {
          Length = "3";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "cancer surgery payment";
          Index = "1";
      }      
      OUT MIR-TOT-CR-EXM-TR-PMT-T[30]
      {
          Length = "3";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "cancer medical exam payment";
          Index = "1";
      }      
      OUT MIR-RDR-GRP-NUM-T[30]
      {
          Length = "3";
          FieldGroup = "Table30";
          DBTableName = "TU3P6";
          SType = "Text";
          Label = "Rider Group number";
          Index = "1";
      }
}

