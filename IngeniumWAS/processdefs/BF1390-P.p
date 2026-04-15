# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT


#*******************************************************************************
#*  Component:   BF1390-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  KC       Created for New U/W Questions                             *
#*  B00131  BMB      Correct decimal fields                                    *
#*  B00148  BMB      Change  MIR-FLD-ID-041 from ANMTST-IND to ARRHTHMIND      *
#*  B00172  BMB      Add parent or guardian question to forms - MIR-FLD-ID-070 *
#*  B00173  BMB      Fields 046,047,048 changed to radio box selection         *
#*  B00148  BMB      Add SheetID 1 - MIR-FLD-ID-071                            *
#*  B00367  BMB      Add Medical Report number: RPT-NUM-ID - MIR-FLD-ID-072    *
#*  B00514  SRO      Change #26 & #27 (height & weight) to remove decimals     *
#*  B00533  SRO      Add ILL1WK-IND - MIR-FLD-ID-073 &                         *
#*                   Add MEDEFF-IND - MIR-FLD-ID-074                           *
#*  B10308  VAN      Add SMOKE-CMNUM - MIR-FLD-ID-76                           *
#*  HNB002  HIN/AI   NEW FIELDS FOR UPLOAD                                     *
#*  HNB002  JSY      ADD HANDWRITTEN NOTES AND INCOMPLETE CHECKBOXES -         *
#*                   MIR-DV-QSTN-RESP-TXT-077 TO MIR-DV-QSTN-RESP-TXT-081      *
#*  P02526  FB       FOR MIR-FLD-ID-081 USE IDENTIFICATION MARK (HCHNOTMRK)    *
#*                   INSTEAD OF INCOMPLETE (SELF-INCMP)                        *
#*  NWLUWF  CTS      CHANGES DONE FOR NWL U/W FORMS REVISION                   *
#*  ATF008  CTS      CHANGES DONE FOR NWL U/W FORMS REVISION                   * 
#*  C17785  CTS      CHANGES FOR MP171 DISEASE INFORMATION                     *
#*  MP176G  CTS      CHANGES FOR ARM NEW SD FORM                               *
#*  M242C2  CTS      CHANGES FOR ARMII NEW SD FORM                             *
#*  M245B3  CTS      CHANGES FOR SPWL NEW SD FORM                              *
#*  MP253F  CTS      CHANGES DONE FOR ULE-2 UW FORM                            *
#*  M280Q1  CTS      CHANGES DONE AS PART OF ARM III NEW REPORTS               *
#*  MP281Q  CTS      CHANGES FOR NEW RETAIL CANCER SD FORM                     *
#*  MP300A  CTS      CHANGES FOR NEW ETC SD FORM                               *
#*  MP270G  CTS      CHANGES FOR EPOS MGA                                      *
#*******************************************************************************

P-STEP BF1390-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1390";
        BusinessFunctionName = "Variable Questions Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM0421";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

#   These next fields (MIR-FLD-ID-nnn) are required as inputs to the process in order
#   for the host to determine what detailed data is to be extracted from
#   its storage location on the host.  The output from this process will be
#   returned to the flow in the form of the MIR-DV-QSTN-RESP-TXT-nnn fields.

#   The value of this field is used to locate the defined field (DFLD)
#   entry.  The DFLD entry is then used to locate the table, and location within
#   that table, where the data is stored.

