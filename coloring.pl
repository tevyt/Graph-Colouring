parish(hanover).
parish(westmoreland).
parish(james).
parish(elizabeth).
parish(trelawny).
parish(manchester).
parish(ann).
parish(clarendon).
parish(catherine).
parish(mary).
parish(andrew).
parish(kingston).
parish(portland).
parish(thomas).


e(hanover , westmoreland).
e(hanover , james).
e(westmoreland , hanover).
e(westmoreland , james).
e(westmoreland , elizabeth).
e(james , hanover).
e(james , westmoreland).
e(james , elizabeth).
e(james , trelawny).
e(elizabeth , westmoreland).
e(elizabeth , james).
e(elizabeth , trelawny).
e(elizabeth, manchester).
e(trelawny , james).
e(trelawny , manchester).
e(trelawny , elizabeth).
e(trelawny , clarendon).
e(trelawny , ann).
e(manchester , elizabeth).
e(manchester , trelawny).
e(manchester , ann).
e(manchester , clarendon).
e(ann , trelawny).
e(ann , manchester).
e(ann, clarendon).
e(ann , catherine).
e(ann , mary).
e(clarendon , manchester).
e(clarendon , trelawny).
e(clarendon , ann).
e(claredon , catherine).
e(catherine , clarendon).
e(catherine , ann).
e(catherine , mary).
e(catherine , andrew).
e(mary , ann).
e(mary , catherine).
e(mary , andrew).
e(mary , portland).
e(andrew , catherine).
e(andrew , mary).
e(andrew , portland).
e(andrew , thomas).
e(andrew , kingston).
e(kingston , andrew).
e(portland , mary).
e(portland , andrew).
e(portland , thomas).
e(thomas , portland).
e(thomas , andrew).

edge(Parish1 , Parish2):-
	e(Parish1 , Parish2).


edge(Parish1 , Parish2):-
	member(Parish1 , parishes),
	member(Parish2 , Parishes),
	member(e(Parish1 , Parish2) ,Edges).






