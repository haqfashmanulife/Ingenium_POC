      *****************************************************************
      **  MEMBER :  XSRU0010                                         **
      **  REMARKS:  BATCH GLOBAL AREA INITIALIZATION PROGRAM         **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  SFD                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  01AUG89  BLK    CREATED GLOBAL AREA INITIALIZATION PGM     **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  01SEP96  BER    MODIFICATIONS FOR MAINTAINABILITY          **
557658**  30SEP97  CG     YEAR 2000                                  **
557699**  30SEP97  CG     NEW AUDITY FACILITY                        **
008453**  31MAR98  552    IMPLEMENT MULTIPLE EXTERNAL DATE FORMAT    **
008455**  31MAR98  552    EXTENSIVE NUMERIC FORMATTING               **
007684**  30OCT98  56     CHECKPOINT RESTART                         **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
010418**  30OCT98  56     MODIFICATIONS REQUIRED FOR MULTI-COMPANY   **
014618**  15JUN99  56A    REMOVE REFERENCE TO SYSTEM-ID              **
012624**  15DEC99  60     SECURITY CHANGES FOR 6.0                   **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
017150**  09FEB01  612J   CURRENCY SCALING                           **
B10109**  01AUG01  VAN    DEFAULT USER LANGUAGE TO JAPANESE          **
      *****************************************************************
 
      *------------------------
       IDENTIFICATION DIVISION.
      *------------------------
 
       PROGRAM-ID. XSRU0010.
 
 
       COPY XCWWCRHT.
 
      /
      *---------------------
       ENVIRONMENT DIVISION.
      *---------------------
      /
      *--------------
       DATA DIVISION.
      *--------------
 
       WORKING-STORAGE SECTION.
 
53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU0010'.
 
       01  WS-PGM-WORK-AREA.
557658*    05  WS-DAY                       PIC 9(05).
557658*    05  WS-DATE                      PIC 9(06).
557658*    05  WS-DATE-R                    REDEFINES
557658*        WS-DATE.
557658*        10  WS-DATE-YY               PIC 9(02).
557658*        10  WS-DATE-MM               PIC 9(02).
557658*        10  WS-DATE-DD               PIC 9(02).
557658*    05  WS-TIME                      PIC 9(08).
557658*    05  WS-TIME-R                    REDEFINES
557658*        WS-TIME.
557658*        10  WS-TIME-HHMMSS           PIC 9(06).
557658*        10  FILLER                   PIC X(02).
557658*    05  WS-TIME-DETAILS              REDEFINES
557658*        WS-TIME.
557658*        10  WS-TIME-HH               PIC 9(02).
557658*        10  WS-TIME-MM               PIC 9(02).
557658*        10  WS-TIME-SS               PIC 9(02).
557658*        10  FILLER                   PIC X(02).
           05  WS-COMPANY-NAME              PIC X(50)  VALUE
               'SECURITY ADMINISTRATION'.
014618*    05  WS-SYSTEM-ID                 PIC X(15)  VALUE
014618*        'INGENIUM 5.6 '.
010418*    05  WS-COMPANY-CODE              PIC X(02)  VALUE
010418*        'CP'.
 
557658*01  WS-ANSI-TIME.
557658*    05  WS-ANSI-TIME-HH              PIC 9(02).
557658*    05  FILLER                       PIC X(01).
557658*    05  WS-ANSI-TIME-MM              PIC 9(02).
557658*    05  FILLER                       PIC X(01).
557658*    05  WS-ANSI-TIME-SS              PIC 9(02).
 
008453 COPY SQLCA.
       COPY XCWWWKDT.
      /
557658 COPY XCWL1610.
008453 COPY XCWL2490.
010418 COPY XCWL0012.
014590*COPY XCWL0030.
      /
      *----------------
       LINKAGE SECTION.
      *----------------
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
 
       COPY XCWL0010.
 
      *------------------
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L0010-PARM-INFO.
      *------------------
 
      *--------------
       0000-MAINLINE.
      *--------------
 
