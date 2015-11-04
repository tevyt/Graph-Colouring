parish("Hanover").
parish("Westmoreland").
parish("St. James").
parish("St. Elizabeth").
parish("Trelawny").
parish("Manchester").
parish("Clarendon").
parish("St. Ann").
parish("St. Catherine").
parish("St. Mary").
parish("St. Andrew").
parish("Kingston").
parish("Portland").
parish("St. Thomas").

% Facts of the edges between two adjacent parishes of Jamaica
edge("Hanover","Westmoreland").
edge("Hanover","St. James").
edge("Westmoreland","St. James").
edge("Westmoreland","St. Elizabeth").
edge("St. James","St. Elizabeth").
edge("St. James","Trelawny").
edge("St. Elizabeth","Trelawny").
edge("St. Elizabeth","Manchester").
edge("Trelawny","Manchester").
edge("Trelawny","Clarendon").
edge("Trelawny","St. Ann").
edge("Manchester","St. Ann").
edge("Manchester","Clarendon").
edge("St. Ann","Clarendon").
edge("St. Ann","St. Catherine").
edge("St. Ann","St. Catherine").
edge("Clarendon","St. Catherine").
edge("St. Catherine","St. Mary").
edge("St. Catherine","St. Andrew").
edge("St. Mary","St. Andrew").
edge("St. Mary","Portland").
edge("St. Andrew","Portland").
edge("St. Andrew","St. Thomas").
edge("St. Andrew","Kingston").
edge("Portland","St. Thomas").

%Colours made available
color(red).
color(green).
color(yellow).
color(blue).

%Call colouring function and prints Solution.
perform_colouring:-
	color_map([] , Solution),
	print_colouring(Solution).

conflict(Parish ,Color, Map):-
	adjacent(Parish , Parish2),
	member([Parish2 , Color] , Map).

valid_coloring(Parish , Colour , Map):-
	\+member([Parish , _] , Map),
	\+conflict(Parish , Colour , Map).

color_map(Map , Solution):-
	parish(Parish),
	color(Color),
	valid_coloring(Parish , Color , Map),
	color_map([[Parish , Color] | Map ] , Solution).

color_map(Solution , Solution).


adjacent(Parish1 , Parish2):-
	edge(Parish1 , Parish2);
	edge(Parish2 , Parish1).

print_colouring([]).
print_colouring([Colouring|Remainder]):-
	write(Colouring),
	nl,
	print_colouring(Remainder).


















