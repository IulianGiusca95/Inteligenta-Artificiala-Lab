% Giusca Iulian 242
% 11.3.2016

% Sa se creeze un predicat care primeste doua nume si returneaza in al 3-lea parametru cel mai mic in ordine lexicografica.

%minim_termeni(+X,+Y,-Z) 
%Predicatul principal 
minim_termeni(X,Y,Z):- (X@<Y,Z=X);Y@=<X, Z=Y.

/* Exemple de interogari
| ?- minim_termeni(a,b,X).                               
X = a ? y
yes
| ?- minim_termeni(b,a,X).
X = a ? ;
no
| ?- minim_termeni('afara este frig',afara,X).
X = afara ? ;
no
| ?- minim_termeni('afara',afara,X).          
X = afara ? ;
no
| ?- minim_termeni(afara,afar,X).             
X = afar ? y
yes
| ?- minim_termeni(bcdefghi,a,X).
X = a ? y
yes
| ?- minim_termeni(5,7,X).       
X = 5 ? y
yes
| ?- minim_termeni(5,a,X).
X = 5 ? y
yes
| ?- minim_termeni(5,a,X).
X = 5 ? ;
no
*/