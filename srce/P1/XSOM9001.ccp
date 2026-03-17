      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM9001.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM9001                                         **
      **  REMARKS:  THIS PROCESS DRIVER LISTS SECURITY CLASS WITH    **
      **            NUMBER OF ACTIVE SESSIONS.                       **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
SESCAP**  31OCT04  CY     NEW PROGRAM FOR SESSION CAP ENHANCEMENT    **
P02614**  31JAN05  AC     FIXED THE TOTAL NUMBER OF ACTIVE SESSIONS  **
      *****************************************************************

      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
      *
      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM9001'.

       COPY SQLCA.
       COPY XCWLPTR.

       01  WS-WORKING-STORAGE.
           05  WS-SUB                       PIC S9(04) VALUE ZERO COMP.
           05  WS-SESN-TOT-ALL              PIC S9(05) VALUE ZERO COMP.
           05  WS-SESN-TOT-NUM              PIC 9(05).
           05  WS-MAX-BROWSE-LINES          PIC S9(04) VALUE +25  COMP.
           05  WS-BUS-FCN-ID                PIC X(04).
               88  WS-BUS-FCN-ID-VALID      VALUE '9001'.
               88  WS-BUS-FCN-LIST          VALUE '9001'.

      /
      ******************************************************************
      *  COMMON COPYBOOKS                                              *
      ******************************************************************
       COPY XCWEBLCH.
       COPY XCWL0280.
       COPY XCWL0290.
       COPY XCWL1580.
       COPY XCWL0035.
      /
      ******************************************************************
      *  INPUT PARAMETER INFORMATION                                   *
      ******************************************************************
      /
       COPY CCFRPSYS.
       COPY XCFWUSCL.
       COPY XCFRUSCL.
       COPY XCFWUSEE.
       COPY XCFRUSES.
       COPY CCFWPSYS.
      /
       COPY XCWWWKDT.
      /
      *****************
       LINKAGE SECTION.
      *****************

      *
       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM9001.
      /

       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.
      *--------------
       0000-MAINLINE.
      *--------------
      *
           SET MIR-RETRN-OK              TO  TRUE.

           PERFORM  ABND-1000-HANDLE-ABEND
               THRU ABND-1000-HANDLE-ABEND-X.

           PERFORM  INIT-1000-INITIALIZE
               THRU INIT-1000-INITIALIZE-X.
      *
           PERFORM  2000-PROCESS-REQUEST
               THRU 2000-PROCESS-REQUEST-X.
      *
           PERFORM  EXIT-1000-FINALIZE
               THRU EXIT-1000-FINALIZE-X.

           GOBACK.

       0000-MAINLINE-X.
           EXIT.
      /
      *--------------------
       2000-PROCESS-REQUEST.
      *--------------------

           PERFORM  9300-SETUP-MSIN-REFERENCE
               THRU 9300-SETUP-MSIN-REFERENCE-X.

           MOVE MIR-BUS-FCN-ID        TO WS-BUS-FCN-ID.
      *
      *    PROCESS SCREEN FUNCTIONS
      *
           EVALUATE TRUE

               WHEN WS-BUS-FCN-LIST
                  PERFORM  2500-PROCESS-LIST
                      THRU 2500-PROCESS-LIST-X

               WHEN OTHER
      *MSG: INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    SET MIR-RETRN-INVALD-RQST     TO  TRUE
                    MOVE 'XS00000237' TO  WGLOB-MSG-REF-INFO
                    MOVE MIR-BUS-FCN-ID
                                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM9001'   TO WGLOB-MSG-PARM (2)
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X

           END-EVALUATE.
      *
       2000-PROCESS-REQUEST-X.
           EXIT.
      /
      ***************************************************************
      *    INQUIRY PROCESSING:  RETRIEVE RECORD AND DISPLAY
      ***************************************************************
      *--------------------
       2500-PROCESS-LIST.
      *--------------------
      *
      * Read PSYS for session expiry period
           SET WPSYS-SYS-CTL-INGENIUM TO TRUE.
           PERFORM  PSYS-1000-READ
               THRU PSYS-1000-READ-X.
      * Call XSDU1580 to subtract session expiry period from system timestamp
           INITIALIZE L1580-TIME-INT-TIME.
      
           PERFORM  0035-5000-TIMESTAMP
               THRU 0035-5000-TIMESTAMP-X.
           MOVE L0035-TIMESTAMP  TO L1580-INT-TS
                                    L1580-IO-INT-TS.
           MOVE RPSYS-SESN-XPRY-DUR TO L1580-INT-TIME-MI.
           PERFORM  1580-3000-TIME-SUBTRACTION
               THRU 1580-3000-TIME-SUBTRACTION-X.


      * Setup the list
           MOVE SPACES                TO MIR-SECUR-CLAS-ID-G.
           MOVE SPACES                TO MIR-SESN-CTL-IND-G.
           MOVE SPACES                TO MIR-MAX-SESN-NUM-G.
           MOVE SPACES                TO MIR-DV-SESN-TOT-G.
      *
           MOVE LOW-VALUES            TO WUSCL-KEY.
           MOVE HIGH-VALUES           TO WUSCL-ENDBR-KEY.
           MOVE MIR-SECUR-CLAS-ID     TO WUSCL-SECUR-CLAS-ID.
      *
           PERFORM  USCL-1000-BROWSE
               THRU USCL-1000-BROWSE-X.
      *
           PERFORM  9150-GET-NEXT-USCL
               THRU 9150-GET-NEXT-USCL-X.
           IF  WUSCL-IO-EOF
              MOVE 'XS00000025'   TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 2500-PROCESS-LIST-X
           END-IF.
      *
           PERFORM  2510-PROCESS-LIST-READ
               THRU 2510-PROCESS-LIST-READ-X
               VARYING WS-SUB FROM +1 BY +1
               UNTIL WS-SUB > WS-MAX-BROWSE-LINES
               OR    WUSCL-IO-EOF.

           IF  WUSCL-IO-EOF
               MOVE 'XS00000025'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
               MOVE 'XS00000014'      TO WGLOB-MSG-REF-INFO
               SET WGLOB-MORE-DATA-EXISTS TO TRUE
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM  USCL-3000-END-BROWSE
               THRU USCL-3000-END-BROWSE-X.
      *
      * Calculate total number of sessions for security classes with session
      * control and all
           PERFORM  2530-GET-SESSION-TOTAL
               THRU 2530-GET-SESSION-TOTAL-X.

       2500-PROCESS-LIST-X.
           EXIT.
      /
      *-----------------------
       2510-PROCESS-LIST-READ.
      *-----------------------
      *
           MOVE RUSCL-SECUR-CLAS-ID   TO MIR-SECUR-CLAS-ID-T (WS-SUB).
           MOVE RUSCL-SESN-CTL-IND TO MIR-SESN-CTL-IND-T (WS-SUB).
           IF  RUSCL-SESN-CTL-IND = SPACE
               MOVE 'N'            TO MIR-SESN-CTL-IND-T (WS-SUB) 
           END-IF.
           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.
                
           MOVE RUSCL-MAX-SESN-NUM    TO  MIR-MAX-SESN-NUM-T (WS-SUB).
           IF  RUSCL-MAX-SESN-NUM = SPACE
               MOVE ZEROS             TO  MIR-MAX-SESN-NUM-T (WS-SUB)
           END-IF.
            
           PERFORM  2520-GET-ACTIVE-SESSION
               THRU 2520-GET-ACTIVE-SESSION-X.

           PERFORM  9150-GET-NEXT-USCL
               THRU 9150-GET-NEXT-USCL-X. 

           IF  WS-SUB = WS-MAX-BROWSE-LINES
               IF  WUSCL-IO-OK
                   MOVE RUSCL-SECUR-CLAS-ID
                                      TO MIR-SECUR-CLAS-ID
               END-IF
           END-IF.
      *
       2510-PROCESS-LIST-READ-X.
           EXIT.

      *------------------------
       2520-GET-ACTIVE-SESSION.
      *------------------------

      * Select count from TUSES with 
      *     same security class and timestamp > calculated value
           MOVE RUSCL-SECUR-CLAS-ID TO WUSEE-SECUR-CLAS-ID
                                       WUSEE-ENDBR-SECUR-CLAS-ID.
           MOVE RUSCL-SESN-CTL-IND  TO WUSEE-SESN-CTL-IND. 
      * If security class has no session control, count all USES rows
      * else take into account of session expiry time
