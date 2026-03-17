      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSRU9683.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER  : XSRU9683                                         **
      **  REMARKS : KATAKANA CONVERSION ROUTINE:                     **
      **                                                             **
      **            THIS PROGRAM TAKES AN INPUT TEXT FIELD OF        **
      **            KATAKANA CHARACTERS AND CONVERTS THE CHARACTERS  **
      **            FROM SINGLE BYTE CHARACTERS TO DOUBLE BYTE       **
      **            CHARACTERS.                                      **
      **                                                             **
      **       FOR BUSINESS IN JAPAN.                                **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTHOR  DESCRIPTION                               **
01PT02** 01AUG01    MAW    INITIAL VERSION                           **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU9683'.
        
       01  WS-IN-SUB                      PIC S9(04) BINARY.
       01  WS-OUT-SUB                     PIC S9(04) BINARY.
 
       01  WS-CHAR-FOUND-SW               PIC X.
           88  WS-CHAR-NOT-FOUND          VALUE 'N'.
           88  WS-CHAR-FOUND              VALUE 'Y'.
 
       01  WS-CONVERT-KA-SBC-FLD          PIC X(70).
       01  WS-CONVERT-KA-SBC-R REDEFINES WS-CONVERT-KA-SBC-FLD.
           05  WS-CONVERT-KA-SBC          PIC X(01) OCCURS 70 TIMES.
            
       01  WS-CONVERT-KA-DBC-FLD          PIC X(140).
       01  WS-CONVERT-KA-DBC-R REDEFINES WS-CONVERT-KA-DBC-FLD.
           05  WS-CONVERT-KA-DBC          PIC X(01) OCCURS 140 TIMES.
            
       01  WS-SB-CHAR1                    PIC 9(02) COMP.
       01  WS-SB-CHAR1-R  REDEFINES WS-SB-CHAR1.
           05  FILLER                     PIC X(01).
           05  WS-THE-SB-CHAR1            PIC X(01).
                
       01  WS-SB-CHAR2                    PIC 9(02) COMP.
       01  WS-SB-CHAR2-R  REDEFINES WS-SB-CHAR2.
           05  FILLER                     PIC X(01).
           05  WS-THE-SB-CHAR2            PIC X(01).

       01  WS-HEX-00      PIC 9(01) BINARY VALUE 0.

       01  WS-HEX-14      PIC 9(01) BINARY VALUE 20.
       01  WS-HEX-1F      PIC 9(01) BINARY VALUE 31.
       01  WS-HEX-27      PIC 9(01) BINARY VALUE 39.
       01  WS-HEX-28      PIC 9(01) BINARY VALUE 40.
       01  WS-HEX-29      PIC 9(01) BINARY VALUE 41.
       01  WS-HEX-30      PIC 9(01) BINARY VALUE 48.
       01  WS-HEX-31      PIC 9(01) BINARY VALUE 49.
       01  WS-HEX-32      PIC 9(01) BINARY VALUE 50.
       01  WS-HEX-33      PIC 9(01) BINARY VALUE 51.
       01  WS-HEX-34      PIC 9(01) BINARY VALUE 52.
       01  WS-HEX-35      PIC 9(01) BINARY VALUE 53.
       01  WS-HEX-36      PIC 9(01) BINARY VALUE 54.
       01  WS-HEX-37      PIC 9(01) BINARY VALUE 55.
       01  WS-HEX-38      PIC 9(01) BINARY VALUE 56.
       01  WS-HEX-39      PIC 9(01) BINARY VALUE 57.
       01  WS-HEX-4A      PIC 9(01) BINARY VALUE 74.
       01  WS-HEX-4D      PIC 9(01) BINARY VALUE 77.
       01  WS-HEX-4E      PIC 9(01) BINARY VALUE 78.
       01  WS-HEX-4F      PIC 9(01) BINARY VALUE 79.
       01  WS-HEX-50      PIC 9(01) BINARY VALUE 80.
       01  WS-HEX-51      PIC 9(01) BINARY VALUE 81.
       01  WS-HEX-52      PIC 9(01) BINARY VALUE 82.
       01  WS-HEX-54      PIC 9(01) BINARY VALUE 84.
       01  WS-HEX-55      PIC 9(01) BINARY VALUE 85.
       01  WS-HEX-56      PIC 9(01) BINARY VALUE 86.
       01  WS-HEX-58      PIC 9(01) BINARY VALUE 88.
       01  WS-HEX-5A      PIC 9(01) BINARY VALUE 90.
       01  WS-HEX-5C      PIC 9(01) BINARY VALUE 92.
       01  WS-HEX-5D      PIC 9(01) BINARY VALUE 93.
       01  WS-HEX-5E      PIC 9(01) BINARY VALUE 94.
       01  WS-HEX-5F      PIC 9(01) BINARY VALUE 95.
       01  WS-HEX-61      PIC 9(01) BINARY VALUE 97.
       01  WS-HEX-62      PIC 9(01) BINARY VALUE 98.
       01  WS-HEX-63      PIC 9(01) BINARY VALUE 99.
       01  WS-HEX-64      PIC 9(01) BINARY VALUE 100.
       01  WS-HEX-65      PIC 9(01) BINARY VALUE 101.
       01  WS-HEX-66      PIC 9(01) BINARY VALUE 102.
       01  WS-HEX-67      PIC 9(01) BINARY VALUE 103.
       01  WS-HEX-68      PIC 9(01) BINARY VALUE 104.
       01  WS-HEX-69      PIC 9(01) BINARY VALUE 105.
       01  WS-HEX-6A      PIC 9(01) BINARY VALUE 106.
       01  WS-HEX-6B      PIC 9(01) BINARY VALUE 107.
       01  WS-HEX-6C      PIC 9(01) BINARY VALUE 108.
       01  WS-HEX-6D      PIC 9(01) BINARY VALUE 109.
       01  WS-HEX-6E      PIC 9(01) BINARY VALUE 110.
       01  WS-HEX-6F      PIC 9(01) BINARY VALUE 111.
       01  WS-HEX-70      PIC 9(01) BINARY VALUE 112.
 
       01  WS-HEX-81      PIC 9(01) BINARY VALUE 129.
       01  WS-HEX-82      PIC 9(01) BINARY VALUE 130.
       01  WS-HEX-83      PIC 9(01) BINARY VALUE 131.
 
       01  WS-HEX-A6      PIC 9(01) BINARY VALUE 166.
       01  WS-HEX-A7      PIC 9(01) BINARY VALUE 167.
       01  WS-HEX-A8      PIC 9(01) BINARY VALUE 168.
       01  WS-HEX-A9      PIC 9(01) BINARY VALUE 169.
       01  WS-HEX-AA      PIC 9(01) BINARY VALUE 170.
       01  WS-HEX-AB      PIC 9(01) BINARY VALUE 171.
       01  WS-HEX-AC      PIC 9(01) BINARY VALUE 172.
       01  WS-HEX-AD      PIC 9(01) BINARY VALUE 173.
       01  WS-HEX-AE      PIC 9(01) BINARY VALUE 174.
       01  WS-HEX-AF      PIC 9(01) BINARY VALUE 175.
       01  WS-HEX-B0      PIC 9(01) BINARY VALUE 176.
       01  WS-HEX-B1      PIC 9(01) BINARY VALUE 177.
       01  WS-HEX-B2      PIC 9(01) BINARY VALUE 178.
       01  WS-HEX-B3      PIC 9(01) BINARY VALUE 179.
       01  WS-HEX-B4      PIC 9(01) BINARY VALUE 180.
       01  WS-HEX-B5      PIC 9(01) BINARY VALUE 181.
       01  WS-HEX-B6      PIC 9(01) BINARY VALUE 182.
       01  WS-HEX-B7      PIC 9(01) BINARY VALUE 183.
       01  WS-HEX-B8      PIC 9(01) BINARY VALUE 184.
       01  WS-HEX-B9      PIC 9(01) BINARY VALUE 185.
       01  WS-HEX-BA      PIC 9(01) BINARY VALUE 186.
       01  WS-HEX-BB      PIC 9(01) BINARY VALUE 187.
       01  WS-HEX-BC      PIC 9(01) BINARY VALUE 188.
       01  WS-HEX-BD      PIC 9(01) BINARY VALUE 189.
       01  WS-HEX-BE      PIC 9(01) BINARY VALUE 190.
       01  WS-HEX-BF      PIC 9(01) BINARY VALUE 191.
       01  WS-HEX-C0      PIC 9(01) BINARY VALUE 192.
       01  WS-HEX-C1      PIC 9(01) BINARY VALUE 193.
       01  WS-HEX-C2      PIC 9(01) BINARY VALUE 194.
       01  WS-HEX-C3      PIC 9(01) BINARY VALUE 195.
       01  WS-HEX-C4      PIC 9(01) BINARY VALUE 196.
       01  WS-HEX-C5      PIC 9(01) BINARY VALUE 197.
       01  WS-HEX-C6      PIC 9(01) BINARY VALUE 198.
       01  WS-HEX-C7      PIC 9(01) BINARY VALUE 199.
       01  WS-HEX-C8      PIC 9(01) BINARY VALUE 200.
       01  WS-HEX-C9      PIC 9(01) BINARY VALUE 201.
       01  WS-HEX-CA      PIC 9(01) BINARY VALUE 202.
       01  WS-HEX-CB      PIC 9(01) BINARY VALUE 203.
       01  WS-HEX-CC      PIC 9(01) BINARY VALUE 204.
       01  WS-HEX-CD      PIC 9(01) BINARY VALUE 205.
       01  WS-HEX-CE      PIC 9(01) BINARY VALUE 206.
       01  WS-HEX-CF      PIC 9(01) BINARY VALUE 207.
       01  WS-HEX-D0      PIC 9(01) BINARY VALUE 208.
       01  WS-HEX-D1      PIC 9(01) BINARY VALUE 209.
       01  WS-HEX-D2      PIC 9(01) BINARY VALUE 210.
       01  WS-HEX-D3      PIC 9(01) BINARY VALUE 211.
       01  WS-HEX-D4      PIC 9(01) BINARY VALUE 212.
       01  WS-HEX-D5      PIC 9(01) BINARY VALUE 213.
       01  WS-HEX-D6      PIC 9(01) BINARY VALUE 214.
       01  WS-HEX-D7      PIC 9(01) BINARY VALUE 215.
       01  WS-HEX-D8      PIC 9(01) BINARY VALUE 216.
       01  WS-HEX-D9      PIC 9(01) BINARY VALUE 217.
       01  WS-HEX-DA      PIC 9(01) BINARY VALUE 218.
       01  WS-HEX-DB      PIC 9(01) BINARY VALUE 219.
       01  WS-HEX-DC      PIC 9(01) BINARY VALUE 220.
       01  WS-HEX-DD      PIC 9(01) BINARY VALUE 221.

      /
       COPY XCWLDTLK.
      /
       COPY XCWWWKDT.
      /
       COPY CCWWINDX.
      /
      *****************
       LINKAGE SECTION.
      *****************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
 
       COPY XCWL9683.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L9683-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------

           MOVE SPACES TO L9683-OUTPUT-TEXT.

           IF  L9683-RQST-SB-TO-DB
               PERFORM 1000-CONVERT-SB-TO-DB
                  THRU 1000-CONVERT-SB-TO-DB-X
           ELSE
               MOVE L9683-INPUT-TEXT  TO L9683-OUTPUT-TEXT
           END-IF.
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
      /

      *----------------------
       1000-CONVERT-SB-TO-DB.
      *----------------------         

           MOVE SPACES TO WS-CONVERT-KA-SBC-FLD
                          WS-CONVERT-KA-DBC-FLD.

           MOVE L9683-INPUT-TEXT  TO WS-CONVERT-KA-SBC-FLD.
           MOVE ZEROS             TO WS-OUT-SUB.
            
           PERFORM 2000-CNVT-KA-SBC-TO-DBC
              THRU 2000-CNVT-KA-SBC-TO-DBC-X
              VARYING WS-IN-SUB FROM 1 BY 1
              UNTIL   WS-IN-SUB > 70.
               
           MOVE WS-CONVERT-KA-DBC-FLD  TO L9683-OUTPUT-TEXT.
 
       1000-CONVERT-SB-TO-DB-X.
           EXIT.

      /
      *----------------------------
       2000-CNVT-KA-SBC-TO-DBC.
      *----------------------------

      *  CONVERT KATAKANA SINGLE BYTE CHARACTERS TO KATAKANA DOUBLE 
      *  BYTE CHARACTERS  

           MOVE WS-HEX-83                     TO WS-SB-CHAR1.

           MOVE WS-HEX-00                     TO WS-SB-CHAR2.
           MOVE WS-CONVERT-KA-SBC (WS-IN-SUB) TO WS-THE-SB-CHAR2.

           SET WS-CHAR-FOUND TO TRUE.

           EVALUATE WS-SB-CHAR2
              WHEN WS-HEX-A6   SUBTRACT WS-HEX-14 FROM WS-SB-CHAR2
              WHEN WS-HEX-A7   SUBTRACT WS-HEX-67 FROM WS-SB-CHAR2 
              WHEN WS-HEX-A8   SUBTRACT WS-HEX-66 FROM WS-SB-CHAR2 
              WHEN WS-HEX-A9   SUBTRACT WS-HEX-65 FROM WS-SB-CHAR2 
              WHEN WS-HEX-AA   SUBTRACT WS-HEX-64 FROM WS-SB-CHAR2 
              WHEN WS-HEX-AB   SUBTRACT WS-HEX-63 FROM WS-SB-CHAR2 
              WHEN WS-HEX-AC   SUBTRACT WS-HEX-29 FROM WS-SB-CHAR2 
              WHEN WS-HEX-AD   SUBTRACT WS-HEX-28 FROM WS-SB-CHAR2 
              WHEN WS-HEX-AE   SUBTRACT WS-HEX-27 FROM WS-SB-CHAR2 
              WHEN WS-HEX-AF   SUBTRACT WS-HEX-4D FROM WS-SB-CHAR2 
              WHEN WS-HEX-B0   SUBTRACT WS-HEX-55 FROM WS-SB-CHAR2 
                               MOVE     WS-HEX-81   TO WS-SB-CHAR1
              WHEN WS-HEX-B1   SUBTRACT WS-HEX-70 FROM WS-SB-CHAR2 
              WHEN WS-HEX-B2   SUBTRACT WS-HEX-6F FROM WS-SB-CHAR2 
              WHEN WS-HEX-B3   SUBTRACT WS-HEX-6E FROM WS-SB-CHAR2 
              WHEN WS-HEX-B4   SUBTRACT WS-HEX-6D FROM WS-SB-CHAR2 
              WHEN WS-HEX-B5   SUBTRACT WS-HEX-6C FROM WS-SB-CHAR2 
              WHEN WS-HEX-B6   SUBTRACT WS-HEX-6C FROM WS-SB-CHAR2 
              WHEN WS-HEX-B7   SUBTRACT WS-HEX-6B FROM WS-SB-CHAR2 
              WHEN WS-HEX-B8   SUBTRACT WS-HEX-6A FROM WS-SB-CHAR2 
              WHEN WS-HEX-B9   SUBTRACT WS-HEX-69 FROM WS-SB-CHAR2 
              WHEN WS-HEX-BA   SUBTRACT WS-HEX-68 FROM WS-SB-CHAR2 
              WHEN WS-HEX-BB   SUBTRACT WS-HEX-67 FROM WS-SB-CHAR2 
              WHEN WS-HEX-BC   SUBTRACT WS-HEX-66 FROM WS-SB-CHAR2 
              WHEN WS-HEX-BD   SUBTRACT WS-HEX-65 FROM WS-SB-CHAR2 
              WHEN WS-HEX-BE   SUBTRACT WS-HEX-64 FROM WS-SB-CHAR2 
              WHEN WS-HEX-BF   SUBTRACT WS-HEX-63 FROM WS-SB-CHAR2 
              WHEN WS-HEX-C0   SUBTRACT WS-HEX-62 FROM WS-SB-CHAR2 
              WHEN WS-HEX-C1   SUBTRACT WS-HEX-61 FROM WS-SB-CHAR2 
              WHEN WS-HEX-C2   SUBTRACT WS-HEX-5F FROM WS-SB-CHAR2 
              WHEN WS-HEX-C3   SUBTRACT WS-HEX-5E FROM WS-SB-CHAR2 
              WHEN WS-HEX-C4   SUBTRACT WS-HEX-5D FROM WS-SB-CHAR2 
              WHEN WS-HEX-C5 THRU WS-HEX-CA 
                               SUBTRACT WS-HEX-5C FROM WS-SB-CHAR2 
              WHEN WS-HEX-CB   SUBTRACT WS-HEX-5A FROM WS-SB-CHAR2 
              WHEN WS-HEX-CC   SUBTRACT WS-HEX-58 FROM WS-SB-CHAR2 
              WHEN WS-HEX-CD   SUBTRACT WS-HEX-56 FROM WS-SB-CHAR2 
              WHEN WS-HEX-CE   SUBTRACT WS-HEX-54 FROM WS-SB-CHAR2 
              WHEN WS-HEX-CF THRU WS-HEX-D0 
                               SUBTRACT WS-HEX-52 FROM WS-SB-CHAR2 
              WHEN WS-HEX-D1 THRU WS-HEX-D3 
                               SUBTRACT WS-HEX-51 FROM WS-SB-CHAR2 
              WHEN WS-HEX-D4   SUBTRACT WS-HEX-50 FROM WS-SB-CHAR2 
              WHEN WS-HEX-D5   SUBTRACT WS-HEX-4F FROM WS-SB-CHAR2 
              WHEN WS-HEX-D6 THRU WS-HEX-DB 
                               SUBTRACT WS-HEX-4E FROM WS-SB-CHAR2 
              WHEN WS-HEX-DC   SUBTRACT WS-HEX-4D FROM WS-SB-CHAR2 
              WHEN WS-HEX-DD   SUBTRACT WS-HEX-4A FROM WS-SB-CHAR2 
              WHEN WS-HEX-30 THRU WS-HEX-39 
                               ADD WS-HEX-1F TO WS-SB-CHAR2
                               MOVE     WS-HEX-82   TO WS-SB-CHAR1
              WHEN OTHER 
                   SET WS-CHAR-NOT-FOUND TO TRUE
           END-EVALUATE.
 
      * IF INPUT CHARACTER IS NOT FOUND (IE. NOT A SINGLE BYTE KATAKANA 
      * CHARACTER), THEN MOVE THE INPUT CHARACTER TO THE OUTPUT ARRAY 
           IF  WS-CHAR-NOT-FOUND
               ADD  +1           TO WS-OUT-SUB
               MOVE WS-CONVERT-KA-SBC (WS-IN-SUB) 
                                 TO WS-CONVERT-KA-DBC (WS-OUT-SUB)
               GO TO 2000-CNVT-KA-SBC-TO-DBC-X 
           END-IF.
 
      * FIRST MOVE THE LEAD BYTE TO THE DOUBLE BYTE CHAR OUTPUT ARRAY 
           ADD  +1               TO WS-OUT-SUB.
           MOVE WS-THE-SB-CHAR1  TO WS-CONVERT-KA-DBC (WS-OUT-SUB).
 
      * NEXT MOVE THE TRAILING BYTE TO THE DOUBLE BYTE CHAR OUTPUT ARRAY 
           ADD +1 TO WS-OUT-SUB.
           MOVE WS-THE-SB-CHAR2  TO WS-CONVERT-KA-DBC (WS-OUT-SUB).
            
       2000-CNVT-KA-SBC-TO-DBC-X.
           EXIT.
            
      /
      *****************************************************************
      *   LINKAGE PROCESSING COPYBOOKS                                *
      *****************************************************************
       
      *****************************************************************
      **                 END OF PROGRAM XSRU9683                     **
      *****************************************************************
