# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9A20-P.p                                                    *
#*  Description: For Updating a Underwrite's Final Decision                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  WF2004           Initial Revision                                          *
#*  AHS150           CHANGES FOR 'MORE' FUNCTIONALITY                          *
#*  BU3679  CTS      FIX FOR PF/CS ERROR LOGS                                  *
#*******************************************************************************

P-STEP BF9A24-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A24";
        BusinessFunctionName = "UW Final Decision List";
        BusinessFunctionType = "List";
        MirName = "CCWM9A20";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-COUNT-INIT
    {

#     Fix for BU3679 start
#     Length = "1";
      Length = "2";
#     Fix for BU3679 end
      SType = "Number";
      Label = "Action";
    }


    INOUT MIR-USER-ID
    {

      Length = "10";
      DBTableName = "TUWFD";
      DefaultSession = "MIR-USER-ID";
      SType = "Text";
      Label = "User ID";
    }

    INOUT MIR-POL-ID
    {

       Length = "10";
       DBTableName = "TUWFD";
       DefaultSession = "MIR-POL-ID-BASE";
       SType = "Text";
       Label = "Policy ID";
    }

    INOUT MIR-CLI-ID
    {

       Length = "10";
       DBTableName = "TUWFD";
       DefaultSession = "MIR-CLI-ID";
       SType = "Text";
       Label = "Client Id";
    }

    INOUT MIR-SEQ-NUM
    {

      Length = "10";
      DBTableName = "TUWFD";
      SType = "Text";
      Label = "Sequence Number";
    }

    INOUT MIR-APP-TYP-CD
    {

      Length = "10";
      DBTableName = "TUWFD";
      SType = "Text";
      Label = "Application Type";
    }

    INOUT MIR-USER-ID-T [15]
    {

      Length = "08";
      DBTableName = "TUWFD";
      DefaultSession = "MIR-USER-ID";
      SType = "Text";
      Label = "User ID";
    }
    INOUT MIR-POL-ID-T [15]
    {

      Length = "10";
      DBTableName = "TUWFD";
      DefaultSession = "MIR-POL-ID";
      SType = "Text";
      Label = "Policy ID";
    }

    INOUT MIR-CLI-ID-T [15]
    {

      Length = "10";
      DBTableName = "TUWFD";
      DefaultSession = "MIR-CLI-ID";
      SType = "Text";
      Label = "Client Id";
    }

    INOUT MIR-SEQ-NUM-T [15]
    {

      Length = "10";
      DBTableName = "TUWFD";
      SType = "Text";
      Label = "Sequence Number";
    }

    INOUT MIR-APP-TYP-CD-T [15]
    {

      Length = "10";
      DBTableName = "TUWFD";
      SType = "Text";
      Label = "Application Type";
    }


 }


