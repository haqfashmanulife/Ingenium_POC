      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSLU9682.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER  : XSRU9682                                         **
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
      **       OBTAIN AMOUNT (PIC 9(12) FORMAT) AND LANG-CD FROM     **
      **       BATCH PROGRAMS.  THIS MODULE WILL RETURN THE AMOUNT   **
      **       WITH A YEN CHARACTER AND POSSIBLY A MAN CHARACTER     **
      **       AFTER THE AMOUNT.                                     **
      **                                                             **
      **       FOR BUSINESS IN JAPAN.                                **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTHOR  DESCRIPTION                               **
15997B**  28SEP18  CTS    CHANGES FOR FRA PREMIUM REDUCTION          **
15997B**                  SIMULATION SCREEN                          **
B28573** 02DEC24    CTS   FIX FOR BEAVER DAY 2.0 TO SUPPORT 10 DIGIT **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU9682'.
 
       01  WS-WORK-AREA.
           05  WS-YEN-CHARACTER                  PIC X(02).
           05  WS-MAN-CHARACTER                  PIC X(02).
           05  WS-MAN-AMOUNT                     PIC 9(12).
           05  WS-REMAINDER                      PIC 9(12).
           05  WS-AMOUNT-PICZ10                  PIC ZZ,ZZZ,ZZ9.
           05  WS-AMOUNT-PICZ08                  PIC ZZZZ,ZZ9.
M245H1     05  WS-AMOUNT-PICZ12                  PIC Z,ZZZ,ZZ9.99.
B28573     05  WS-AMOUNT1-PICZ13                 PIC ZZ,ZZZ,ZZ9.99.
M245H1     05  WS-SPACE                          PIC X(32).
M245H1     05  WS-CTR                            PIC 9(02).
M245H1     05  WS-RIGHT-YEN                      PIC X(12) 
M245H1                                           JUSTIFIED RIGHT.
M245H1     05  WS-MAN-YEN                        PIC X(04).
M245H1     05  WS-RIGHT-AMT                      PIC X(32) 
M245H1                                           JUSTIFIED RIGHT.
M245H1     05  WS-FIELD                          PIC X(32).
Q51003     05  WS-AMOUNT-PICZ11                  PIC ZZZ,ZZZ,ZZ9.
B28573     05  WS-AMOUNT-PICZ13                  PIC Z,ZZZ,ZZZ,ZZ9.
B28573     05  WS-RIGHT-YEN1                     PIC X(13) 
B28573                                           JUSTIFIED RIGHT.
M245O5     05  WS-SPACE-1                        PIC X(34)
M245O5                                           JUSTIFIED RIGHT.
M245O5     05  WS-FIELD-1                        PIC X(34)
M245O5                                           JUSTIFIED RIGHT.
      /
       COPY XCWLDTLK.
       
007766 COPY XCWLPTR.       
      /
       COPY XCWWWKDT.
      /
       COPY CCWWINDX.
      /
       COPY XCWL2490.
      /
       LINKAGE SECTION.
 
       01  DFHCOMMAREA.
         02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
007766 COPY XCWL9682.
/
      ********************
       PROCEDURE DIVISION.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------

007766     SET ADDRESS OF L9682-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).

           PERFORM  1000-FORMAT-AMOUNT
               THRU 1000-FORMAT-AMOUNT-X.
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
      /

      *-------------------
       1000-FORMAT-AMOUNT.
      *-------------------
M245H1     INITIALIZE  WS-WORK-AREA.

           PERFORM  2490-1000-BUILD-PARM-INFO
               THRU 2490-1000-BUILD-PARM-INFO-X.

           MOVE 'XSRU9682'         TO L2490-TXT-SRC-ID.
           MOVE L9682-LANG-CD      TO L2490-TXT-LANG-CD.

