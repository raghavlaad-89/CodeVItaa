# CodeVItaa

% Define rules for full adder 
full_adder(A, B, Cin, Sum, Cout) :-
	xor_gate(A, B, X1), 
    xor_gate(X1, Cin, Sum), 
    and_gate(A, B, P1), 
    and_gate(Cin, X1, P2), 
    or_gate(P1, P2, Cout).
% Define logic gates 
xor_gate(A, B, R) :-
	R is A xor B.
and_gate(A, B, R) :- R is A * B.
or_gate(A, B, R) :-
	R is A + B - A * B.
% Testing the full adder 
test_input(A, B, Cin) :-
	full_adder(A, B, Cin, Sum, Cout),
	format('Sum= ~w , Carry= ~w \n', [ Sum, Cout]).

test_full_adder:-
    test_input(0,0,0),
    test_input(0,0,1),
    test_input(0,1,0),
    test_input(0,1,1),
    test_input(1,0,0),
    test_input(1,0,1),
    test_input(1,1,0),
    test_input(1,1,1).








    

//parent child
% parent(Parent, Child) 
% parent(albert, jim). 
parent(albert, peter). 
parent(jim, brian). 
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

% female(Person) 
% female(irene). 
female(pat). 
female(lee). 
female(sandra). 
female(jenny). 
female(amanda). 
female(kate).
% male(Person) 
% male(albert). 
male(jim). 
male(peter). 
male(brian). 
male(john). 
male(darren). 
male(james). 
male(kyle).
% yearOfBirth(Person, Year).
% yearOfBirth(irene, 1923).
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
yearOfBirth(james, 1969).
yearOfBirth(kate, 1975).
yearOfBirth(kyle, 1976).


%1. Is Albert a parent of Peter?
%parent(albert, peter).

%2. Who is the child of Jim?
%parent(jim, Child).

%3. Who are the parents of Brian?
%parent(Parent, brian).

%4. Is Irene a grandparent of Brian?
grandparent(X,Y):-parent(X, Grandchild), parent(Grandchild, Y).
%grandparent(irene, brian).

%5. Find all the grandchildren of Irene
%grandparent(irene, X)

%6. Now add the following rule to familytree.pl and re-consult:
older(Person1, Person2):- yearOfBirth(Person1, Year1),yearOfBirth(Person2, Year2),Year2 > Year1.

%7. Who is older than Pat?
%older(X,pat).

%8. Who is younger than Darren?
%older(darren,Y)

%9. List the siblings of Sandra.
sibling(X, Y):- parent(Z, X) ,parent(Z,Y), X \= Y.
%sibling(X,sandra)

%10. Who is the older brother of Sandra?
olderbrother(Person1,Person2) :-yearOfBirth(Person1, Year1),yearOfBirth(Person2, Year2),Year2 > Year1,male(Person1),sibling(Person1,Person2).


%11. Find the predecessors of Kyle. predecessor(Person1,Person2) :-parent(Person1,Person2).
predecessor(Person1,Person2) :-parent(Person1,Y),predecessor(Y,Person2).


%12. Does Kate have a sister?
sister(Person1,Person2) :- sibling(Person1,Person2),female(Person1),Person1\=Person2.
 
%13. Is Albert a parent?
%parent(albert,X)

%14. Now add the following rule to familytree.pl and re-consult male1(person('Barry', 'Drake')).
%%male 1 (person(Jim', 'Fried")). female1(person("Dot", "Kanga")).
%15. Find the last names of all the males and females. last_name(Person, Last) :-
male1(person(First, Last)), Person = male(First, Last). last_name(Person, Last) :-
female1(person(First, Last)), Person = female(First, Last).

get_last_names(LastNames) :-
findall(Person, (last_name(Person, _)), LastNames).

