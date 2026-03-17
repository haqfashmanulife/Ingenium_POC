      
      **************************
       IDENTIFICATION DIVISION.
      **************************
      
       PROGRAM-ID.    ZSBMFIIA.
      
       COPY XCWWCRHT.
      
      *****************************************************************
      **  MEMBER : ZSBMFIIA                                          **
      **  REMARKS: FORMULA II - BRANCH AND SALES OFFICE CONVERSION   **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
FII001**  31MAR03  AT     ORIGINAL VERSION                           **
FII01A**  31MAR03  AT     POPULATE ALL 3 NAMES ON CLNC               **
FII01B**  31MAR03  AT     FINE TUNE HANDLING OF PAYROLL DEDUCTION    **
FII01B**                  WHEN THE NEW GROUP ALREADY EXISTS - WE     **
FII01B**                  MUST CREATE THE NEW RL ROWS                **
P00916**  11APR03  AT     IMPROVE REUSABILITY (FACILITATE FUTURE     **
P00916**                  CONVERSIONS) BY REPLACING THE HARDWIRED    **
P00916**                  CONVERSION PHASE LETTER PROVIDED BY THE    **
P00916**                  *FIIB/C COPYBOOKS WITH THE PHASE LETTER    **
P00916**                  FROM THE CONTROL RECORD.                   **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************

      ***********************
       ENVIRONMENT DIVISION.
      ***********************

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
        
           SELECT ZMAP-DATA-FILE ASSIGN TO CSZMAP
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WZMAP-SEQ-FILE-STATUS .

      /
      ********************
       DATA DIVISION.
      ********************
 
       FILE SECTION.
        
       FD  ZMAP-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
            
       01  ZMAP-REC.
           05  ZMAP-DATA.
               10  ZMAP-ID                          PIC 9(6).
               10  ZMAP-KATAK-NM                    PIC X(60).
               10  ZMAP-KANJ-NM                     PIC X(60).
               10  ZMAP-ADDR-LOC-CD                 PIC X(15).
               10  ZMAP-POSTAL-CD                   PIC X(15).
               10  ZMAP-SAMA                        PIC X(60).
               10  ZMAP-CNTCT                       PIC X(20).

      /
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMFIIA'.

       COPY SQLCA.
 
       01  WZMAP-SEQ-IO-WORK-AREA.
           05  WZMAP-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'ZMAP'.
           05  WZMAP-SEQ-IO-COMMAND             PIC X(02).
           05  WZMAP-SEQ-FILE-STATUS            PIC X(02).
               88  WZMAP-SEQ-IO-OK              VALUE '00'.
               88  WZMAP-SEQ-IO-EOF             VALUE '10'.
                
       01  WZMAP-TABLE.
FII01A*    05  WZMAP-DATA  OCCURS 200 TIMES.
FII01A     05  WZMAP-DATA  OCCURS 350 TIMES.
               10  WZMAP-ID                PIC X(6)  VALUE SPACES.
               10  WZMAP-KATAK-NM          PIC X(60) VALUE SPACES.
               10  WZMAP-KANJ-NM           PIC X(60) VALUE SPACES.
               10  WZMAP-ADDR-LOC-CD       PIC X(15) VALUE SPACES.
               10  WZMAP-POSTAL-CD         PIC X(15) VALUE SPACES.
               10  WZMAP-SAMA              PIC X(60) VALUE SPACES.
               10  WZMAP-CNTCT             PIC X(20) VALUE SPACES.
                
       01  MISC-WORK-LITERALS.
           05  WS-ZMAP-CNT              PIC 9(3)  VALUE ZERO.
           05  WS-ZMAP-SUB              PIC 9(3)  VALUE ZERO.
           05  WS-ZMAP-ID               PIC X(6).
           05  WS-ZMAP-ID-N REDEFINES WS-ZMAP-ID PIC 9(6).
           05  WS-ZMAP-SEARCH-STATUS    PIC X(1).
               88 WS-ZMAP-FND           VALUE 'Y'.
               88 WS-ZMAP-NOT-FND       VALUE 'N'.
           05  WS-PROGRAM-ID            PIC X(08) VALUE 'ZSBMFIIA'.
           05  WS-CNVR-TBL-CNT          PIC 9(02) VALUE ZERO.
           05  WS-BRCH-SW               PIC X(01) VALUE 'X'.
               88 WS-BRCH-SW-Y          VALUE 'Y'.
               88 WS-BRCH-SW-N          VALUE 'N'.
               88 WS-BRCH-SW-INVALID    VALUE 'X'.
           05  WS-SALE-SW               PIC X(01) VALUE 'X'.
               88 WS-SALE-SW-Y          VALUE 'Y'.
               88 WS-SALE-SW-N          VALUE 'N'.
               88 WS-SALE-SW-INVALID    VALUE 'X'.
           05  WS-AG-SW                 PIC X(01) VALUE 'X'.
               88 WS-AG-SW-Y            VALUE 'Y'.
               88 WS-AG-SW-N            VALUE 'N'.
               88 WS-AG-SW-INVALID      VALUE 'X'.
           05  WS-POL-SW                PIC X(01) VALUE 'X'.
               88 WS-POL-SW-Y           VALUE 'Y'.
               88 WS-POL-SW-N           VALUE 'N'.
               88 WS-POL-SW-INVALID     VALUE 'X'.
           05  WS-SPOL-SW               PIC X(01) VALUE 'X'.
               88 WS-SPOL-SW-Y          VALUE 'Y'.
               88 WS-SPOL-SW-N          VALUE 'N'.
               88 WS-SPOL-SW-INVALID    VALUE 'X'.
           05  WS-USEC-SW               PIC X(01) VALUE 'X'.
               88 WS-USEC-SW-Y          VALUE 'Y'.
               88 WS-USEC-SW-N          VALUE 'N'.
               88 WS-USEC-SW-INVALID    VALUE 'X'.
           05  WS-UWAS-SW               PIC X(01) VALUE 'X'.
               88 WS-UWAS-SW-Y          VALUE 'Y'.
               88 WS-UWAS-SW-N          VALUE 'N'.
               88 WS-UWAS-SW-INVALID    VALUE 'X'.
           05  WS-CLI-SW                PIC X(01) VALUE 'X'.
               88 WS-CLI-SW-Y           VALUE 'Y'.
               88 WS-CLI-SW-N           VALUE 'N'.
               88 WS-CLI-SW-INVALID     VALUE 'X'.
           05  WS-POLC-SW               PIC X(01) VALUE 'X'.
               88 WS-POLC-SW-Y          VALUE 'Y'.
               88 WS-POLC-SW-N          VALUE 'N'.
               88 WS-POLC-SW-INVALID    VALUE 'X'.
           05  WS-PHST-SW               PIC X(01) VALUE 'X'.
               88 WS-PHST-SW-Y          VALUE 'Y'.
               88 WS-PHST-SW-N          VALUE 'N'.
               88 WS-PHST-SW-INVALID    VALUE 'X'.
           05  WS-HI-SW                 PIC X(01) VALUE 'X'.
               88 WS-HI-SW-Y            VALUE 'Y'.
               88 WS-HI-SW-N            VALUE 'N'.
               88 WS-HI-SW-INVALID      VALUE 'X'.
           05  WS-XTAB-SW               PIC X(01) VALUE 'X'.
               88 WS-XTAB-SW-Y          VALUE 'Y'.
               88 WS-XTAB-SW-N          VALUE 'N'.
               88 WS-XTAB-SW-INVALID    VALUE 'X'.
           05  WS-HI-LO-X               PIC X(8).
           05  WS-HI-LO   REDEFINES WS-HI-LO-X    PIC 9(8).
           05  F                        PIC X(1).
           05  WS-HI-HIGH-X             PIC X(8).
           05  WS-HI-HIGH REDEFINES WS-HI-HIGH-X  PIC 9(8).
            
           05  WS-BRCH-NOMAT-CNT        PIC 9(7)  VALUE ZERO.
           05  WS-BRCH-DEL-CNT          PIC 9(7)  VALUE ZERO.
           05  WS-BRCH-INS-CNT          PIC 9(7)  VALUE ZERO.
            
           05  WS-SALE-NOMAT-CNT        PIC 9(7)  VALUE ZERO.
           05  WS-SALE-DEL-CNT          PIC 9(7)  VALUE ZERO.
           05  WS-SALE-INS-CNT          PIC 9(7)  VALUE ZERO.
            
           05  WS-AG-NOMAT-CNT          PIC 9(7)  VALUE ZERO.
           05  WS-AG-UPD-CNT            PIC 9(7)  VALUE ZERO.
            
           05  WS-POL-NOMAT-CNT         PIC 9(7)  VALUE ZERO.
           05  WS-POL-UPD-CNT           PIC 9(7)  VALUE ZERO.
           05  WS-POL-NOAG-CNT          PIC 9(7)  VALUE ZERO.
            
           05  WS-SPOL-NOMAT-CNT        PIC 9(7)  VALUE ZERO.
           05  WS-SPOL-UPD-CNT          PIC 9(7)  VALUE ZERO.
            
           05  WS-USEC-NOMAT-CNT        PIC 9(7)  VALUE ZERO.
           05  WS-USEC-UPD-CNT          PIC 9(7)  VALUE ZERO.
            
           05  WS-UWAS-NOMAT-CNT        PIC 9(7)  VALUE ZERO.
           05  WS-UWAS-DEL-CNT          PIC 9(7)  VALUE ZERO.
            
           05  WS-CLI-NOMAT-BRCH-CNT    PIC 9(7)  VALUE ZERO.
           05  WS-CLI-NOMAT-SALE-CNT    PIC 9(7)  VALUE ZERO.
           05  WS-CLI-NOMAT-CLIG-CNT    PIC 9(7)  VALUE ZERO.
            
           05  WS-CLI-DEL-BRCH-CNT      PIC 9(7)  VALUE ZERO.
           05  WS-CLI-DEL-SALE-CNT      PIC 9(7)  VALUE ZERO.
           05  WS-CLI-DEL-CLIG-CNT      PIC 9(7)  VALUE ZERO.
            
           05  WS-CLI-INS-BRCH-CNT      PIC 9(7)  VALUE ZERO.
           05  WS-CLI-INS-SALE-CNT      PIC 9(7)  VALUE ZERO.
           05  WS-CLI-INS-CLIG-CNT      PIC 9(7)  VALUE ZERO.
            
           05  WS-CLIA-DEL-CNT          PIC 9(7)  VALUE ZERO.
           05  WS-CLIA-INS-CNT          PIC 9(7)  VALUE ZERO.
           05  WS-CLNC-DEL-CNT          PIC 9(7)  VALUE ZERO.
           05  WS-CLNC-INS-CNT          PIC 9(7)  VALUE ZERO.
           05  WS-CLIG-DEL-CNT          PIC 9(7)  VALUE ZERO.
           05  WS-CLIG-INS-CNT          PIC 9(7)  VALUE ZERO.
           05  WS-RL-DEL-CNT            PIC 9(7)  VALUE ZERO.
           05  WS-RL-INS-CNT            PIC 9(7)  VALUE ZERO.
            
           05  WS-POLC-UPD-CNT          PIC 9(7)  VALUE ZERO.
            
           05  WS-PHST-NOMAT-CNT        PIC 9(7)  VALUE ZERO.
           05  WS-PHST-UPD-CNT          PIC 9(7)  VALUE ZERO.
            
           05  WS-HI77-UPD-CNT          PIC 9(7)  VALUE ZERO.
           05  WS-HI88-UPD-CNT          PIC 9(7)  VALUE ZERO.
           05  WS-HI99-UPD-CNT          PIC 9(7)  VALUE ZERO.
            
           05  WS-XTAB-NOMAT-BRCH-CNT   PIC 9(7)  VALUE ZERO.
           05  WS-XTAB-NOMAT-SALE-CNT   PIC 9(7)  VALUE ZERO.
           05  WS-XTAB-DEL-BRCH-CNT     PIC 9(7)  VALUE ZERO.
           05  WS-XTAB-DEL-SALE-CNT     PIC 9(7)  VALUE ZERO.
           05  WS-XTAB-INS-BRCH-CNT     PIC 9(7)  VALUE ZERO.
           05  WS-XTAB-INS-SALE-CNT     PIC 9(7)  VALUE ZERO.
            
           05  WS-TTAB-NOMAT-CNT        PIC 9(7)  VALUE ZERO.
            
           05  WS-CLI-ADDR-TYP-CD       PIC X(2).
            
           05  WS-POL-COMMIT-CNT        PIC 9(7)  VALUE ZERO.
            
           05  WS-CLIENT-TYPE           PIC X(1).
               88  WS-CLIENT-TYPE-BRCH  VALUE 'B'. 
               88  WS-CLIENT-TYPE-SALE  VALUE 'S'. 
               88  WS-CLIENT-TYPE-CLIG  VALUE 'G'. 
            
           05  WS-ORIG-CLI-ID           PIC X(10).
           05  WS-NEW-CLI-ID            PIC X(10).
            
           05  WS-TIME                  PIC 9(8).
            
      *
      * INTERNAL DEFINITION OF THE BATCH CONTROL RECORD
      *
       01  WS-CNVR-CTL.
           05  F                        PIC X(20).
           05  F                        PIC X(06).
           05  WS-CNVR-PHASE            PIC X(1).
               88  WS-CNVR-PHASE-VALID  VALUE 'A',
                                              'B',
                                              'C',
                                              'D'.
           05  F                        PIC X(08).
           05  WS-CNVR-RUN-TYPE         PIC X(1).
               88 WS-CNVR-RUN-TYPE-LIVE VALUE 'Y'.
               88 WS-CNVR-RUN-TYPE-TEST VALUE 'N'.
                                               
      *
      * DEFINITION OF THE BATCH CONTROL TABLE SWITCH RECORDS
      *
       01  WS-CNVR-TBL-SWITCH.
           05  WS-CNVR-TBL-ABBR         PIC X(4).
               88  WS-CNVR-TBL-ABBR-VALID VALUE 'BRCH',
                                                'SALE',
                                                'AG  ',
                                                'POL ',
                                                'SPOL',
                                                'USEC',
                                                'UWAS',
                                                'CLI ',
                                                'POLC',
                                                'PHST',
                                                'HI  ',
                                                'XTAB'.
               88  WS-CNVR-TBL-ABBR-BRCH  VALUE 'BRCH'.
               88  WS-CNVR-TBL-ABBR-SALE  VALUE 'SALE'.
               88  WS-CNVR-TBL-ABBR-AG    VALUE 'AG  '.
               88  WS-CNVR-TBL-ABBR-POL   VALUE 'POL '.
               88  WS-CNVR-TBL-ABBR-SPOL  VALUE 'SPOL'.
               88  WS-CNVR-TBL-ABBR-USEC  VALUE 'USEC'.
               88  WS-CNVR-TBL-ABBR-UWAS  VALUE 'UWAS'.
               88  WS-CNVR-TBL-ABBR-CLI   VALUE 'CLI '.
               88  WS-CNVR-TBL-ABBR-POLC  VALUE 'POLC'.
               88  WS-CNVR-TBL-ABBR-PHST  VALUE 'PHST'.
               88  WS-CNVR-TBL-ABBR-HI    VALUE 'HI  '.
               88  WS-CNVR-TBL-ABBR-XTAB  VALUE 'XTAB'.
                
           05  F                        PIC X(3).
           05  WS-CNVR-TBL-SW           PIC X(1).
               88  WS-CNVR-TBL-BRCH-YES VALUE 'Y'.
               88  WS-CNVR-TBL-BRCH-NO  VALUE 'N'.
           05  F                        PIC X(1).
           05  WS-CNVR-HI-LO            PIC X(8).
           05  F                        PIC X(1).
           05  WS-CNVR-HI-HIGH          PIC X(8).
      /
      *****************************************************************
      *     COMMON COPYBOOKS                                          *
      *****************************************************************

       COPY CCWLPGA.
      / 
       COPY CCWWCCC.
      / 
       COPY CCWWINDX.
      /
       COPY XCWWWKDT.
      /
       COPY XCWWTIME.
      / 
       COPY XCWLDTLK.
      /
       COPY XCWTFCMD.
      /
       COPY CCWWAT77.
       COPY CCWWAT88.
       COPY CCWWAT99.
        
      *****************************************************************
      *     I/O COPYBOOKS                                             *
      *****************************************************************

       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       COPY CCFRHI.
       COPY CCFWHI.
      /
       COPY CCFRBRCH.
       COPY CCFWBRCH.
      /
       COPY CCFRAG.
       COPY CCFWAG.
      /
       COPY CCFRSALE.
       COPY CCFWSALE.
      /
       COPY CCFRPOL.
       COPY CCFWPOL.
      /
       COPY CCFRSPOL.
       COPY CCFWSPOL.
      /
       COPY XCFRUSEC.
       COPY XCFWUSEC.
      /
       COPY NCFRUWAS.
       COPY NCFWUWAS.
      /
       COPY CCFRCLI.
       COPY CCFWCLI.
       COPY CCFRCLIA.
       COPY CCFWCLIA.
       COPY CCFRCLNC.
       COPY CCFWCLNC.
       COPY CCFRCLIG.
       COPY CCFWCLIG.
       COPY CCFRRL.
       COPY CCFWRL.
       COPY CCFRPOLC.
       COPY CCFWPOLC.
      /
       COPY NCFRTTAB.
       COPY NCFWTTAB.
      /
       COPY XCFRXTAB.
       COPY XCFWXTAB.
      /
      *****************************************************************
      *     CALLED MODULES                                            *
      *****************************************************************
      
       COPY XCWL0040.
      /
       COPY XCWL0270.
      /
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
        
       COPY XCWL0035.
        
      /
      ********************
       PROCEDURE DIVISION.
      ********************

      *----------------
       0000-MAINLINE.
      *----------------

           PERFORM 0100-OPEN-FILES
              THRU 0100-OPEN-FILES-X.
 
           PERFORM 2000-INITIALIZE
              THRU 2000-INITIALIZE-X.

           PERFORM 3000-CONVERT          
              THRU 3000-CONVERT-X.

           PERFORM 9000-PRINT-STATS
              THRU 9000-PRINT-STATS-X.
 
           PERFORM 9999-CLOSE-FILES
              THRU 9999-CLOSE-FILES-X.

