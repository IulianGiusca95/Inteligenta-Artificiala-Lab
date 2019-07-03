
:- op(100,xfy,+=+).
:- op(100,xfy,este).
Z este X +=+ Y :-Z1 este Y,Z is X + Z1.
Z este X +=+ Y :- number(X),number(Y), Z is X + Y.

