# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1914-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02MI01a YUC      Add Kana Name   10SEP2002                                 *
#*                                                                             *
#*  MP310B  CTS      ADDED UW CLASS CODE TO THE USEC SECURITY RELATED SCREENS  *
#*  UYS100  CTS      ADDED POL ADMIN CLASS CODE TO THE USER SECURITY RELATED   *
#*                   SCREENS                                                   *
#*******************************************************************************

P-STEP BF1914-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1914";
        BusinessFunctionName = "User Security Record List";
        BusinessFunctionType = "List";
        MirName = "XCWM0100";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-USER-ID
    {
        Key;
        Length = "8";
        DBTableName = "TUSEC";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    OUT MIR-BR-ID-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Branch ID";
        Index = "1";
    }

    OUT MIR-DEPT-ID-T[10]
    {
        Length = "6";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "DEPT";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Department ID";
        Index = "1";
    }

    OUT MIR-PRTR-ID-T[10]
    {
        Length = "8";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "PRTID";
        DBTableName = "TUSEC";
        SType = "Selection";
        Label = "Printer ID";
        Index = "1";
    }

    OUT MIR-SECUR-CLAS-ID-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Security Class";
        Index = "1";
    }

    OUT MIR-USER-ID-T[10]
    {
        Length = "8";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "User ID";
        Index = "1";
    }

    OUT MIR-USER-LANG-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "LANG";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

    OUT MIR-USER-PSWD-TXT-T[10]
    {
        Length = "8";
        FieldGroup = "Table10";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Password";
        Index = "1";
    }

    OUT MIR-USER-PSWD-XPRY-DUR-T[10]
    {
        Length = "4";
        FieldGroup = "Table10";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Password Expiry";
        Index = "1";
    }

# 02MI01a YUC    10SEP2002  Add 20 lines to add Kana Name
    OUT MIR-KA-SUR-NM-T[10]
    {
        Length = "25";
        FieldGroup = "Table10";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Kana Last Name";
        Index = "1";
    }

    OUT MIR-KA-GIV-NM-T[10]
    {
        Length = "25";
        FieldGroup = "Table10";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Kana First Name";
        Index = "1";
    }
# MP310B CHANGES STARTS
    OUT MIR-UW-CLAS-CD-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";        
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "UW CLASS CODE";
        Index = "1";        
    }
# MP310B CHANGES ENDS 
# UYS100 CHANGES STARTS
    OUT MIR-POL-ADMIN-CLAS-CD-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "POLICY ADMINISTRATION CLASS CODE";
        Index = "1";        
    }
# UYS100 CHANGES ENDS 
}

