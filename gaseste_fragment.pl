%gaseste_fragment(+Lista,+Capat1,+Capat2,-Fragment)

gaseste_fragment(L,C1,C2,F):-gaseste_c1(L,C1,C1,C2,F).

gaseste_c1([H|T],[H|R],C1,C2,F):- gaseste_c1(T,R,C1,C2,F).
gaseste_c1([H|T],[C|R],C1,C2,F):- gaseste_c1(T,C1,C1,C2,F).
gaseste_c1(L,[],C1,C2,F):-gaseste_c2(L,C2,C2,F).

gaseste_c2([H|T],[H|R],C2,F):-gaseste_c2(T,R,C2,F1),F=[H|F1].
gaseste_c2([H|T],[C|R],C2,F):-gaseste_c2(T,C2,C2,F1),F=[H|F1].
gaseste_c2([H|T],[],C2,[]).