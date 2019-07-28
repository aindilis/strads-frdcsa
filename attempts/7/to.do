(need to have the ability to add other things to the KB besides
 percepts, such as beliefs, rather than have consider(X) :-
 perceive(A), have consider(Y) :- believe(B).  Have to go from
 percepts to beliefs somehow, as in goal.)

(Limitations:
 (currently, if an event generates multiple reaction events, they
  are added to the queue sequentially.  they should be
  simultaneous, probably.)

 (currently, there is no room for `and` or `or` in the head of a
  consider.  It would work at first, but then during the reaction
  generation phase it wouldn't work because the rules wouldn't
  evaluate properly: consider(B,do(B,acceptInvitation(B,A))) :-
  perceive(B,do(A,inviteToParty(A,B))).)  )

(2019-07-10 01:45:23 <aindilis> I've added some more cases to the system, and
      it's starting to get a bit diverse in terms of runthroughs, but I
      haven't added more semantics, such as the ability to react to an
      expectation, or the ability for an action to affect world state.
2019-07-10 01:46:58 <aindilis> but it's very satsifying to see the system in
      action.  another thing to wonder is how to handle the fact that
      suppositional-reasoner theoretically handles unknown actions, whereas so
      far all reactions of this system have to be defined ahead of time.
2019-07-10 01:48:07 <aindilis> I suspect to get it to advance in terms of
      semantics it will be necessary to encode using CycL
2019-07-10 01:48:49 <aindilis> I was wondering will your next release
      (hopefully) early next week contain a working Prolog backend to
      LarKC_CL?  Or should I use the one that LudumDare44 uses?
2019-07-10 01:49:17 <aindilis> *Or should I use the LarKC_CL release that
      LudumDare44 uses?)