#   Additional details may be retrieved by adding separate input fields to
#   transport the data from host to client (i.e. add ...-005 and so on).  The values
#   contained within this P-Step are a sample of data that may be requested and
#   returned to the flow.  There are currently a maximum of 150 fields that may be
#   defined and retrieved in this manner.

    IN MIR-FLD-ID-001
    {
        Value = "DSCLSRE-DT";
    }

    IN MIR-FLD-ID-002
    {
        Value = "CONSULTATN";
    }

    IN MIR-FLD-ID-003
    {
        Value = "HOSP5YRSIN";
    }

    IN MIR-FLD-ID-004
    {
        Value = "ILLSURGYIN";
    }

    IN MIR-FLD-ID-005
    {
        Value = "SYS-CARDIO";
    }

    IN MIR-FLD-ID-006
    {
        Value = "SYS-NERVE";
    }

    IN MIR-FLD-ID-007
    {
        Value = "SYS-RESPIR";
    }

    IN MIR-FLD-ID-008
    {
        Value = "SYS-DIGEST";
    }

    IN MIR-FLD-ID-009
    {
        Value = "LIVGALLIND";
    }

    IN MIR-FLD-ID-010
    {
        Value = "SYS-URINRY";
    }

    IN MIR-FLD-ID-011
    {
        Value = "SELFSENIND";
    }

    IN MIR-FLD-ID-012
    {
        Value = "SYS-TUMOUR";
    }

    IN MIR-FLD-ID-013
    {
        Value = "SELFILLIND";
    }

    IN MIR-FLD-ID-014
    {
        Value = "IRGILL-IND";
    }

    IN MIR-FLD-ID-015
    {
        Value = "HD-RCV-IND";
    }

    IN MIR-FLD-ID-016
    {
        Value = "HD-ABN-IND";
    }

    IN MIR-FLD-ID-017
    {
        Value = "DISABILITY";
    }

    IN MIR-FLD-ID-018
    {
        Value = "SELFMOTIND";
    }

    IN MIR-FLD-ID-019
    {
        Value = "FMLEHOSIND";
    }

    IN MIR-FLD-ID-020
    {
        Value = "FMLOPERIND";
    }

    IN MIR-FLD-ID-021
    {
        Value = "PREG-IND";
    }

    IN MIR-FLD-ID-022
    {
        Value = "PREG-MO";
    }

    IN MIR-FLD-ID-023
    {
        Value = "PREG-WK";
    }

    IN MIR-FLD-ID-024
    {
        Value = "SMK-IND";
    }

    IN MIR-FLD-ID-025
    {
        Value = "SMK-CIG-QT";
    }

    IN MIR-FLD-ID-026
    {
        Value = "CLNTHTCM";
    }

    IN MIR-FLD-ID-027
    {
        Value = "CLNTWTKG";
    }

    IN MIR-FLD-ID-028
    {
        Value = "FILPERS-ID";
    }

    IN MIR-FLD-ID-029
    {
        Value = "ALCHL-IND";
    }

    IN MIR-FLD-ID-030
    {
        Value = "GENCONDIND";
    }

    IN MIR-FLD-ID-031
    {
        Value = "MEDCHSTIND";
    }

    IN MIR-FLD-ID-032
    {
        Value = "MEDABDMIND";
    }

    IN MIR-FLD-ID-033
    {
        Value = "NERVSYSIND";
    }

    IN MIR-FLD-ID-034
    {
        Value = "MEDSENSIND";
    }

    IN MIR-FLD-ID-035
    {
        Value = "MEDMOTRIND";
    }

    IN MIR-FLD-ID-036
    {
        Value = "DSTNCHRIND";
    }

    IN MIR-FLD-ID-037
    {
        Value = "OTHDSTNIND";
    }

    IN MIR-FLD-ID-038
    {
        Value = "C-CHST-QTY";
    }

    IN MIR-FLD-ID-039
    {
        Value = "CABDMN-QTY";
    }

    IN MIR-FLD-ID-040
    {
        Value = "PULS-RT";
    }

    IN MIR-FLD-ID-041
    {
        Value = "ARRHTHMIND";
#       Value = "ANMTST-IND";
    }

    IN MIR-FLD-ID-042
    {
        Value = "HMGLB-QTY";
    }

    IN MIR-FLD-ID-043
    {
        Value = "MAX-BLD-RT";
    }

    IN MIR-FLD-ID-044
    {
        Value = "MIN-BLD-RT";
    }

    IN MIR-FLD-ID-045
    {
        Value = "URINTSTIND";
    }

    IN MIR-FLD-ID-046
    {
        Value = "URINPROTCD";
    }

    IN MIR-FLD-ID-047
    {
        Value = "URINSUGRCD";
    }

    IN MIR-FLD-ID-048
    {
        Value = "URINBLD-CD";
    }

    IN MIR-FLD-ID-049
    {
        Value = "ACQNT-IND";
    }

    IN MIR-FLD-ID-050
    {
        Value = "PHSIREGIND";
    }

    IN MIR-FLD-ID-051
    {
        Value = "CMPLXNIND";
    }

    IN MIR-FLD-ID-052
    {
        Value = "SKNIREGIND";
    }

    IN MIR-FLD-ID-053
    {
        Value = "PSTRE-IND";
    }

    IN MIR-FLD-ID-054
    {
        Value = "ABNMMVTIND";
    }

    IN MIR-FLD-ID-055
    {
        Value = "ATND-IND";
    }

    IN MIR-FLD-ID-056
    {
        Value = "CNFRM-CD";
    }

    IN MIR-FLD-ID-057
    {
        Value = "PROF-CD";
    }

    IN MIR-FLD-ID-058
    {
        Value = "NONCONTIND";
    }

    IN MIR-FLD-ID-059
    {
        Value = "M-EXAM-DT";
    }

    IN MIR-FLD-ID-060
    {
        Value = "MEDXRAYIND";
    }

    IN MIR-FLD-ID-061
    {
        Value = "XRAYINFIND";
    }

    IN MIR-FLD-ID-062
    {
        Value = "BLDTST-IND";
    }

    IN MIR-FLD-ID-063
    {
        Value = "LIVTST-IND";
    }

    IN MIR-FLD-ID-064
    {
        Value = "LIVRGOTQTY";
    }

    IN MIR-FLD-ID-065
    {
        Value = "LIVRGTPQTY";
    }

    IN MIR-FLD-ID-066
    {
        Value = "LIVGTP-QTY";
    }

    IN MIR-FLD-ID-067
    {
        Value = "MED-EKGIND";
    }

    IN MIR-FLD-ID-068
    {
        Value = "EKGINFOIND";
    }

    IN MIR-FLD-ID-069
    {
        Value = "MEDCERT-DT";
    }
 
    IN MIR-FLD-ID-070
    {
        Value = "REL-IND";
    }
     
    IN MIR-FLD-ID-071
    {
        Value = "SHT1-ID";
    }
         
    IN MIR-FLD-ID-072
    {
        Value = "RPT-NUM-ID";
    }
     
    IN MIR-FLD-ID-073
    {
        Value = "ILL1WK-IND";
    }
     
    IN MIR-FLD-ID-074
    {
        Value = "MEDEFF-IND";
    }
     
    IN MIR-FLD-ID-075
    {
        Value = "SMOKE-CIGS";
    }

    IN MIR-FLD-ID-076
    {
        Value = "SMOKE-CNUM";
    }

    IN MIR-FLD-ID-077
    {
        Value = "MED-HAND1";
    }

    IN MIR-FLD-ID-078
    {
        Value = "MED-HAND2";
    }

    IN MIR-FLD-ID-079
    {
        Value = "MED-INCMP1";
    }

    IN MIR-FLD-ID-080
    {
        Value = "MED-INCMP2";
    }

    IN MIR-FLD-ID-081
    {
        Value = "HCHNOTMRK";
    }
    #ATF008 CHANGES START    
    #NWLUWF CHANGES START
    #
    #IN MIR-FLD-ID-082
    #{
    #    Value = "CANSARLM10";
    #}
    #
    #IN MIR-FLD-ID-083
    #{
    #    Value = "CANSARLM05";
    #}
    #NWLUWF CHANGES END
    
    IN MIR-FLD-ID-082
    {
        Value = "CANSARLMQ1";
    }
    
    IN MIR-FLD-ID-083
    {
        Value = "CANSARLMQ2";
    }    
    IN MIR-FLD-ID-084
    {
        Value = "CANSARLMQ3";
    }    
    #ATF008 CHANGES END
    #MP176G CHANGES START
    #
    
    IN MIR-FLD-ID-085
    {
        Value = "ILLNESS";
    }  
    
    IN MIR-FLD-ID-086
    {
        Value = "HYPT-IND";
    }  
    
    IN MIR-FLD-ID-087
    {
        Value = "LIPID-IND";
    }  
    
    IN MIR-FLD-ID-088
    {
        Value = "HEPAT-IND";
    }  
    
    IN MIR-FLD-ID-089
    {
        Value = "URIC-IND";
    }  
    
    IN MIR-FLD-ID-090
    {
        Value = "FRAC-IND";
    }  
    
    IN MIR-FLD-ID-091
    {
        Value = "UTESUR-IND";
    }  
    
    IN MIR-FLD-ID-092
    {
        Value = "UTEFIB-IND";
    }  
    
    IN MIR-FLD-ID-093
    {
        Value = "CSEC-IND";
    }  
    
    IN MIR-FLD-ID-094
    {
        Value = "DUR-PREG";
    }  
    
    IN MIR-FLD-ID-095
    {
        Value = "DERM-IND";
    }  
    
    IN MIR-FLD-ID-096
    {
        Value = "GALST-IND";
    }  
    
    IN MIR-FLD-ID-097
    {
        Value = "UREST-IND";
    }  
    
    IN MIR-FLD-ID-098
    {
        Value = "CTRCT-IND";
    }  
    
    IN MIR-FLD-ID-099
    {
        Value = "GLAU-IND";
    }  
    
    IN MIR-FLD-ID-100
    {
        Value = "SINUS-IND";
    }  
    
    IN MIR-FLD-ID-101
    {
        Value = "ANAL-IND";
    }  
    
    IN MIR-FLD-ID-102
    {
        Value = "GAST-IND";
    }  
    
    IN MIR-FLD-ID-103
    {
        Value = "CNFRM-IND";
    }  
    
    IN MIR-FLD-ID-104
    {
        Value = "ACPT-IND";
    }  
    
    #MP176G CHANGES END HERE
    
    #M242C2 CHANGES STARTS HERE
    IN MIR-FLD-ID-105
    {
        Value = "CANCER-IND";
    }  
    
    #M242C2 CHANGES ENDS HERE  
    
    #M245B3 CHANGES STARTS HERE
    IN MIR-FLD-ID-106
    {
        Value = "HOSP2YRSIN";
    }  
        
    #M245B3 CHANGES ENDS HERE
   
    #MP253F CHANGES STARTS HERE
    IN MIR-FLD-ID-107
    {
        Value = "MEDLTCQ1";
    }  
    
    IN MIR-FLD-ID-108
    {
        Value = "MEDLTCQ2";
    }     
      
    #MP253F CHANGES ENDS HERE 
    
    #M280Q1 CHANGES STARTS HERE
    IN MIR-FLD-ID-109
    {
        Value = "DNGRJOBIND";
    } 
    
    IN MIR-FLD-ID-110
    {
        Value = "LIPIDTST";
    }    
   
    IN MIR-FLD-ID-111
    {
        Value = "LIPID-TC";
    }   
   
    IN MIR-FLD-ID-112
    {
        Value = "LIPID-HDL";
    }   
   
    IN MIR-FLD-ID-113
    {
        Value = "LIPID-LDL";
    }   
  
    IN MIR-FLD-ID-114
    {
        Value = "LIPID-TG";
    }    
   
     IN MIR-FLD-ID-115
    {
        Value = "BLDSUGRTST";
    }   
  
    IN MIR-FLD-ID-116
    {
        Value = "BLDSUG-FBS";
    }   
 
    IN MIR-FLD-ID-117
    {
         Value = "BLDHBA1C";
    }
    
    IN MIR-FLD-ID-118
    {
         Value = "HBA1CIND";
    }
    
    IN MIR-FLD-ID-119
    {
         Value = "ARRHTHM-RT";
    } 
    
    IN MIR-FLD-ID-120
    {
         Value = "ANMTST-IND";
    }
    
    IN MIR-FLD-ID-121
    {
         Value = "EXAMLOC-CD";
    }    

   #M280Q1 CHANGES ENDS HERE
   
   #MP281Q CHANGES STARTS HERE
   
   IN MIR-FLD-ID-122
   {
        Value = "RADIJOBIND";
   }      
   #MP281Q CHANGES ENDS HERE

   #MP300A CHANGES STARTS HERE
   
   IN MIR-FLD-ID-123
   {
       Value = "WLIND";
   }
   
   IN MIR-FLD-ID-124
   {
       Value = "MEDIND";
   }
   
   IN MIR-FLD-ID-125
   {
       Value = "CNCRIND";
   }
   #MP300A CHANGES ENDS HERE   
   #MP270G CHANGES STARTS HERE  
   IN MIR-FLD-ID-126
   {
       Value = "DNGRHOBIND";
   }   
   #MP270G CHANGES ENDS HERE     
   OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of Birth";
    }

    OUT MIR-STCKR-ID
    {
        Length = "11";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Sticker Number";
    }