M245H1*    MOVE '09001'                     TO L2490-TXT-SRC-REF-ID.
M245H1*    PERFORM 2490-1000-RETRIEVE-TEXT
M245H1*       THRU 2490-1000-RETRIEVE-TEXT-X.
M245H1*    MOVE L2490-TXT-STR-TXT           TO WS-YEN-CHARACTER.
M245H1*
M245H1*    MOVE '09002'                     TO L2490-TXT-SRC-REF-ID.
M245H1*    PERFORM 2490-1000-RETRIEVE-TEXT
M245H1*       THRU 2490-1000-RETRIEVE-TEXT-X.
M245H1*    MOVE L2490-TXT-STR-TXT           TO WS-MAN-CHARACTER.

M245H1*    DIVIDE 10000 INTO L9682-INPUT-AMT   
M245H1*        GIVING WS-MAN-AMOUNT  REMAINDER WS-REMAINDER.

      **  IF YEN FMT IS REQUESTED, OUTPUT YEN FORMAT. 
      **  IF MAN YEN FMT IS REQUESTED, BUT INPUT AMT IS ZERO OR INPUT AMT 
      **  IS NOT EVENLY DIVISIBLE BY 10,000, OUTPUT YEN FORMAT. 

M245H1*    IF  L9682-RQST-YEN-FMT
M245H1*    OR  L9682-INPUT-AMT = ZERO
M245H1*    OR  WS-REMAINDER NOT = ZERO
M245H1*        MOVE L9682-INPUT-AMT    TO WS-AMOUNT-PICZ10 
M245H1*        MOVE WS-AMOUNT-PICZ10   TO L9682-OUTPUT-FMT1-AMT
M245H1*        MOVE WS-YEN-CHARACTER   TO L9682-OUTPUT-FMT1-YEN
M245H1*    ELSE 
M245H1*        MOVE WS-MAN-AMOUNT      TO WS-AMOUNT-PICZ08 
M245H1*        MOVE WS-AMOUNT-PICZ08   TO L9682-OUTPUT-FMT2-AMT
M245H1*        STRING WS-MAN-CHARACTER, WS-YEN-CHARACTER 
M245H1*            DELIMITED BY ' '  INTO L9682-OUTPUT-FMT2-MAN-YEN
M245H1*    END-IF.
M245H1
M245H1     IF  L9682-RQST-MAN-YEN-FMT 
M245H1         DIVIDE 10000 INTO L9682-INPUT-AMT
M245H1               GIVING WS-MAN-AMOUNT  REMAINDER WS-REMAINDER
M245H1
M245H1         IF  L9682-INPUT-AMT = ZERO
M245H1         OR  WS-REMAINDER NOT = ZERO
M245H1             SET L9682-RQST-YEN-FMT   TO TRUE
M245H1         ELSE
M245H1             MOVE '09001'             TO L2490-TXT-SRC-REF-ID
M245H1             PERFORM  2490-1000-RETRIEVE-TEXT
M245H1                 THRU 2490-1000-RETRIEVE-TEXT-X
M245H1             MOVE L2490-TXT-STR-TXT   TO WS-YEN-CHARACTER
M245H1
M245H1             MOVE '09002'             TO L2490-TXT-SRC-REF-ID
M245H1             PERFORM  2490-1000-RETRIEVE-TEXT
M245H1                 THRU 2490-1000-RETRIEVE-TEXT-X
M245H1             MOVE L2490-TXT-STR-TXT   TO WS-MAN-CHARACTER
M245H1             MOVE WS-MAN-AMOUNT       TO WS-AMOUNT-PICZ08
M245H1
M245H1             MOVE WS-AMOUNT-PICZ08    TO L9682-OUTPUT-FMT2-AMT
M245H1             STRING WS-MAN-CHARACTER, WS-YEN-CHARACTER 
M245H1             DELIMITED BY ' '  INTO L9682-OUTPUT-FMT2-MAN-YEN
M245H1
M245H1             IF  L9682-RIGHT-JUST-YES
M245H1                 STRING WS-MAN-CHARACTER , WS-YEN-CHARACTER
M245H1                 DELIMITED BY ' ' INTO  WS-MAN-YEN
M245H1                 MOVE  WS-MAN-YEN     TO L9682-OUTPUT-FMT3-CRCY
M245O5                                         L9682-OUTPUT-FMT4-CRCY
B28573*M245H1                 MOVE  WS-AMOUNT-PICZ08 
B28573*M245H1                                      TO WS-RIGHT-YEN
B28573*M245H1                 MOVE WS-RIGHT-YEN    TO L9682-OUTPUT-FMT3-AMT
B28573                 MOVE  WS-AMOUNT-PICZ08 
B28573                                      TO WS-RIGHT-YEN1
B28573                 MOVE WS-RIGHT-YEN1   TO L9682-OUTPUT-FMT3-AMT
M245O5                                         L9682-OUTPUT-FMT4-AMT
M245H1             ELSE  
M245H1                 GO TO 1000-FORMAT-AMOUNT-X
M245H1             END-IF
M245H1         END-IF
M245H1     END-IF.
M245H1
M245H1     IF  L9682-RQST-YEN-FMT
M245H1         MOVE '09001'                 TO L2490-TXT-SRC-REF-ID
M245H1         PERFORM  2490-1000-RETRIEVE-TEXT
M245H1             THRU 2490-1000-RETRIEVE-TEXT-X
M245H1         MOVE L2490-TXT-STR-TXT       TO L9682-OUTPUT-FMT1-YEN
M245H1                                         L9682-OUTPUT-FMT3-CRCY
M245O5                                         L9682-OUTPUT-FMT4-CRCY
Q51003*M245H1         MOVE L9682-INPUT-AMT         TO WS-AMOUNT-PICZ10
Q51003*M245H1         MOVE WS-AMOUNT-PICZ10        TO L9682-OUTPUT-FMT1-AMT
B28573*Q51003         MOVE L9682-INPUT-AMT         TO WS-AMOUNT-PICZ11
B28573*Q51003         MOVE WS-AMOUNT-PICZ11        TO L9682-OUTPUT-FMT3-AMT
B28573         MOVE L9682-INPUT-AMT         TO WS-AMOUNT-PICZ13
B28573         MOVE WS-AMOUNT-PICZ13        TO L9682-OUTPUT-FMT3-AMT
M245O5                                         L9682-OUTPUT-FMT4-AMT
Q51003         MOVE L9682-INPUT-AMT         TO WS-AMOUNT-PICZ10
Q51003         MOVE WS-AMOUNT-PICZ10        TO L9682-OUTPUT-FMT1-AMT
M245H1         IF  L9682-RIGHT-JUST-YES    
Q51003*M245H1             MOVE  WS-AMOUNT-PICZ10   TO WS-RIGHT-YEN
B28573*Q51003             MOVE  WS-AMOUNT-PICZ11   TO WS-RIGHT-YEN
B28573*M245H1             MOVE  WS-RIGHT-YEN       TO L9682-OUTPUT-FMT3-AMT
B28573             MOVE  WS-AMOUNT-PICZ13   TO WS-RIGHT-YEN1
B28573             MOVE  WS-RIGHT-YEN1      TO L9682-OUTPUT-FMT3-AMT
M245O5                                         L9682-OUTPUT-FMT4-AMT
M245H1         END-IF
M245H1     END-IF.
M245H1     
M245H1     IF  L9682-RQST-USD-FMT
M245H1         MOVE '09006'                 TO L2490-TXT-SRC-REF-ID
M245H1         PERFORM  2490-1000-RETRIEVE-TEXT
M245H1             THRU 2490-1000-RETRIEVE-TEXT-X
M245H1         MOVE L2490-TXT-STR-TXT       TO L9682-OUTPUT-FMT3-CRCY
M245O5                                         L9682-OUTPUT-FMT4-CRCY
M245H1         IF  L9682-DCML-REQIR-NO
Q51003*M245H1             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ10
Q51003*M245H1             MOVE WS-AMOUNT-PICZ10    TO WS-RIGHT-YEN
B28573*Q51003             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ11
B28573*Q51003             MOVE WS-AMOUNT-PICZ11    TO WS-RIGHT-YEN
B28573*M245H1             MOVE WS-RIGHT-YEN        TO L9682-OUTPUT-FMT3-AMT
B28573             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ13
B28573             MOVE WS-AMOUNT-PICZ13    TO WS-RIGHT-YEN1
B28573             MOVE WS-RIGHT-YEN1       TO L9682-OUTPUT-FMT3-AMT
M245O5                                         L9682-OUTPUT-FMT4-AMT
M245H1         ELSE
B28573*M245H1             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ12
B28573*M245H1             MOVE WS-AMOUNT-PICZ12    TO L9682-OUTPUT-FMT3-AMT
B28573             MOVE L9682-INPUT-AMT     TO WS-AMOUNT1-PICZ13
B28573             MOVE WS-AMOUNT1-PICZ13   TO L9682-OUTPUT-FMT3-AMT
M245O5                                         L9682-OUTPUT-FMT4-AMT
M245H1         END-IF
M245H1     END-IF.
M245H1
M245H1     IF  L9682-RQST-AUD-FMT
M245H1         MOVE '09007'                 TO L2490-TXT-SRC-REF-ID
M245H1         PERFORM  2490-1000-RETRIEVE-TEXT
M245H1             THRU 2490-1000-RETRIEVE-TEXT-X
M245H1         MOVE L2490-TXT-STR-TXT       TO L9682-OUTPUT-FMT3-CRCY
M245O5                                         L9682-OUTPUT-FMT4-CRCY
M245H1         IF  L9682-DCML-REQIR-NO
Q51003*M245H1             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ10
Q51003*M245H1             MOVE WS-AMOUNT-PICZ10    TO WS-RIGHT-YEN
B28573*Q51003             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ11
B28573*Q51003             MOVE WS-AMOUNT-PICZ11    TO WS-RIGHT-YEN
B28573*M245H1             MOVE WS-RIGHT-YEN        TO L9682-OUTPUT-FMT3-AMT
B28573             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ13
B28573             MOVE WS-AMOUNT-PICZ13    TO WS-RIGHT-YEN1
B28573             MOVE WS-RIGHT-YEN1       TO L9682-OUTPUT-FMT3-AMT
M245O5                                         L9682-OUTPUT-FMT4-AMT
M245H1         ELSE
B28573*M245H1             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ12
B28573*M245H1             MOVE WS-AMOUNT-PICZ12    TO L9682-OUTPUT-FMT3-AMT
B28573             MOVE L9682-INPUT-AMT     TO WS-AMOUNT1-PICZ13
B28573             MOVE WS-AMOUNT1-PICZ13   TO L9682-OUTPUT-FMT3-AMT
M245O5                                         L9682-OUTPUT-FMT4-AMT
M245H1         END-IF
M245H1     END-IF.
M245H1
M245H1     IF  L9682-RQST-EUR-FMT
M245H1         MOVE '09008'                 TO L2490-TXT-SRC-REF-ID
M245H1         PERFORM  2490-1000-RETRIEVE-TEXT
M245H1             THRU 2490-1000-RETRIEVE-TEXT-X
M245H1         MOVE L2490-TXT-STR-TXT       TO L9682-OUTPUT-FMT3-CRCY
M245O5                                         L9682-OUTPUT-FMT4-CRCY
M245H1         IF  L9682-DCML-REQIR-NO
Q51003*M245H1             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ10
Q51003*M245H1             MOVE WS-AMOUNT-PICZ10    TO WS-RIGHT-YEN
B28573*Q51003             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ11
B28573*Q51003             MOVE WS-AMOUNT-PICZ11    TO WS-RIGHT-YEN
B28573*M245H1             MOVE WS-RIGHT-YEN        TO L9682-OUTPUT-FMT3-AMT
B28573             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ13
B28573             MOVE WS-AMOUNT-PICZ13    TO WS-RIGHT-YEN1
B28573             MOVE WS-RIGHT-YEN1       TO L9682-OUTPUT-FMT3-AMT
M245O5                                         L9682-OUTPUT-FMT4-AMT
M245H1         ELSE
B28573*M245H1             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ12
B28573*M245H1             MOVE WS-AMOUNT-PICZ12    TO L9682-OUTPUT-FMT3-AMT
B28573             MOVE L9682-INPUT-AMT     TO WS-AMOUNT1-PICZ13
B28573             MOVE WS-AMOUNT1-PICZ13   TO L9682-OUTPUT-FMT3-AMT
M245O5                                         L9682-OUTPUT-FMT4-AMT
M245H1         END-IF
M245H1     END-IF.
M245H1
M245H1     IF  L9682-RQST-NZD-FMT
M245H1         MOVE '09009'                 TO L2490-TXT-SRC-REF-ID
M245H1         PERFORM  2490-1000-RETRIEVE-TEXT
M245H1             THRU 2490-1000-RETRIEVE-TEXT-X
M245H1         MOVE L2490-TXT-STR-TXT       TO L9682-OUTPUT-FMT3-CRCY
M245O5                                         L9682-OUTPUT-FMT4-CRCY
M245H1         IF  L9682-DCML-REQIR-NO
Q51003*M245H1             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ10
Q51003*M245H1             MOVE WS-AMOUNT-PICZ10    TO WS-RIGHT-YEN
B28573*Q51003             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ11
B28573*Q51003             MOVE WS-AMOUNT-PICZ11    TO WS-RIGHT-YEN
B28573*M245H1             MOVE WS-RIGHT-YEN        TO L9682-OUTPUT-FMT3-AMT
B28573             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ13
B28573             MOVE WS-AMOUNT-PICZ13    TO WS-RIGHT-YEN1
B28573             MOVE WS-RIGHT-YEN1       TO L9682-OUTPUT-FMT3-AMT
M245O5                                         L9682-OUTPUT-FMT4-AMT
M245H1         ELSE
B28573*M245H1             MOVE L9682-INPUT-AMT     TO WS-AMOUNT-PICZ12
B28573*M245H1             MOVE WS-AMOUNT-PICZ12    TO L9682-OUTPUT-FMT3-AMT
B28573             MOVE L9682-INPUT-AMT     TO WS-AMOUNT1-PICZ13
B28573             MOVE WS-AMOUNT1-PICZ13   TO L9682-OUTPUT-FMT3-AMT
M245O5                                         L9682-OUTPUT-FMT4-AMT
M245H1         END-IF
M245H1     END-IF.
M245H1    
M245H1     IF  L9682-RIGHT-JUST-YES
M245H1         UNSTRING L9682-OUTPUT-AMT-FMT3 DELIMITED BY ALL SPACES
M245H1                 INTO  WS-SPACE , WS-FIELD
M245H1         IF  WS-SPACE <> SPACE
M245H1             MOVE WS-SPACE            TO  WS-FIELD
M245H1         END-IF
M245H1         INSPECT WS-FIELD TALLYING WS-CTR FOR CHARACTERS
M245H1                 BEFORE INITIAL SPACE
M245H1         MOVE  WS-FIELD(1:WS-CTR)     TO  WS-RIGHT-AMT
M245H1         MOVE  WS-RIGHT-AMT           TO  L9682-OUTPUT-AMT-FMT3
M245H1     END-IF.
M245O5
M245O5     IF  L9682-RIGHT-JUST-YES 
M245O5         MOVE '/'                     TO  L9682-WS-SPACE
M245O5         UNSTRING L9682-OUTPUT-AMT-FMT4 DELIMITED BY ALL SPACES
M245O5         INTO  WS-SPACE-1 , WS-FIELD-1
M245O5         IF  WS-SPACE-1 <> SPACE
M245O5             MOVE WS-SPACE-1          TO  WS-FIELD-1
M245O5         END-IF
M245O5         INSPECT WS-FIELD-1 REPLACING ALL '/'
M245O5                                BY ' '  
M245O5         MOVE  WS-FIELD-1             TO  L9682-OUTPUT-AMT-FMT4
M245O5     END-IF.
M245H1     INITIALIZE  L9682-CRCY-SYMBL-SIZE-CD
M245H1                 L9682-RIGHT-JUST-IND.
M245H1
 
       1000-FORMAT-AMOUNT-X.
           EXIT.

      /
      *****************************************************************
      *   LINKAGE PROCESSING COPYBOOKS                                *
      *****************************************************************
      /
       COPY XCPS2490.
       COPY XCCL2490.
      /
      *****************************************************************
      **                 END OF PROGRAM XSLU9682                     **
      *****************************************************************