P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------
 
           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM BCF-1000-OPEN-INPUT
              THRU BCF-1000-OPEN-INPUT-X.
 
      *
      * OPEN FILE OF ADDITIONAL MAPPING DATA
      *
           OPEN INPUT ZMAP-DATA-FILE.
            
           IF NOT WZMAP-SEQ-IO-OK 
               MOVE  'ZSFIIA0020'          TO  WGLOB-MSG-REF-INFO
               MOVE  WZMAP-SEQ-FILE-STATUS TO  WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-3000-QSAM-ERROR
                   THRU 0030-3000-QSAM-ERROR-X
           END-IF.
            
      *
      * LOAD ADDITIONAL MAPPING DATA
      *
           READ ZMAP-DATA-FILE INTO ZMAP-REC.
            
           IF NOT WZMAP-SEQ-IO-OK 
               MOVE  'ZSFIIA0021'          TO  WGLOB-MSG-REF-INFO
               MOVE  WZMAP-SEQ-FILE-STATUS TO  WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-3000-QSAM-ERROR
                   THRU 0030-3000-QSAM-ERROR-X
           END-IF.
            
           PERFORM 0110-LOAD-ZMAP
              THRU 0110-LOAD-ZMAP-X
                   UNTIL WZMAP-SEQ-IO-EOF.
 
       0100-OPEN-FILES-X.
           EXIT.

      /
      *---------------
       0110-LOAD-ZMAP.
      *---------------

           ADD 1 TO WS-ZMAP-CNT.
            
           MOVE ZMAP-DATA TO WZMAP-DATA (WS-ZMAP-CNT).
 
           READ ZMAP-DATA-FILE INTO ZMAP-REC.
            
           IF  NOT WZMAP-SEQ-IO-OK 
           AND NOT WZMAP-SEQ-IO-EOF
               MOVE  'ZSFIIA0021'          TO  WGLOB-MSG-REF-INFO
               MOVE  WZMAP-SEQ-FILE-STATUS TO  WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-3000-QSAM-ERROR
                   THRU 0030-3000-QSAM-ERROR-X
           END-IF.
            
       0110-LOAD-ZMAP-X.
           EXIT.
      /
      *----------------
       2000-INITIALIZE.
      *----------------
 
           MOVE SPACES  TO WGLOB-COMPANY-CODE.

      **   READ THE COMPANY CONTROL CARD     
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.
                
           MOVE WCCC-COMPANY-CONTROL-RECORD TO WS-CNVR-CTL. 
 
      *
      * VALIDATE PHASE LETTER
      *
           IF NOT WS-CNVR-PHASE-VALID
               MOVE  'ZSFIIA0004'       TO  WGLOB-MSG-REF-INFO
               MOVE  WS-CNVR-PHASE      TO  WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.
        
      *
      * VALIDATE RUN TYPE
      *
           IF  NOT WS-CNVR-RUN-TYPE-LIVE
           AND NOT WS-CNVR-RUN-TYPE-TEST
               MOVE  'ZSFIIA0012'       TO  WGLOB-MSG-REF-INFO
               MOVE  WS-CNVR-RUN-TYPE   TO  WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.
                                  
           PERFORM 11 TIMES
            
             PERFORM 2010-GET-TBL-SWITCH
                THRU 2010-GET-TBL-SWITCH-X
               
           END-PERFORM.
 
 
           IF WS-BRCH-SW-INVALID
           OR WS-SALE-SW-INVALID
           OR WS-AG-SW-INVALID
           OR WS-POL-SW-INVALID
           OR WS-SPOL-SW-INVALID
           OR WS-USEC-SW-INVALID
           OR WS-UWAS-SW-INVALID
           OR WS-CLI-SW-INVALID
           OR WS-POLC-SW-INVALID
           OR WS-PHST-SW-INVALID
           OR WS-XTAB-SW-INVALID
               MOVE  'ZSFIIA0008'       TO  WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.
            
      *
      * VALIDATE HI TABLE PROCESSING RANGE
      *
      *    IF  (    WS-HI-SW-Y ) 
      *    AND (    WS-HI-LO-X   NOT NUMERIC
      *          OR WS-HI-HIGH-X NOT NUMERIC )
      *    OR  (    WS-HI-LO   = ZERO
      *          OR WS-HI-HIGH = ZERO )
      *        MOVE  'ZSFIIA0006'         TO  WGLOB-MSG-REF-INFO
      *        PERFORM  0260-1000-GENERATE-MESSAGE
      *            THRU 0260-1000-GENERATE-MESSAGE-X
      *        PERFORM  0030-5000-LOGIC-ERROR
      *            THRU 0030-5000-LOGIC-ERROR-X
      *    END-IF.
      *
      *    IF WS-HI-LO > WS-HI-HIGH  
      *        MOVE  'ZSFIIA0007'    TO  WGLOB-MSG-REF-INFO
      *        MOVE  WS-HI-LO        TO  WGLOB-MSG-PARM (1)
      *        MOVE  WS-HI-HIGH      TO  WGLOB-MSG-PARM (2)
      *        PERFORM  0260-1000-GENERATE-MESSAGE
      *            THRU 0260-1000-GENERATE-MESSAGE-X
      *        PERFORM  0030-5000-LOGIC-ERROR
      *            THRU 0030-5000-LOGIC-ERROR-X
      *    END-IF.
 
 
           PERFORM  0950-0000-INIT-PARM-INFO
            
               THRU 0950-0000-INIT-PARM-INFO-X.
                
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE L0950-COMPANY-NAME      TO L0040-COMPANY-NAME.

           PERFORM  2100-INIT-OCF-TITLES
               THRU 2100-INIT-OCF-TITLES-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.

       2000-INITIALIZE-X.
           EXIT.
       
      /
      *---------------------
       2010-GET-TBL-SWITCH.
      *---------------------

           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF  NOT WBCF-SEQ-IO-OK
               MOVE  'ZSFIIA0008'       TO  WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

           MOVE RBCF-SEQ-REC-INFO TO WS-CNVR-TBL-SWITCH.
            
           ADD 1 TO WS-CNVR-TBL-CNT.

      *
      * VALIDATE THE TABLE ABBREVIATION
      *
           IF  NOT WS-CNVR-TBL-ABBR-VALID
               MOVE  'ZSFIIA0005'       TO  WGLOB-MSG-REF-INFO
               MOVE  WS-CNVR-TBL-ABBR   TO  WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

      *
      * VALIDATE THE TABLE SWITCH
      *
           IF  NOT WS-CNVR-TBL-BRCH-YES
           AND NOT WS-CNVR-TBL-BRCH-NO
               MOVE  'ZSFIIA0005'       TO  WGLOB-MSG-REF-INFO
               MOVE  WS-CNVR-TBL-ABBR   TO  WGLOB-MSG-PARM (1)
               MOVE  WS-CNVR-TBL-SW     TO  WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.
            
           EVALUATE TRUE
            
           WHEN WS-CNVR-TBL-ABBR-BRCH
                MOVE WS-CNVR-TBL-SW  TO WS-BRCH-SW
                IF  NOT WS-BRCH-SW-Y
                AND NOT WS-BRCH-SW-N
                    SET WS-BRCH-SW-INVALID TO TRUE
                END-IF
           WHEN WS-CNVR-TBL-ABBR-SALE  
                MOVE WS-CNVR-TBL-SW  TO WS-SALE-SW
                IF  NOT WS-SALE-SW-Y
                AND NOT WS-SALE-SW-N
                    SET WS-SALE-SW-INVALID TO TRUE
                END-IF
           WHEN WS-CNVR-TBL-ABBR-AG  
                MOVE WS-CNVR-TBL-SW  TO WS-AG-SW
                IF  NOT WS-AG-SW-Y
                AND NOT WS-AG-SW-N
                    SET WS-AG-SW-INVALID TO TRUE
                END-IF
           WHEN WS-CNVR-TBL-ABBR-POL   
                MOVE WS-CNVR-TBL-SW  TO WS-POL-SW
                IF  NOT WS-POL-SW-Y
                AND NOT WS-POL-SW-N
                    SET WS-POL-SW-INVALID TO TRUE
                END-IF
           WHEN WS-CNVR-TBL-ABBR-SPOL  
                MOVE WS-CNVR-TBL-SW  TO WS-SPOL-SW
                IF  NOT WS-SPOL-SW-Y
                AND NOT WS-SPOL-SW-N
                    SET WS-SPOL-SW-INVALID TO TRUE
                END-IF
           WHEN WS-CNVR-TBL-ABBR-USEC  
                MOVE WS-CNVR-TBL-SW  TO WS-USEC-SW
                IF  NOT WS-USEC-SW-Y
                AND NOT WS-USEC-SW-N
                    SET WS-USEC-SW-INVALID TO TRUE
                END-IF
           WHEN WS-CNVR-TBL-ABBR-UWAS  
                MOVE WS-CNVR-TBL-SW  TO WS-UWAS-SW
                IF  NOT WS-UWAS-SW-Y
                AND NOT WS-UWAS-SW-N
                    SET WS-UWAS-SW-INVALID TO TRUE
                END-IF
           WHEN WS-CNVR-TBL-ABBR-CLI   
                MOVE WS-CNVR-TBL-SW  TO WS-CLI-SW
                IF  NOT WS-CLI-SW-Y
                AND NOT WS-CLI-SW-N
                    SET WS-CLI-SW-INVALID TO TRUE
                END-IF
           WHEN WS-CNVR-TBL-ABBR-POLC  
                MOVE WS-CNVR-TBL-SW  TO WS-POLC-SW
                IF  NOT WS-POLC-SW-Y
                AND NOT WS-POLC-SW-N
                    SET WS-POLC-SW-INVALID TO TRUE
                END-IF
           WHEN WS-CNVR-TBL-ABBR-PHST  
                MOVE WS-CNVR-TBL-SW  TO WS-PHST-SW
                IF  NOT WS-PHST-SW-Y
                AND NOT WS-PHST-SW-N
                    SET WS-PHST-SW-INVALID TO TRUE
                END-IF
           WHEN WS-CNVR-TBL-ABBR-HI    
                MOVE WS-CNVR-TBL-SW  TO WS-HI-SW
                IF  NOT WS-HI-SW-Y
                AND NOT WS-HI-SW-N
                    SET WS-HI-SW-INVALID TO TRUE
                END-IF
                MOVE WS-CNVR-HI-LO   TO WS-HI-LO-X
                MOVE WS-CNVR-HI-HIGH TO WS-HI-HIGH-X
           WHEN WS-CNVR-TBL-ABBR-XTAB  
                MOVE WS-CNVR-TBL-SW  TO WS-XTAB-SW
                IF  NOT WS-XTAB-SW-Y
                AND NOT WS-XTAB-SW-N
                    SET WS-XTAB-SW-INVALID TO TRUE
                END-IF
 
           END-EVALUATE.
            
       2010-GET-TBL-SWITCH-X.
           EXIT.
      /
      *---------------------
       2100-INIT-OCF-TITLES.
      *---------------------
       
      * SET UP THE TITLE/HEADING LINES FOR THE OCF REPORT
       
           MOVE ZERO                    TO L0040-ERROR-CNT.
 
      **   GET THE SYSTEM ID
           MOVE 'CS00000056'            TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT           TO L0040-SYSTEM-ID.
 
      **   GET THE PROGRAM DESCRIPTION
           MOVE 'ZSFIIA0001'            TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT           TO L0040-PROGRAM-DESC.
 
      **   GET THE 'RUN MESSAGES' MESSAGE TEXT
           MOVE 'ZSFIIA0002'            TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT           TO L0040-HDG-LINE-3.
 
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.
       
       2100-INIT-OCF-TITLES-X.
           EXIT.

      /
      *-------------
       3000-CONVERT.           
      *-------------

           IF WS-BRCH-SW-Y
              ACCEPT WS-TIME FROM TIME
              MOVE  'ZSFIIA0019'       TO  WGLOB-MSG-REF-INFO
              MOVE  'BRCH'             TO  WGLOB-MSG-PARM (1)
              MOVE  WS-TIME            TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 4000-ADD-BRANCHES
                 THRU 4000-ADD-BRANCHES-X
              PERFORM 4100-DELETE-BRANCHES
                 THRU 4100-DELETE-BRANCHES-X
              PERFORM 0035-1000-COMMIT
                 THRU 0035-1000-COMMIT-X
           END-IF.

           IF WS-SALE-SW-Y
              ACCEPT WS-TIME FROM TIME
              MOVE  'ZSFIIA0019'       TO  WGLOB-MSG-REF-INFO
              MOVE  'SALE'             TO  WGLOB-MSG-PARM (1)
              MOVE  WS-TIME            TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 4700-ADD-SOS
                 THRU 4700-ADD-SOS-X
              PERFORM 4800-DELETE-SOS
                 THRU 4800-DELETE-SOS-X
              PERFORM 0035-1000-COMMIT
                 THRU 0035-1000-COMMIT-X
           END-IF.
            
           IF WS-AG-SW-Y
              ACCEPT WS-TIME FROM TIME
              MOVE  'ZSFIIA0019'       TO  WGLOB-MSG-REF-INFO
              MOVE  'AG  '             TO  WGLOB-MSG-PARM (1)
              MOVE  WS-TIME            TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 4200-CONVERT-AG-TBL  
                 THRU 4200-CONVERT-AG-TBL-X
              PERFORM 0035-1000-COMMIT
                 THRU 0035-1000-COMMIT-X
           END-IF.
            
           IF WS-POL-SW-Y
              ACCEPT WS-TIME FROM TIME
              MOVE  'ZSFIIA0019'       TO  WGLOB-MSG-REF-INFO
              MOVE  'POL '             TO  WGLOB-MSG-PARM (1)
              MOVE  WS-TIME            TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 4300-CONVERT-POL-TBL  
                 THRU 4300-CONVERT-POL-TBL-X
              PERFORM 0035-1000-COMMIT
                 THRU 0035-1000-COMMIT-X
           END-IF.
            
           IF WS-SPOL-SW-Y
              ACCEPT WS-TIME FROM TIME
              MOVE  'ZSFIIA0019'       TO  WGLOB-MSG-REF-INFO
              MOVE  'SPOL'             TO  WGLOB-MSG-PARM (1)
              MOVE  WS-TIME            TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 4400-CONVERT-SPOL-TBL  
                 THRU 4400-CONVERT-SPOL-TBL-X
              PERFORM 0035-1000-COMMIT
                 THRU 0035-1000-COMMIT-X
           END-IF.
            
           IF WS-USEC-SW-Y
              ACCEPT WS-TIME FROM TIME
              MOVE  'ZSFIIA0019'       TO  WGLOB-MSG-REF-INFO
              MOVE  'USEC'             TO  WGLOB-MSG-PARM (1)
              MOVE  WS-TIME            TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 4500-CONVERT-USEC-TBL  
                 THRU 4500-CONVERT-USEC-TBL-X
              PERFORM 0035-1000-COMMIT
                 THRU 0035-1000-COMMIT-X
           END-IF.
            
           IF WS-UWAS-SW-Y
              ACCEPT WS-TIME FROM TIME
              MOVE  'ZSFIIA0019'       TO  WGLOB-MSG-REF-INFO
              MOVE  'UWAS'             TO  WGLOB-MSG-PARM (1)
              MOVE  WS-TIME            TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 4600-DELETE-UWAS-TBL  
                 THRU 4600-DELETE-UWAS-TBL-X
              PERFORM 0035-1000-COMMIT
                 THRU 0035-1000-COMMIT-X
           END-IF.
            
           IF WS-CLI-SW-Y
              ACCEPT WS-TIME FROM TIME
              MOVE  'ZSFIIA0019'       TO  WGLOB-MSG-REF-INFO
              MOVE  'CLI (ADD)'        TO  WGLOB-MSG-PARM (1)
              MOVE  WS-TIME            TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 6000-ADD-CLIENTS 
                 THRU 6000-ADD-CLIENTS-X
              ACCEPT WS-TIME FROM TIME
              MOVE  'ZSFIIA0019'       TO  WGLOB-MSG-REF-INFO
              MOVE  'CLI (DELETE)'        TO  WGLOB-MSG-PARM (1)
              MOVE  WS-TIME            TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 6100-DELETE-CLIENTS
                 THRU 6100-DELETE-CLIENTS-X
              PERFORM 0035-1000-COMMIT
                 THRU 0035-1000-COMMIT-X
           END-IF.
            
           IF WS-POLC-SW-Y
              ACCEPT WS-TIME FROM TIME
              MOVE  'ZSFIIA0019'       TO  WGLOB-MSG-REF-INFO
              MOVE  'POLC'             TO  WGLOB-MSG-PARM (1)
              MOVE  WS-TIME            TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 6500-CONVERT-POLC-TBL 
                 THRU 6500-CONVERT-POLC-TBL-X
              PERFORM 0035-1000-COMMIT
                 THRU 0035-1000-COMMIT-X
           END-IF.
            
           IF WS-XTAB-SW-Y
              ACCEPT WS-TIME FROM TIME
              MOVE  'ZSFIIA0019'       TO  WGLOB-MSG-REF-INFO
              MOVE  'XTAB'             TO  WGLOB-MSG-PARM (1)
              MOVE  WS-TIME            TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 5000-ADD-BR-XTABS
                 THRU 5000-ADD-BR-XTABS-X
              PERFORM 5100-DELETE-BR-XTABS
                 THRU 5100-DELETE-BR-XTABS-X
              PERFORM 5300-ADD-SO-XTABS
                 THRU 5300-ADD-SO-XTABS-X
              PERFORM 5400-DELETE-SO-XTABS
                 THRU 5400-DELETE-SO-XTABS-X
              PERFORM 0035-1000-COMMIT
                 THRU 0035-1000-COMMIT-X
           END-IF.
            
       3000-CONVERT-X.
           EXIT.
            
      /
      *------------------
       4000-ADD-BRANCHES.           
      *------------------
            
           MOVE LOW-VALUES  TO WTTAB-KEY.
           MOVE HIGH-VALUES TO WTTAB-ENDBR-KEY.
