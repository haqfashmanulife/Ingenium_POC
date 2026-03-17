      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSDU0289.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSDU0289                                         **
      **  REMARKS:  CURRENCY ROUNDING AND TRUNCATION PROGRAM.        **
      **  THIS PROGRAM ROUNDS OR TRUNCATES A CURRENCY AMOUNT TO      **
      **  THE NUMBER OF DIGITS APPLICABLE TO THE CURRENCY.           **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
017150**  09FEB01  612J   CURRENCY SCALING                           **
M245B1**  07MAR14  CTS    CHANGES ARE DONE FOR CURRENCY ROUNDING     ** 
M245A3**  07APR14  CTS    CURRENCY ROUND UP                          **
Q61668**  13JUL15  CTS    FRA TAX WITH HOLDING AMOUNT ROUNDED CHANGES**
B28573**  23AUG24  CTS    CHANGES DONE AS  PART OF BEAVER BEAV-28573 **
UY3010**  15JUL21  CTS    ROUNDING RULE FOR STREAM 3                 **
UY3V7A**  27NOV24  CTS    STREAM 3 ROUNDING LOGIC INCLUSION          **
S49446** 09APR25   CTS    FIX FOR RETROFIT                           **
S50105**  12MAY25  CTS    CHANGES AS PART OF PE FIX                  **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU0289'.
       
M245B1       01  WS-WORKING-STORAGE.
M245B1           05  WS-CRCY-CD                PIC X(02).
M245B1               88  WS-CRCY-CD-0-DCML     VALUE 'JP'.  
B28573*M245A3           05  WS-CRCY-OUT-AMT           PIC 9(9)V9(9).
B28573           05  WS-CRCY-OUT-AMT           PIC 9(13)V9(5).
M245A3           05  WS-CRCY-INTG-AMT          PIC 9(18).
M245A3           05  WS-CRCY-DCML-AMT          PIC V9(18).
M245A3           05  WS-EXP-10-VAL             PIC 9(02) VALUE 10.
M245A3           05  WS-RND-UP                 PIC 9(10).
S49446
S49446 01  WGLOB-GLOBAL-AREA.
S49446 COPY XCWWGLOB.
S49446
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      / 
      *****************
       LINKAGE SECTION.
      *****************
       COPY XCWL0289.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************

       PROCEDURE DIVISION USING L0289-PARM-INFO.


      *--------------
       0000-MAINLINE.
      *--------------
 
           SET L0289-RETRN-OK TO TRUE.
           INITIALIZE L0289-WRK-INFO.
 
           EVALUATE TRUE
 
               WHEN L0289-RQST-CRCY-RND
                    PERFORM  1000-CRCY-RND
                        THRU 1000-CRCY-RND-X
 
               WHEN L0289-RQST-CRCY-TRUNC
                    PERFORM  2000-CRCY-TRUNC
                        THRU 2000-CRCY-TRUNC-X
                        
M245B1         WHEN L0289-RQST-CRCY-CD-RND
M245B1              PERFORM  3000-CRCY-CD-RND
M245B1                  THRU 3000-CRCY-CD-RND-X    

M245A3         WHEN L0289-RQST-CRCY-RND-UP
M245A3              PERFORM  4000-CRCY-RND-UP
M245A3                  THRU 4000-CRCY-RND-UP-X
 
Q61668         WHEN L0289-RQST-CRCY-CD-TRUNC
Q61668              PERFORM  5000-CRCY-CD-TRUNC
Q61668                  THRU 5000-CRCY-CD-TRUNC-X 
               WHEN OTHER
                    SET L0289-RETRN-INVALD-RQST TO TRUE
 
           END-EVALUATE.
 
       0000-MAINLINE-X.
           GOBACK.
      /
 
      ****************************************************************
      * CURRENCY ROUNDING.
      * THIS ROUTINE ROUNDS THE RESULT OF A CURRENCY AMOUNT COMPUTATION
      * BASED ON THE CURRENCY SCALING DEFINED.
      ****************************************************************
      *--------------
       1000-CRCY-RND.
      *--------------
      
           EVALUATE TRUE
      
               WHEN L0289-CRCY-SCALE-0-DCML
                    COMPUTE L0289-CRCY-0-DCML-AMT ROUNDED
                          = L0289-CRCY-AMT
                    MOVE L0289-CRCY-0-DCML-AMT  TO L0289-CRCY-AMT
