      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSDU1660.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSDU1660                                         **
      **  REMARKS:  CONVERT A DATE FROM INTERNAL TO INVERTED FORMAT, **
      **            OR FROM INVERTED TO INTERNAL.                    **
      **            CONVERT THE PASSED INPUT DATE FROM INTERNAL TO   **
      **            INVERTED OR INVERTED TO INTERNAL ACCORDING TO    **
      **            THE REQUEST CODE. INTERNAL DATES ARE EDITED      **
      **            BEFORE CONVERSION.                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
54-001**  01SEP96  GJR    MODIFICATIONS FOR MAINTAINABILITY          **
005409**  30OCT98  56     MODIFICATIONS FOR LEAP YEAR                **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
54-001 COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU1660'.
 
       01  WS-ALL-NINES              PIC 9(08)   VALUE 10000000.
       COPY XCWTDTTB.
       COPY XCWWWKDT.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       COPY XCWLDTLK.
       COPY XCWL1660.
      /
       PROCEDURE DIVISION USING LDTLK-PARM-INFO
                                L1660-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           SET LDTLK-VALID         TO TRUE.
           SET L1660-RETRN-OK      TO TRUE.
 
005409*    IF  L1660-LEAP-YEAR-VALID
005409*        CONTINUE
005409*    ELSE
005409*        SET L1660-DO-NOT-USE-LEAP-YEAR TO TRUE
005409*    END-IF.
 
005409*    MOVE L1660-LEAP-YEAR-SW TO LDTLK-LEAP-YEAR-SW.
 
           PERFORM  1000-PROCESS-DATE
               THRU 1000-PROCESS-DATE-X.
 
           MOVE LDTLK-VALID-SW     TO L1660-VALID-SW.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      *------------------
       1000-PROCESS-DATE.
      *------------------
 
           EVALUATE TRUE
 
               WHEN L1660-INTERNAL-TO-INVERTED
                    PERFORM  2000-COMPUTE-INVERTED
                        THRU 2000-COMPUTE-INVERTED-X
 
               WHEN L1660-INVERTED-TO-INTERNAL
                    PERFORM  3000-COMPUTE-INTERNAL
                        THRU 3000-COMPUTE-INTERNAL-X
               WHEN OTHER
                    SET LDTLK-NOT-VALID             TO TRUE
                    SET L1660-RETRN-INVALID-REQUEST TO TRUE
 
           END-EVALUATE.
 
       1000-PROCESS-DATE-X.
           EXIT.
 
      *----------------------
       2000-COMPUTE-INVERTED.
      *----------------------
 
           MOVE L1660-INTERNAL-DATE    TO LDTLK-DATE-1.
 
           COMPUTE L1660-INVERTED-DATE = WS-ALL-NINES
                  - ( (10000 * (LDTLK-YYYY-1 - 1800))
                    + (100 * LDTLK-MM-1)
                    + LDTLK-DD-1).
 
       2000-COMPUTE-INVERTED-X.
           EXIT.
 
      *----------------------
       3000-COMPUTE-INTERNAL.
      *----------------------
 
           COMPUTE LDTLK-INVRT-DATE = WS-ALL-NINES
                                    - L1660-INVERTED-DATE.
           MOVE WWKDT-ZERO-DT          TO LDTLK-DATE-1.
           MOVE LDTLK-INVRT-DD         TO LDTLK-DD-1.
           MOVE LDTLK-INVRT-MM         TO LDTLK-MM-1.
           COMPUTE LDTLK-YYYY-1 = LDTLK-INVRT-YYY + 1800.
 
           PERFORM  INED-0100-EDIT-INTERNAL
               THRU INED-0100-EDIT-INTERNAL-X.
 
           IF  LDTLK-NOT-VALID
               MOVE WWKDT-ZERO-DT      TO L1660-INTERNAL-DATE
           ELSE
               MOVE LDTLK-DATE-1       TO L1660-INTERNAL-DATE
           END-IF.
 
       3000-COMPUTE-INTERNAL-X.
           EXIT.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY XCPPINED.
       COPY XCPPLEAP.
      *****************************************************************
      **                 END OF PROGRAM XSDU1660                     **
      *****************************************************************