#   Ultimately, it is the question responses that are the desired objective of this
#   business function.
#   It is essential that the numeric identifier
#   (the last 3 characters of the field name itself) correspond to the input
#   field for these medical details.  For example, the output for the field
#   HAZ-FLY (requested via field MIR-FLD-ID-001), will be returned in the
#   MIR-DV-QSTN-TXT-001 field below.  The process driver for this business
#   function expects this and performs the mapping of input field to output
#   field.

#   Additional responses may be retrieved by adding separate output fields to
#   transport the data from host to client (i.e. add ...-005 and so on)

#   This is a date field - 10 characters
    OUT MIR-DV-QSTN-RESP-TXT-001
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-002
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-003
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-004
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-005
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-006
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-007
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-008
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-009
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-010
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-011
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-012
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-013
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-014
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-015
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-016
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-017
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-018
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-019
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-020
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-021
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is for months pregnant - 2 characters
    OUT MIR-DV-QSTN-RESP-TXT-022
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

#   This is for weeks pregnant - 2 characters
    OUT MIR-DV-QSTN-RESP-TXT-023
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-024
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is for number of cigarettes smoked - 3 characters
    OUT MIR-DV-QSTN-RESP-TXT-025
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

#   This is for height - 4 characters (3 + 1 decimal)
#   Changed for height - 3 characters (3 + 0 decimal)
    OUT MIR-DV-QSTN-RESP-TXT-026
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