S50105                                             L0289-CRCY-AMT-1
      
               WHEN L0289-CRCY-SCALE-1-DCML
                    COMPUTE L0289-CRCY-1-DCML-AMT ROUNDED
                          = L0289-CRCY-AMT
                    MOVE L0289-CRCY-1-DCML-AMT  TO L0289-CRCY-AMT
S50105                                             L0289-CRCY-AMT-1
      
               WHEN L0289-CRCY-SCALE-2-DCML
                    COMPUTE L0289-CRCY-2-DCML-AMT ROUNDED
                          = L0289-CRCY-AMT
                    MOVE L0289-CRCY-2-DCML-AMT  TO L0289-CRCY-AMT
S50105                                             L0289-CRCY-AMT-1

UY3010         WHEN L0289-CRCY-SCALE-3-DCML
UY3010              COMPUTE L0289-CRCY-3-DCML-AMT ROUNDED
UY3010                      = L0289-CRCY-AMT
UY3010              MOVE L0289-CRCY-3-DCML-AMT  TO L0289-CRCY-AMT
S50105                                             L0289-CRCY-AMT-1
UY3V7A         WHEN L0289-CRCY-SCALE-4-DCML
UY3V7A              COMPUTE L0289-CRCY-4-DCML-AMT ROUNDED
S50105*UY3V7A                      = L0289-CRCY-AMT
S50105                      = L0289-CRCY-AMT-1
S50105*UY3V7A              MOVE L0289-CRCY-4-DCML-AMT  TO L0289-CRCY-AMT
S50105              MOVE L0289-CRCY-4-DCML-AMT  TO L0289-CRCY-AMT-1
UY3V7A
UY3V7A         WHEN L0289-CRCY-SCALE-5-DCML
UY3V7A              COMPUTE L0289-CRCY-5-DCML-AMT ROUNDED
S50105                      = L0289-CRCY-AMT-1
S50105*UY3V7A                      = L0289-CRCY-AMT
S50105*UY3V7A              MOVE L0289-CRCY-5-DCML-AMT  TO L0289-CRCY-AMT
S50105              MOVE L0289-CRCY-5-DCML-AMT  TO L0289-CRCY-AMT-1
UY3V7A
UY3V7A         WHEN L0289-CRCY-SCALE-6-DCML
UY3V7A              COMPUTE L0289-CRCY-6-DCML-AMT ROUNDED
S50105*UY3V7A                      = L0289-CRCY-AMT
S50105                      = L0289-CRCY-AMT-1
S50105*UY3V7A              MOVE L0289-CRCY-6-DCML-AMT  TO L0289-CRCY-AMT
S50105              MOVE L0289-CRCY-6-DCML-AMT  TO L0289-CRCY-AMT-1

      
               WHEN OTHER
                    SET L0289-RETRN-INVALD-SCALE TO TRUE
                    MOVE ZERO                    TO L0289-CRCY-AMT
      
           END-EVALUATE.
      
       1000-CRCY-RND-X.
           EXIT.
      /
      
      ****************************************************************
      * CURRENCY TRUNCATION.
      * THIS ROUTINE TRUNCATES THE RESULT OF A CURRENCY AMOUNT 
      * COMPUTATION BASED ON THE CURRENCY SCALING DEFINED.
      ****************************************************************
      *----------------
       2000-CRCY-TRUNC.
      *----------------
      
           EVALUATE TRUE
      
               WHEN L0289-CRCY-SCALE-0-DCML
                    MOVE L0289-CRCY-AMT         TO L0289-CRCY-0-DCML-AMT
                    MOVE L0289-CRCY-0-DCML-AMT  TO L0289-CRCY-AMT
      
               WHEN L0289-CRCY-SCALE-1-DCML
                    MOVE L0289-CRCY-AMT         TO L0289-CRCY-1-DCML-AMT
                    MOVE L0289-CRCY-1-DCML-AMT  TO L0289-CRCY-AMT
      
               WHEN L0289-CRCY-SCALE-2-DCML
                    MOVE L0289-CRCY-AMT         TO L0289-CRCY-2-DCML-AMT
                    MOVE L0289-CRCY-2-DCML-AMT  TO L0289-CRCY-AMT
      
               WHEN OTHER
                    SET L0289-RETRN-INVALD-SCALE TO TRUE
                    MOVE ZERO                    TO L0289-CRCY-AMT
      
           END-EVALUATE.
      
       2000-CRCY-TRUNC-X.
           EXIT.