P00916*    MOVE 'FIIBA'     TO WTTAB-ETBL-TYP-ID
P00916*                        WTTAB-ENDBR-ETBL-TYP-ID.
P00916     STRING 'FIIB'        DELIMITED BY SIZE 
P00916            WS-CNVR-PHASE DELIMITED BY SIZE 
P00916            INTO WTTAB-ETBL-TYP-ID.
P00916
P00916     STRING 'FIIB'        DELIMITED BY SIZE 
P00916            WS-CNVR-PHASE DELIMITED BY SIZE 
P00916            INTO WTTAB-ENDBR-ETBL-TYP-ID.
 
           PERFORM TTAB-1000-BROWSE
              THRU TTAB-1000-BROWSE-X.
              
           PERFORM TTAB-2000-READ-NEXT
              THRU TTAB-2000-READ-NEXT-X.
              
           IF WTTAB-IO-OK    
              PERFORM 4020-ADD-BRANCH 
                 THRU 4020-ADD-BRANCH-X 
                      UNTIL WTTAB-IO-EOF
           END-IF.
                  
           PERFORM TTAB-3000-END-BROWSE
              THRU TTAB-3000-END-BROWSE-X.
               
       4000-ADD-BRANCHES-X.
           EXIT.

      /
      *----------------------
       4020-ADD-BRANCH.           
      *----------------------
       
      ****************************************************************
      ****************************************************************
      * TEMP CODE                                                    *
      ****************************************************************
      ****************************************************************
      *     IF RTTAB-ETBL-VALU-ID (1:2) NOT = 'AT'
      *        PERFORM TTAB-2000-READ-NEXT
      *           THRU TTAB-2000-READ-NEXT-X
      *        GO TO 4020-ADD-BRANCH-X
      *     END-IF.
            
      *
      * IF THE DESTINATION BRANCH IS IS THE SAME AS THE SOURCE BRANCH ID
      * THEN THERE IS NO BRANCH TO ADD SO GET THE NEXT TTAB AND EXIT
      *
        IF RTTAB-TTBL-VALU-TXT (1:3) = RTTAB-ETBL-VALU-ID (1:3)     
           PERFORM TTAB-2000-READ-NEXT
              THRU TTAB-2000-READ-NEXT-X
           GO TO 4020-ADD-BRANCH-X
        END-IF.
         
      *
      * IF THE NEW BRANCH IS ALREADY IN THE DATABASE THEN EXIT
      *
        MOVE RTTAB-TTBL-VALU-TXT (1:3) TO WBRCH-BR-ID.

        PERFORM BRCH-1000-READ
           THRU BRCH-1000-READ-X.

        IF WBRCH-IO-OK
           PERFORM TTAB-2000-READ-NEXT
              THRU TTAB-2000-READ-NEXT-X
           GO TO 4020-ADD-BRANCH-X
        END-IF.
            
      *
      * IF LIVE RUN THEN ADD THE NEW BRANCH
      *
        ADD 1 TO WS-BRCH-INS-CNT
        MOVE RTTAB-TTBL-VALU-TXT (1:3)   TO RBRCH-BR-ID
        MOVE SPACES                      TO RBRCH-CLI-ID
        STRING "B"                          DELIMITED BY SIZE
               RTTAB-TTBL-VALU-TXT (1:3)    DELIMITED BY SIZE
                                       INTO RBRCH-CLI-ID
        MOVE 'PR'                        TO RBRCH-CLI-ADDR-TYP-CD
         
        IF WS-CNVR-RUN-TYPE-LIVE
           PERFORM BRCH-1000-WRITE
              THRU BRCH-1000-WRITE-X
        END-IF.
            
        PERFORM TTAB-2000-READ-NEXT
           THRU TTAB-2000-READ-NEXT-X.
               
       4020-ADD-BRANCH-X.
           EXIT.
      /
      *-------------------------
       4100-DELETE-BRANCHES.           
      *-------------------------

           MOVE LOW-VALUES  TO WBRCH-KEY.
           MOVE HIGH-VALUES TO WBRCH-ENDBR-KEY.
 
           PERFORM BRCH-1000-BROWSE
              THRU BRCH-1000-BROWSE-X.
              
           PERFORM BRCH-2000-READ-NEXT
              THRU BRCH-2000-READ-NEXT-X.
              
           IF WBRCH-IO-OK    
              PERFORM 4120-DELETE-BRANCH
                 THRU 4120-DELETE-BRANCH-X 
                      UNTIL WBRCH-IO-EOF
           END-IF.
                  
           PERFORM BRCH-3000-END-BROWSE
              THRU BRCH-3000-END-BROWSE-X.
                                     
       4100-DELETE-BRANCHES-X.
           EXIT.
      /
      *-------------------
       4120-DELETE-BRANCH.           
      *-------------------
 
      ****************************************************************
      ****************************************************************
      * TEMP CODE                                                    *
      ****************************************************************
      ****************************************************************
      *     IF RBRCH-BR-ID (1:2) NOT = 'AT'
      *        PERFORM BRCH-2000-READ-NEXT
      *           THRU BRCH-2000-READ-NEXT-X
      *        GO TO 4120-DELETE-BRANCH-X
      *     END-IF.
            
      *
      * ASSEMBLE KEY INTO TTAB AND GET THE BRANCH MAPPING DATA                  
      *
           MOVE RBRCH-BR-ID (1:3) TO WTTAB-ETBL-VALU-ID.  
            
           PERFORM FIIB-1000-EDIT
              THRU FIIB-1000-EDIT-X.
               
      *
      * IF THE CURRENT BRANCH ID IS NOT ON TTAB THEN ISSUE A MESSAGE
      * AND MOVE ON TO THE NEXT BRANCH
      *
           IF WTTAB-IO-NOT-FOUND  
      *        ADD 1 TO WS-BRCH-NOMAT-CNT
      *        MOVE  'ZSFIIA0003'        TO  WGLOB-MSG-REF-INFO
      *        MOVE  'BRCH'              TO  WGLOB-MSG-PARM (1)
      *        MOVE  RTTAB-ETBL-VALU-ID  TO  WGLOB-MSG-PARM (2)
      *        PERFORM  0260-1000-GENERATE-MESSAGE
      *            THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM BRCH-2000-READ-NEXT
                 THRU BRCH-2000-READ-NEXT-X
              GO TO 4120-DELETE-BRANCH-X
           END-IF.
               
      *
      * IF CURRENT VALUE = NEW VALUE ON TTAB THEN THE CURRENT VALUE
      * REPRESENTS AN ENTITY THAT IS REMAINING OPEN SO DO NOTHING
      *
           IF RBRCH-BR-ID (1:3) = RTTAB-TTBL-VALU-TXT (1:3) 
              PERFORM BRCH-2000-READ-NEXT
                 THRU BRCH-2000-READ-NEXT-X
              GO TO 4120-DELETE-BRANCH-X
           END-IF.
            
      *
      * IF LIVE RUN THEN DELETE THE OLD BRANCH
      *
           MOVE RBRCH-BR-ID TO WBRCH-BR-ID.

           PERFORM  BRCH-1000-READ-FOR-UPDATE
               THRU BRCH-1000-READ-FOR-UPDATE-X.

           IF WBRCH-IO-OK
              ADD 1 TO WS-BRCH-DEL-CNT
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM BRCH-1000-DELETE
                    THRU BRCH-1000-DELETE-X
              ELSE
                 PERFORM BRCH-3000-UNLOCK
                    THRU BRCH-3000-UNLOCK-X
              END-IF
           END-IF.
            
           PERFORM BRCH-2000-READ-NEXT
              THRU BRCH-2000-READ-NEXT-X.
            
       4120-DELETE-BRANCH-X.
           EXIT.
      /
      *--------------------
       4200-CONVERT-AG-TBL.       
      *--------------------

           MOVE LOW-VALUES  TO WAG-KEY.
           MOVE HIGH-VALUES TO WAG-ENDBR-KEY.
 
           PERFORM AG-1000-BROWSE
              THRU AG-1000-BROWSE-X.
              
           PERFORM AG-2000-READ-NEXT
              THRU AG-2000-READ-NEXT-X.
              
           IF WAG-IO-OK    
              PERFORM 4220-CONVERT-AG-ROW
                 THRU 4220-CONVERT-AG-ROW-X 
                      UNTIL WAG-IO-EOF
           END-IF.
                  
           PERFORM AG-3000-END-BROWSE
              THRU AG-3000-END-BROWSE-X.
            
       4200-CONVERT-AG-TBL-X.    
           EXIT.
      /
      *--------------------
       4220-CONVERT-AG-ROW.       
      *--------------------
       
      *
      * ASSEMBLE KEY INTO TTAB AND GET THE MAPPING DATA                  
      *
           MOVE SPACES TO WTTAB-ETBL-VALU-ID.  
           STRING RAG-BR-ID (1:3) DELIMITED BY SIZE 
                  RAG-SO-ID (1:3) DELIMITED BY SIZE 
                  INTO WTTAB-ETBL-VALU-ID.  
            
           PERFORM FIIC-1000-EDIT
              THRU FIIC-1000-EDIT-X.
               
      *
      * IF THE CURRENT BR/SO ID IS NOT ON TTAB THEN ISSUE A MESSAGE
      * AND MOVE ON TO THE NEXT AGENT
      *
           IF WTTAB-IO-NOT-FOUND  
              ADD 1 TO WS-AG-NOMAT-CNT
              MOVE  'ZSFIIA0003'        TO  WGLOB-MSG-REF-INFO
              STRING 'AG '              DELIMITED BY SIZE
                     RAG-AGT-ID         DELIMITED BY SIZE
                     INTO                   WGLOB-MSG-PARM (1)
              MOVE  WTTAB-ETBL-VALU-ID  TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM AG-2000-READ-NEXT
                 THRU AG-2000-READ-NEXT-X
              GO TO 4220-CONVERT-AG-ROW-X
           END-IF.
               
      *
      * IF CURRENT VALUE = NEW VALUE ON TTAB THEN THE CURRENT VALUE
      * REPRESENTS AN ENTITY THAT IS REMAINING OPEN SO DO NOTHING
      *
           IF WTTAB-ETBL-VALU-ID (1:6) = RTTAB-TTBL-VALU-TXT (1:6) 
              PERFORM AG-2000-READ-NEXT
                 THRU AG-2000-READ-NEXT-X
              GO TO 4220-CONVERT-AG-ROW-X
           END-IF.
            
      *
      * IF THE BRANCH ID HAS CHANGED ENSURE THE NEW VALUE IS ON BRCH
      *
           IF RTTAB-TTBL-VALU-TXT (1:3) <> RAG-BR-ID  
              MOVE RTTAB-TTBL-VALU-TXT (1:3) TO WBRCH-BR-ID
              PERFORM BRCH-1000-READ 
                 THRU BRCH-1000-READ-X
              IF WBRCH-IO-NOT-FOUND
                 ADD 1 TO WS-TTAB-NOMAT-CNT
                 MOVE  'ZSFIIA0015'        TO  WGLOB-MSG-REF-INFO
                 MOVE  'BRANCH'            TO  WGLOB-MSG-PARM (1)
                 MOVE  RTTAB-TTBL-VALU-TXT (1:3) TO  WGLOB-MSG-PARM (2)
                 PERFORM 0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X
                 PERFORM AG-2000-READ-NEXT
                    THRU AG-2000-READ-NEXT-X
                 GO TO 4220-CONVERT-AG-ROW-X
              END-IF
           END-IF.
            
      *
      * ENSURE THE NEW SALES OFFICE ID ON SALE
      *
           MOVE RTTAB-TTBL-VALU-TXT (1:3) TO WSALE-BR-ID.
           MOVE RTTAB-TTBL-VALU-TXT (4:3) TO WSALE-SO-ID.
            
           PERFORM SALE-1000-READ 
              THRU SALE-1000-READ-X
               
           IF WSALE-IO-NOT-FOUND
              ADD 1 TO WS-TTAB-NOMAT-CNT
              MOVE  'ZSFIIA0015'        TO  WGLOB-MSG-REF-INFO
              MOVE  'SALES OFFICE'      TO  WGLOB-MSG-PARM (1)
              STRING WSALE-BR-ID (1:3)  DELIMITED BY SIZE
                     WSALE-SO-ID (1:3)  DELIMITED BY SIZE
                     INTO  WGLOB-MSG-PARM (2)
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM AG-2000-READ-NEXT
                 THRU AG-2000-READ-NEXT-X
              GO TO 4220-CONVERT-AG-ROW-X
           END-IF.
       
      *
      * IF LIVE RUN THEN UPDATE THE AGENT
      *
           MOVE RAG-AGT-ID TO WAG-AGT-ID.

           PERFORM  AG-1000-READ-FOR-UPDATE
               THRU AG-1000-READ-FOR-UPDATE-X.

           IF WAG-IO-OK
              ADD 1 TO WS-AG-UPD-CNT
              IF RTTAB-TTBL-VALU-TXT (1:3) <> RAG-BR-ID  
                 MOVE RAG-BR-ID TO RAG-PREV-BR-ID
              END-IF
              IF RTTAB-TTBL-VALU-TXT (4:3) <> RAG-SO-ID  
                 MOVE RAG-SO-ID TO RAG-PREV-SO-ID
              END-IF
              MOVE RTTAB-TTBL-VALU-TXT (1:3) TO RAG-BR-ID
              MOVE RTTAB-TTBL-VALU-TXT (4:3) TO RAG-SO-ID
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM AG-2000-REWRITE
                    THRU AG-2000-REWRITE-X
              ELSE
                 PERFORM AG-3000-UNLOCK
                    THRU AG-3000-UNLOCK-X
              END-IF
           END-IF.
            
           PERFORM AG-2000-READ-NEXT
              THRU AG-2000-READ-NEXT-X.
 
            
       4220-CONVERT-AG-ROW-X.    
           EXIT.
 
      /
      *---------------------
       4300-CONVERT-POL-TBL.       
      *---------------------

           MOVE LOW-VALUES  TO WPOL-KEY.
           MOVE HIGH-VALUES TO WPOL-ENDBR-KEY.
 
           PERFORM POL-1000-TBL-BROWSE
              THRU POL-1000-TBL-BROWSE-X.
              
           PERFORM POL-2000-TBL-READ-NEXT
              THRU POL-2000-TBL-READ-NEXT-X.
              
           IF WPOL-IO-OK    
              PERFORM 4320-CONVERT-POL-ROW
                 THRU 4320-CONVERT-POL-ROW-X 
                      UNTIL WPOL-IO-EOF
           END-IF.
                  
           PERFORM POL-3000-TBL-END-BROWSE
              THRU POL-3000-TBL-END-BROWSE-X.
               
       4300-CONVERT-POL-TBL-X.    
           EXIT.
            
      /
      *---------------------
       4320-CONVERT-POL-ROW.       
      *---------------------
 
      * 
      * GET THE POLICY'S SERVICING AGENT
      *
           MOVE RPOL-SERV-AGT-ID TO WAG-AGT-ID.
            
           PERFORM AG-1000-READ
              THRU AG-1000-READ-X.
               
           IF WAG-IO-NOT-FOUND
              ADD 1 TO WS-POL-NOAG-CNT
              MOVE  'ZSFIIA0016'        TO  WGLOB-MSG-REF-INFO
              MOVE  RPOL-POL-ID         TO  WGLOB-MSG-PARM (1)
              MOVE  WAG-AGT-ID          TO  WGLOB-MSG-PARM (2)
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM POL-2000-TBL-READ-NEXT
                 THRU POL-2000-TBL-READ-NEXT-X
              GO TO 4320-CONVERT-POL-ROW-X
           END-IF.
            
 
      * 
      * IF POLICY SERVICING BRANCH = AGENT BRANCH THEN EXIT
      *
           IF RPOL-SERV-BR-ID = RAG-BR-ID
              PERFORM POL-2000-TBL-READ-NEXT
                 THRU POL-2000-TBL-READ-NEXT-X
              GO TO 4320-CONVERT-POL-ROW-X
           END-IF.
            
      *
      * GET THE POLICY FOR UPDATE
      *
           MOVE RPOL-POL-ID TO WPOL-POL-ID.

           PERFORM  POL-1000-READ-FOR-UPDATE
               THRU POL-1000-READ-FOR-UPDATE-X.

           IF WPOL-IO-OK
              ADD 1 TO WS-POL-UPD-CNT
                       WS-POL-COMMIT-CNT
              MOVE RAG-BR-ID TO RPOL-SERV-BR-ID
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM POL-2000-REWRITE
                    THRU POL-2000-REWRITE-X
              ELSE
                 PERFORM POL-3000-UNLOCK
                    THRU POL-3000-UNLOCK-X
              END-IF
           END-IF.
         
      *
      * IF 1000TH UPDATE AND LIVE RUN THEN COMMIT
      *
           IF WS-POL-COMMIT-CNT > 999
              MOVE  'ZSFIIA0019'       TO  WGLOB-MSG-REF-INFO
              MOVE  'POL (COMMIT)'     TO  WGLOB-MSG-PARM (1)
              MOVE  WS-TIME            TO  WGLOB-MSG-PARM (2)
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 0035-1000-COMMIT
                 THRU 0035-1000-COMMIT-X
              MOVE ZERO TO WS-POL-COMMIT-CNT
           END-IF.
                  
      *
      * GET NEXT POLICY
      *
           PERFORM POL-2000-TBL-READ-NEXT
              THRU POL-2000-TBL-READ-NEXT-X.
               
       4320-CONVERT-POL-ROW-X.    
           EXIT.
      /
      *---------------------
       4400-CONVERT-SPOL-TBL.       
      *---------------------

           MOVE LOW-VALUES  TO WSPOL-KEY.
           MOVE HIGH-VALUES TO WSPOL-ENDBR-KEY.
 
           PERFORM SPOL-1000-TBL-BROWSE
              THRU SPOL-1000-TBL-BROWSE-X.
              
           PERFORM SPOL-2000-TBL-READ-NEXT
              THRU SPOL-2000-TBL-READ-NEXT-X.
              
           IF WSPOL-IO-OK    
              PERFORM 4420-CONVERT-SPOL-ROW
                 THRU 4420-CONVERT-SPOL-ROW-X 
                      UNTIL WSPOL-IO-EOF
           END-IF.
                  
           PERFORM SPOL-3000-TBL-END-BROWSE
              THRU SPOL-3000-TBL-END-BROWSE-X.
               
       4400-CONVERT-SPOL-TBL-X.    
           EXIT.
            
      /
      *---------------------
       4420-CONVERT-SPOL-ROW.       
      *---------------------
 
      * 
      * GET THE SUSPENDED POLICY'S SERVICING AGENT
      *
           MOVE RSPOL-SERV-AGT-ID TO WAG-AGT-ID.
            
           PERFORM AG-1000-READ
              THRU AG-1000-READ-X.
               
           IF WAG-IO-NOT-FOUND
              ADD 1 TO WS-POL-NOAG-CNT
              MOVE  'ZSFIIA0016'        TO  WGLOB-MSG-REF-INFO
              MOVE  RSPOL-POL-ID        TO  WGLOB-MSG-PARM (1)
              MOVE  WAG-AGT-ID          TO  WGLOB-MSG-PARM (2)
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM SPOL-2000-TBL-READ-NEXT
                 THRU SPOL-2000-TBL-READ-NEXT-X
              GO TO 4420-CONVERT-SPOL-ROW-X
           END-IF.
            
 
      * 
      * IF SUSPENDED POLICY SERVICING BRANCH = AGENT BRANCH THEN EXIT
      *
           IF RSPOL-SERV-BR-ID = RAG-BR-ID
              PERFORM SPOL-2000-TBL-READ-NEXT
                 THRU SPOL-2000-TBL-READ-NEXT-X
              GO TO 4420-CONVERT-SPOL-ROW-X
           END-IF.
            
      *
      * GET THE SUSPENDED POLICY FOR UPDATE
      *
           MOVE RSPOL-POL-ID TO WSPOL-POL-ID.

           PERFORM  SPOL-1000-READ-FOR-UPDATE
               THRU SPOL-1000-READ-FOR-UPDATE-X.

           IF WSPOL-IO-OK
              ADD 1 TO WS-SPOL-UPD-CNT
              MOVE RAG-BR-ID TO RSPOL-SERV-BR-ID
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM SPOL-2000-REWRITE
                    THRU SPOL-2000-REWRITE-X
              ELSE
                 PERFORM SPOL-3000-UNLOCK
                    THRU SPOL-3000-UNLOCK-X
              END-IF
           END-IF.
                  
      *
      * GET NEXT SUSPENDED POLICY
      *
           PERFORM SPOL-2000-TBL-READ-NEXT
              THRU SPOL-2000-TBL-READ-NEXT-X.
               
       4420-CONVERT-SPOL-ROW-X.    
           EXIT.
            
      /
      *----------------------
       4500-CONVERT-USEC-TBL.       
      *----------------------

           MOVE LOW-VALUES  TO WUSEC-KEY.
           MOVE HIGH-VALUES TO WUSEC-ENDBR-KEY.
 
           PERFORM USEC-1000-TBL-BROWSE
              THRU USEC-1000-TBL-BROWSE-X.
              
           PERFORM USEC-2000-TBL-READ-NEXT
              THRU USEC-2000-TBL-READ-NEXT-X.
              
           IF WUSEC-IO-OK    
              PERFORM 4520-CONVERT-USEC-ROW
                 THRU 4520-CONVERT-USEC-ROW-X 
                      UNTIL WUSEC-IO-EOF
           END-IF.
                  
           PERFORM USEC-3000-TBL-END-BROWSE
              THRU USEC-3000-TBL-END-BROWSE-X.
            
       4500-CONVERT-USEC-TBL-X.    
           EXIT.
      /
      *--------------------
       4520-CONVERT-USEC-ROW.       
      *----------------------
       
      *
      * ASSEMBLE KEY INTO TTAB AND GET THE MAPPING DATA                  
      *
           MOVE SPACES      TO WTTAB-ETBL-VALU-ID.  
           MOVE RUSEC-BR-ID TO WTTAB-ETBL-VALU-ID.  
            
           PERFORM FIIB-1000-EDIT
              THRU FIIB-1000-EDIT-X.
               
      *
      * IF THE CURRENT BRANCH ID IS NOT ON TTAB THEN ISSUE A MESSAGE
      * AND MOVE ON TO THE NEXT USEC ROW
      *
           IF WTTAB-IO-NOT-FOUND  
              ADD 1 TO WS-USEC-NOMAT-CNT
              MOVE  'ZSFIIA0003'        TO  WGLOB-MSG-REF-INFO
              STRING 'USEC '            DELIMITED BY SIZE
                     RUSEC-BR-ID        DELIMITED BY SIZE
                     INTO                   WGLOB-MSG-PARM (1)
              MOVE  WTTAB-ETBL-VALU-ID  TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM USEC-2000-TBL-READ-NEXT
                 THRU USEC-2000-TBL-READ-NEXT-X
              GO TO 4520-CONVERT-USEC-ROW-X
           END-IF.
               
      *
      * IF CURRENT VALUE = NEW VALUE ON TTAB THEN THE CURRENT VALUE
      * REPRESENTS AN ENTITY THAT IS REMAINING OPEN SO DO NOTHING
      *
           IF WTTAB-ETBL-VALU-ID (1:3) = RTTAB-TTBL-VALU-TXT (1:3) 
              PERFORM USEC-2000-TBL-READ-NEXT
                 THRU USEC-2000-TBL-READ-NEXT-X
              GO TO 4520-CONVERT-USEC-ROW-X
           END-IF.
            
      *
      * IF THE BRANCH ID HAS CHANGED ENSURE THE NEW VALUE IS ON BRCH
      *
           IF RTTAB-TTBL-VALU-TXT (1:3) <> RUSEC-BR-ID  
              MOVE RTTAB-TTBL-VALU-TXT (1:3) TO WBRCH-BR-ID
              PERFORM BRCH-1000-READ 
                 THRU BRCH-1000-READ-X
              IF WBRCH-IO-NOT-FOUND
                 ADD 1 TO WS-TTAB-NOMAT-CNT
                 MOVE  'ZSFIIA0015'        TO  WGLOB-MSG-REF-INFO
                 MOVE  'BRANCH'            TO  WGLOB-MSG-PARM (1)
                 MOVE  RTTAB-TTBL-VALU-TXT (1:3) TO  WGLOB-MSG-PARM (2)
                 PERFORM 0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X
                 PERFORM USEC-2000-TBL-READ-NEXT
                    THRU USEC-2000-TBL-READ-NEXT-X
                 GO TO 4520-CONVERT-USEC-ROW-X
              END-IF
           END-IF.
            
      *
      * IF LIVE RUN THEN UPDATE THE USEC
      *
           MOVE RUSEC-USER-ID TO WUSEC-USER-ID.

           PERFORM  USEC-1000-READ-FOR-UPDATE
               THRU USEC-1000-READ-FOR-UPDATE-X.

           IF WUSEC-IO-OK
              ADD 1 TO WS-USEC-UPD-CNT
              MOVE RTTAB-TTBL-VALU-TXT (1:3) TO RUSEC-BR-ID
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM USEC-2000-REWRITE
                    THRU USEC-2000-REWRITE-X
              ELSE
                 PERFORM USEC-3000-UNLOCK
                    THRU USEC-3000-UNLOCK-X
              END-IF
           END-IF.
            
           PERFORM USEC-2000-TBL-READ-NEXT
              THRU USEC-2000-TBL-READ-NEXT-X.
 
       4520-CONVERT-USEC-ROW-X.    
           EXIT.
      /
      *---------------------
       4600-DELETE-UWAS-TBL.       
      *---------------------

           MOVE LOW-VALUES  TO WUWAS-KEY.
           MOVE HIGH-VALUES TO WUWAS-ENDBR-KEY.
           MOVE ZEROS       TO WUWAS-UWAR-TCR-AMT 
                               WUWAS-ENDBR-UWAR-TCR-AMT.
 
           PERFORM UWAS-1000-BROWSE
              THRU UWAS-1000-BROWSE-X.
              
           PERFORM UWAS-2000-READ-NEXT
              THRU UWAS-2000-READ-NEXT-X.
              
           IF WUWAS-IO-OK    
              PERFORM 4620-DELETE-UWAS-ROW
                 THRU 4620-DELETE-UWAS-ROW-X 
                      UNTIL WUWAS-IO-EOF
           END-IF.
                  
           PERFORM UWAS-3000-END-BROWSE
              THRU UWAS-3000-END-BROWSE-X.
            
       4600-DELETE-UWAS-TBL-X.    
           EXIT.
      /
      *--------------------
       4620-DELETE-UWAS-ROW.       
      *----------------------
       
      *
      * ASSEMBLE KEY INTO TTAB AND GET THE MAPPING DATA                  
      *
           MOVE SPACES      TO WTTAB-ETBL-VALU-ID.  
           MOVE RUWAS-BR-ID TO WTTAB-ETBL-VALU-ID.  
            
           PERFORM FIIB-1000-EDIT
              THRU FIIB-1000-EDIT-X.
               
      *
      * IF THE CURRENT BRANCH ID IS NOT ON TTAB THEN ISSUE A MESSAGE
      * AND MOVE ON TO THE NEXT UWAS ROW
      *
           IF WTTAB-IO-NOT-FOUND  
              ADD 1 TO WS-UWAS-NOMAT-CNT
              MOVE  'ZSFIIA0003'        TO  WGLOB-MSG-REF-INFO
              STRING 'UWAS '            DELIMITED BY SIZE
                     RUWAS-BR-ID        DELIMITED BY SIZE
                     INTO                   WGLOB-MSG-PARM (1)
              MOVE  WTTAB-ETBL-VALU-ID  TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM UWAS-2000-READ-NEXT
                 THRU UWAS-2000-READ-NEXT-X
              GO TO 4620-DELETE-UWAS-ROW-X
           END-IF.
               
      *
      * IF CURRENT VALUE = NEW VALUE ON TTAB THEN THE CURRENT VALUE
      * REPRESENTS AN ENTITY THAT IS REMAINING OPEN SO DO NOTHING
      *
           IF WTTAB-ETBL-VALU-ID (1:3) = RTTAB-TTBL-VALU-TXT (1:3) 
              PERFORM UWAS-2000-READ-NEXT
                 THRU UWAS-2000-READ-NEXT-X
              GO TO 4620-DELETE-UWAS-ROW-X
           END-IF.
            
      *
      * IF LIVE RUN THEN DELETE THE UWAS
      *
           MOVE RUWAS-KEY TO WUWAS-KEY.

           PERFORM  UWAS-1000-READ-FOR-UPDATE
               THRU UWAS-1000-READ-FOR-UPDATE-X.

           IF WUWAS-IO-OK
              ADD 1 TO WS-UWAS-DEL-CNT
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM UWAS-1000-DELETE
                    THRU UWAS-1000-DELETE-X
              ELSE
                 PERFORM UWAS-3000-UNLOCK
                    THRU UWAS-3000-UNLOCK-X
              END-IF
           END-IF.
            
           PERFORM UWAS-2000-READ-NEXT
              THRU UWAS-2000-READ-NEXT-X.
 
       4620-DELETE-UWAS-ROW-X.    
           EXIT.
            
      /
      *-------------
       4700-ADD-SOS.           
      *-------------
            
           MOVE LOW-VALUES  TO WTTAB-KEY.
           MOVE HIGH-VALUES TO WTTAB-ENDBR-KEY.
            
