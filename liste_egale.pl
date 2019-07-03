egal([],[]).
egal([H1|T1],[H2|T2]):- H1==H2, egal(T1,T2).


%raspuns_corect(id_intrebare,lista_optiuni_corecte).
raspuns_corect(i1,[a,b,f]).
raspuns_corect(i2,[b,c,d]).
raspuns_corect(i3,[d]).
raspuns_corect(i4,[a,d]).
raspuns_corect(i5,[a,b,c,d]).

%raspuns(nume_elev,id_intrebari,lista_optiuni)
raspuns(ion,i1,[a,b,c,f]).
raspuns(ion,i2,[c,f]).
raspuns(ion,i3,[d]).
raspuns(ion,i3,[a,d]).
raspuns(ion,i4,[a,b,c,d]).
raspuns(ion,i5,[a,b,c,d]).
raspuns(mihai,i1,[b,c,f]).
raspuns(mihai,i2,[b,c,d]).
raspuns(mihai,i3,[a,b]).
raspuns(mihai,i4,[a,d]).
raspuns(mihai,i5,[c]).
raspuns(alin,i1,[b,c,d]).
raspuns(alin,i2,[b,c,d]).
raspuns(alin,i3,[b]).
raspuns(alin,i4,[a,d]).
raspuns(alin,i5,[a,d,e,f]).
raspuns(teo,i1,[a,b,f]).
raspuns(teo,i2,[b,c,d]).
raspuns(teo,i3,[d]).
raspuns(teo,i4,[d,e,f]).
raspuns(teo,i5,[a,b,c,d]).
raspuns(lavinia,i1,[c,d,f]).
raspuns(lavinia,i2,[a]).
raspuns(lavinia,i3,[a,d]).
raspuns(lavinia,i4,[a,d,f]).
raspuns(lavinia,i5,[a,b,c]).
raspuns(daniel,i1,[a,b,f]).
raspuns(daniel,i2,[b,c,d]).
raspuns(daniel,i3,[d]).
raspuns(daniel,i4,[a,d]).
raspuns(daniel,i5,[a,b,c,d]).


list_copii(Id,L):-raspuns_corect(Id,ListaRaspuns),bagof(X,raspuns(X,Id,ListaRaspuns),L).
