      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. VSOM0010.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  VSOM0010                                         **
      **  REMARKS:  VLBL PROCESS DRIVER                              **
      **                                                             **
      **  DOMAIN :  AT                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-062**  30NOV95  VK     ARCHITECTURE CHANGES TO SUPPORT GRAPHICAL  **
53-062**                  USER INTERFACE                             **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  01SEP96  MIG    MODIFICATIONS FOR MAINTAINABILITY          **
557918**  30SEP97  JMG    REPLACE NON-STANDARD MESSAGES              **
557708**  30SEP97  LLE    HANDLING OF CICS ABENDS                    **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
013578**  15DEC99  60     REMOVAL OF 3270 LOGIC, MIR RENAMES         **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'VSOM0010'.

       COPY SQLCA.
007766 COPY XCWLPTR.


014590*COPY XCWL0030.
      /
       01  WS-PGM-WORK-AREA.
           05  WS-BUS-FCN-ID               PIC X(04).
               88  WS-BUS-FCN-ID-VALID     VALUES
                   '1850' '1851' '1852' '1853'.
               88  WS-BUS-FCN-RETRIEVE     VALUE  '1850'.
               88  WS-BUS-FCN-CREATE       VALUE  '1851'.
               88  WS-BUS-FCN-UPDATE       VALUE  '1852'.
               88  WS-BUS-FCN-DELETE       VALUE  '1853'.
           05  WS-ERROR-SW                 PIC 9.
               88  WS-NO-ERRORS            VALUES ARE 0.
               88  WS-ERRORS-EXIST         VALUES ARE 1.
54-001     05  WS-KEY-EDIT-ERROR-SW        PIC 9.
54-001         88  WS-KEY-EDIT-NO-ERRORS   VALUES ARE 0.
54-001         88  WS-KEY-EDIT-ERRORS      VALUES ARE 1.
           05  WS-INDX                     PIC S9(4)  COMP VALUE +0.
       01  MSGE-ERROR-MESSAGE-TABLE.
           05  FILLER                      PIC X(10) VALUE 'VS00100009'.
           05  FILLER                      PIC X(10) VALUE 'VS00100010'.
           05  FILLER                      PIC X(10) VALUE 'VS00100011'.
           05  FILLER                      PIC X(10) VALUE 'VS00100012'.
           05  FILLER                      PIC X(10) VALUE 'VS00100013'.
           05  FILLER                      PIC X(10) VALUE 'VS00100014'.
           05  FILLER                      PIC X(10) VALUE 'VS00100015'.
           05  FILLER                      PIC X(10) VALUE 'VS00100016'.
           05  FILLER                      PIC X(10) VALUE 'VS00100017'.
           05  FILLER                      PIC X(10) VALUE 'VS00100018'.
           05  FILLER                      PIC X(10) VALUE 'VS00100019'.
           05  FILLER                      PIC X(10) VALUE 'VS00100020'.
       01  MSGE-ERROR-MESSAGE-TABLE-R      REDEFINES
                                           MSGE-ERROR-MESSAGE-TABLE.
           05  MSGE-ERR-MSG                OCCURS 12 TIMES.
               10  MSGE-ERR-SOURCE         PIC X(06).
               10  MSGE-ERR-NUMBER         PIC X(04).
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY CCFREDIT.
       COPY CCFWEDIT.
      /
       COPY VCFRVL.
       COPY VCFWVL.
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                          *
      *****************************************************************
54-001 COPY VCWL0011.
      /
      *****************************************************************
      *  INPUT PARAMETER INFORMATION                                  *
      *****************************************************************
007766*01  WGLOB-GLOBAL-AREA.
007766*COPY XCWWGLOB.
      /
      *****************
       LINKAGE SECTION.
      *****************
007766 01 WGLOB-GLOBAL-AREA.
007766 COPY XCWWGLOB.
       COPY VCWM0010.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.

      *--------------
       0000-MAINLINE.
      *--------------

557708     PERFORM  ABND-1000-HANDLE-ABEND
557708         THRU ABND-1000-HANDLE-ABEND-X.
557708

