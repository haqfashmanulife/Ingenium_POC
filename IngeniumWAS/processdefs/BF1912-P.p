# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1912-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02MI01a YUC      Add Name, Employee Code and PIT ID   10SEP2002            *
#*  P02188  RZ       Add UNLOCK LOCKEDID INDICATOR        30MAR2005            *
#*  MP310B  CTS      ADDED UW CLASS CODE TO THE USEC SECURITY RELATED SCREENS  *
#*  UYS100  CTS      ADDED POL ADMIN CLASS CODE TO THE USER SECURITY RELATED   *
#*                   SCREENS                                                   *
#*******************************************************************************

P-STEP BF1912-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1912";
        BusinessFunctionName = "User Security Record Update";
        BusinessFunctionType = "Update";
        MirName = "XCWM0100";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TUSEC";
        SType = "Selection";
        Label = "Branch ID";
    }

    INOUT MIR-DEPT-ID
    {
        Length = "6";
        CodeSource = "XTAB";
        CodeType = "DEPT";
        DBTableName = "TUSEC";
        SType = "Selection";
        Label = "Department ID";
    }

    INOUT MIR-PRTR-ID
    {
        Mandatory;
        Length = "8";
        CodeSource = "XTAB";
        CodeType = "PRTID";
        DBTableName = "TUSEC";
        SType = "Selection";
        Label = "Printer ID";
    }

    INOUT MIR-SECUR-CLAS-ID
    {
        Mandatory;
        Length = "10";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Security Class";
    }

    INOUT MIR-USER-LANG-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "LANG";
        DBTableName = "TUSEC";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-USER-PSWD-TXT
    {
        Mandatory;
        Length = "8";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Password";
    }

    INOUT MIR-USER-PSWD-XPRY-DUR
    {
        Mandatory;
        Length = "4";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Password Expiry";
    }

    INOUT MIR-UNLOCK-LOCKEDID-IND
    {
        Length = "1";
        DBTableName = "TUSEC";
        SType = "CheckBox";
        Label = "Unlock User ID Indicator";
    }

    INOUT MIR-USER-RPT-DSTRB-CD
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "DIST";
        DBTableName = "TUSEC";
        SType = "Selection";
        Label = "Distribution Code";
    }

    IN MIR-USER-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TUSEC";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

# 02MI01a YUC    10SEP2002  Add 48 lines to add Name, Employee Code and PIT ID
    INOUT MIR-KJ-SUR-NM
    {
        Length = "25";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Kanji Last Name";
    }

    INOUT MIR-KJ-GIV-NM
    {
        Length = "25";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Kanji First Name";
    }

    INOUT MIR-KA-SUR-NM
    {
        Length = "25";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Kana Last Name";
    }

    INOUT MIR-KA-GIV-NM
    {
        Length = "25";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Kana First Name";
    }

    INOUT MIR-MLJ-EMPLE-ID
    {
        Length = "6";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "MLJ Employee Code";
    }

    INOUT MIR-PIT-ID
    {
        Length = "10";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "PIT ID";
    }
# MP310B CHANGES STARTS
    INOUT MIR-UW-CLAS-CD
    {
        Length = "1";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "UW CLASS CODE";
    }
# MP310B CHANGES ENDS  
# UYS100 CHNAGES STARTS HERE
    INOUT MIR-POL-ADMIN-CLAS-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "PADCL";
        DBTableName = "TUSEC";
        SType = "Selection";
        Label = "POLICY ADMINISTRATION CLASS CODE";
    }
# UYS100 CHNAGES ENDS HERE
}

