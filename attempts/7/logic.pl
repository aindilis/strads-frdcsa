believe(A,X) :-
	perceive(A,X).

percentageOfTheTime(Percentage) :-
	random(0.0,99.999999,X),
	X < Percentage.

%% perceive(A,E) :-
%% 	perceive(A,and(Events)),
%% 	member(E,Events).

%% %% perceive(A,E) :-
%% %% 	perceive(A,or(Events)),
%% %% 	member(E,Events).