P02614*
P02614*    IF  RUSCL-SESN-CTL
P02614*        MOVE L1580-IO-INT-TS TO WUSEE-PREV-UPDT-TS
P02614*    ELSE
P02614*        MOVE WWKDT-LOW-TS    TO WUSEE-PREV-UPDT-TS
P02614*    END-IF.
P02614     MOVE L1580-IO-INT-TS TO WUSEE-PREV-UPDT-TS
           MOVE WWKDT-HIGH-TS TO WUSEE-ENDBR-PREV-UPDT-TS
           PERFORM  USEE-3000-READ-COUNT
               THRU USEE-3000-READ-COUNT-X.
           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.
           MOVE WUSEE-COUNT-SECUR-CLAS-ID TO WS-SESN-TOT-NUM.
           MOVE WS-SESN-TOT-NUM           TO MIR-DV-SESN-TOT-T(WS-SUB).

       2520-GET-ACTIVE-SESSION-X.
           EXIT.

      *----------------------- 
       2530-GET-SESSION-TOTAL.
      *----------------------- 
           MOVE 0            TO WS-SESN-TOT-ALL.
           MOVE LOW-VALUES   TO WUSEE-SECUR-CLAS-ID.
           MOVE HIGH-VALUES  TO WUSEE-ENDBR-SECUR-CLAS-ID.
      * Get number of sessions for security classes with session control
           MOVE L1580-IO-INT-TS  TO WUSEE-PREV-UPDT-TS.
           MOVE WWKDT-HIGH-TS    TO WUSEE-ENDBR-PREV-UPDT-TS.
           SET WUSEE-SESN-CTL TO TRUE.
           PERFORM  USEE-3000-READ-COUNT
               THRU USEE-3000-READ-COUNT-X.
           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.
           MOVE WUSEE-COUNT-SECUR-CLAS-ID TO WS-SESN-TOT-NUM.
           MOVE WS-SESN-TOT-NUM       TO MIR-DV-SESN-TOT-SESN-CTL.
           ADD  WUSEE-COUNT-SECUR-CLAS-ID TO WS-SESN-TOT-ALL.
      * Get number of sessions for all
