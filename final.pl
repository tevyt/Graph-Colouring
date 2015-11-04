% COMP3220 Assignment 2
% November 6, 2015
% Raphaella Colahar 620065239
% Travis Smith 620065811
% Justen Morgan 620070138
% Dane Miller 620070179
%
% Execution Instructions: Run the query "?-perform_colouring." to
% perform the graph colouring. This program uses Depth First Search. Can
% be modified by changing the parish facts and edge facts to suit
% another graph colouring problem. More colours can be added as well.
%

% Facts of the parishes of Jamaica.
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

% Facts of the edges between two adjacent parishes of Jamaica.
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

% Colours made available
colour(red).
colour(green).
colour(yellow).
colour(blue).

% Method to run the graph colouring which calls the colouring function
% and prints Solution.
perform_colouring:-
	colour_map([] , Solution),
	print_colouring(Solution).
% Succeeds if there is a parish with another parish of the same colour
% within the map of parishes
%
conflict(Parish ,Colour, Map):-
	adjacent(Parish , Parish2),
	member([Parish2 , Colour] , Map).

% Checks if the parish loaded is valid to be coloured under constraints
% of the parish not already being in the map as well as no conflicts
% with this parish and colour with the existing map
valid_coloring(Parish , Colour , Map):-
	not(member([Parish , _] , Map)),
	not(conflict(Parish , Colour , Map)).

% Loads and parish and a colour and checks if the these facts are true
% for valid_colouring. If this is true, this parish and associated
% colour are added to solution and the function is run recursively.
colour_map(Map , Solution):-
	parish(Parish),
	colour(Colour),
	valid_coloring(Parish , Colour , Map),
	colour_map([[Parish , Colour] | Map ] , Solution).

% Goal state where the previous colour_map function fails where the
% solution arrived is the solution of the problem. This will be invoked
% if there are no more parishes to load.
colour_map(Solution , Solution).

% Checks if two parishes are adjacent to each other
adjacent(Parish1 , Parish2):-
	edge(Parish1 , Parish2);
	edge(Parish2 , Parish1).

% Writes the solution
print_colouring([]).
print_colouring([Colouring|Remainder]):-
	write(Colouring),
	nl,
	print_colouring(Remainder).


















