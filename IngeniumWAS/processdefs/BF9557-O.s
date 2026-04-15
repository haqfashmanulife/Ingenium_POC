# Converted from PathFinder 2.2 to 3.0 May 28, 2004 3:12:38 PM EDT

#*******************************************************************************
#*  Component:   BF9557-O.s                                                    *
#*  Description: Issue Reversal                                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Author Description                                        *
#*                                                                             *
#*  FEID11  28MAY08  CTS  CHANGES FOR ISSUE REVERSAL SYSTEM                    *
#*                                                                             *
#*******************************************************************************

S-STEP BF9557-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Reversal";
        Type = "Input";
        DelEmptyRows;
        FocusField = "confirmButton";
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

       IN MIR-POL-ISS-DT-TYP-CD
       {
           DisplayOnly;
           Length = "1";
           CodeSource = "DataModel";
           CodeType = "POL-ISS-DT-TYP-CD";
           SType = "Text";
           Label = "Policy Issue Date Type";
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
       INOUT MIR-CVG-NUM
       {
           Length = "2";
           DBTableName = "TCVG";
           SType = "Text";
           Label = "Coverage Number";
       }

       IN MIR-CLI-SUR-NM-T[20]
       {
           DisplayOnly;
           Length = "25";
           FieldGroup = "Table20";
           SType = "Text";
           Label = "Last Name";
           Index = "1";
       }

       IN MIR-CLI-UWGDECN-CD-T[20]
       {
           DisplayOnly;
           Length = "2";
           FieldGroup = "Table20";
           CodeSource = "DataModel";
           CodeType = "CLI-UWGDECN-CD";
           SType = "Text";
           Label = "Underwriting Decision";
           Index = "1";
       }

       IN MIR-CLI-UWGDECN-TYP-CD-T[20]
       {
           DisplayOnly;
           Length = "2";
           FieldGroup = "Table20";
           CodeSource = "EDIT";
           CodeType = "CLDEC";
           SType = "Text";
           Label = "Decision Type";
           Index = "1";
       }

       IN MIR-CVG-CSTAT-CD-T[20]
       {
           DisplayOnly;
           Length = "40";
           FieldGroup = "Table20";
           CodeSource = "DataModel";
           CodeType = "CVG-CSTAT-CD";
           SType = "Text";
           Label = "Coverage Status";
           Index = "1";
       }

       IN MIR-CVG-NUM-T[20]
       {
           DisplayOnly;
           Length = "2";
           FieldGroup = "Table20";
           SType = "Text";
           Label = "Coverage Number";
           Index = "1";
       }

       IN MIR-CVG-UWGDECN-CD-T[20]
       {
           DisplayOnly;
           Length = "40";
           FieldGroup = "Table20";
           CodeSource = "DataModel";
           CodeType = "CVG-UWGDECN-CD";
           SType = "Text";
           Label = "Coverage Decision";
           Index = "1";
       }

       IN MIR-CVG-UWGDECN-SUB-CD-T[20]
       {
           DisplayOnly;
           Length = "2";
           FieldGroup = "Table20";
           CodeSource = "EDIT";
           CodeType = "CODEC";
           SType = "Text";
           Label = "Reason";
           Index = "1";
       }

       IN MIR-DV-OWN-CLI-NM
       {
           DisplayOnly;
           Length = "75";
           SType = "Text";
           Label = "Owner Name";
       }

       IN MIR-INSRD-CLI-ID-T[20]
       {
           DisplayOnly;
           Length = "10";
           FieldGroup = "Table20";
           KeyColumn;
           SType = "Text";
           Label = "Client Number of Lives Insured";
           Index = "1";
       }

       IN MIR-POL-CSTAT-CD
       {
           DisplayOnly;
           Length = "40";
           CodeSource = "DataModel";
           CodeType = "POL-CSTAT-CD";
           SType = "Text";
           Label = "Policy Status";
       }

       IN MIR-SBSDRY-CO-ID
       {
           DisplayOnly;
           Length = "40";
           CodeSource = "EDIT";
           CodeType = "SUBCO";
           SType = "Text";
           Label = "Subsidiary Company ID";
       }

   }

