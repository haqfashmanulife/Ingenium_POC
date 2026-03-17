      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSDU0270.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSDU0270                                         **
      **  REMARKS:  NUMERIC TOKEN REPLACEMENT PROGRAM.               **
      **            THIS PROGRAM RECEIVES AS INPUT A STRING OF DATA  **
      **            AND AN ARRAY OF TOKEN VALUES. THE STRING IS      **
      **            SEARCHED FOR A TOKEN AND THE RESPECTIVE TOKEN    **
      **            VALUE IS INSERTED INTO THE STRING.  IF THE       **
      **            RESULTING OUTPUT LENGTH EXCEEDS THE AVAILABLE    **
      **            AREA, PUT A WARNING CHARACTER (+) IN THE LAST    **
      **            POSITION.                                        **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      *                                                              **
      *   INPUT FIELDS:                                              **
      *       L0270-MSG-OUT-LEN   LENGTH OF THE OUTPUT MESSAGE       **
      *       L0270-MSG-IN        ORIGINAL MESSAGE CONTAINING TOKENS **
      *       L0270-MSG-PARM-INFO 4 TOKEN VALUES                     **
      *                                                              **
      *   OUTPUT FIELDS:                                             **
      *       L0270-MSG-OUT       MESSAGE WITH TOKENS REPLACED       **
      *                                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-066**  30NOV95  REC    ORIGINAL VERSION                           **
54-001**  01SEP96  ALW    MODIFICATIONS FOR MAINTAINABILITY          **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       CONFIGURATION SECTION.
      /
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS  REPLACING =='$VAR1'== BY =='XSDU0270'==.
 
       01  WS-CONSTANTS.
54-001     05  WS-MSG-OUT-MAX             PIC S9(04) COMP VALUE +132.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       COPY XCWL0270.
      /
       PROCEDURE DIVISION USING L0270-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
54-001     IF  L0270-RQST-CD-VALID
54-001         SET L0270-RETRN-OK TO TRUE
54-001     ELSE
54-001         SET L0270-RETRN-INVALID-REQUEST TO TRUE
54-001     END-IF.
 
           PERFORM  1000-TOKEN-REPLACEMENT
               THRU 1000-TOKEN-REPLACEMENT-X.
 
       0000-MAINLINE-X.
           GOBACK.
 
      /
      *-----------------------
       1000-TOKEN-REPLACEMENT.
      *-----------------------
 
      *
      *  VERIFY OUT LENGTH IS REASONABLE, IF NOT SET TO MAXIMUM LENGTH
      *
           IF  L0270-MSG-OUT-LEN  <  +1
           OR  L0270-MSG-OUT-LEN  >  WS-MSG-OUT-MAX
               MOVE  WS-MSG-OUT-MAX  TO  L0270-MSG-OUT-LEN
           END-IF.
      *
      *  MOVE THE MESSAGE CHARACTER BY CHARACTER FROM THE INPUT AREA
      *  TO THE OUTPUT AREA; EACH CHARACTER IS COMPARED TO THE
      *  PARAMETER INSERTION SYMBOL AND IF EQUAL, THE
      *  APPROPRIATE PARAMETER FROM THE PARAMETER AREA IS INSERTED.
      *
           INITIALIZE  L0270-MSG-OUT.
           INITIALIZE  L0270-MSG-OUT-I.
 
           PERFORM  1100-MOVE-MESSAGE-CHAR
               THRU 1100-MOVE-MESSAGE-CHAR-X
               UNTIL L0270-MSG-IN     =  SPACES
               OR    L0270-MSG-OUT-I  =  L0270-MSG-OUT-LEN.
      *
      *  WHEN THE OUTPUT LINE IS FULL, BUT THERE IS STILL SOME DATA
      *  LEFT IN THE INPUT LINE OR PARAMETER LINE, PLACE A MORE (+)
      *  INDICATOR IN THE LAST POSITION OF THE OUTPUT LINE
      *
 
           IF  L0270-MSG-OUT-I   =  L0270-MSG-OUT-LEN
 
               IF  L0270-MSG-IN  NOT =  SPACES
               OR  L0270-PARM    NOT =  SPACES
                   MOVE  '+'  TO L0270-MSG-OUT-CHAR (L0270-MSG-OUT-I)
               END-IF
 
           END-IF.
 
           INITIALIZE  L0270-MSG-IN.
           INITIALIZE  L0270-MSG-PARM-INFO.
           INITIALIZE  L0270-MSG-OUT-LEN.
 
       1000-TOKEN-REPLACEMENT-X.
           EXIT.
      /
      *-----------------------
       1100-MOVE-MESSAGE-CHAR.
      *-----------------------
      *
      *  IF THE MESSAGE BYTE IS A PARAMETER CHARACTER, THEN INSERT
      *  PARAMETER VALUE ELSE MOVE THE BYTE TO THE OUTPUT AREA, THEN
      *  GET THE NEXT CHARACTER TO PROCESS
      *
