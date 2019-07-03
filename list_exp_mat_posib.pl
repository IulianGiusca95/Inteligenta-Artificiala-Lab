%calc_list(+Lista_exp,-Lista_exp_ramase, -Lista_rezultate).

calc_list([H|T],Le,Lr):-Hr is H, calc_list(T,Le1,Lr1),Le =[H|Le1],Lr=[Hr|Lr1] ; calc_list(T,Le,Lr).
calc_list([],[],[]).