P00916*    MOVE 'FIICA'     TO WTTAB-ETBL-TYP-ID
P00916*                        WTTAB-ENDBR-ETBL-TYP-ID.
P00916                                                 
P00916     STRING 'FIIC'        DELIMITED BY SIZE 
P00916            WS-CNVR-PHASE DELIMITED BY SIZE 
P00916            INTO WTTAB-ETBL-TYP-ID.
P00916
P00916     STRING 'FIIC'        DELIMITED BY SIZE 
P00916            WS-CNVR-PHASE DELIMITED BY SIZE 
P00916            INTO WTTAB-ENDBR-ETBL-TYP-ID.
 
           PERFORM TTAB-1000-BROWSE
              THRU TTAB-1000-BROWSE-X.
              
           PERFORM TTAB-2000-READ-NEXT
              THRU TTAB-2000-READ-NEXT-X.
              
           IF WTTAB-IO-OK    
              PERFORM 4720-ADD-SO 
                 THRU 4720-ADD-SO-X 
                      UNTIL WTTAB-IO-EOF
           END-IF.
                  
           PERFORM TTAB-3000-END-BROWSE
              THRU TTAB-3000-END-BROWSE-X.
               
       4700-ADD-SOS-X.
           EXIT.

      /
      *-----------
       4720-ADD-SO.         
      *-----------
       
      ****************************************************************
      ****************************************************************
      * TEMP CODE                                                    *
      ****************************************************************
      ****************************************************************
      *     IF RTTAB-ETBL-VALU-ID (1:2) NOT = 'AB'
      *        PERFORM TTAB-2000-READ-NEXT
      *           THRU TTAB-2000-READ-NEXT-X
      *        GO TO 4720-ADD-SO-X
      *     END-IF.
            
      *
      * IF THE DESTINATION SO ID IS THE SAME AS THE SOURCE SO ID
      * THEN THERE IS NO SO TO ADD SO GET THE NEXT TTAB AND EXIT
      *
        IF RTTAB-TTBL-VALU-TXT (1:6) = RTTAB-ETBL-VALU-ID (1:6)     
           PERFORM TTAB-2000-READ-NEXT
              THRU TTAB-2000-READ-NEXT-X
           GO TO 4720-ADD-SO-X
        END-IF.
         
      *
      * IF THE NEW SALES OFFICE IS ALREADY IN THE DATABASE THEN EXIT
      *
        MOVE RTTAB-TTBL-VALU-TXT (1:3) TO WSALE-BR-ID.
        MOVE RTTAB-TTBL-VALU-TXT (4:3) TO WSALE-SO-ID.

        PERFORM SALE-1000-READ
           THRU SALE-1000-READ-X.

        IF WSALE-IO-OK
           PERFORM TTAB-2000-READ-NEXT
              THRU TTAB-2000-READ-NEXT-X
           GO TO 4720-ADD-SO-X
        END-IF.
            
      *
      * IF LIVE RUN THEN ADD THE NEW SALES OFFICE
      *
        ADD 1 TO WS-SALE-INS-CNT
        MOVE RTTAB-TTBL-VALU-TXT (1:3)   TO RSALE-BR-ID
        MOVE RTTAB-TTBL-VALU-TXT (4:3)   TO RSALE-SO-ID
        MOVE SPACES                      TO RSALE-CLI-ID
        STRING "S"                          DELIMITED BY SIZE
               RTTAB-TTBL-VALU-TXT (1:6)    DELIMITED BY SIZE
                                       INTO RSALE-CLI-ID
        MOVE 'PR'                        TO RSALE-CLI-ADDR-TYP-CD
         
        IF WS-CNVR-RUN-TYPE-LIVE
           PERFORM SALE-1000-WRITE
              THRU SALE-1000-WRITE-X
        END-IF.
            
        PERFORM TTAB-2000-READ-NEXT
           THRU TTAB-2000-READ-NEXT-X.
               
       4720-ADD-SO-X.
           EXIT.
      /
      *-------------------------
       4800-DELETE-SOS.          
      *-------------------------

           MOVE LOW-VALUES  TO WSALE-KEY.
           MOVE HIGH-VALUES TO WSALE-ENDBR-KEY.
 
           PERFORM SALE-1000-BROWSE
              THRU SALE-1000-BROWSE-X.
              
           PERFORM SALE-2000-READ-NEXT
              THRU SALE-2000-READ-NEXT-X.
              
           IF WSALE-IO-OK    
              PERFORM 4820-DELETE-SO
                 THRU 4820-DELETE-SO-X 
                      UNTIL WSALE-IO-EOF
           END-IF.
                  
           PERFORM SALE-3000-END-BROWSE
              THRU SALE-3000-END-BROWSE-X.
                                     
       4800-DELETE-SOS-X.
           EXIT.
      /
      *-------------------
       4820-DELETE-SO.           
      *-------------------
 
      ****************************************************************
      ****************************************************************
      * TEMP CODE                                                    *
      ****************************************************************
      ****************************************************************
      *     IF RSALE-BR-ID (1:2) NOT = 'AB'
      *        PERFORM SALE-2000-READ-NEXT
      *           THRU SALE-2000-READ-NEXT-X
      *        GO TO 4820-DELETE-SO-X
      *     END-IF.
            
      *
      * ASSEMBLE KEY INTO TTAB AND GET THE BRANCH MAPPING DATA                  
      *
           MOVE   SPACES            TO WTTAB-ETBL-VALU-ID.
           STRING RSALE-BR-ID (1:3) DELIMITED BY SIZE
                  RSALE-SO-ID (1:3) DELIMITED BY SIZE
                  INTO              WTTAB-ETBL-VALU-ID.
            
           PERFORM FIIC-1000-EDIT
              THRU FIIC-1000-EDIT-X.
               
      *
      * IF THE CURRENT SALES OFFICE ID IS NOT ON TTAB THEN 
      * MOVE ON TO THE NEXT BRANCH
      *
           IF WTTAB-IO-NOT-FOUND  
              PERFORM SALE-2000-READ-NEXT
                 THRU SALE-2000-READ-NEXT-X
              GO TO 4820-DELETE-SO-X
           END-IF.
               
      *
      * IF CURRENT VALUE = NEW VALUE ON TTAB THEN THE CURRENT VALUE
      * REPRESENTS AN ENTITY THAT IS REMAINING OPEN SO DO NOTHING
      *
           IF  RSALE-BR-ID (1:3) = RTTAB-TTBL-VALU-TXT (1:3) 
           AND RSALE-SO-ID (1:3) = RTTAB-TTBL-VALU-TXT (4:3) 
              PERFORM SALE-2000-READ-NEXT
                 THRU SALE-2000-READ-NEXT-X
              GO TO 4820-DELETE-SO-X
           END-IF.
            
      *
      * IF LIVE RUN THEN DELETE THE OLD SALES OFFICE
      *
           MOVE RSALE-BR-ID TO WSALE-BR-ID.
           MOVE RSALE-SO-ID TO WSALE-SO-ID.

           PERFORM  SALE-1000-READ-FOR-UPDATE
               THRU SALE-1000-READ-FOR-UPDATE-X.

           IF WSALE-IO-OK
              ADD 1 TO WS-SALE-DEL-CNT
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM SALE-1000-DELETE
                    THRU SALE-1000-DELETE-X
              ELSE
                 PERFORM SALE-3000-UNLOCK
                    THRU SALE-3000-UNLOCK-X
              END-IF
           END-IF.
            
           PERFORM SALE-2000-READ-NEXT
              THRU SALE-2000-READ-NEXT-X.
            
       4820-DELETE-SO-X.
           EXIT.
      /
      *------------------
       5000-ADD-BR-XTABS.          
      *------------------
            
           MOVE LOW-VALUES  TO WTTAB-KEY.
           MOVE HIGH-VALUES TO WTTAB-ENDBR-KEY.
