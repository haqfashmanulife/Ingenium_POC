
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSDU9688.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSDU9688                                         **
      **  REMARKS:  RETRIEVE CURRENCY SYMBOL FROM TTEXT TABLE        **
      **            AND ALSO UPDATE THE CURRENCY MULITIPLY FACTOR    **
      **            TO BE USED FOR AMOUNT FORMATTING                 **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      *
      * INPUT PARAMETERS :
      *  L9688-CRCY-CD         HOLDS POLICY CURRENCY CODE.
      *                        THIS FIELD IS USED TO RETREIVE CURRENCY
      *                        SYMBOL FROM TTEXT
      *  L9688-DCML-IND        WHETHER THE FIELD IS TO DISPLAY THE
      *                        DECIMALS PART OF THE AMOUNT.
      *                        THIS FIELD IS USED TO UPDATE THE INPUT
      *                        AMOUNTS TO BE FORMATTED
      
      * OUTPUT FIELDS:
      *  L0290-CRCY-SYMBL      CONTAINS THE CHARACTER USED FOR CURRENCY.
      *  L0290-PRECISION       NUMBER OF DIGITS AFTER THE DECIMAL POINT.
      *  L9688-CRCY-MULT-FCT   CONTAINS MULTIPLY FACTOR BASED ON
      *                        CURRENCY
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  21MAY14  CTS    CREATED TO RETRIEVE MULTI CURRENCY AND     **
      **  21MAY14  CTS    TO UPDATE THE INPUTS FOR AMOUNT FORMATTING **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU9688'.

       COPY XCWL2490.
      /
      *****************
       LINKAGE SECTION.
      *****************
       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL9688.
      /
       COPY XCWL0290.

       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L9688-PARM-INFO
                                L0290-PARM-INFO.

      *--------------
       0000-MAINLINE.
      *--------------

           INITIALIZE L9688-OUTPUT-PARM-INFO.
           SET L9688-RETRN-OK               TO TRUE.

           EVALUATE TRUE

               WHEN L9688-RQST-CRCY
                    PERFORM  1000-SET-CRCY-INFO
                        THRU 1000-SET-CRCY-INFO-X

               WHEN OTHER
                    SET L9688-RETRN-INVALID-REQUEST 
                                            TO TRUE

           END-EVALUATE.

       0000-MAINLINE-X.
           GOBACK.

      /
      *--------------------
       1000-SET-CRCY-INFO.
      *--------------------

           MOVE 'XSRU9682'                  TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD.

           IF  L9688-CRCY-CD = 'JP'
               IF  L0290-CRCY-RIGHT
                   MOVE '09001'             TO L2490-TXT-SRC-REF-ID
                   PERFORM  2490-1000-RETRIEVE-TEXT
                       THRU 2490-1000-RETRIEVE-TEXT-X
                   MOVE L2490-TXT-STR-TXT   TO L0290-CRCY-SYMBL
               ELSE
                   MOVE WGLOB-CRCY-SYMBL    TO L0290-CRCY-SYMBL
               END-IF
           END-IF.

           IF  L9688-CRCY-CD = 'US'
               MOVE '09004'                 TO L2490-TXT-SRC-REF-ID
               PERFORM  2490-1000-RETRIEVE-TEXT
                   THRU 2490-1000-RETRIEVE-TEXT-X
               MOVE L2490-TXT-STR-TXT       TO L0290-CRCY-SYMBL
               IF  L0290-DCML-DISPLAY
                   SET L0290-CRCY-MULT-FCT-2-DCML
                                            TO TRUE
                   MOVE +2                  TO L0290-PRECISION
               END-IF
           END-IF.

           IF  L9688-CRCY-CD = 'AU'
               MOVE '09005'                 TO L2490-TXT-SRC-REF-ID
               PERFORM  2490-1000-RETRIEVE-TEXT
                   THRU 2490-1000-RETRIEVE-TEXT-X
               MOVE L2490-TXT-STR-TXT       TO L0290-CRCY-SYMBL
               IF  L0290-DCML-DISPLAY
                   SET L0290-CRCY-MULT-FCT-2-DCML
                                            TO TRUE
                   MOVE +2                  TO L0290-PRECISION
               END-IF
           END-IF.

       1000-SET-CRCY-INFO-X.
           EXIT.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
      /
       COPY XCPL2490.
       COPY XCPS2490.
      *****************************************************************
      **                 END OF PROGRAM XSDU9688                     **
      *****************************************************************