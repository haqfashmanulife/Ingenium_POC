#*******************************************************************************
#*  Component:   BF9002-P.p                                                    *
#*  Description: Claims Additional Questions                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   Initial Version                                              *
#*                                                                             *
#*  AFU015  CTS    Change to increase the length of question description to 200*
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*******************************************************************************

P-STEP BF9002-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9002";
        BusinessFunctionName = "Claims Additional Questions";
        BusinessFunctionType = "Update";
        MirName = "CCWM9002";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }

    INOUT MIR-CLM-ID
    {
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Claim ID";
    }
    INOUT MIR-DV-INS-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    INOUT MIR-CLMA-CLM-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim Status";
    }
    INOUT MIR-CLMA-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Insured Client ID";
    }
    INOUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Date of Birth";
    }
    INOUT MIR-CLI-DTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Date of Death";
    }
    INOUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    INOUT MIR-INS-MORAL-RISK-IND   
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Insured Moral Risk";
    }
    INOUT MIR-CLAIM-NOTE-IND     
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Claim Note";
    }
    INOUT MIR-PREV-AUTO-ADJC-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Last Auto Adjudication Date";
    }
    INOUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Previous Update Date";
    }
    INOUT MIR-PREV-UPDT-USER-ID
    {
        Length = "12";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Previous Update User ID";
    }

    INOUT MIR-CLMA-HIST-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Historical Claim";
    }
    #UYSDMC CHANGES STARTS HERE
    INOUT MIR-CLMA-USYS-CLM-IND
    {    
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Unisys Claim";
    }
    #UYSDMC CHANGES ENDS HERE
    INOUT MIR-HID-MORE-QSTN-ID
    {
        Length = "09";
        DBTableName = "TCQDR";
        FieldGroup = "Table1";
        SType = "Hidden";
        Label = "";
    }

    INOUT MIR-HID-MORE-LVL-NUM
    {
        Length = "03";
        FieldGroup = "Table 1";
        SType = "Hidden";
        Label = "";
    }
                   
    INOUT MIR-HID-FLOW-CHK-IND
    {
        Length = "01";
        FieldGroup = "Table 1";
        SType = "Hidden";
        Label = "";
    }
                   
    INOUT MIR-QSTN-DESC-TXT-T[50]
    {
#AFU015 CHANGES START
#       Length = "100";
        Length = "200";
#AFU015 CHANGES END
        DBTableName = "TCQDS";
        FieldGroup = "Table1";
        Index = "1";
        SType="Text";
        Label = "";
    }
    
    INOUT MIR-ANSWR-CD-T[50]
    {
        Length = "01";
        DBTableName = "TCQAN";
        FieldGroup = "Table1";
        Index = "1";
        SType = "YesNoUnanswered";
    }        

    INOUT MIR-HID-QSTN-ID-T[50]
    {
        Length = "09";
        DBTableName = "TCQDR";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Hidden";
        Label = "";
    }

    INOUT MIR-HID-LVL-NUM-T[50]
    {
        Length = "03";
        FieldGroup = "Table 1";
        Index = "1";
        SType = "Hidden";
        Label = "";
    }
    
    INOUT MIR-HID-TRIGGR-CD-T[50]
    {
        Length = "01";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Hidden";
        Label = "";
    }
    
    INOUT MIR-HID-PARNT-QSTN-ID-T[50]
    {
        Length = "09";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Hidden";
        Label = "";
    }    
    
}