#   This is for weight - 4 characters (3 + 1 decimal)
#   Changed for weight - 3 characters (3 + 0 decimal)
    OUT MIR-DV-QSTN-RESP-TXT-027
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

#   This field is for the doctor's id code - 6 characters
    OUT MIR-DV-QSTN-RESP-TXT-028
    {
        Length = "6";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-029
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-030
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-031
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-032
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-033
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-034
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-035
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-036
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-037
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is for chest diameter
    OUT MIR-DV-QSTN-RESP-TXT-038
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

#   This is for waist diameter
    OUT MIR-DV-QSTN-RESP-TXT-039
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

#   This is for pulse rate 
    OUT MIR-DV-QSTN-RESP-TXT-040
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-041
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is for rate of arrhythmia
    OUT MIR-DV-QSTN-RESP-TXT-042
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

#   This is for max blood rate
    OUT MIR-DV-QSTN-RESP-TXT-043
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

#   This is for min blood rate
    OUT MIR-DV-QSTN-RESP-TXT-044
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-045
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is for urine protein code - 1 number - radio box selected
    OUT MIR-DV-QSTN-RESP-TXT-046
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "YesNo";
        Label = "Response to Variable Questions";
    }

#   This is for urine sugar code - 1 number - radio box selected
    OUT MIR-DV-QSTN-RESP-TXT-047
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "YesNo";
        Label = "Response to Variable Questions";
    }