P00916
P00916*    MOVE 'FIIBA'     TO WTTAB-ETBL-TYP-ID
P00916*                        WTTAB-ENDBR-ETBL-TYP-ID.
P00916
P00916     STRING 'FIIB'        DELIMITED BY SIZE 
P00916            WS-CNVR-PHASE DELIMITED BY SIZE 
P00916            INTO WTTAB-ETBL-TYP-ID.
P00916
P00916     STRING 'FIIB'        DELIMITED BY SIZE 
P00916            WS-CNVR-PHASE DELIMITED BY SIZE 
P00916            INTO WTTAB-ENDBR-ETBL-TYP-ID.
 
           PERFORM TTAB-1000-BROWSE
              THRU TTAB-1000-BROWSE-X.
              
           PERFORM TTAB-2000-READ-NEXT
              THRU TTAB-2000-READ-NEXT-X.
              
           IF WTTAB-IO-OK    
              PERFORM 5020-ADD-BR-XTAB   
                 THRU 5020-ADD-BR-XTAB-X 
                      UNTIL WTTAB-IO-EOF
           END-IF.
                  
           PERFORM TTAB-3000-END-BROWSE
              THRU TTAB-3000-END-BROWSE-X.
               
       5000-ADD-BR-XTABS-X.
           EXIT.

      /
      *----------------------
       5020-ADD-BR-XTAB.           
      *----------------------
       
      ****************************************************************
      ****************************************************************
      * TEMP CODE                                                    *
      ****************************************************************
      ****************************************************************
      *     IF RTTAB-ETBL-VALU-ID (1:2) NOT = 'AT'
      *        PERFORM TTAB-2000-READ-NEXT
      *           THRU TTAB-2000-READ-NEXT-X
      *        GO TO 5020-ADD-BR-XTAB-X
      *     END-IF.
            
      *
      * IF THE NEW ID IS THE SAME AS THE OLD ID GET THE NEXT AND EXIT
      *
        IF RTTAB-TTBL-VALU-TXT (1:3) = RTTAB-ETBL-VALU-ID (1:3)     
           PERFORM TTAB-2000-READ-NEXT
              THRU TTAB-2000-READ-NEXT-X
           GO TO 5020-ADD-BR-XTAB-X
        END-IF.
         
      *
      * IF THE NEW ENGLISH ID IS NOT ALREADY IN THE DATABASE THEN ADD IT
      *
        MOVE 'BRCH'                    TO WXTAB-ETBL-TYP-ID 
        MOVE RTTAB-TTBL-VALU-TXT (1:3) TO WXTAB-ETBL-VALU-ID. 
        MOVE 'E'                       TO WXTAB-ETBL-LANG-CD.

        PERFORM XTAB-1000-READ
           THRU XTAB-1000-READ-X.

        IF NOT WXTAB-IO-OK
           ADD 1 TO WS-XTAB-INS-BRCH-CNT
           MOVE 'BRCH'                    TO WXTAB-ETBL-TYP-ID 
           MOVE RTTAB-TTBL-VALU-TXT (1:3) TO WXTAB-ETBL-VALU-ID 
           MOVE 'E'                       TO WXTAB-ETBL-LANG-CD
           MOVE RTTAB-TTBL-VALU-TXT (1:3) TO RXTAB-ETBL-DESC-TXT
           IF WS-CNVR-RUN-TYPE-LIVE
              PERFORM XTAB-1000-WRITE
                 THRU XTAB-1000-WRITE-X
           END-IF
        END-IF.
            
      *
      * IF THE NEW JAPANESE ID IS NOT ALREADY IN THE DATABASE THEN ADD IT
      *
        MOVE 'BRCH'                    TO WXTAB-ETBL-TYP-ID 
        MOVE RTTAB-TTBL-VALU-TXT (1:3) TO WXTAB-ETBL-VALU-ID. 
        MOVE 'J'                       TO WXTAB-ETBL-LANG-CD.

        PERFORM XTAB-1000-READ
           THRU XTAB-1000-READ-X.

        IF NOT WXTAB-IO-OK
           ADD 1 TO WS-XTAB-INS-BRCH-CNT
           MOVE 'BRCH'                    TO WXTAB-ETBL-TYP-ID 
           MOVE RTTAB-TTBL-VALU-TXT (1:3) TO WXTAB-ETBL-VALU-ID 
           MOVE 'J'                       TO WXTAB-ETBL-LANG-CD
           MOVE RTTAB-TTBL-VALU-TXT (1:3) TO RXTAB-ETBL-DESC-TXT
           IF WS-CNVR-RUN-TYPE-LIVE
              PERFORM XTAB-1000-WRITE
                 THRU XTAB-1000-WRITE-X
           END-IF
        END-IF.
        PERFORM TTAB-2000-READ-NEXT
           THRU TTAB-2000-READ-NEXT-X.
               
       5020-ADD-BR-XTAB-X.
           EXIT.
      /
      *-------------------------
       5100-DELETE-BR-XTABS.          
      *-------------------------

           MOVE LOW-VALUES  TO WXTAB-KEY.
           MOVE HIGH-VALUES TO WXTAB-ENDBR-KEY.
           MOVE 'BRCH'      TO WXTAB-ETBL-TYP-ID 
                               WXTAB-ENDBR-ETBL-TYP-ID.
 
           PERFORM XTAB-1000-BROWSE
              THRU XTAB-1000-BROWSE-X.
              
           PERFORM XTAB-2000-READ-NEXT
              THRU XTAB-2000-READ-NEXT-X.
              
           IF WXTAB-IO-OK    
              PERFORM 5120-DELETE-BR-XTAB
                 THRU 5120-DELETE-BR-XTAB-X 
                      UNTIL WXTAB-IO-EOF
           END-IF.
                  
           PERFORM XTAB-3000-END-BROWSE
              THRU XTAB-3000-END-BROWSE-X.
                                     
       5100-DELETE-BR-XTABS-X.
           EXIT.
      /
      *--------------------
       5120-DELETE-BR-XTAB.           
      *--------------------
 
      ****************************************************************
      ****************************************************************
      * TEMP CODE                                                    *
      ****************************************************************
      ****************************************************************
      *     IF RXTAB-ETBL-VALU-ID (1:2) NOT = 'AT'
      *        PERFORM XTAB-2000-READ-NEXT
      *           THRU XTAB-2000-READ-NEXT-X
      *        GO TO 5120-DELETE-BR-XTAB-X
      *     END-IF.
            
      *
      * ASSEMBLE KEY INTO TTAB AND GET THE BRANCH MAPPING DATA                  
      *
           MOVE RXTAB-ETBL-VALU-ID (1:3) TO WTTAB-ETBL-VALU-ID.  
            
           PERFORM FIIB-1000-EDIT
              THRU FIIB-1000-EDIT-X.
               
           IF WTTAB-IO-NOT-FOUND  
              PERFORM XTAB-2000-READ-NEXT
                 THRU XTAB-2000-READ-NEXT-X
              GO TO 5120-DELETE-BR-XTAB-X
           END-IF.
               
      *
      * IF CURRENT VALUE = NEW VALUE ON TTAB THEN THE CURRENT VALUE
      * REPRESENTS AN ENTITY THAT IS REMAINING OPEN SO DO NOTHING
      *
           IF RXTAB-ETBL-VALU-ID (1:3) = RTTAB-TTBL-VALU-TXT (1:3) 
              PERFORM XTAB-2000-READ-NEXT
                 THRU XTAB-2000-READ-NEXT-X
              GO TO 5120-DELETE-BR-XTAB-X
           END-IF.
            
      *
      * IF LIVE RUN THEN DELETE THE OLD BRANCH
      *
           MOVE RXTAB-ETBL-TYP-ID         TO WXTAB-ETBL-TYP-ID.
           MOVE RXTAB-ETBL-VALU-ID        TO WXTAB-ETBL-VALU-ID.
           MOVE RXTAB-ETBL-LANG-CD        TO WXTAB-ETBL-LANG-CD.

           PERFORM  XTAB-1000-READ-FOR-UPDATE
               THRU XTAB-1000-READ-FOR-UPDATE-X.

           IF WXTAB-IO-OK
              ADD 1 TO WS-XTAB-DEL-BRCH-CNT
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM XTAB-1000-DELETE
                    THRU XTAB-1000-DELETE-X
              ELSE
                 PERFORM XTAB-3000-UNLOCK
                    THRU XTAB-3000-UNLOCK-X
              END-IF
           END-IF.
            
           PERFORM XTAB-2000-READ-NEXT
              THRU XTAB-2000-READ-NEXT-X.
            
       5120-DELETE-BR-XTAB-X.
           EXIT.
      /
      *------------------
       5300-ADD-SO-XTABS.          
      *------------------
            
           MOVE LOW-VALUES  TO WTTAB-KEY.
           MOVE HIGH-VALUES TO WTTAB-ENDBR-KEY.
P00916*    MOVE 'FIISA'     TO WTTAB-ETBL-TYP-ID
P00916*                        WTTAB-ENDBR-ETBL-TYP-ID.
P00916     STRING 'FIIS'        DELIMITED BY SIZE 
P00916            WS-CNVR-PHASE DELIMITED BY SIZE 
P00916            INTO WTTAB-ETBL-TYP-ID.
P00916
P00916     STRING 'FIIS'        DELIMITED BY SIZE 
P00916            WS-CNVR-PHASE DELIMITED BY SIZE 
P00916            INTO WTTAB-ENDBR-ETBL-TYP-ID.
 
           PERFORM TTAB-1000-BROWSE
              THRU TTAB-1000-BROWSE-X.
              
           PERFORM TTAB-2000-READ-NEXT
              THRU TTAB-2000-READ-NEXT-X.
              
           IF WTTAB-IO-OK    
              PERFORM 5320-ADD-SO-XTAB   
                 THRU 5320-ADD-SO-XTAB-X 
                      UNTIL WTTAB-IO-EOF
           END-IF.
                  
           PERFORM TTAB-3000-END-BROWSE
              THRU TTAB-3000-END-BROWSE-X.
               
       5300-ADD-SO-XTABS-X.
           EXIT.

      /
      *----------------------
       5320-ADD-SO-XTAB.           
      *----------------------
       
      ****************************************************************
      ****************************************************************
      * TEMP CODE                                                    *
      ****************************************************************
      ****************************************************************
      *     IF RTTAB-ETBL-VALU-ID (1:2) NOT = 'AT'
      *        PERFORM TTAB-2000-READ-NEXT
      *           THRU TTAB-2000-READ-NEXT-X
      *        GO TO 5320-ADD-SO-XTAB-X
      *     END-IF.
            
      *
      * IF THE NEW ID IS THE SAME AS THE OLD ID GET THE NEXT AND EXIT
      *
        IF RTTAB-TTBL-VALU-TXT (1:3) = RTTAB-ETBL-VALU-ID (1:3)     
           PERFORM TTAB-2000-READ-NEXT
              THRU TTAB-2000-READ-NEXT-X
           GO TO 5320-ADD-SO-XTAB-X
        END-IF.
         
      *
      * IF THE NEW ENGLISH ID IS NOT ALREADY IN THE DATABASE THEN ADD IT
      *
        MOVE 'SALE'                    TO WXTAB-ETBL-TYP-ID 
        MOVE RTTAB-TTBL-VALU-TXT (1:3) TO WXTAB-ETBL-VALU-ID. 
        MOVE 'E'                       TO WXTAB-ETBL-LANG-CD.

        PERFORM XTAB-1000-READ
           THRU XTAB-1000-READ-X.

        IF NOT WXTAB-IO-OK
           ADD 1 TO WS-XTAB-INS-SALE-CNT
           MOVE 'SALE'                    TO WXTAB-ETBL-TYP-ID 
           MOVE RTTAB-TTBL-VALU-TXT (1:3) TO WXTAB-ETBL-VALU-ID 
           MOVE 'E'                       TO WXTAB-ETBL-LANG-CD
           MOVE RTTAB-TTBL-VALU-TXT (1:3) TO RXTAB-ETBL-DESC-TXT
           IF WS-CNVR-RUN-TYPE-LIVE
              PERFORM XTAB-1000-WRITE
                 THRU XTAB-1000-WRITE-X
           END-IF
        END-IF.
            
      *
      * IF THE NEW JAPANESE ID IS NOT ALREADY IN THE DATABASE THEN ADD IT
      *
        MOVE 'SALE'                    TO WXTAB-ETBL-TYP-ID 
        MOVE RTTAB-TTBL-VALU-TXT (1:3) TO WXTAB-ETBL-VALU-ID. 
        MOVE 'J'                       TO WXTAB-ETBL-LANG-CD.

        PERFORM XTAB-1000-READ
           THRU XTAB-1000-READ-X.

        IF NOT WXTAB-IO-OK
           ADD 1 TO WS-XTAB-INS-SALE-CNT
           MOVE 'SALE'                    TO WXTAB-ETBL-TYP-ID 
           MOVE RTTAB-TTBL-VALU-TXT (1:3) TO WXTAB-ETBL-VALU-ID 
           MOVE 'J'                       TO WXTAB-ETBL-LANG-CD
           MOVE RTTAB-TTBL-VALU-TXT (1:3) TO RXTAB-ETBL-DESC-TXT
           IF WS-CNVR-RUN-TYPE-LIVE
              PERFORM XTAB-1000-WRITE
                 THRU XTAB-1000-WRITE-X
           END-IF
        END-IF.
         
        PERFORM TTAB-2000-READ-NEXT
           THRU TTAB-2000-READ-NEXT-X.
               
       5320-ADD-SO-XTAB-X.
           EXIT.
      /
      *-------------------------
       5400-DELETE-SO-XTABS.          
      *-------------------------

           MOVE LOW-VALUES  TO WXTAB-KEY.
           MOVE HIGH-VALUES TO WXTAB-ENDBR-KEY.
           MOVE 'SALE'      TO WXTAB-ETBL-TYP-ID 
                               WXTAB-ENDBR-ETBL-TYP-ID.
 
           PERFORM XTAB-1000-BROWSE
              THRU XTAB-1000-BROWSE-X.
              
           PERFORM XTAB-2000-READ-NEXT
              THRU XTAB-2000-READ-NEXT-X.
              
           IF WXTAB-IO-OK    
              PERFORM 5420-DELETE-SO-XTAB
                 THRU 5420-DELETE-SO-XTAB-X 
                      UNTIL WXTAB-IO-EOF
           END-IF.
                  
           PERFORM XTAB-3000-END-BROWSE
              THRU XTAB-3000-END-BROWSE-X.
                                     
       5400-DELETE-SO-XTABS-X.
           EXIT.
      /
      *--------------------
       5420-DELETE-SO-XTAB.           
      *--------------------
 
      ****************************************************************
      ****************************************************************
      * TEMP CODE                                                    *
      ****************************************************************
      ****************************************************************
      *     IF RXTAB-ETBL-VALU-ID (1:2) NOT = 'AT'
      *        PERFORM XTAB-2000-READ-NEXT
      *           THRU XTAB-2000-READ-NEXT-X
      *        GO TO 5420-DELETE-SO-XTAB-X
      *     END-IF.
            
      *
      * ASSEMBLE KEY INTO TTAB AND GET THE SALES OFFICE MAPPING DATA            
      *
           MOVE RXTAB-ETBL-VALU-ID (1:3) TO WTTAB-ETBL-VALU-ID.  
            
           PERFORM FIIS-1000-EDIT
              THRU FIIS-1000-EDIT-X.
               
           IF WTTAB-IO-NOT-FOUND  
              PERFORM XTAB-2000-READ-NEXT
                 THRU XTAB-2000-READ-NEXT-X
              GO TO 5420-DELETE-SO-XTAB-X
           END-IF.
               
      *
      * IF CURRENT VALUE = NEW VALUE ON TTAB THEN THE CURRENT VALUE
      * REPRESENTS AN ENTITY THAT IS REMAINING OPEN SO DO NOTHING
      *
           IF RXTAB-ETBL-VALU-ID (1:3) = RTTAB-TTBL-VALU-TXT (1:3) 
              PERFORM XTAB-2000-READ-NEXT
                 THRU XTAB-2000-READ-NEXT-X
              GO TO 5420-DELETE-SO-XTAB-X
           END-IF.
            
      *
      * IF LIVE RUN THEN DELETE THE OLD SALES OFFICE
      *
           MOVE RXTAB-ETBL-TYP-ID         TO WXTAB-ETBL-TYP-ID.
           MOVE RXTAB-ETBL-VALU-ID        TO WXTAB-ETBL-VALU-ID.
           MOVE RXTAB-ETBL-LANG-CD        TO WXTAB-ETBL-LANG-CD.

           PERFORM  XTAB-1000-READ-FOR-UPDATE
               THRU XTAB-1000-READ-FOR-UPDATE-X.

           IF WXTAB-IO-OK
              ADD 1 TO WS-XTAB-DEL-SALE-CNT
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM XTAB-1000-DELETE
                    THRU XTAB-1000-DELETE-X
              ELSE
                 PERFORM XTAB-3000-UNLOCK
                    THRU XTAB-3000-UNLOCK-X
              END-IF
           END-IF.
            
           PERFORM XTAB-2000-READ-NEXT
              THRU XTAB-2000-READ-NEXT-X.
            
       5420-DELETE-SO-XTAB-X.
           EXIT.
            
      /
      *-----------------
       6000-ADD-CLIENTS.           
      *-----------------
 
      *
      * ADD BRANCH CLIENTS
      *
           SET WS-CLIENT-TYPE-BRCH TO TRUE.
            
           MOVE LOW-VALUES  TO WTTAB-KEY.
           MOVE HIGH-VALUES TO WTTAB-ENDBR-KEY.
P00916*    MOVE 'FIIBA'     TO WTTAB-ETBL-TYP-ID
P00916*                        WTTAB-ENDBR-ETBL-TYP-ID.
P00916
P00916     STRING 'FIIB'        DELIMITED BY SIZE 
P00916            WS-CNVR-PHASE DELIMITED BY SIZE 
P00916            INTO WTTAB-ETBL-TYP-ID.
P00916
P00916     STRING 'FIIB'        DELIMITED BY SIZE 
P00916            WS-CNVR-PHASE DELIMITED BY SIZE 
P00916            INTO WTTAB-ENDBR-ETBL-TYP-ID.
 
           PERFORM TTAB-1000-BROWSE
              THRU TTAB-1000-BROWSE-X.
              
           PERFORM TTAB-2000-READ-NEXT
              THRU TTAB-2000-READ-NEXT-X.
              
           IF WTTAB-IO-OK    
              PERFORM 6020-ADD-CLIENT 
                 THRU 6020-ADD-CLIENT-X 
                      UNTIL WTTAB-IO-EOF
           END-IF.
                  
           PERFORM TTAB-3000-END-BROWSE
              THRU TTAB-3000-END-BROWSE-X.
               
      *
      * ADD SALES OFFICE CLIENTS
      *
           SET WS-CLIENT-TYPE-SALE TO TRUE.
            
           MOVE LOW-VALUES  TO WTTAB-KEY.
           MOVE HIGH-VALUES TO WTTAB-ENDBR-KEY.
P00916*    MOVE 'FIICA'     TO WTTAB-ETBL-TYP-ID
P00916*                        WTTAB-ENDBR-ETBL-TYP-ID.
P00916
P00916     STRING 'FIIC'        DELIMITED BY SIZE 
P00916            WS-CNVR-PHASE DELIMITED BY SIZE 
P00916            INTO WTTAB-ETBL-TYP-ID.
P00916
P00916     STRING 'FIIC'        DELIMITED BY SIZE 
P00916            WS-CNVR-PHASE DELIMITED BY SIZE 
P00916            INTO WTTAB-ENDBR-ETBL-TYP-ID.
 
           PERFORM TTAB-1000-BROWSE
              THRU TTAB-1000-BROWSE-X.
              
           PERFORM TTAB-2000-READ-NEXT
              THRU TTAB-2000-READ-NEXT-X.
              
           IF WTTAB-IO-OK    
              PERFORM 6020-ADD-CLIENT 
                 THRU 6020-ADD-CLIENT-X 
                      UNTIL WTTAB-IO-EOF
           END-IF.
                  
           PERFORM TTAB-3000-END-BROWSE
              THRU TTAB-3000-END-BROWSE-X.
               
      *
      * ADD PAYROLL DEDUCTION GROUP CLIENTS
      *
           SET WS-CLIENT-TYPE-CLIG TO TRUE.
            
           MOVE LOW-VALUES  TO WTTAB-KEY.
           MOVE HIGH-VALUES TO WTTAB-ENDBR-KEY.
            
