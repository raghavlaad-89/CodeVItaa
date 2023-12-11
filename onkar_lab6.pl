parent(albert, jim).
parent(albert, peter).
parent(jim, bryan).
parent(john, darren).
parent(peter, lee).
parent(peter, sandra).
parent(peter, james).
parent(peter, kate).
parent(peter, kyle).
parent(brian, jenny).
parent(irene, jim).
parent(irene, peter).
parent(pat, brian).
parent(pat, darren).
parent(amanda, jenny).


female(irene).
female(pat).
female(lee).
female(sandra).
female(jenny).
female(amanda).
female(kate).



male(albert).
male(jim).
male(peter).
male(brian).
male(john).
male(darren).
male(james).
male(kyle).



yearOfBirth(irene, 1923).
yearOfBirth(pat, 1954).
yearOfBirth(lee, 1970).
yearOfBirth(sandra, 1973).
yearOfBirth(jenny, 2004).
yearOfBirth(amanda, 1979).
yearOfBirth(albert, 1926).
yearOfBirth(jim, 1949).
yearOfBirth(peter, 1945).
yearOfBirth(brian, 1974).
yearOfBirth(john, 1955).
yearOfBirth(darren, 1976).
yearOfBirth(james, 1996).
yearOfBirth(kate, 1974).
yearOfBirth(kyle, 1976).


male1(person('Barry', 'Drake')).
male1(person('Jim', 'Fried')).
female1(person('Dot', 'Kanga')).

%rules
%child(X,Y):-  parent(X,Y).
grandparent(X,Y):- parent(X,Z),parent(Z,Y).
older(X,Y):-yearOfBirth(X,A1),yearOfBirth(Y,A2), A1<A2.
sibling(X,Y):- parent(Z,X),parent(Z,Y).
olderSibling(X,Y):- older(X,Y),sibling(X,Y).
brother(X,Y):- male(X),sibling(X,Y).
olderBrother(X,Y):- brother(X,Y),sibling(X,Y).
pred(X,Y):- parent(X,Y).
pred(X,Y):-
    parent(X,Z),pred(Z,Y).
sister(X,Y):-female(X),sibling(X,Y).

lastnameMale(Y):- male1(person(_, Y)).
lastnameFemale(Y):- female1(person(_, Y)).