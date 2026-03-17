      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSRU9687.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER  : XSRU9687                                         **
      **  REMARKS : AMOUNT FORMAT ROUTINE:                           **
      **              ADDS YEN CHARACTER AND POSSIBLY MAN CHARACTER  **
      **              AFTER THE INPUT AMOUNT                         **
      **                                                             **
      **        EXAMPLE OF FORMATTED AMOUNT WITH YEN:                **
      **                                                             **
      **              123,400YEN                                     **
      **                                                             **
      **        EXAMPLE OF FORMATTED AMOUNT WITH MAN AND YEN:        **
      **                                                             **
      **              500MIL.YEN                                     **
      **                                                             **
      **       OBTAIN AMOUNT (PIC 9(15) FORMAT) AND LANG-CD FROM     **
      **       BATCH PROGRAMS.  THIS MODULE WILL RETURN THE AMOUNT   **
      **       WITH A YEN CHARACTER AND POSSIBLY A MAN CHARACTER     **
      **       AFTER THE AMOUNT.                                     **
      **                                                             **
      **       XSRU9682 IS ALSO AMOUNT FORMAT ROUTINE.BUT IT COULD   **
      **       NOT HANDLE LARGE AMOUNTS.CLONE OF 9682(9687) IS       ** 
      **       WRITTEN TO FORMAT LARGE AMOUNTS.                      ** 
      **                                                             **
      **       FOR BUSINESS IN JAPAN.                                **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTHOR  DESCRIPTION                               **
ABF075** 02FEB07    CTS    INITIAL VERSION                           **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU9687'.
 
       01  WS-WORK-AREA.
           05  WS-YEN-CHARACTER                  PIC X(02).
           05  WS-MAN-CHARACTER                  PIC X(02).
           05  WS-MAN-AMOUNT                     PIC 9(15).
           05  WS-REMAINDER                      PIC 9(15).
           05  WS-AMOUNT-PICZ13                  PIC Z,ZZZ,ZZZ,ZZ9.
           05  WS-AMOUNT-PICZ11                  PIC ZZZ,ZZZ,ZZ9.
 
      /
       COPY XCWLDTLK.
      /
       COPY XCWWWKDT.
      /
       COPY CCWWINDX.
      /
       COPY XCWL2490.
      /
      *****************
       LINKAGE SECTION.
      *****************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
 
       COPY XCWL9687.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L9687-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  1000-FORMAT-AMOUNT
               THRU 1000-FORMAT-AMOUNT-X.
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
      /

      *-------------------
       1000-FORMAT-AMOUNT.
      *-------------------

           PERFORM  2490-1000-BUILD-PARM-INFO
               THRU 2490-1000-BUILD-PARM-INFO-X.

           MOVE 'XSRU9687'                  TO L2490-TXT-SRC-ID.
           MOVE L9687-LANG-CD               TO L2490-TXT-LANG-CD.

      **  GET YEN CHARACTER FROM TEXT TABLE.
           MOVE '90001'                     TO L2490-TXT-SRC-REF-ID.
           PERFORM 2490-1000-RETRIEVE-TEXT
              THRU 2490-1000-RETRIEVE-TEXT-X.
           MOVE L2490-TXT-STR-TXT           TO WS-YEN-CHARACTER.

      **  GET MAN CHARACTER FROM TEXT TABLE.
           MOVE '90002'                     TO L2490-TXT-SRC-REF-ID.
           PERFORM 2490-1000-RETRIEVE-TEXT
              THRU 2490-1000-RETRIEVE-TEXT-X.
           MOVE L2490-TXT-STR-TXT           TO WS-MAN-CHARACTER.

           DIVIDE 10000 INTO L9687-INPUT-AMT   
               GIVING WS-MAN-AMOUNT  REMAINDER WS-REMAINDER.

      **  IF YEN FMT IS REQUESTED, OUTPUT YEN FORMAT. 
      **  IF MAN YEN FMT IS REQUESTED, BUT INPUT AMT IS ZERO OR INPUT AMT 
      **  IS NOT EVENLY DIVISIBLE BY 10,000, OUTPUT YEN FORMAT. 

           IF  L9687-RQST-YEN-FMT
           OR  L9687-INPUT-AMT = ZERO
           OR  WS-REMAINDER NOT = ZERO
               MOVE L9687-INPUT-AMT         TO WS-AMOUNT-PICZ13 
               MOVE WS-AMOUNT-PICZ13        TO L9687-OUTPUT-FMT1-AMT
               MOVE WS-YEN-CHARACTER        TO L9687-OUTPUT-FMT1-YEN
           ELSE 
               MOVE WS-MAN-AMOUNT           TO WS-AMOUNT-PICZ11 
               MOVE WS-AMOUNT-PICZ11        TO L9687-OUTPUT-FMT2-AMT
               STRING WS-MAN-CHARACTER, WS-YEN-CHARACTER 
                   DELIMITED BY ' '  INTO L9687-OUTPUT-FMT2-MAN-YEN
           END-IF.
 
       1000-FORMAT-AMOUNT-X.
           EXIT.

      /
      *****************************************************************
      *   LINKAGE PROCESSING COPYBOOKS                                *
      *****************************************************************
      /
       COPY XCPS2490.
       COPY XCPL2490.
      /
      *****************************************************************
      **                 END OF PROGRAM XSRU9687                     **
      *****************************************************************