013578     INSPECT MIR-PARM-AREA REPLACING ALL '*' BY ' '.

           PERFORM  INIT-1000-INITIALIZE
               THRU INIT-1000-INITIALIZE-X.

           PERFORM  0200-PROCESS-REQUEST
               THRU 0200-PROCESS-REQUEST-X.

           PERFORM  EXIT-1000-FINALIZE
               THRU EXIT-1000-FINALIZE-X.

       0000-MAINLINE-X.
           GOBACK.
      /
      *---------------------
       0200-PROCESS-REQUEST.
      *---------------------

           SET  MIR-RETRN-OK          TO TRUE.
           MOVE MIR-BUS-FCN-ID        TO WS-BUS-FCN-ID.

           EVALUATE TRUE

               WHEN WS-BUS-FCN-RETRIEVE
                    PERFORM  1000-PROCESS-RETRIEVE
                        THRU 1000-PROCESS-RETRIEVE-X

               WHEN WS-BUS-FCN-CREATE
                    PERFORM  2000-PROCESS-CREATE
                        THRU 2000-PROCESS-CREATE-X

               WHEN WS-BUS-FCN-UPDATE
                    PERFORM  3000-PROCESS-UPDATE
                        THRU 3000-PROCESS-UPDATE-X

               WHEN WS-BUS-FCN-DELETE
                    PERFORM  4000-PROCESS-DELETE
                        THRU 4000-PROCESS-DELETE-X

               WHEN OTHER
      *MSG: INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID  TO WGLOB-MSG-PARM (1)
                    MOVE 'VSOM0010'      TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237'    TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST  TO TRUE

           END-EVALUATE.

       0200-PROCESS-REQUEST-X.
           EXIT.
      /
      *----------------------
       1000-PROCESS-RETRIEVE.
      *----------------------

      *****************************************************************
      *   INQUIRY PROCESSING: RETRIEVE RECORD AND DISPLAY.
      *****************************************************************

      *
      *    SET UP VL-KEY FIELDS
      *

           MOVE MIR-VALN-LBL-ID       TO  WVL-VALN-LBL-ID.

           PERFORM  VL-1000-READ
               THRU VL-1000-READ-X.

           IF  NOT WVL-IO-OK
      *MSG:   'RECORD @1 NOT FOUND'
557918*        MOVE 'VS00000004'            TO WGLOB-MSG-REF-INFO
557918         MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
557918         MOVE WVL-KEY           TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 1000-PROCESS-RETRIEVE-X
           END-IF.

           PERFORM  5000-DISPLAY-RECORDS
               THRU 5000-DISPLAY-RECORDS-X.

       1000-PROCESS-RETRIEVE-X.
           EXIT.

      /
      *--------------------
       2000-PROCESS-CREATE.
      *--------------------
      *    CREATE PROCESSING: CHECK RECORD DOES NOT EXIST, INIT NEW
      *    RECORD AND ALLOW USER TO MODIFY.

      *
      *    SET UP VL-KEY FIELDS
      *

           MOVE MIR-VALN-LBL-ID         TO  WVL-VALN-LBL-ID.

54-001     SET WS-KEY-EDIT-NO-ERRORS    TO TRUE.

           PERFORM  6100-KEY-EDIT
               THRU 6100-KEY-EDIT-X.

54-001     IF  WS-KEY-EDIT-ERRORS
54-001         GO TO 2000-PROCESS-CREATE-X
54-001     END-IF.

           PERFORM  VL-1000-READ
               THRU VL-1000-READ-X.

           IF  WVL-IO-OK
      *MSG:    'RECORD (@1) ALREADY EXISTS'
557918*        MOVE 'VS00000005'            TO WGLOB-MSG-REF-INFO
557918         MOVE 'XS00000003'      TO WGLOB-MSG-REF-INFO
557918         MOVE WVL-KEY           TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-PROCESS-CREATE-X
           END-IF.

           PERFORM  VL-1000-CREATE
               THRU VL-1000-CREATE-X.

           PERFORM  VL-1000-WRITE
               THRU VL-1000-WRITE-X.

           PERFORM  5000-DISPLAY-RECORDS
               THRU 5000-DISPLAY-RECORDS-X.

           PERFORM  9100-INIT-DATA-FIELDS
               THRU 9100-INIT-DATA-FIELDS-X.

      *MSG:'RECORD CREATED - CONTINUE'
