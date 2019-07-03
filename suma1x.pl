suma1(M,N,0):- M>N.
suma1(M,N,S):- M1 is M+1, suma1(M1,N,S1), S is S1+M.

suma2(N,S):- S is N*(N+1) div 2.