viewIf(Indent,Content) :-
	(   flag(debug,on) -> (tab(Indent),view(Content)) ; true).

view(Content) :-
	writeln(Content).
