# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:57 PM EDT

#*******************************************************************************
#*  Component:   BF9074-P.p                                                    *
#*  Description: LINC Request Transaction List                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB05B EKM      CREATION OF STEP                                          *
#*******************************************************************************
 
P-STEP BF9074-P
{
 
   ATTRIBUTES
   {
       BusinessFunctionId = "9074";
       BusinessFunctionName = "LINC Request Transaction List";
       BusinessFunctionType = "List";
       MirName = "NCWM9074";
   }
   
   OUT LSIR-RETURN-CD;
      
   OUT MIR-RETRN-CD;

   INOUT MIR-POL-ID-BASE 
   {
       Key;
       Length = "09";
       DBTableName = "TLTRN";
       SType = "Text";
       Label = "Policy ID";
   }

   INOUT MIR-POL-ID-SFX
   {
       Key;
       Length = "1";
       DBTableName = "TLTRN";
       SType = "Text";
       Label = "Suffix";
   }
    
    INOUT MIR-CLI-ID
    {
       Key;
       Length = "10";
       DBTableName = "TLTRN";
       SType = "Text";
       Label = "Client ID";
    }

   OUT MIR-POL-ID-T[12]
   {
       Length = "10";
       FieldGroup = "Table12";
       Index = "1";
       DBTableName = "TLTRN";
       SType = "Text";
       Label = "Policy Number";
   }

   OUT MIR-CLI-ID-T[12]
   {
       Length = "10";
       FieldGroup = "Table12";
       Index = "1";
       DBTableName = "TLTRN";
       SType = "Text";
       Label = "Client Number";
   }

   OUT MIR-DV-CLI-NM-T[12]
   {
       Length = "75";
       FieldGroup = "Table12";
       Index = "1";
       DBTableName = "Derived";
       SType = "Text";
       Label = "Client Name";
   }

   OUT MIR-LTRN-REC-TYP-CD-T[12]
   {
       Length = "40";
       CodeSource = "EDIT";
       CodeType = "LINCT";
       DBTableName = "TLTRN";
       SType = "Text";
       Label = "LINC Record Type";
   }

   OUT MIR-PREV-UPDT-USER-ID-T[12]
   {
       Length = "12";
       FieldGroup = "Table12";
       Index = "1";
       DBTableName = "TLTRN";
       SType = "Text";
       Label = "Registration Number";
   }

   OUT MIR-PREV-UPDT-DT-T[12]
   {
       Length = "10";
       FieldGroup = "Table12";
       Index = "1";
       DBTableName = "TLTRN";
       SType = "Text";
       Label = "Registration Date";
   }
}
