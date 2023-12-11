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
    
    