010418     MOVE 'E'                     TO L0012-ETBL-LANG-CD.
010418     PERFORM  0012-1000-GET-DEFAULT-CO-ID
010418         THRU 0012-1000-GET-DEFAULT-CO-ID-X.
010418
010418     IF  L0012-RETRN-INVALID-REQUEST
010418         PERFORM  0030-5000-LOGIC-ERROR
010418             THRU 0030-5000-LOGIC-ERROR-X
010418     END-IF.
010418
010418     MOVE L0012-ETBL-VALU-ID       TO WGLOB-COMPANY-CODE.
 
010418*    MOVE WS-COMPANY-CODE          TO WGLOB-COMPANY-CODE.
           MOVE WS-COMPANY-NAME          TO L0010-COMPANY-NAME.
014618*    MOVE WS-SYSTEM-ID             TO L0010-SYSTEM-ID.
 
012624*    MOVE 'BATC'                   TO WGLOB-TRANSACTION-ID.
012624     MOVE 'BATC'                   TO WGLOB-BUS-FCN-ID.
012624*    MOVE 'SA'                     TO WGLOB-APPL-ID.
           MOVE SPACE                    TO WGLOB-COUNTRY-CODE.
           MOVE SPACE                    TO WGLOB-CURRENCY-CODE.
           MOVE 'E'                      TO WGLOB-EDIT-LANG.
B10109*    MOVE 'E'                      TO WGLOB-USER-LANG.
B10109     MOVE 'J'                      TO WGLOB-USER-LANG.
           MOVE 'BATCH'                  TO WGLOB-USER-ID.
012624*    MOVE SPACE                    TO WGLOB-USER-SEC-CLASS.
012624     MOVE SPACE                    TO WGLOB-SECUR-CLAS-ID.
012624*    MOVE 'BATC'                   TO WGLOB-TERMINAL-ID.
           MOVE SPACE                    TO WGLOB-MSG-SECUR-CLAS-CD.
012624*    MOVE SPACE                    TO WGLOB-USER-CON-IND.
012624     MOVE SPACE                    TO WGLOB-SECUR-CNFD-ACCS-CD.
           MOVE SPACE                    TO WGLOB-USER-BRANCH-CODE.
012624*    MOVE +5                       TO WGLOB-MSG-MAX-LINES.
012624*    MOVE ZERO                     TO WGLOB-MSG-LINES-USED.
           MOVE ZERO                     TO WGLOB-MSG-ERROR-SW.
012624*    MOVE SPACE                    TO WGLOB-MSG-LINES.
           MOVE ZERO                     TO WGLOB-MSIN-SEQ-NUM.
557699     MOVE ZERO                     TO WGLOB-AUDT-AUD-INSTC-ID.
           MOVE ZERO                     TO WGLOB-GLOBAL-LEN.
007766*    MOVE ZERO                     TO WGLOB-SPECIFIC-LEN.
           MOVE ZERO                     TO WGLOB-OTHER-LEN.
           MOVE SPACE                    TO WGLOB-MSG-IND.
           MOVE SPACE                    TO WGLOB-MSG-PARM-INFO.
           MOVE SPACE                    TO WGLOB-MSG-SEVRTY-CD.
           MOVE SPACE                    TO WGLOB-MSG-TXT.
           MOVE SPACE                    TO WGLOB-USER-RPT-DSTRB-CD.
           MOVE SPACE                    TO WGLOB-RETURN-CODE.
           MOVE 'BA'                     TO WGLOB-ENVRMNT-CD.
           MOVE 1                        TO WGLOB-TASK-ID-N.
           MOVE ZERO                     TO WGLOB-USER-SESN-BTCH-NUM.
           MOVE SPACE                    TO WGLOB-REF-COMPANY-CODE.
           MOVE SPACE                    TO WGLOB-REF-POLICY-OR-CLIENT.
           MOVE SPACE                    TO WGLOB-REF-POLICY-ID.
           MOVE SPACE                    TO WGLOB-REF-COVERAGE-NUMBER.
           MOVE ZERO                     TO WGLOB-M-SUB.
