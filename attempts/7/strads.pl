:- use_module(library(random)).

:- multifile believe/2, consider/2, are/2.
:- discontiguous believe/2, consider/2, are/2.

:- dynamic flag/2, event/1, events/1, perceive/2, dead/1.

:- consult('util').
:- consult('logic').
:- consult('rules').
:- consult('kb').

start(Flags) :-
	foreach(member(Flag,Flags),assert(Flag)),
	(flag(security,on) -> consult('security/security_rules') ; true),
	(   flag(security,on) -> consult('security/security_kb') ; true),
	initialAllEvents(AllEvents),
	initializeKB(AllEvents),
	mainLoop.

initializeKB(AllEvents) :-
	foreach(member(Events,AllEvents),assert(events(Events))).

mainLoop :-
	repeat,
	(   selectNextEventsFromEventsQueue(Events) ->
	    (	
		updateKnowledgeBaseFromEvents,
		identifyActorsWhoMightReact(Events,Actors),
		determineReactions(Events,Actors,AllReactions),
		updateKnowledgeBase(AllReactions),
		findall(CurrentEvent,
			(   
			    member([_Actor,Reactions],AllReactions),
			    member(CurrentEvent,Reactions)
			),
			CurrentEvents),
		assertz(events(CurrentEvents)),
		viewIf(4,[currentEvents,CurrentEvents]),

		retractall(perceive(_,_)),
		retractall(event(_)),

		%% nl, %% writeln([-------------------------------]),
		fail
	    ) ;
	    true).

selectNextEventsFromEventsQueue(Events) :-
	(   events(Events),
	    foreach(member(Event,Events),
		    assert(event(Event))),
	    (	length(Events,0) -> fail ;
		(   retract(events(Events)),
		    view([events,Events])))).

identifyActorsWhoMightReact(_Events,Actors) :-
	findall(Actor,isa(Actor,actor),Actors).

determineReactions(_Events,Actors,AllReactions) :-
	foreach(member(Actor,Actors),
		(   not(dead(Actor)) ->
		    foreach(event(Event),
			    assert(perceive(Actor,Event))) ; true)),
	findall(perceive(Actor,Event),perceive(Actor,Event),Percepts),
	viewIf(4,[percepts,Percepts]),
	findall([Actor,Reactions],
		(   
		    member(Actor,Actors),
		    findall(PossibleReaction,consider(Actor,PossibleReaction),PossibleReactions),
		    viewIf(8,[actor,Actor,possibleReactions,PossibleReactions]),
		    %% have to know which actions are disjoint, for now, just select one random action
		    (	length(PossibleReactions,0) -> Reactions = [] ; (random_member(Reaction,PossibleReactions),Reactions = [Reaction]))
		),
		AllReactions),
	viewIf(4,[allReactions,AllReactions]).

updateKnowledgeBaseFromEvents :-
	true.

updateKnowledgeBase(_AllReactions).