#   This is for urine blood code - 1 number - radio box selected
    OUT MIR-DV-QSTN-RESP-TXT-048
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "YesNo";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-049
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-050
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-051
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-052
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-053
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-054
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-055
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a checkbox for type of photo id presented.
    OUT MIR-DV-QSTN-RESP-TXT-056
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MED-CNFRM-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Type of ID provided";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-057
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-058
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a date field - 10 characters
    OUT MIR-DV-QSTN-RESP-TXT-059
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-060
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-061
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-062
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-063
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is for Liver GOT Quantity - 3 characters
    OUT MIR-DV-QSTN-RESP-TXT-064
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

#   This is for Liver GTP Quantity - 3 characters
    OUT MIR-DV-QSTN-RESP-TXT-065
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

#   This is for Liver GGOT Quantity - 3 characters
    OUT MIR-DV-QSTN-RESP-TXT-066
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }


#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-067
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-068
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a date field - 10 characters
    OUT MIR-DV-QSTN-RESP-TXT-069
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field - but the questions are modified to Parent, Guardian and Unanswered 
    OUT MIR-DV-QSTN-RESP-TXT-070
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
     
#   This is for the sheet ID  - 5 characters
    OUT MIR-DV-QSTN-RESP-TXT-071
    {
        Length = "5";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }
     
