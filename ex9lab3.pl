:- op(100,xfy,+=+).
:- op(200,xfy,este).
:- op(100,xfy,#=#).
Z este X +=+ Y :- number(X),number(Y),!, Z is (X+Y)/2.
Z este X +=+ Y :- Zaux este Y, Z este X +=+ Zaux .
Z este X #=# Y :- X>0,Y>0, Z is 2 /(1 / X + 1 / Y).