P00916*    MOVE 'FIIBA'     TO WTTAB-ETBL-TYP-ID
P00916*                        WTTAB-ENDBR-ETBL-TYP-ID.
P00916
P00916     STRING 'FIIB'        DELIMITED BY SIZE 
P00916            WS-CNVR-PHASE DELIMITED BY SIZE 
P00916            INTO WTTAB-ETBL-TYP-ID.
P00916
P00916     STRING 'FIIB'        DELIMITED BY SIZE 
P00916            WS-CNVR-PHASE DELIMITED BY SIZE 
P00916            INTO WTTAB-ENDBR-ETBL-TYP-ID.
 
           PERFORM TTAB-1000-BROWSE
              THRU TTAB-1000-BROWSE-X.
              
           PERFORM TTAB-2000-READ-NEXT
              THRU TTAB-2000-READ-NEXT-X.
              
           IF WTTAB-IO-OK    
              PERFORM 6020-ADD-CLIENT 
                 THRU 6020-ADD-CLIENT-X 
                      UNTIL WTTAB-IO-EOF
           END-IF.
                  
           PERFORM TTAB-3000-END-BROWSE
              THRU TTAB-3000-END-BROWSE-X.
               
       6000-ADD-CLIENTS-X.
           EXIT.

      /
      *----------------------
       6020-ADD-CLIENT.           
      *----------------------
       
      ****************************************************************
      ****************************************************************
      * TEMP CODE                                                    *
      ****************************************************************
      ****************************************************************
      *     IF RTTAB-ETBL-VALU-ID (1:2) NOT = '0A'
      *        PERFORM TTAB-2000-READ-NEXT
      *           THRU TTAB-2000-READ-NEXT-X
      *        GO TO 6020-ADD-CLIENT-X
      *     END-IF.
            
      *
      * IF THE DESTINATION CLIENT IS IS THE SAME AS THE SOURCE CLIENT ID
      * THEN THERE IS NO CLIENT TO ADD SO GET THE NEXT TTAB AND EXIT
      *
           IF  WS-CLIENT-TYPE-BRCH
           AND RTTAB-TTBL-VALU-TXT (1:3) = RTTAB-ETBL-VALU-ID (1:3)    
              PERFORM TTAB-2000-READ-NEXT
                 THRU TTAB-2000-READ-NEXT-X
              GO TO 6020-ADD-CLIENT-X
           END-IF.
            
           IF  WS-CLIENT-TYPE-CLIG 
           AND RTTAB-TTBL-VALU-TXT (1:3) = RTTAB-ETBL-VALU-ID (1:3)    
              PERFORM TTAB-2000-READ-NEXT
                 THRU TTAB-2000-READ-NEXT-X
              GO TO 6020-ADD-CLIENT-X
           END-IF.
            
           IF  WS-CLIENT-TYPE-SALE 
           AND RTTAB-TTBL-VALU-TXT (1:6) = RTTAB-ETBL-VALU-ID (1:6)      
              PERFORM TTAB-2000-READ-NEXT
                 THRU TTAB-2000-READ-NEXT-X
              GO TO 6020-ADD-CLIENT-X
           END-IF.
         
      *
FII01B* IF THE NEW CLIENT IS ALREADY IN THE DATABASE THEN EXIT,
FII01B* EXCEPT WHEN THE NEW CLIENT REPRESENTS A PAYROLL DEDUCTION
FII01B* GROUP - IN THOSE CASES WE MUST CREATE THE RL ROWS
      *
FII01B     MOVE SPACES TO WS-NEW-CLI-ID.
FII01B     MOVE SPACES TO WS-ORIG-CLI-ID.
         
           EVALUATE TRUE
           WHEN WS-CLIENT-TYPE-BRCH
             STRING "B"                       DELIMITED BY SIZE 
                    RTTAB-TTBL-VALU-TXT (1:3) DELIMITED BY SIZE
                    INTO WS-NEW-CLI-ID
                     
FII01B       STRING "B"                       DELIMITED BY SIZE 
FII01B              RTTAB-ETBL-VALU-ID (1:3)  DELIMITED BY SIZE
FII01B              INTO WS-ORIG-CLI-ID
 
           WHEN WS-CLIENT-TYPE-SALE
             STRING "S"                       DELIMITED BY SIZE 
                    RTTAB-TTBL-VALU-TXT (1:6) DELIMITED BY SIZE
                    INTO WS-NEW-CLI-ID
                     
FII01B       STRING "S"                       DELIMITED BY SIZE 
FII01B              RTTAB-ETBL-VALU-ID (1:6)  DELIMITED BY SIZE
FII01B              INTO WS-ORIG-CLI-ID
 
           WHEN WS-CLIENT-TYPE-CLIG
             STRING "G01002"                  DELIMITED BY SIZE 
                    RTTAB-TTBL-VALU-TXT (1:3) DELIMITED BY SIZE
                    INTO WS-NEW-CLI-ID
                     
FII01B       STRING "G01002"                  DELIMITED BY SIZE 
FII01B              RTTAB-ETBL-VALU-ID (1:3)  DELIMITED BY SIZE
FII01B              INTO WS-ORIG-CLI-ID
 
           END-EVALUATE.
         
F1101B     MOVE WS-NEW-CLI-ID TO WCLI-CLI-ID.
            
           PERFORM CLI-1000-READ
              THRU CLI-1000-READ-X.
   
           IF WCLI-IO-OK
FII01B        IF WS-CLIENT-TYPE-CLIG
FII01B           MOVE LOW-VALUES     TO WRL-KEY
FII01B           MOVE HIGH-VALUES    TO WRL-ENDBR-KEY
FII01B           MOVE WS-ORIG-CLI-ID TO WRL-CLI-ID
FII01B           MOVE WS-ORIG-CLI-ID TO WRL-ENDBR-CLI-ID
FII01B           PERFORM RL-1000-BROWSE
FII01B              THRU RL-1000-BROWSE-X
FII01B           PERFORM RL-2000-READ-NEXT
FII01B              THRU RL-2000-READ-NEXT-X
FII01B           IF WRL-IO-OK    
FII01B              PERFORM 6048-ADD-CLIG-RL 
FII01B                 THRU 6048-ADD-CLIG-RL-X 
FII01B                      UNTIL WRL-IO-EOF
FII01B           END-IF
FII01B           PERFORM RL-3000-END-BROWSE
FII01B           THRU RL-3000-END-BROWSE-X
FII01B           PERFORM TTAB-2000-READ-NEXT
FII01B              THRU TTAB-2000-READ-NEXT-X
FII01B           GO TO 6020-ADD-CLIENT-X
FII01B     ELSE
              PERFORM TTAB-2000-READ-NEXT
                 THRU TTAB-2000-READ-NEXT-X
              GO TO 6020-ADD-CLIENT-X
           END-IF.
            
FII01B*     
FII01B* IF LIVE RUN THEN ADD THE NEW CLIENT
FII01B*     
FII01B* FIRST GET THE ORIGINAL ROW TO GET NON-KEY DATA
FII01B*     
FII01B*    MOVE SPACES TO WCLI-CLI-ID.
FII01B*     
FII01B*    EVALUATE TRUE
FII01B*     
FII01B*    WHEN WS-CLIENT-TYPE-BRCH
FII01B*      STRING "B"                       DELIMITED BY SIZE 
FII01B*    WHEN WS-CLIENT-TYPE-SALE
FII01B*      STRING "S"                       DELIMITED BY SIZE 
FII01B*    WHEN WS-CLIENT-TYPE-CLIG
FII01B*      STRING "G01002"                  DELIMITED BY SIZE 
FII01B*    END-EVALUATE.
FII01B*     
FII01B*    MOVE WCLI-CLI-ID TO WS-ORIG-CLI-ID.
 
FII01B     MOVE WS-ORIG-CLI-ID TO WCLI-CLI-ID.
           PERFORM CLI-1000-READ
              THRU CLI-1000-READ-X.

           IF NOT WCLI-IO-OK
              MOVE  'ZSFIIA0018'        TO  WGLOB-MSG-REF-INFO
              MOVE  WCLI-CLI-ID         TO  WGLOB-MSG-PARM (1)
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM TTAB-2000-READ-NEXT
                 THRU TTAB-2000-READ-NEXT-X
              GO TO 6020-ADD-CLIENT-X
           END-IF.
 
           MOVE WS-NEW-CLI-ID TO WCLI-CLI-ID.
            
           EVALUATE TRUE
         
           WHEN WS-CLIENT-TYPE-BRCH
                ADD 1 TO WS-CLI-INS-BRCH-CNT 
           WHEN WS-CLIENT-TYPE-SALE
                ADD 1 TO WS-CLI-INS-SALE-CNT 
           WHEN WS-CLIENT-TYPE-CLIG
                ADD 1 TO WS-CLI-INS-CLIG-CNT 
           END-EVALUATE.
         
           IF WS-CNVR-RUN-TYPE-LIVE
              PERFORM CLI-1000-WRITE
                 THRU CLI-1000-WRITE-X
           END-IF.
            
           PERFORM 6040-ADD-OTHER-CLIENT-DATA
              THRU 6040-ADD-OTHER-CLIENT-DATA-X.
            
           PERFORM TTAB-2000-READ-NEXT
              THRU TTAB-2000-READ-NEXT-X.
               
       6020-ADD-CLIENT-X.
           EXIT.
      /
      *---------------------------
       6040-ADD-OTHER-CLIENT-DATA.     
      *---------------------------
       
      *
      * CLIA - CLIENT ADDRESSES
      *
           MOVE LOW-VALUES     TO WCLIA-KEY.
           MOVE HIGH-VALUES    TO WCLIA-ENDBR-KEY.
           MOVE WS-ORIG-CLI-ID TO WCLIA-CLI-ID.
           MOVE WS-ORIG-CLI-ID TO WCLIA-ENDBR-CLI-ID.
 
           PERFORM CLIA-1000-BROWSE
              THRU CLIA-1000-BROWSE-X.
              
           PERFORM CLIA-2000-READ-NEXT
              THRU CLIA-2000-READ-NEXT-X.
              
           IF WCLIA-IO-OK    
              PERFORM 6042-ADD-CLIA 
                 THRU 6042-ADD-CLIA-X 
                      UNTIL WCLIA-IO-EOF
           END-IF.
                  
           PERFORM CLIA-3000-END-BROWSE
              THRU CLIA-3000-END-BROWSE-X.
               
      *
      * CLNC - CLIENT NAMES
      *
           MOVE LOW-VALUES     TO WCLNC-KEY.
           MOVE HIGH-VALUES    TO WCLNC-ENDBR-KEY.
           MOVE WS-ORIG-CLI-ID TO WCLNC-CLI-ID.
           MOVE WS-ORIG-CLI-ID TO WCLNC-ENDBR-CLI-ID.
 
           PERFORM CLNC-1000-BROWSE
              THRU CLNC-1000-BROWSE-X.
              
           PERFORM CLNC-2000-READ-NEXT
              THRU CLNC-2000-READ-NEXT-X.
              
           IF WCLNC-IO-OK    
              PERFORM 6044-ADD-CLNC 
                 THRU 6044-ADD-CLNC-X 
                      UNTIL WCLNC-IO-EOF
           END-IF.
                  
           PERFORM CLNC-3000-END-BROWSE
              THRU CLNC-3000-END-BROWSE-X.
               
      *
      * CLIG - PAYROLL DEDUCTION GROUP
      *
           IF NOT WS-CLIENT-TYPE-CLIG
              GO TO 6040-ADD-OTHER-CLIENT-DATA-X
           END-IF.
            
           PERFORM 6046-ADD-CLIG
              THRU 6046-ADD-CLIG-X.
               
      *
      * CLIG - PAYROLL DEDUCTION GROUP RELATIONSHIPS
      *
           MOVE LOW-VALUES     TO WRL-KEY.
           MOVE HIGH-VALUES    TO WRL-ENDBR-KEY.
           MOVE WS-ORIG-CLI-ID TO WRL-CLI-ID.
           MOVE WS-ORIG-CLI-ID TO WRL-ENDBR-CLI-ID.
 
           PERFORM RL-1000-BROWSE
              THRU RL-1000-BROWSE-X.
              
           PERFORM RL-2000-READ-NEXT
              THRU RL-2000-READ-NEXT-X.
              
           IF WRL-IO-OK    
              PERFORM 6048-ADD-CLIG-RL 
                 THRU 6048-ADD-CLIG-RL-X 
                      UNTIL WRL-IO-EOF
           END-IF.
                  
           PERFORM RL-3000-END-BROWSE
              THRU RL-3000-END-BROWSE-X.

       6040-ADD-OTHER-CLIENT-DATA-X.
           EXIT.
               
      /
      *--------------
       6042-ADD-CLIA.     
      *--------------
                  
      *
      * CHECK TO SEE IF WE HAVE ALREADY ADDED THIS ROW
      *
           MOVE WS-NEW-CLI-ID          TO WCLIA-CLI-ID.
           MOVE RCLIA-CLI-ADDR-GR-CD   TO WCLIA-CLI-ADDR-GR-CD.
           MOVE RCLIA-CLI-ADDR-TYP-CD  TO WCLIA-CLI-ADDR-TYP-CD. 
           MOVE RCLIA-CLI-ADDR-SEQ-NUM TO WCLIA-CLI-ADDR-SEQ-NUM.  
 
           PERFORM CLIA-1000-READ
              THRU CLIA-1000-READ-X.
               
           IF WCLIA-IO-OK
              PERFORM CLIA-2000-READ-NEXT
                 THRU CLIA-2000-READ-NEXT-X
              GO TO 6042-ADD-CLIA-X
           END-IF.
               
      *
      * GET NON-KEY DATA FROM INTERNAL TABLE
      *
           IF WS-NEW-CLI-ID (1:1) = 'B' OR 'S'       
              IF WS-NEW-CLI-ID (1:1) = 'B'
                 STRING WS-NEW-CLI-ID (2:3) DELIMITED BY SIZE
                        '000'             DELIMITED BY SIZE
                        INTO              WS-ZMAP-ID
              ELSE
                 MOVE WS-NEW-CLI-ID (2:6)   TO WS-ZMAP-ID
              END-IF
               
              SET  WS-ZMAP-NOT-FND TO TRUE
              MOVE ZEROS           TO WS-ZMAP-SUB
               
              PERFORM UNTIL WS-ZMAP-FND OR WS-ZMAP-SUB >= WS-ZMAP-CNT
               
                ADD 1 TO WS-ZMAP-SUB
                 
                IF WS-ZMAP-ID = WZMAP-ID (WS-ZMAP-SUB)
                   SET  WS-ZMAP-FND TO TRUE
                    
                   IF WZMAP-ADDR-LOC-CD (WS-ZMAP-SUB) <> SPACES
                      MOVE WZMAP-ADDR-LOC-CD (WS-ZMAP-SUB) 
                      TO   RCLIA-CLI-ADDR-LOC-CD 
                   END-IF 
                    
                   IF  WZMAP-POSTAL-CD (WS-ZMAP-SUB) <> SPACES
                       MOVE WZMAP-POSTAL-CD (WS-ZMAP-SUB) 
                       TO   RCLIA-CLI-PSTL-CD 
                   END-IF 
                    
                   IF WZMAP-SAMA (WS-ZMAP-SUB) <> SPACES 
                      MOVE WZMAP-SAMA (WS-ZMAP-SUB) 
                      TO   RCLIA-CLI-ADDR-ADDL-TXT 
                   END-IF 
                    
                   IF WZMAP-CNTCT (WS-ZMAP-SUB) <> SPACES 
                      MOVE WZMAP-CNTCT (WS-ZMAP-SUB) 
                      TO   RCLIA-CLI-ADDR-CNTCT-TXT 
                   END-IF 
               
              END-PERFORM
 
      *
      * WRITE THE ROW
      *
           MOVE WS-NEW-CLI-ID TO WCLIA-CLI-ID.
            
           ADD 1 TO WS-CLIA-INS-CNT.
            
           IF WS-CNVR-RUN-TYPE-LIVE
              PERFORM CLIA-1000-WRITE
                 THRU CLIA-1000-WRITE-X
           END-IF.
               
           PERFORM CLIA-2000-READ-NEXT
              THRU CLIA-2000-READ-NEXT-X.
               
       6042-ADD-CLIA-X.
           EXIT.
      /
      *--------------
       6044-ADD-CLNC.     
      *--------------
                  
      *
      * CHECK TO SEE IF WE HAVE ALREADY ADDED THIS ROW
      *
           MOVE WS-NEW-CLI-ID          TO WCLNC-CLI-ID.
           MOVE RCLNC-CLI-CO-GR-CD     TO WCLNC-CLI-CO-GR-CD.
           MOVE RCLNC-CLI-CO-NM-TYP-CD TO WCLNC-CLI-CO-NM-TYP-CD. 
            
           PERFORM CLNC-1000-READ
              THRU CLNC-1000-READ-X.
               
           IF WCLNC-IO-OK
              PERFORM CLNC-2000-READ-NEXT
                 THRU CLNC-2000-READ-NEXT-X
              GO TO 6044-ADD-CLNC-X
           END-IF.
            
      *
      * GET NON-KEY DATA FROM INTERNAL TABLE
      *
           IF WS-NEW-CLI-ID (1:1) = 'B' OR 'S'       
              IF WS-NEW-CLI-ID (1:1) = 'B'
                 STRING WS-NEW-CLI-ID (2:3) DELIMITED BY SIZE
                        '000'             DELIMITED BY SIZE
                        INTO              WS-ZMAP-ID
              ELSE
                 MOVE WS-NEW-CLI-ID (2:6)   TO WS-ZMAP-ID
              END-IF
               
              SET  WS-ZMAP-NOT-FND TO TRUE
              MOVE ZEROS           TO WS-ZMAP-SUB
               
              PERFORM UNTIL WS-ZMAP-FND OR WS-ZMAP-SUB >= WS-ZMAP-CNT
               
                ADD 1 TO WS-ZMAP-SUB
                 
                IF WS-ZMAP-ID = WZMAP-ID (WS-ZMAP-SUB)
                   SET  WS-ZMAP-FND TO TRUE
                    
                   IF RCLNC-CLI-CO-GR-KATAKANA
                      IF WZMAP-KATAK-NM (WS-ZMAP-SUB) <> SPACES 
                         MOVE WZMAP-KATAK-NM (WS-ZMAP-SUB) 
                         TO   RCLNC-CLI-CO-ENTR-NM 
FII01A                        RCLNC-CLI-CO-NM-PHNT-TXT
FII01A                        RCLNC-CLI-CO-NM
                      END-IF
                   ELSE 
                      IF RCLNC-CLI-CO-GR-KANJI
                         IF WZMAP-KANJ-NM  (WS-ZMAP-SUB) <> SPACES
                            MOVE WZMAP-KANJ-NM  (WS-ZMAP-SUB) 
                            TO   RCLNC-CLI-CO-ENTR-NM 