#   This is for the medical report number  - 7 characters
    OUT MIR-DV-QSTN-RESP-TXT-072
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }
     
#   This is for the Illness within last week indicator - Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-073
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
     
#   This is for Event that can affect medical results - Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-074
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#   This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-075
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
#   This is for SMOKE-CNUM - 3 characters
    OUT MIR-DV-QSTN-RESP-TXT-076
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }
#   This is a Y/N field for Handwritten Notes on 1st Page
    OUT MIR-DV-QSTN-RESP-TXT-077
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNo";
        Label = "Response to Variable Questions";
    }
#   This is a Y/N field for Handwritten Notes on 2nd Page
    OUT MIR-DV-QSTN-RESP-TXT-078
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNo";
        Label = "Response to Variable Questions";
    }
#   This is a Y/N field for Incomplete Mandatory Data on 1st Page
    OUT MIR-DV-QSTN-RESP-TXT-079
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNo";
        Label = "Response to Variable Questions";
    }
#   This is a Y/N field for Incomplete Mandatory Data on 2nd Page
    OUT MIR-DV-QSTN-RESP-TXT-080
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNo";
        Label = "Response to Variable Questions";
    }
#   This is a Y/N field for Handwritten Notes or Incomplete Form
    OUT MIR-DV-QSTN-RESP-TXT-081
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNo";
        Label = "Response to Variable Questions";
    }
#NWLUWF Changes begin
#   Addition of Yes/No/Unanswered fields for cancer history
    OUT MIR-DV-QSTN-RESP-TXT-082
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    OUT MIR-DV-QSTN-RESP-TXT-083
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
#NWLUWF Changes end
# ATF008 CHNAGES BEGIN
    OUT MIR-DV-QSTN-RESP-TXT-084
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   
# ATF008 CHNAGES ENDS
# MP176G CHANGES START HERE
    
   IN MIR-UW-FORM-ID 
   { 
       Length = "1"; 
       SType = "Hidden"; 
       Label = "Underwriting form type"; 
   } 

# This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-085
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for hypertension
    OUT MIR-DV-QSTN-RESP-TXT-086
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for hyperlipedemia
    OUT MIR-DV-QSTN-RESP-TXT-087
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for hepatitis
    OUT MIR-DV-QSTN-RESP-TXT-088
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for hyperuricemia
    OUT MIR-DV-QSTN-RESP-TXT-089
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    } 
    
