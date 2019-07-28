%% DERIVED-PREDICATES

isa(A,B) :- are(List,B), member(A,List).

%% CHOICES

consider(B,do(B,acceptInvitation(B,A))) :- believe(B,do(A,inviteToParty(A,B))).
consider(B,do(B,declineInvitation(B,A))) :- believe(B,do(A,inviteToParty(A,B))).
consider(B,do(B,beHappy(B))) :- believe(B,do(A,acceptInvitation(A,B))).
consider(B,do(B,meetAtParty(B,A))) :- believe(B,do(A,acceptInvitation(A,B))).
consider(B,do(B,beSad(B))) :- believe(B,do(A,declineInvitation(A,B))).
