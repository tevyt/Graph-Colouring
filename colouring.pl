adjacent(X,Y,Map):-
	member([X,Y],Map);
	member([Y,X],Map).

find_regions([],R,R).

find_regions([[X,Y]|S], R,A) :-
 (member(X,R) ->
  (member(Y,R) -> find_regions(S,R,A); find_regions(S,[Y|R],A));
   (member(Y,R) -> find_regions(S,[X|R],A); find_regions(S,[X,Y|R],A) ) ).

color(Map,Colors,Coloring) :-
        find_regions(Map,[],Regions),
        color_all(Regions,Colors,Coloring),
        \+ conflict(Map,Coloring).

color_all([R|Rs],Colors,[[R,C]|A]) :-
        member(C,Colors),
        color_all(Rs,Colors,A).

color_all([],_,[]).

conflict(Map,Coloring) :-
        member([R1,C],Coloring),
        member([R2,C],Coloring),
        adjacent(R1,R2,Map).

perform(X):-
       color([[hanover , westmoreland],[hanover , james],[westmoreland , james],[westmoreland , elizabeth],[james , elizabeth],[james , trelawny],[elizabeth , trelawny],[elizabeth, manchester],[trelawny , manchester],[trelawny , clarendon],[trelawny , ann],[manchester , ann],[manchester , clarendon],[ann, clarendon],[ann , catherine],[ann , mary],[claredon , catherine],[catherine , mary],[catherine , andrew],[mary , andrew],[mary , portland],[andrew , portland],[andrew , thomas],[andrew , kingston],[portland,thomas]],[red,blue,green,yellow,orange],X).
