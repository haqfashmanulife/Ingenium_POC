# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:52 PM EDT

#*******************************************************************************
#*  Component:   BF1910-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02MI01a YUC      Add Name, Employee Code and PIT ID   10SEP2002            *
#*                                                                             *
#*  MP310B  CTS      ADDED UW CLASS CODE TO THE USEC SECURITY RELATED SCREENS  *
#*  UYS100  CTS      ADDED POL ADMIN CLASS CODE TO THE USER SECURITY RELATED   *
#*                   SCREENS                                                   *
#*******************************************************************************

S-STEP BF1910-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    IN MIR-USER-ID
    {
        Key;
        DisplayOnly;
        Length = "8";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    IN MIR-BR-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch ID";
    }

    IN MIR-DEPT-ID
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "XTAB";
        CodeType = "DEPT";
        SType = "Text";
        Label = "Department ID";
    }

    IN MIR-PRTR-ID
    {
        DisplayOnly;
        Length = "8";
        CodeSource = "XTAB";
        CodeType = "PRTID";
        SType = "Text";
        Label = "Printer ID";
    }

    IN MIR-SECUR-CLAS-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Security Class";
    }

    IN MIR-USER-LANG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
    }

    IN MIR-USER-PSWD-TXT
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Password";
    }

    IN MIR-USER-PSWD-XPRY-DUR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Password Expiry";
    }

    IN MIR-USER-RPT-DSTRB-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "DIST";
        SType = "Text";
        Label = "Distribution Code";
    }

# 02MI01a YUC    10SEP2002  Add 48 lines to add Name, Employee Code and PIT ID
    IN MIR-KJ-SUR-NM
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Kanji Last Name";
    }

    IN MIR-KJ-GIV-NM
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Kanji First Name";
    }

    IN MIR-KA-SUR-NM
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Kana Last Name";
    }

    IN MIR-KA-GIV-NM
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Kana First Name";
    }

    IN MIR-MLJ-EMPLE-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "MLJ Employee Code";
    }

    IN MIR-PIT-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "PIT ID";
    }
# MP310B CHANGES STARTS
    IN MIR-UW-CLAS-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "UWCCD";
        SType = "Text";
        Label = "UW CLASS CODE";
    }
# MP310B CHANGES ENDS  
# UYS100 CHANGES STARTS
    IN MIR-POL-ADMIN-CLAS-CD
    {
        DisplayOnly;    
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "PADCL";
        SType = "Text";
        Label = "POLICY ADMINISTRATION CLASS CODE";
    }
# UYS100 CHANGES ENDS  
}