# This is for fracture
    OUT MIR-DV-QSTN-RESP-TXT-090
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for uterine fibroid with surgery
    OUT MIR-DV-QSTN-RESP-TXT-091
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for uterine fibroid without surgery
    OUT MIR-DV-QSTN-RESP-TXT-092
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for caesarean
    OUT MIR-DV-QSTN-RESP-TXT-093
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for pregnancy
    OUT MIR-DV-QSTN-RESP-TXT-094
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for dermatitis
    OUT MIR-DV-QSTN-RESP-TXT-095
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   
# This is for gall stone
    OUT MIR-DV-QSTN-RESP-TXT-096
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for kidney stone
    OUT MIR-DV-QSTN-RESP-TXT-097
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for cataract
    OUT MIR-DV-QSTN-RESP-TXT-098
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for glaucoma
    OUT MIR-DV-QSTN-RESP-TXT-099
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for sinusitis
    OUT MIR-DV-QSTN-RESP-TXT-100
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for anal fistula
    OUT MIR-DV-QSTN-RESP-TXT-101
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is for gastritis
    OUT MIR-DV-QSTN-RESP-TXT-102
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is a Y/N field 
    OUT MIR-DV-QSTN-RESP-TXT-103
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

# This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-104
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

#MP176G CHANGES END HERE

#M242C2 CHANGES STARTS HERE
# This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-105
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#M242C2 CHANGES ENDS HERE

#M245B3 CHANGES STARTS HERE
# This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-106
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#M245B3 CHANGES ENDS HERE

#MP253F CHANGES STARTS HERE

# This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-107
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

# This is a Y/N field
    OUT MIR-DV-QSTN-RESP-TXT-108
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    
#MP253F CHANGES ENDS HERE

#M280Q1 CHANGES STARTS HERE

    OUT MIR-DV-QSTN-RESP-TXT-109
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    OUT MIR-DV-QSTN-RESP-TXT-110
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    OUT MIR-DV-QSTN-RESP-TXT-111
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    OUT MIR-DV-QSTN-RESP-TXT-112
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    OUT MIR-DV-QSTN-RESP-TXT-113
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    OUT MIR-DV-QSTN-RESP-TXT-114
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    OUT MIR-DV-QSTN-RESP-TXT-115
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    OUT MIR-DV-QSTN-RESP-TXT-116
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    OUT MIR-DV-QSTN-RESP-TXT-117
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    
    OUT MIR-DV-QSTN-RESP-TXT-118
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    } 
   
    OUT MIR-DV-QSTN-RESP-TXT-119
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

    OUT MIR-DV-QSTN-RESP-TXT-120
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    
    OUT MIR-DV-QSTN-RESP-TXT-121
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }    
    
#M280Q1 CHANGES ENDS HERE

#MP281Q CHANGES STARTS HERE

    OUT MIR-DV-QSTN-RESP-TXT-122
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }    