007684     MOVE 1                        TO WGLOB-CHKPT-INSTC-ID.
557658*    ACCEPT WS-DAY                 FROM DAY.
557658*    ACCEPT WS-DATE                FROM DATE.
557658*    ACCEPT WS-TIME                FROM TIME.
557658     PERFORM  1610-1000-GET-DATE-TIME
557658         THRU 1610-1000-GET-DATE-TIME-X.
557658*    MOVE WS-DAY                   TO WGLOB-SYSTEM-DATE.
557658*    MOVE WS-TIME-HHMMSS           TO WGLOB-SYSTEM-TIME.
557658*    MOVE WWKDT-ZERO-DT            TO WWKDT-INT-DT-1.
557658*    MOVE WS-DATE-MM               TO WWKDT-INT-DT-MO-1.
557658*    MOVE WS-DATE-DD               TO WWKDT-INT-DT-DY-1.
557658*
557658*    IF WS-DATE-YY > 90
557658*        ADD WS-DATE-YY 1900       GIVING WWKDT-INT-DT-YR-1
557658*    ELSE
557658*        ADD WS-DATE-YY 2000       GIVING WWKDT-INT-DT-YR-1
557658*    END-IF.
557658*
557658*    MOVE WWKDT-INT-DT-1           TO WGLOB-SYSTEM-DATE-INT.
557658*    MOVE WWKDT-INT-DT-1           TO WGLOB-PROCESS-DATE.
557658     MOVE L1610-SYSTEM-DATE-INT    TO WGLOB-SYSTEM-DATE-INT.
557658     MOVE L1610-SYSTEM-DATE-INT    TO WGLOB-PROCESS-DATE.
557658*    MOVE WWKDT-ZERO-TIME          TO WS-ANSI-TIME.
557658*    MOVE WS-TIME-HH               TO WS-ANSI-TIME-HH.
557658*    MOVE WS-TIME-MM               TO WS-ANSI-TIME-MM.
557658*    MOVE WS-TIME-SS               TO WS-ANSI-TIME-SS.
557658*    MOVE WS-ANSI-TIME             TO WGLOB-SYSTEM-TIME-INT.
557658     MOVE L1610-SYSTEM-TIME-INT    TO WGLOB-SYSTEM-TIME-INT.
557658     MOVE L1610-SYSTEM-TIME        TO WGLOB-SYSTEM-TIME.
008453*
008453*    SINCE THERE IS NO MAST RECORD FOR APPLICATION 'SA', COUNTRY
008453*    AND CURRENCY CANNOT BE DETERMINED, USE DEFAULT VALUES FOR
008453*    FORMATTING PARAMETERS.
008453*
008453         MOVE 'A'                  TO WGLOB-DT-FRMT-CD
008453         MOVE ' '                  TO WGLOB-DT-SEPARATOR-SYMBL
008453         MOVE 'N'                  TO WGLOB-DT-ZERO-SUPRES-IND
008453
008455         MOVE '$'                  TO WGLOB-CRCY-SYMBL
008455         MOVE ','                  TO WGLOB-THOUSANDS-SYMBL
008455         MOVE '.'                  TO WGLOB-DCML-SYMBL
008455         MOVE 'R'                  TO WGLOB-SIGN-POSN-CD
008455         MOVE 'F'                  TO WGLOB-CRCY-POSN-CD
017150         MOVE  0                   TO WGLOB-CRCY-SCALE-QTY
008453*
008453***  GET FORMATTING DATA FROM TEXT
008453*
008453     PERFORM  2490-1000-BUILD-PARM-INFO
008453         THRU 2490-1000-BUILD-PARM-INFO-X.
008453
008453     MOVE 'XSDU1640'                TO L2490-TXT-SRC-ID.
008453     MOVE '00001'                   TO L2490-TXT-SRC-REF-ID.
008453
008453     PERFORM  2490-1000-RETRIEVE-TEXT
008453         THRU 2490-1000-RETRIEVE-TEXT-X.
008453
008453     IF L2490-RETRN-OK
008453         MOVE L2490-TXT-STR-TXT     TO WGLOB-MOS-ABBR-TXT
008453     ELSE
008453         MOVE 'JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC'
008453                                    TO WGLOB-MOS-ABBR-TXT
008453     END-IF.

       0000-MAINLINE-X.
           GOBACK.

008453 COPY XCPL0260.
557658 COPY XCPL1610.
008453 COPY XCPL2490.
008453 COPY XCPS2490.
010418 COPY XCPL0012.
010418 COPY XCPL0030.

      ******************************************************************
      *                  END OF PROGRAM XSRU0010                       *
      ******************************************************************