P02614*    MOVE WWKDT-LOW-TS     TO WUSEE-PREV-UPDT-TS.
P02614     MOVE L1580-IO-INT-TS  TO WUSEE-PREV-UPDT-TS.
           MOVE WWKDT-HIGH-TS    TO WUSEE-ENDBR-PREV-UPDT-TS.
           SET WUSEE-SESN-CTL-NO TO TRUE.
           PERFORM  USEE-3000-READ-COUNT
               THRU USEE-3000-READ-COUNT-X.
           ADD  WUSEE-COUNT-SECUR-CLAS-ID TO WS-SESN-TOT-ALL.
           MOVE WS-SESN-TOT-ALL           TO WS-SESN-TOT-NUM.
           MOVE WS-SESN-TOT-NUM           TO MIR-DV-SESN-TOT-ALL.
       
       2530-GET-SESSION-TOTAL-X.
           EXIT.
      /
   YSZ*-----------------------
   YSZ*9100-BLANK-DATA-FIELDS.
   YSZ*-----------------------
   YSZ*
   YSZ*    CONTINUE
   YSZ*
   YSZ*9100-BLANK-DATA-FIELDS-X.
   YSZ*    EXIT.
      /
      *-------------------
       9150-GET-NEXT-USCL.
      *-------------------
           PERFORM  USCL-2000-READ-NEXT
               THRU USCL-2000-READ-NEXT-X.
      * Check whether the session control filter is active
           IF NOT WUSCL-IO-EOF
           AND (MIR-DV-SESN-CTL-ONLY-IND = 'Y'
           AND NOT RUSCL-SESN-CTL)
               GO TO 9150-GET-NEXT-USCL
           END-IF.
       9150-GET-NEXT-USCL-X.
           EXIT.
      /
   YSZ*---------------------------
   YSZ*9200-MOVE-RECORD-TO-SCREEN.
   YSZ*---------------------------
   YSZ*
   YSZ*    CONTINUE.
   
   YSZ*9200-MOVE-RECORD-TO-SCREEN-X.
   YSZ*    EXIT.
      /
      *--------------------------
       9300-SETUP-MSIN-REFERENCE.
      *--------------------------
      *
           MOVE SPACES                TO WGLOB-MSIN-REFERENCE.
           MOVE WGLOB-COMPANY-CODE    TO WGLOB-REF-COMPANY-CODE.
      *
       9300-SETUP-MSIN-REFERENCE-X.
           EXIT.
      /
       COPY XCPPINIT.
      *
       COPY XCPPEXIT.
      /
       COPY XCCL0260.
      /
       COPY XCPS0290.
       COPY XCPL0280.
       COPY XCPL0290.
      /
       COPY XCCPABND.
       COPY XCCP0030.
       
       COPY XCPL0035.
       COPY XCPL1580.
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY XCPBUSCL.
      /
       COPY XCPFUSEE.
      /
       COPY CCPNPSYS.
       
      *****************************************************************
      **                 END OF PROGRAM XSOM9001                     **
      *****************************************************************
