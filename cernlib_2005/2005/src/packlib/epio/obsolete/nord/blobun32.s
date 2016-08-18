*
* $Id: blobun32.s,v 1.1.1.1 1996/03/08 15:21:55 mclareni Exp $
*
* $Log: blobun32.s,v $
* Revision 1.1.1.1  1996/03/08 15:21:55  mclareni
* Epio
*
*
#if defined(CERNLIB_ND50)||defined(CERNLIB_ND500)
       MODULE M_BLOBUN32W
% CALL BLO32W(SOURCE,N1,TARGET,N2,N3)
% MOVES 32 BIT WORDS INTO 32 BIT WORDS. CAN START ON 16 BIT BOUNDARY IN SOURCE
% CALL BUN32W(SOURCE,N1,TARGET,N2,N3)
% MOVES 32 BIT WORDS INTO 32 BIT WORDS. CAN START ON 16 BIT BOUNDARY IN TARGET
% VERSION 811002
       EXPORT BLO32W,BUN32W
       ROUTINE BLO32W,BUN32W
       LIB BLO32W,BUN32W
VBAS:  STACK FIXED
PAR:   W BLOCK 5
       ENDSTACK
BLO32W:  ENTF VBAS
       W4:=IND(B.PAR+16)
       IF <= GO BACK
       W1:=IND(B.PAR+4)
       W1-1
       W1 MULAD 2,B.PAR
       W2:=IND(B.PAR+12)
       W2-1
       W BMOVE R1.0,IND(B.PAR+8)(R2),R4
       RET
BUN32W:  ENTF VBAS
       W4:=IND(B.PAR+16)
       IF <= GO BACK
       W1:=IND(B.PAR+4)
       W1-1
       W2:=IND(B.PAR+12)
       W2-1
       W2 MULAD 2,B.PAR+8
       W BMOVE IND(B.PAR)(R1),R2.0,R4
BACK:  RET
       ENDROUTINE
       ENDMODULE
#endif