#MP281Q CHANGES ENDS HERE
#MP300A CHANGES STARTS HERE

    OUT MIR-DV-QSTN-RESP-TXT-123
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    OUT MIR-DV-QSTN-RESP-TXT-124
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    OUT MIR-DV-QSTN-RESP-TXT-125
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
#MP300A CHANGES ENDS HERE
#MP270G CHANGES STARTS HERE

    OUT MIR-DV-QSTN-RESP-TXT-126
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
#MP270G CHANGES ENDS HERE
#C17785 changes start here
    OUT MIR-CORCT-IND
    {
        Length = "1";
	DBTableName = "TAPPV";
	SType = "Indicator";
        Label = "Correction Indicator";
    }
    OUT MIR-1-DISEASE-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Disease Code";
    }
    OUT MIR-1-CRNT-STAT-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Disease Current Status";
    }
    OUT MIR-1-OUTP-STRT-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Outpatient Start Date";
    }
    OUT MIR-1-OUTP-END-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Outpatient End Date";
    }
    OUT MIR-1-OUTP-DY-DUR
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Number of outpatient days";
    }
    OUT MIR-1-TRTMNT-INFO-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment information";
    }
    OUT MIR-1-DRUG-STAT-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Drug status";
    }
    OUT MIR-1-DRUG-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Drug code";
    }
    OUT MIR-1-HOSP-STRT-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Hospitalization start Date";
    }
    OUT MIR-1-HOSP-DY-DUR
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Number of days hospitalized";
    }
    OUT MIR-1-SURGY-TYP-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery type code";
    }
    OUT MIR-1-SURGY-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery code";
    }
    OUT MIR-1-BODY-PART-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Body part code";
    }
    OUT MIR-1-SURGY-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery Date";
    }
    OUT MIR-1-LAST-EXAM-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Last Examination Date";
    }
    OUT MIR-1-HOSP-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Hospital code";
    }
    OUT MIR-1-FULL-RECOV-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Full recovery Date";
    }
    OUT MIR-1-TRTMNT-SPND-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment suspend date";
    }
    OUT MIR-1-COMNT-TXT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment Item";
    }
    OUT MIR-1-MAX-BLOOD-PRES-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Maximal blood pressure";
    }
    OUT MIR-1-MIN-BLOOD-PRES-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Minimal blood pressure";
    }
    OUT MIR-1-URIC-ACID-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Uric acid value";
    }
    OUT MIR-1-TOT-CHLSTRL-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Value of total cholesterol";
    }
    OUT MIR-1-NEUTRAL-FAT-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Neutral fat";
    }
    OUT MIR-1-LDL-RNG-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "LDL range";
    }
    OUT MIR-1-HDL-RNG-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "HDL range";
    }
    OUT MIR-2-DISEASE-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Disease Code";
    }
    OUT MIR-2-CRNT-STAT-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Disease Current Status";
    }
    OUT MIR-2-OUTP-STRT-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Outpatient Start Date";
    }
    OUT MIR-2-OUTP-END-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Outpatient End Date";
    }
    OUT MIR-2-OUTP-DY-DUR
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Number of outpatient days";
    }
    OUT MIR-2-TRTMNT-INFO-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment information";
    }
    OUT MIR-2-DRUG-STAT-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Drug status";
    }
    OUT MIR-2-DRUG-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Drug code";
    }
    OUT MIR-2-HOSP-STRT-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Hospitalization start Date";
    }
    OUT MIR-2-HOSP-DY-DUR
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Number of days hospitalized";
    }
    OUT MIR-2-SURGY-TYP-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery type code";
    }
    OUT MIR-2-SURGY-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery code";
    }
    OUT MIR-2-BODY-PART-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Body part code";
    }
    OUT MIR-2-SURGY-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Surgery Date";
    }
    OUT MIR-2-LAST-EXAM-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Last Examination Date";
    }
    OUT MIR-2-HOSP-CD
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Hospital code";
    }
    OUT MIR-2-FULL-RECOV-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Full recovery Date";
    }
    OUT MIR-2-TRTMNT-SPND-DT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment suspend date";
    }
    OUT MIR-2-COMNT-TXT
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Treatment Item";
    }
    OUT MIR-2-MAX-BLOOD-PRES-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Maximal blood pressure";
    }
    OUT MIR-2-MIN-BLOOD-PRES-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Minimal blood pressure";
    }
    OUT MIR-2-URIC-ACID-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Uric acid value";
    }
    OUT MIR-2-TOT-CHLSTRL-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Value of total cholesterol";
    }
    OUT MIR-2-NEUTRAL-FAT-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "Neutral fat";
    }
    OUT MIR-2-LDL-RNG-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "LDL range";
    }
    OUT MIR-2-HDL-RNG-NUM
    {
	Length = "10";
	DBTableName = "TAPPD";
	SType = "Text";
	Label = "HDL range";
    }
#C17785 changes end.

}