557918*    MOVE 'VS00000006'                TO WGLOB-MSG-REF-INFO.
557918     MOVE 'XS00000004'          TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

       2000-PROCESS-CREATE-X.
           EXIT.

      /
      *--------------------
       3000-PROCESS-UPDATE.
      *--------------------
      *   MAINTAIN PROCESSING: GET RECORD, EDIT DATA FIELDS, AND UPDATE
      *   IF NO EDIT ERRORS; ELSE UNLOCK.

      *
      *    SET UP VL-KEY FIELDS
      *
           MOVE MIR-VALN-LBL-ID       TO  WVL-VALN-LBL-ID.

           PERFORM  VL-1000-READ-FOR-UPDATE
               THRU VL-1000-READ-FOR-UPDATE-X.

           IF  WVL-IO-OK
               CONTINUE
           ELSE
      *MSG:    'RECORD LOST IN MAINTAIN (@1) - CONTACT SYSTEMS'
               MOVE WVL-KEY           TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000006'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 3000-PROCESS-UPDATE-X
           END-IF.

           PERFORM  6000-EDIT-FIELDS
               THRU 6000-EDIT-FIELDS-X.
           PERFORM  VL-2000-REWRITE
               THRU VL-2000-REWRITE-X.

           IF  WGLOB-GOOD-RETURN
               IF  L0011-NO-DEFAULT-LABEL
      *MSG:        'MAINTENANCE COMPLETE - CONTINUE'
                   MOVE 'XS00000007'  TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               ELSE
      *MSG:        'RECORD UPDATED'
                   MOVE 'XS00000008'  TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF
           END-IF.

       3000-PROCESS-UPDATE-X.
           EXIT.

      /
      *--------------------
       4000-PROCESS-DELETE.
      *--------------------

      *****************************************************************
      *   DELETE PROCESSING:
      *****************************************************************

      *
      *    SET UP VL-KEY FIELDS
      *

           MOVE MIR-VALN-LBL-ID       TO  WVL-VALN-LBL-ID.

           PERFORM  VL-1000-READ-FOR-UPDATE
               THRU VL-1000-READ-FOR-UPDATE-X.

           IF  NOT WVL-IO-OK
      *MSG:    '***RECORD NOT DELETED. INVALID KEY***'
557918*        MOVE 'VS00000008'            TO WGLOB-MSG-REF-INFO
557918         MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
557918         MOVE WVL-KEY           TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4000-PROCESS-DELETE-X
           END-IF.

           PERFORM  VL-1000-DELETE
               THRU VL-1000-DELETE-X.


      *MSG: 'DELETE COMPLETED - CONTINUE'
557918*    MOVE 'VS00000007'                TO WGLOB-MSG-REF-INFO
557918     MOVE 'XS00000011'          TO WGLOB-MSG-REF-INFO
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

       4000-PROCESS-DELETE-X.
           EXIT.

      /
      *---------------------
       5000-DISPLAY-RECORDS.
      *---------------------

      *
      * MOVE ALL RECORD FIELDS TO THE SCREEN (MIR- FIELDS)
      *
           MOVE RVL-VALN-LBL-CD (01)  TO MIR-DV-VALN-LBL-CD-T (01).
           MOVE RVL-VALN-LBL-CD (02)  TO MIR-DV-VALN-LBL-CD-T (02).
           MOVE RVL-VALN-LBL-CD (03)  TO MIR-DV-VALN-LBL-CD-T (03).
           MOVE RVL-VALN-LBL-CD (04)  TO MIR-DV-VALN-LBL-CD-T (04).
           MOVE RVL-VALN-LBL-CD (05)  TO MIR-DV-VALN-LBL-CD-T (05).
           MOVE RVL-VALN-LBL-CD (06)  TO MIR-DV-VALN-LBL-CD-T (06).
           MOVE RVL-VALN-LBL-CD (07)  TO MIR-DV-VALN-LBL-CD-T (07).
           MOVE RVL-VALN-LBL-CD (08)  TO MIR-DV-VALN-LBL-CD-T (08).
           MOVE RVL-VALN-LBL-CD (09)  TO MIR-DV-VALN-LBL-CD-T (09).
           MOVE RVL-VALN-LBL-CD (10)  TO MIR-DV-VALN-LBL-CD-T (10).
           MOVE RVL-VALN-LBL-CD (11)  TO MIR-DV-VALN-LBL-CD-T (11).
           MOVE RVL-VALN-LBL-CD (12)  TO MIR-DV-VALN-LBL-CD-T (12).

       5000-DISPLAY-RECORDS-X.
           EXIT.
      /
      /