FII01A                           RCLNC-CLI-CO-NM-PHNT-TXT
FII01A                           RCLNC-CLI-CO-NM
                         END-IF
                      END-IF
                   END-IF
               
              END-PERFORM
               
      *
      * WRITE THE ROW
      *
           MOVE WS-NEW-CLI-ID TO WCLNC-CLI-ID.
            
           ADD 1 TO WS-CLNC-INS-CNT.
            
           IF WS-CNVR-RUN-TYPE-LIVE
              PERFORM CLNC-1000-WRITE
                 THRU CLNC-1000-WRITE-X
           END-IF.
               
           PERFORM CLNC-2000-READ-NEXT
              THRU CLNC-2000-READ-NEXT-X.
               
       6044-ADD-CLNC-X.
           EXIT.
      /
      *--------------
       6046-ADD-CLIG.     
      *--------------
                  
      *
      * FIRST GET THE ORIGINAL ROW TO GET NON-KEY DATA
      *
           MOVE WS-ORIG-CLI-ID TO WCLIG-CLI-ID.
         
           PERFORM CLIG-1000-READ
              THRU CLIG-1000-READ-X.
               
      *
      * CHECK TO SEE IF WE HAVE ALREADY ADDED THIS ROW
      *
           IF WCLIG-IO-OK 
              MOVE WS-NEW-CLI-ID TO WCLIG-CLI-ID
              PERFORM CLIG-1000-READ
                 THRU CLIG-1000-READ-X
              IF NOT WCLIG-IO-OK
                 MOVE WS-NEW-CLI-ID TO WCLIG-CLI-ID
                 ADD 1 TO WS-CLIG-INS-CNT
                 IF WS-CNVR-RUN-TYPE-LIVE
                    PERFORM CLIG-1000-WRITE
                       THRU CLIG-1000-WRITE-X
                 END-IF
              END-IF
           END-IF.
               
       6046-ADD-CLIG-X.
           EXIT.
      /
      *----------------
       6048-ADD-CLIG-RL.     
      *----------------
                  
      *
      * CHECK TO SEE IF WE HAVE ALREADY ADDED THIS ROW
      *
           MOVE RRL-KEY     TO WRL-KEY.