M245B1*----------------
M245B1 3000-CRCY-CD-RND.
M245B1*----------------
M245B1     PERFORM  9000-GET-CRCY-INFO
M245B1         THRU 9000-GET-CRCY-INFO-X.
M245B1
M245B1     PERFORM  1000-CRCY-RND
M245B1         THRU 1000-CRCY-RND-X.
M245B1
M245B1 3000-CRCY-CD-RND-X.
M245B1     EXIT.
M245B1/   
M245A3*-----------------
M245A3 4000-CRCY-RND-UP.
M245A3*-----------------
M245A3  
M245A3* SET DEFAULT VALUE
M245A3
M245A3     INITIALIZE WS-CRCY-OUT-AMT.
M245A3     INITIALIZE WS-CRCY-INTG-AMT.
M245A3     INITIALIZE WS-CRCY-DCML-AMT.
M245A3
M245A3* GET CURRENCY SCALE QUANTITY
M245A3
M245A3     PERFORM  9000-GET-CRCY-INFO
M245A3         THRU 9000-GET-CRCY-INFO-X.
M245A3
M245A3* SET ROUND UP VALUE BASED ON COMPARISION OF DECIMAL PRECISION 
M245A3* AND CURRENCY SCALE QUANTITY
M245A3
M245A3     IF  L0289-CRCY-SCALE-QTY > L0289-DCML-PRECSN
M245A3         COMPUTE WS-RND-UP = WS-EXP-10-VAL ** L0289-DCML-PRECSN
M245A3     ELSE
M245A3         COMPUTE WS-RND-UP = WS-EXP-10-VAL 
M245A3                           ** L0289-CRCY-SCALE-QTY
M245A3     END-IF.
M245A3
M245A3* ROUND UP CALCULATION
M245A3                     
M245A3     COMPUTE WS-CRCY-OUT-AMT = L0289-CRCY-AMT 
M245A3                             * WS-RND-UP.
M245A3 
M245A3     MOVE WS-CRCY-OUT-AMT             TO WS-CRCY-INTG-AMT.
M245A3     MOVE WS-CRCY-OUT-AMT             TO WS-CRCY-DCML-AMT.
M245A3           
M245A3     IF  WS-CRCY-DCML-AMT > ZEROES
M245A3           
M245A3         COMPUTE WS-CRCY-INTG-AMT = WS-CRCY-INTG-AMT + 1
M245A3              
M245A3     END-IF.
M245A3           
M245A3     COMPUTE L0289-CRCY-AMT = WS-CRCY-INTG-AMT
M245A3                            / WS-RND-UP.
M245A3
M245A3 4000-CRCY-RND-UP-X.
M245A3     EXIT.
M245A3/
Q61668*-------------------
Q61668 5000-CRCY-CD-TRUNC.
Q61668*-------------------
Q61668     PERFORM  9000-GET-CRCY-INFO
Q61668         THRU 9000-GET-CRCY-INFO-X.
Q61668
Q61668     PERFORM  2000-CRCY-TRUNC
Q61668         THRU 2000-CRCY-TRUNC-X.
Q61668
Q61668 5000-CRCY-CD-TRUNC-X.
Q61668     EXIT.
Q61668/ 
M245B1****************************************************************
M245B1* IF L0289-CRCY-CD NOT EQUAL SIGN ON CURRENCY CODE, SET ZERO TO
M245B1* JAPANESE CURRENCY OTHERWISE SET 2 FOR OTHER CURRENCIES
M245B1****************************************************************
M245B1*-------------------
M245B1 9000-GET-CRCY-INFO.
M245B1*-------------------
M245B1
M245B1     IF  L0289-CRCY-CD = SPACES
M245B1         GO TO 9000-GET-CRCY-INFO-X
M245B1     END-IF.
M245B1
M245B1     MOVE L0289-CRCY-CD               TO WS-CRCY-CD.
M245B1            
M245B1     EVALUATE TRUE
M245B1      
M245B1         WHEN WS-CRCY-CD-0-DCML
M245B1             SET  L0289-CRCY-SCALE-0-DCML
M245B1                                      TO TRUE
M245B1           
M245B1         WHEN OTHER
M245B1             SET  L0289-CRCY-SCALE-2-DCML
M245B1                                      TO TRUE
M245B1                    
M245B1     END-EVALUATE.
M245B1
M245B1 9000-GET-CRCY-INFO-X.
M245B1     EXIT.

S49446 COPY XCPL0260.

      *****************************************************************
      **                 END OF PROGRAM XSDU0289                     **
      *****************************************************************