54-001     IF  L0270-MSG-IN-CHAR-PARAMETER
 
               PERFORM  1110-GET-PARM-VALUE
                   THRU 1110-GET-PARM-VALUE-X
 
               PERFORM  1120-MOVE-PARM-CHAR
                   THRU 1120-MOVE-PARM-CHAR-X
                   UNTIL  L0270-PARM       =  SPACES
                   OR     L0270-MSG-OUT-I  =  L0270-MSG-OUT-LEN
           ELSE
               ADD   +1  TO  L0270-MSG-OUT-I
               MOVE  L0270-MSG-IN-CHAR
                 TO  L0270-MSG-OUT-CHAR (L0270-MSG-OUT-I)
           END-IF.
 
      *
      *  SHIFT THE INPUT MESSAGE 1 BYTE (IE. CHARACTERS 2-76 ARE SHIFTED 1
      *  POSITION TO THE LEFT SO THAT POSITION 1 OF THE INPUT STRING
      *  WILL ALWAYS CONTAIN THE NEXT CHARACTER TO BE PROCESSED)
      *
           MOVE  L0270-MSG-IN-REST  TO  L0270-MSG-IN.
 
       1100-MOVE-MESSAGE-CHAR-X.
           EXIT.
      /
      *--------------------
       1110-GET-PARM-VALUE.
      *--------------------
      *
      *  WHEN THE NEXT CHARACTER IS IN THE RANGE 1-4, WE HAVE FOUND
      *  A TOKEN TO REPLACE
      *
 
           IF  L0270-MSG-IN (2:1)  >=  '1'
           AND L0270-MSG-IN (2:1)  <=  '4'
               MOVE  L0270-MSG-IN-REST              TO  L0270-MSG-IN
               MOVE  L0270-MSG-IN-CHAR              TO  L0270-PARM-I
               MOVE  L0270-MSG-PARM (L0270-PARM-I)  TO  L0270-PARM
               GO TO  1110-GET-PARM-VALUE-X
           END-IF.
 
      *
      *  TOKEN WAS NOT FOUND, SO MOVE THE '@' TO THE OUTPUT LINE
      *
           MOVE  SPACES  TO  L0270-PARM.
           ADD   +1      TO  L0270-MSG-OUT-I.
           MOVE  L0270-MSG-IN-CHAR
                         TO  L0270-MSG-OUT-CHAR (L0270-MSG-OUT-I).
 
       1110-GET-PARM-VALUE-X.
           EXIT.
 
      *--------------------
       1120-MOVE-PARM-CHAR.
      *--------------------
 
           ADD   +1               TO  L0270-MSG-OUT-I.
           MOVE  L0270-PARM-CHAR  TO
                 L0270-MSG-OUT-CHAR (L0270-MSG-OUT-I).
           MOVE  L0270-PARM-REST  TO  L0270-PARM.
 
       1120-MOVE-PARM-CHAR-X.
           EXIT.
 
      *****************************************************************
      **                 END OF PROGRAM XSDU0270                     **
      *****************************************************************
