:-op(100,xfx,#>).

T #> []:-number(T).
T #> [E|C] :-number(T),number(E), T > E, T #> C.

:-op(100,xfx,###).

[] ### _.
[H1|T1] ### [H2|T2] :-number(H1),number(H2), H1 =:= H2, T1 ### T2 .