54-001*-----------------
53-064 6000-EDIT-FIELDS.
54-001*-----------------
54-001
54-001     PERFORM  0011-0000-INIT-PARM-INFO
54-001         THRU 0011-0000-INIT-PARM-INFO-X.
54-001
54-001     MOVE MIR-DV-VALN-LBL-CD-G  TO  L0011-LVAL-TABLE.
54-001
54-001     PERFORM  0011-1000-VLBL-EDITS
54-001         THRU 0011-1000-VLBL-EDITS-X.
54-001
54-001     EVALUATE TRUE
54-001
54-001         WHEN L0011-RETRN-INVALID-REQUEST
54-001              MOVE +1           TO WGLOB-RETURN-CODE
54-001
54-001         WHEN L0011-RETRN-EDIT-ERRORS
54-001              MOVE +1           TO WGLOB-RETURN-CODE
54-001              PERFORM  6020-EDIT-RETURN-SCREEN
54-001                  THRU 6020-EDIT-RETURN-SCREEN-X
54-001
54-001         WHEN L0011-RETRN-OK
54-001              PERFORM  6020-EDIT-RETURN-SCREEN
54-001                  THRU 6020-EDIT-RETURN-SCREEN-X
54-001
54-001      END-EVALUATE.
54-001
53-064 6000-EDIT-FIELDS-X.
53-064     EXIT.
54-001
54-001/
54-001*-----------------------
54-001 6020-EDIT-RETURN-SCREEN.
54-001*-----------------------
54-001
54-001     PERFORM  6025-EDIT-RETURN-FIELD
54-001         THRU 6025-EDIT-RETURN-FIELD-X
54-001         VARYING WS-INDX FROM 1 BY 1
54-001             UNTIL WS-INDX > 12.
54-001
54-001 6020-EDIT-RETURN-SCREEN-X.
54-001     EXIT.
54-001
54-001/
54-001*-----------------------
54-001 6025-EDIT-RETURN-FIELD.
54-001*-----------------------
54-001
54-001     IF  L0011-LVAL-T (WS-INDX)        =  HIGH-VALUES
               CONTINUE
54-001     ELSE
54-001         MOVE L0011-LVAL-T (WS-INDX)
                                     TO MIR-DV-VALN-LBL-CD-T (WS-INDX)
54-001     END-IF.
54-001
54-001 6025-EDIT-RETURN-FIELD-X.
54-001     EXIT.
      /
      *--------------
       6100-KEY-EDIT.
      *--------------

           IF  WVL-VALN-LBL-ID = SPACES
54-001         SET WS-KEY-EDIT-ERRORS       TO TRUE
      *MSG: 'PLEASE UPDATE THE UNINITIALIZED LABELS(S)
               MOVE 'VS00100005'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X

           END-IF.

       6100-KEY-EDIT-X.
           EXIT.
      /
      *----------------------
       9100-INIT-DATA-FIELDS.
      *----------------------

           MOVE  'XXXXXX'             TO MIR-DV-VALN-LBL-CD-T (01)
                                         MIR-DV-VALN-LBL-CD-T (02)
                                         MIR-DV-VALN-LBL-CD-T (03)
                                         MIR-DV-VALN-LBL-CD-T (04)
                                         MIR-DV-VALN-LBL-CD-T (05)
                                         MIR-DV-VALN-LBL-CD-T (06)
                                         MIR-DV-VALN-LBL-CD-T (07)
                                         MIR-DV-VALN-LBL-CD-T (08)
                                         MIR-DV-VALN-LBL-CD-T (09)
                                         MIR-DV-VALN-LBL-CD-T (10)
                                         MIR-DV-VALN-LBL-CD-T (11)
                                         MIR-DV-VALN-LBL-CD-T (12).

       9100-INIT-DATA-FIELDS-X.
           EXIT.
      /
      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************
      /
       COPY XCPPINIT.
       COPY XCPPEXIT.
      /
      ****************************************************************
      * LINKAGE PROCESSING COPYBOOKS                                 *
      ****************************************************************
       COPY VCPS0011.
       COPY VCCL0011.
      /
       COPY XCCL0260.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY VCPAVL.
       COPY VCPCVL.
       COPY VCPNVL.
       COPY VCPUVL.
       COPY VCPXVL.
      /
54-001*COPY CCPNEDIT.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
557708*COPY XCCPHNDL.
557708 COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM VSOM0010                     **
      *****************************************************************