FII01B*    MOVE RCLI-CLI-ID TO WRL-CLI-ID.
FII01B     MOVE WS-NEW-CLI-ID TO WRL-CLI-ID.
            
           PERFORM RL-1000-READ
              THRU RL-1000-READ-X.
               
           IF WRL-IO-OK
              PERFORM RL-2000-READ-NEXT
                 THRU RL-2000-READ-NEXT-X
              GO TO 6048-ADD-CLIG-RL-X
           END-IF.
            
      *
      * WRITE THE ROW
      *
           MOVE WS-NEW-CLI-ID TO RRL-CLI-ID.
            
           ADD 1 TO WS-RL-INS-CNT.
            
           IF WS-CNVR-RUN-TYPE-LIVE
              PERFORM RL-1000-WRITE
                 THRU RL-1000-WRITE-X
           END-IF.
            
           PERFORM RL-2000-READ-NEXT
              THRU RL-2000-READ-NEXT-X.
               
       6048-ADD-CLIG-RL-X.
           EXIT.
            
      /
      *--------------------
       6100-DELETE-CLIENTS.     
      *--------------------
       
           MOVE LOW-VALUES  TO WCLI-KEY.
            
           STRING "B"           DELIMITED BY SIZE
                  INTO          WCLI-CLI-ID.
                   
           MOVE HIGH-VALUES TO WCLI-ENDBR-KEY.
            
           STRING "S"           DELIMITED BY SIZE
                  INTO          WCLI-ENDBR-CLI-ID.
                   
           PERFORM CLI-1000-BROWSE
              THRU CLI-1000-BROWSE-X.
              
           PERFORM CLI-2000-READ-NEXT
              THRU CLI-2000-READ-NEXT-X.
              
           IF WCLI-IO-OK    
              PERFORM 6120-DELETE-CLIENT
                 THRU 6120-DELETE-CLIENT-X 
                      UNTIL WCLI-IO-EOF
           END-IF.
                  
           PERFORM CLI-3000-END-BROWSE
              THRU CLI-3000-END-BROWSE-X.
               
       6100-DELETE-CLIENTS-X.
           EXIT.
      /
      *-------------------
       6120-DELETE-CLIENT.     
      *-------------------
            
           IF  RCLI-CLI-ID (1:1) <> "B"
           AND RCLI-CLI-ID (1:1) <> "S"
           AND RCLI-CLI-ID (1:6) <> "G01002"
              PERFORM CLI-2000-READ-NEXT
                 THRU CLI-2000-READ-NEXT-X
              GO TO 6120-DELETE-CLIENT-X
           END-IF.
            
           IF  RCLI-CLI-SEX-CD <> "C"
              PERFORM CLI-2000-READ-NEXT
                 THRU CLI-2000-READ-NEXT-X
              GO TO 6120-DELETE-CLIENT-X
           END-IF.
            
           MOVE SPACES TO WCLI-CLI-ID.
         
      *
      * ASSEMBLE KEY INTO TTAB DEPENDING ON TYPE OF CLIENT
      *
           SET WTTAB-IO-NOT-FOUND TO TRUE.
            
           EVALUATE TRUE
         
           WHEN RCLI-CLI-ID (1:1) = "B"
                MOVE RCLI-CLI-ID (2:3) TO WTTAB-ETBL-VALU-ID  
                PERFORM FIIB-1000-EDIT
                   THRU FIIB-1000-EDIT-X
                 
           WHEN RCLI-CLI-ID (1:1) = "G"
                MOVE RCLI-CLI-ID (7:3) TO WTTAB-ETBL-VALU-ID  
                PERFORM FIIB-1000-EDIT
                   THRU FIIB-1000-EDIT-X
                 
           WHEN RCLI-CLI-ID (1:1) = "S"
                MOVE RCLI-CLI-ID (2:6) TO WTTAB-ETBL-VALU-ID  
                PERFORM FIIC-1000-EDIT
                   THRU FIIC-1000-EDIT-X
            
           END-EVALUATE.
            
           IF NOT WTTAB-IO-OK 
              PERFORM CLI-2000-READ-NEXT
                 THRU CLI-2000-READ-NEXT-X
              GO TO 6120-DELETE-CLIENT-X
           END-IF.
             
      ****************************************************************
      ****************************************************************
      * TEMP CODE                                                    *
      ****************************************************************
      ****************************************************************
      *     IF RTTAB-ETBL-VALU-ID (1:2) NOT = '0A'
      *        PERFORM CLI-2000-READ-NEXT
      *           THRU CLI-2000-READ-NEXT-X
      *        GO TO 6120-DELETE-CLIENT-X
      *     END-IF.
            
      *
      * IF THE NEW ID IS THE SAME AS THE OLD ID THEN NO ACTION REQUIRED
      *
           IF  ( RCLI-CLI-ID (1:1) = "B" OR "G" )
           AND RTTAB-TTBL-VALU-TXT (1:3) = RTTAB-ETBL-VALU-ID (1:3)     
              PERFORM CLI-2000-READ-NEXT
                 THRU CLI-2000-READ-NEXT-X
              GO TO 6120-DELETE-CLIENT-X
           END-IF.
            
           IF  RCLI-CLI-ID (1:1) = "S"
           AND RTTAB-TTBL-VALU-TXT (1:6) = RTTAB-ETBL-VALU-ID (1:6)     
              PERFORM CLI-2000-READ-NEXT
                 THRU CLI-2000-READ-NEXT-X
              GO TO 6120-DELETE-CLIENT-X
           END-IF.

      *
      * INITIALIZE ALL BROWSE KEYS HERE
      *
           MOVE LOW-VALUES     TO WCLIA-KEY.
           MOVE SPACES         TO WCLIA-CLI-ID.
           MOVE HIGH-VALUES    TO WCLIA-ENDBR-KEY.
           MOVE SPACES         TO WCLIA-ENDBR-CLI-ID.
            
           MOVE LOW-VALUES     TO WCLNC-KEY.
           MOVE SPACES         TO WCLNC-CLI-ID.
           MOVE HIGH-VALUES    TO WCLNC-ENDBR-KEY.
           MOVE SPACES         TO WCLNC-ENDBR-CLI-ID.
            
           MOVE LOW-VALUES     TO WRL-KEY.
           MOVE SPACES         TO WRL-CLI-ID.
           MOVE HIGH-VALUES    TO WRL-ENDBR-KEY.
           MOVE SPACES         TO WRL-ENDBR-CLI-ID.
            
           EVALUATE TRUE
           WHEN RCLI-CLI-ID (1:1) = "B" 
              STRING RCLI-CLI-ID (1:1)        DELIMITED BY SIZE
                     RTTAB-ETBL-VALU-ID (1:3) DELIMITED BY SIZE    
                     INTO WCLIA-CLI-ID
                      
              STRING RCLI-CLI-ID (1:1)        DELIMITED BY SIZE
                     RTTAB-ETBL-VALU-ID (1:3) DELIMITED BY SIZE    
                     INTO WCLIA-ENDBR-CLI-ID
                      
              STRING RCLI-CLI-ID (1:1)        DELIMITED BY SIZE
                     RTTAB-ETBL-VALU-ID (1:3) DELIMITED BY SIZE    
                     INTO WCLNC-CLI-ID
                      
              STRING RCLI-CLI-ID (1:1)        DELIMITED BY SIZE
                     RTTAB-ETBL-VALU-ID (1:3) DELIMITED BY SIZE    
                     INTO WCLNC-ENDBR-CLI-ID
                     
      *       MOVE WCLIA-CLI-ID TO WCLIA-ENDBR-CLI-ID
      *                            WCLNC-CLI-ID 
      *                            WCLNC-ENDBR-CLI-ID
                           
           WHEN RCLI-CLI-ID (1:1) = "G"
              STRING "G01002"                 DELIMITED BY SIZE
                     RTTAB-ETBL-VALU-ID (1:3) DELIMITED BY SIZE    
                     INTO WCLIA-CLI-ID
              STRING "G01002"                 DELIMITED BY SIZE
                     RTTAB-ETBL-VALU-ID (1:3) DELIMITED BY SIZE    
                     INTO WCLIA-ENDBR-CLI-ID
              STRING "G01002"                 DELIMITED BY SIZE
                     RTTAB-ETBL-VALU-ID (1:3) DELIMITED BY SIZE    
                     INTO WCLNC-CLI-ID
              STRING "G01002"                 DELIMITED BY SIZE
                     RTTAB-ETBL-VALU-ID (1:3) DELIMITED BY SIZE    
                     INTO WCLNC-ENDBR-CLI-ID
              STRING "G01002"                 DELIMITED BY SIZE
                     RTTAB-ETBL-VALU-ID (1:3) DELIMITED BY SIZE    
                     INTO WRL-CLI-ID
              STRING "G01002"                 DELIMITED BY SIZE
                     RTTAB-ETBL-VALU-ID (1:3) DELIMITED BY SIZE    
                     INTO WRL-ENDBR-CLI-ID
                           
           WHEN RCLI-CLI-ID (1:1) = "S"
              STRING RCLI-CLI-ID (1:1)        DELIMITED BY SIZE
                     RTTAB-ETBL-VALU-ID (1:6) DELIMITED BY SIZE    
                     INTO WCLIA-CLI-ID
                      
              STRING RCLI-CLI-ID (1:1)        DELIMITED BY SIZE
                     RTTAB-ETBL-VALU-ID (1:6) DELIMITED BY SIZE    
                     INTO WCLIA-ENDBR-CLI-ID
                      
              STRING RCLI-CLI-ID (1:1)        DELIMITED BY SIZE
                     RTTAB-ETBL-VALU-ID (1:6) DELIMITED BY SIZE    
                     INTO WCLNC-CLI-ID
                      
              STRING RCLI-CLI-ID (1:1)        DELIMITED BY SIZE
                     RTTAB-ETBL-VALU-ID (1:6) DELIMITED BY SIZE    
                     INTO WCLNC-ENDBR-CLI-ID
                                    
           END-EVALUATE.
 
      *
      * CLIA - CLIENT ADDRESSES
      *
           PERFORM CLIA-1000-BROWSE
              THRU CLIA-1000-BROWSE-X.
              
           PERFORM CLIA-2000-READ-NEXT
              THRU CLIA-2000-READ-NEXT-X.
              
           IF WCLIA-IO-OK    
              PERFORM 6122-DELETE-CLIA 
                 THRU 6122-DELETE-CLIA-X 
                      UNTIL WCLIA-IO-EOF
           END-IF.
                  
           PERFORM CLIA-3000-END-BROWSE
              THRU CLIA-3000-END-BROWSE-X.
               
      *
      * CLNC - CLIENT NAMES
      *
           PERFORM CLNC-1000-BROWSE
              THRU CLNC-1000-BROWSE-X.
              
           PERFORM CLNC-2000-READ-NEXT
              THRU CLNC-2000-READ-NEXT-X.
              
           IF WCLNC-IO-OK    
              PERFORM 6124-DELETE-CLNC 
                 THRU 6124-DELETE-CLNC-X 
                      UNTIL WCLNC-IO-EOF
           END-IF.
                  
           PERFORM CLNC-3000-END-BROWSE
              THRU CLNC-3000-END-BROWSE-X.
               
      *
      * CLIG - PAYROLL DEDUCTION GROUP
      *
           IF RCLI-CLI-ID (1:1) NOT = "G"
              PERFORM 6129-DELETE-CLI
                 THRU 6129-DELETE-CLI-X
              PERFORM CLI-2000-READ-NEXT
                 THRU CLI-2000-READ-NEXT-X
              GO TO 6120-DELETE-CLIENT-X
           END-IF.
            
           PERFORM 6126-DELETE-CLIG
              THRU 6126-DELETE-CLIG-X.
               
      *
      * CLIG - PAYROLL DEDUCTION GROUP RELATIONSHIPS
      *
           PERFORM RL-1000-BROWSE
              THRU RL-1000-BROWSE-X.
              
           PERFORM RL-2000-READ-NEXT
              THRU RL-2000-READ-NEXT-X.
              
           IF WRL-IO-OK    
              PERFORM 6128-DELETE-CLIG-RL 
                 THRU 6128-DELETE-CLIG-RL-X 
                      UNTIL WRL-IO-EOF
           END-IF.
                  
           PERFORM RL-3000-END-BROWSE
              THRU RL-3000-END-BROWSE-X.
               
      *
      * CLI - CLIENT
      *
           PERFORM 6129-DELETE-CLI
              THRU 6129-DELETE-CLI-X.

           PERFORM CLI-2000-READ-NEXT
              THRU CLI-2000-READ-NEXT-X.
               
       6120-DELETE-CLIENT-X.
           EXIT.
            
      /
      *-----------------
       6122-DELETE-CLIA.     
      *-----------------
               
      *
      * IF LIVE RUN THEN DELETE THE OLD CLIENT ADDRESS
      *
           MOVE RCLIA-KEY TO WCLIA-KEY.

           PERFORM  CLIA-1000-READ-FOR-UPDATE
               THRU CLIA-1000-READ-FOR-UPDATE-X.

           IF WCLIA-IO-OK
              ADD 1 TO WS-CLIA-DEL-CNT
              MOVE  'ZSFIIA0022'       TO  WGLOB-MSG-REF-INFO
              MOVE  'CLIA'             TO  WGLOB-MSG-PARM (1)
              MOVE  WCLIA-KEY          TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM CLIA-1000-DELETE
                    THRU CLIA-1000-DELETE-X
              ELSE
                 PERFORM CLIA-3000-UNLOCK
                    THRU CLIA-3000-UNLOCK-X
              END-IF
           END-IF.
              
           PERFORM CLIA-2000-READ-NEXT
              THRU CLIA-2000-READ-NEXT-X.
               
       6122-DELETE-CLIA-X.
           EXIT.
      /
      *-----------------
       6124-DELETE-CLNC.     
      *-----------------
       
      *
      * IF LIVE RUN THEN DELETE THE OLD CLIENT NAME
      *
           MOVE RCLNC-KEY TO WCLNC-KEY.

           PERFORM  CLNC-1000-READ-FOR-UPDATE
               THRU CLNC-1000-READ-FOR-UPDATE-X.

           IF WCLNC-IO-OK
              ADD 1 TO WS-CLNC-DEL-CNT
              MOVE  'ZSFIIA0022'       TO  WGLOB-MSG-REF-INFO
              MOVE  'CLNC'             TO  WGLOB-MSG-PARM (1)
              MOVE  WCLNC-KEY          TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM CLNC-1000-DELETE
                    THRU CLNC-1000-DELETE-X
              ELSE
                 PERFORM CLNC-3000-UNLOCK
                    THRU CLNC-3000-UNLOCK-X
              END-IF
           END-IF.
               
           PERFORM CLNC-2000-READ-NEXT
              THRU CLNC-2000-READ-NEXT-X.
               
       6124-DELETE-CLNC-X.
           EXIT.
      /
      *-----------------
       6126-DELETE-CLIG.     
      *-----------------
               
      *
      * IF LIVE RUN THEN DELETE THE OLD PAYROLL DEDUCTION GROUP
      *
           MOVE RCLI-CLI-ID TO WCLIG-CLI-ID.

           PERFORM  CLIG-1000-READ-FOR-UPDATE
               THRU CLIG-1000-READ-FOR-UPDATE-X.

           IF WCLIG-IO-OK
              ADD 1 TO WS-CLIG-DEL-CNT
              MOVE  'ZSFIIA0022'       TO  WGLOB-MSG-REF-INFO
              MOVE  'CLIG'             TO  WGLOB-MSG-PARM (1)
              MOVE  WCLIG-KEY          TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM CLIG-1000-DELETE
                    THRU CLIG-1000-DELETE-X
              ELSE
                 PERFORM CLIG-3000-UNLOCK
                    THRU CLIG-3000-UNLOCK-X
              END-IF
           END-IF.
            
       6126-DELETE-CLIG-X.
           EXIT.
      /
      *--------------------
       6128-DELETE-CLIG-RL.     
      *--------------------
               
      *
      * IF LIVE RUN THEN DELETE THE OLD CLIENT RELATIONSHIP
      *
           MOVE RRL-KEY TO WRL-KEY.

           PERFORM  RL-1000-READ-FOR-UPDATE
               THRU RL-1000-READ-FOR-UPDATE-X.

           IF WRL-IO-OK
              ADD 1 TO WS-RL-DEL-CNT
              MOVE  'ZSFIIA0022'       TO  WGLOB-MSG-REF-INFO
              MOVE  'CLIG-RL'          TO  WGLOB-MSG-PARM (1)
              MOVE  WRL-KEY            TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM RL-1000-DELETE
                    THRU RL-1000-DELETE-X
              ELSE
                 PERFORM RL-3000-UNLOCK
                    THRU RL-3000-UNLOCK-X
              END-IF
           END-IF.
              
           PERFORM RL-2000-READ-NEXT
              THRU RL-2000-READ-NEXT-X.
               
       6128-DELETE-CLIG-RL-X.
           EXIT.
            
      /
      *----------------
       6129-DELETE-CLI.     
      *----------------
               
      *
      * IF LIVE RUN THEN DELETE THE OLD CLIENT
      *
           MOVE RCLI-CLI-ID TO WCLI-CLI-ID.

           PERFORM  CLI-1000-READ-FOR-UPDATE
               THRU CLI-1000-READ-FOR-UPDATE-X.

           IF WCLI-IO-OK
              EVALUATE TRUE
              WHEN RCLI-CLI-ID (1:1) = "B"
                   ADD 1 TO WS-CLI-DEL-BRCH-CNT
              WHEN RCLI-CLI-ID (1:1) = "G"
                   ADD 1 TO WS-CLI-DEL-CLIG-CNT
              WHEN RCLI-CLI-ID (1:1) = "S"
                   ADD 1 TO WS-CLI-DEL-SALE-CNT
              END-EVALUATE
              MOVE  'ZSFIIA0022'       TO  WGLOB-MSG-REF-INFO
              MOVE  'CLI'              TO  WGLOB-MSG-PARM (1)
              MOVE  WCLI-KEY           TO  WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM CLI-1000-DELETE
                    THRU CLI-1000-DELETE-X
              ELSE
                 PERFORM CLI-3000-UNLOCK
                    THRU CLI-3000-UNLOCK-X
              END-IF
           END-IF.
            
       6129-DELETE-CLI-X.
           EXIT.
            
      /
      *---------------------
       6500-CONVERT-POLC-TBL.       
      *---------------------

           MOVE LOW-VALUES  TO WPOLC-KEY.
           MOVE HIGH-VALUES TO WPOLC-ENDBR-KEY.
 
           PERFORM POLC-1000-BROWSE
              THRU POLC-1000-BROWSE-X.
              
           PERFORM POLC-2000-READ-NEXT
              THRU POLC-2000-READ-NEXT-X.
              
           IF WPOLC-IO-OK    
              PERFORM 6520-CONVERT-POLC-ROW
                 THRU 6520-CONVERT-POLC-ROW-X 
                      UNTIL WPOLC-IO-EOF
           END-IF.
                  
           PERFORM POLC-3000-END-BROWSE
              THRU POLC-3000-END-BROWSE-X.
               
       6500-CONVERT-POLC-TBL-X.    
           EXIT.
            
      /
      *---------------------
       6520-CONVERT-POLC-ROW.       
      *---------------------
 
      *
      * ONLY INTERESTED IN POLC ROWS THAT REPRESENT PAYROLL DEDUCTION
      * GROUPS
      * 
           IF RPOLC-CLI-ID (1:6) NOT = 'G01002'
              PERFORM POLC-2000-READ-NEXT
                 THRU POLC-2000-READ-NEXT-X
              GO TO 6520-CONVERT-POLC-ROW-X
           END-IF.
            
      *
      * ONLY INTERESTED IN POLC ROWS THAT REPRESENT BILLING INFO
      * 
           IF NOT RPOLC-POL-CLI-REL-TYP-LBILL 
              PERFORM POLC-2000-READ-NEXT
                 THRU POLC-2000-READ-NEXT-X
              GO TO 6520-CONVERT-POLC-ROW-X
           END-IF.
       
      *
      * LOOKUP THE BRANCH ON TTAB
      *
           MOVE RPOLC-CLI-ID (7:3) TO WTTAB-ETBL-VALU-ID  
            
           PERFORM FIIB-1000-EDIT
              THRU FIIB-1000-EDIT-X.
                 
      *
      * BYPASS IF NOT ON TTAB
      *
           IF NOT WTTAB-IO-OK
              PERFORM POLC-2000-READ-NEXT
                 THRU POLC-2000-READ-NEXT-X
              GO TO 6520-CONVERT-POLC-ROW-X
           END-IF.
            
      *
      * IF THE POLICY CLIENT IS ASSOCIATD WITH A BRANCH THAT IS
      * REMAINING OPEN THEN BYPASS THE POLICY CLIENT
      *
           IF RTTAB-TTBL-VALU-TXT (1:3) = RTTAB-ETBL-VALU-ID (1:3)    
              PERFORM POLC-2000-READ-NEXT
                 THRU POLC-2000-READ-NEXT-X
              GO TO 6520-CONVERT-POLC-ROW-X
           END-IF.
 
      *
      * GET THE POLICY CLIENT FOR DELETE
      *
           MOVE RPOLC-KEY TO WPOLC-KEY.

           PERFORM  POLC-1000-READ-FOR-UPDATE
               THRU POLC-1000-READ-FOR-UPDATE-X.

      *
      * DELETE EXISTING POLICY CLIENT AND INSERT NEW ONE
      *
           IF WPOLC-IO-OK
              ADD 1 TO WS-POLC-UPD-CNT
              IF WS-CNVR-RUN-TYPE-LIVE
                 PERFORM POLC-1000-DELETE
                    THRU POLC-1000-DELETE-X
                 STRING RPOLC-CLI-ID        (1:6) DELIMITED BY SIZE
                        RTTAB-TTBL-VALU-TXT (1:3) DELIMITED BY SIZE
                        INTO WPOLC-CLI-ID                
                 PERFORM POLC-1000-WRITE
                    THRU POLC-1000-WRITE-X
              ELSE
                 PERFORM POLC-3000-UNLOCK
                    THRU POLC-3000-UNLOCK-X
              END-IF
           END-IF.
                  
      *
      * GET NEXT POLICY CLIENT   
      *
           PERFORM POLC-2000-READ-NEXT
              THRU POLC-2000-READ-NEXT-X.
               
       6520-CONVERT-POLC-ROW-X.    
           EXIT.
            
      *-------------------
      *3A00-CONVERT-HI-TBL.           
      *-------------------
      *
      *    MOVE LOW-VALUES    TO WHI-KEY.
      *    MOVE ZEROS         TO WHI-POL-TRXN-TIME.
      *    MOVE ZEROS         TO WHI-POL-TRXN-SEQ-NUM.
      *    MOVE WWKDT-LOW-DT  TO WHI-POL-TRXN-EFF-DT.
      *    MOVE WWKDT-LOW-DT  TO WHI-POL-TRXN-DT.
      *    MOVE HIGH-VALUES   TO WHI-ENDBR-KEY.
      *    MOVE 9999999       TO WHI-ENDBR-POL-TRXN-TIME.
      *    MOVE 999           TO WHI-ENDBR-POL-TRXN-SEQ-NUM.
      *    MOVE WWKDT-HIGH-DT TO WHI-ENDBR-POL-TRXN-EFF-DT.
      *    MOVE WWKDT-HIGH-DT TO WHI-ENDBR-POL-TRXN-DT.
      *     
      *    PERFORM HI-1000-BROWSE 
      *       THRU HI-1000-BROWSE-X.
      *        
      *    IF WHI-IO-OK
      *       PERFORM HI-2000-READ-NEXT
      *          THRU HI-2000-READ-NEXT-X
      *    END-IF.
      *     
      *    PERFORM 3A10-CONVERT-HI-ROW              
      *       THRU 3A10-CONVERT-HI-ROW-X
      *            UNTIL WHI-IO-EOF.
      *             
      *    PERFORM HI-3000-END-BROWSE
      *       THRU HI-3000-END-BROWSE-X.
      *
      *3A00-CONVERT-HI-TBL-X.
      *    EXIT.
      *
      *-------------------
      *3A10-CONVERT-HI-ROW.           
      *-------------------
      *
      *    EVALUATE TRUE
      *     
      *    WHEN RHI-POL-HIST-TYP-CD = 'A'
      *     
      *    MOVE RHI-POL-TRXN-DTL-INFO-TXT TO WAT77-REC-INFO 
      *    MOVE 'FIIB '                   TO RTTAB-ETBL-TYP-ID
      *    MOVE SPACES                    TO RTTAB-ETBL-VALU-ID 
      *     
      *    STRING WAT77-BR-ID DELIMITED BY SIZE 
      *           WAT77-SO-ID DELIMITED BY SIZE 
      *                       INTO RTTAB-ETBL-VALU-ID
      *
      *    MOVE 'AD'                      TO RTTAB-TTAB-ADMIN-APPL-ID 
      *     
      *    PERFORM TTAB-1000-READ
      *       THRU TTAB-1000-READ-X
      *        
      *    IF  NOT WTTAB-IO-OK
      *        MOVE  'ZSFIIA0003'       TO  WGLOB-MSG-REF-INFO
      *        MOVE  RTTAB-ETBL-VALU-ID TO  WGLOB-MSG-PARM (1)
      *        PERFORM  0260-1000-GENERATE-MESSAGE
      *            THRU 0260-1000-GENERATE-MESSAGE-X
      *        PERFORM  0030-5000-LOGIC-ERROR
      *            THRU 0030-5000-LOGIC-ERROR-X
      *    END-IF
      *     
      *    IF RTTAB-TTBL-VALU-TXT (1:10) NOT = RTTAB-ETBL-VALU-ID (1:10)
      *       MOVE RHI-KEY TO WHI-KEY
      *       PERFORM HI-1000-READ-FOR-UPDATE
      *          THRU HI-1000-READ-FOR-UPDATE-X
      *       IF WHI-IO-OK
      *          MOVE RTTAB-TTBL-VALU-TXT(1:5) TO WAT77-BR-ID
      *          MOVE RTTAB-TTBL-VALU-TXT(6:5) TO WAT77-SO-ID
      *          MOVE WAT77-REC-INFO    
      *          TO   RHI-POL-TRXN-DTL-INFO-TXT
      *          PERFORM HI-2000-REWRITE
      *             THRU HI-2000-REWRITE-X
      *          PERFORM HI-3000-UNLOCK
      *             THRU HI-3000-UNLOCK-X
      *       END-IF
      *    END-IF
      *        
      *    END-EVALUATE.
      *     
      *
      *3A10-CONVERT-HI-ROW-X.
      *    EXIT.

      /
      *------------------
       9000-PRINT-STATS.
      *------------------
      
      **   OUTPUT A BLANK LINE
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                   TO L0040-INPUT-LINE.

      ** MSG: ********** NORMAL PROGRAM TERMINATION **********
           MOVE 'XS00000157' TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.
               
      *
      * TTAB ID NOT ON INGENIUM
      *
           MOVE  'ZSFIIA0015'       TO  WGLOB-MSG-REF-INFO.
           MOVE  WS-TTAB-NOMAT-CNT  TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
      * BRCH - DELETED
      *        INSERTED
      *        NO MATCH
           MOVE  'ZSFIIA0010'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'BRCH'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-BRCH-DEL-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0009'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'BRCH'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-BRCH-INS-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0013'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'BRCH'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-BRCH-NOMAT-CNT  TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
      
      * SALE - DELETED
      *        INSERTED
      *        NO MATCH
           MOVE  'ZSFIIA0010'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'SALE'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-SALE-DEL-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0009'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'SALE'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-SALE-INS-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0013'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'SALE'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-SALE-NOMAT-CNT  TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
      * AG   - UPDATED
      *        NO MATCH
           MOVE  'ZSFIIA0011'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'AG  '             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-AG-UPD-CNT     TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0013'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'AG  '             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-AG-NOMAT-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
      * POL  - UPDATED
      *        NO MATCH
      *        SERVICING AGENT NOT ON INGENIUM
           MOVE  'ZSFIIA0011'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'POL '             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-POL-UPD-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0013'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'POL '             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-POL-NOMAT-CNT   TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0017'       TO  WGLOB-MSG-REF-INFO.
           MOVE  WS-POL-NOAG-CNT    TO  WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
      * SPOL - UPDATED
      *        NO MATCH
           MOVE  'ZSFIIA0011'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'SPOL'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-SPOL-UPD-CNT   TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0013'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'SPOL '            TO  WGLOB-MSG-PARM (1).
           MOVE  WS-SPOL-NOMAT-CNT  TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
      * USEC - UPDATED
      *        NO MATCH
           MOVE  'ZSFIIA0011'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'USEC'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-USEC-UPD-CNT   TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0013'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'USEC '            TO  WGLOB-MSG-PARM (1).
           MOVE  WS-USEC-NOMAT-CNT  TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
      * UWAS - DELETED
      *        NO MATCH
           MOVE  'ZSFIIA0010'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'UWAS'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-UWAS-DEL-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0013'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'UWAS'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-UWAS-NOMAT-CNT  TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
      * CLI - DELETED
      *       INSERTED
      *       NO MATCH
           MOVE  'ZSFIIA0010'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLI-BRCH'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLI-DEL-BRCH-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0010'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLI-SALE'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLI-DEL-SALE-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0010'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLI-CLIG'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLI-DEL-CLIG-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
           MOVE  'ZSFIIA0009'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLI-BRCH'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLI-INS-BRCH-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0009'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLI-SALE'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLI-INS-SALE-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0009'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLI-CLIG'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLI-INS-CLIG-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
           MOVE  'ZSFIIA0013'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLI-BRCH'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLI-NOMAT-BRCH-CNT  TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0013'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLI-SALE'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLI-NOMAT-SALE-CNT  TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0013'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLI-CLIG'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLI-NOMAT-CLIG-CNT  TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
      * CLIA - DELETED
      *        INSERTED
           MOVE  'ZSFIIA0010'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLIA'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLIA-DEL-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0009'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLIA'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLIA-INS-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
      * CLNC - DELETED
      *        INSERTED
           MOVE  'ZSFIIA0010'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLNC'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLNC-DEL-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0009'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLNC'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLNC-INS-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
      * CLIG - DELETED
      *        INSERTED
           MOVE  'ZSFIIA0010'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLIG'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLIG-DEL-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0009'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'CLIG'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-CLIG-INS-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
      * RL   - DELETED
      *        INSERTED
           MOVE  'ZSFIIA0010'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'RL  '             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-RL-DEL-CNT      TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0009'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'RL  '             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-RL-INS-CNT      TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
      * POLC - UPDATED  (DELETED AND INSERTED)
      *        INSERTED
           MOVE  'ZSFIIA0011'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'POLC'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-POLC-UPD-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

      * PHST - UPDATED
      *        NO MATCH
           MOVE  'ZSFIIA0011'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'PHST'             TO  WGLOB-MSG-PARM (1).
           MOVE  WS-PHST-UPD-CNT   TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0013'       TO  WGLOB-MSG-REF-INFO.
           MOVE  'PHST '            TO  WGLOB-MSG-PARM (1).
           MOVE  WS-PHST-NOMAT-CNT  TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
      * XTAB- DELETED
      *       INSERTED
      *       NO MATCH
           MOVE  'ZSFIIA0010'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'XTAB-BRCH'            TO  WGLOB-MSG-PARM (1).
           MOVE  WS-XTAB-DEL-BRCH-CNT    TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0010'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'XTAB-SALE'            TO  WGLOB-MSG-PARM (1).
           MOVE  WS-XTAB-DEL-SALE-CNT   TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
           MOVE  'ZSFIIA0009'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'XTAB-BRCH'            TO  WGLOB-MSG-PARM (1).
           MOVE  WS-XTAB-INS-BRCH-CNT   TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0009'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'XTAB-SALE'            TO  WGLOB-MSG-PARM (1).
           MOVE  WS-XTAB-INS-SALE-CNT   TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
           MOVE  'ZSFIIA0013'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'XTAB-BRCH'            TO  WGLOB-MSG-PARM (1).
           MOVE  WS-XTAB-NOMAT-BRCH-CNT TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE  'ZSFIIA0013'           TO  WGLOB-MSG-REF-INFO.
           MOVE  'XTAB-SALE'            TO  WGLOB-MSG-PARM (1).
           MOVE  WS-XTAB-NOMAT-SALE-CNT TO  WGLOB-MSG-PARM (2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
       9000-PRINT-STATS-X.
           EXIT.

      /
      *------------------
       9999-CLOSE-FILES.
      *------------------
      
           PERFORM BCF-4000-CLOSE
              THRU BCF-4000-CLOSE-X.
      
           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

           CLOSE ZMAP-DATA-FILE.
            
       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      * LINK COPYBOOKS
      *****************************************************************
       
       COPY CCPS0010.
       COPY CCPL0010.
       
       COPY CCPS0950.
       COPY CCPL0950.
      
       COPY XCPL0040.
      
       COPY XCPL0260.
      
       COPY XCPL0270.
      
       COPY XCPLBCF.
      
       COPY XCPLOCF.
      
       COPY XCPL0030.
       
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS
      *****************************************************************
       COPY CCPPCCC.
       COPY ZCPEFIIB.
       COPY ZCPEFIIC.
       COPY ZCPEFIIS.

      /
      *****************************************************************
      *  FILE I/O COPYBOOKS
      *****************************************************************
       
       COPY XCPOOCF.
      
       COPY XCPOBCF.
      
       COPY XCPNBCF.

       COPY CCPBHI.
       COPY CCPUHI.
        
       COPY CCPABRCH.
       COPY CCPBBRCH.
       COPY CCPNBRCH.
       COPY CCPUBRCH.
       COPY CCPXBRCH.
        
       COPY CCPASALE.
       COPY CCPBSALE.
       COPY CCPNSALE.
       COPY CCPUSALE.
       COPY CCPXSALE.
        
       COPY CCPBAG.
       COPY CCPNAG.
       COPY CCPUAG.
        
       COPY CCPTPOL.
       COPY CCPNPOL.
       COPY CCPUPOL.
        
       COPY CCPTSPOL.
       COPY CCPNSPOL.
       COPY CCPUSPOL.
        
       COPY XCPTUSEC.
       COPY XCPNUSEC.
       COPY XCPUUSEC.
        
       COPY NCPBUWAS.
       COPY NCPNUWAS.
       COPY NCPUUWAS.
       COPY NCPXUWAS.
        
       COPY CCPACLI.
       COPY CCPBCLI.
       COPY CCPNCLI.
       COPY CCPUCLI.
       COPY CCPXCLI.
       COPY CCPACLIA.
       COPY CCPBCLIA.
       COPY CCPNCLIA.
       COPY CCPUCLIA.
       COPY CCPXCLIA.
       COPY CCPACLNC.
       COPY CCPBCLNC.
       COPY CCPNCLNC.
       COPY CCPUCLNC.
       COPY CCPXCLNC.
       COPY CCPACLIG.
       COPY CCPBCLIG.
       COPY CCPNCLIG.
       COPY CCPUCLIG.
       COPY CCPXCLIG.
       COPY CCPARL.
       COPY CCPBRL.
       COPY CCPNRL.
       COPY CCPURL.
       COPY CCPXRL.
        
       COPY CCPAPOLC.
       COPY CCPBPOLC.
       COPY CCPUPOLC.
       COPY CCPXPOLC.
        
       COPY NCPBTTAB.
       COPY NCPNTTAB.
        
       COPY XCPAXTAB.
       COPY XCPBXTAB.
       COPY XCPNXTAB.
       COPY XCPUXTAB.
       COPY XCPXXTAB.
        
       COPY XCPL0035.
        
      *****************************************************************
      **                 END OF PROGRAM ZSBMFIIA                     **
      *****************************************************************
