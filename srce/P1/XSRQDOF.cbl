      *****************************************************************
      **  MEMBER : XSRQDOF                                           **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           DATA OUTPUT FILE                                  **
      **                                                             **
      **  DOMAIN : AC                                                **
      **  CLASS  : PD                                                **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MI0009**  05MAY03  CSS    CREATED FOR 'DOF' FILE PROCESSING          **
      *****************************************************************
 
      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSRQDOF.
 
       COPY XCWWCRHT.
 
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY XCSSDOF.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY XCSDDOF.
 
       COPY XCSRDOF.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRQDOF'.
 
       COPY SQLCA.
 
       01  WS-WORKING-STORAGE.
           05  WS-FILE-OPEN-SWITCH          PIC X(01)  VALUE 'N'.
               88  WS-FILE-IS-OPEN                     VALUE 'Y'.
               88  WS-FILE-IS-CLOSED                   VALUE 'N'.
      /
       COPY XCWTFCMD.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY XCSWDOF.
 
       01  WDOF-LINK-RECORD          PIC X(80).
      /
 
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 WDOF-SEQ-IO-WORK-AREA
                                 WDOF-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
           AND (WDOF-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
           OR   WDOF-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
                MOVE  WDOF-LINK-RECORD TO RDOF-SEQ-REC-INFO
           END-IF.
 
           EVALUATE TRUE
 
               WHEN  WDOF-SEQ-IO-COMMAND = TFCMD-READ-RECORD
                  PERFORM DOF-1000-READ
                     THRU DOF-1000-READ-X
 
               WHEN  WDOF-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
                  PERFORM DOF-2000-WRITE
                     THRU DOF-2000-WRITE-X
 
               WHEN  WDOF-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
                  PERFORM DOF-3000-OPEN-INPUT
                     THRU DOF-3000-OPEN-INPUT-X
                  MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
               WHEN  WDOF-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
                  PERFORM DOF-4000-OPEN-OUTPUT
                     THRU DOF-4000-OPEN-OUTPUT-X
                  MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
               WHEN  WDOF-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
                  PERFORM DOF-5000-CLOSE
                     THRU DOF-5000-CLOSE-X
                  MOVE 'N' TO WS-FILE-OPEN-SWITCH
 
               WHEN  WDOF-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
                  PERFORM DOF-6000-OPEN-EXTEND
                     THRU DOF-6000-OPEN-EXTEND-X
                  MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
           END-EVALUATE.
 
           IF  WS-FILE-IS-OPEN
           AND (WDOF-SEQ-IO-COMMAND = TFCMD-READ-RECORD
           OR   WDOF-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
           OR   WDOF-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
                MOVE RDOF-SEQ-REC-INFO TO WDOF-LINK-RECORD
           END-IF.
 
           GOBACK.
      *
       0000-MAINLINE-X.
           EXIT.
      /
       COPY XCPIDOF.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM XSRQDOF                      **
      *****************************************************************
