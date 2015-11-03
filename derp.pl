% COMP3220 Assignment 2
% November 6, 2015
% Raphaella Colahar 620065239
% Travis Smith 620065811
% Justen Morgan 620070138
% Dane Miller 620070179
%
% Execution Instructions: Run the query "?- execute." to perform the
% colour search
%

% Facts of the parishes of Jamaica. Can be any fact of a problem in
% order to be generic.
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

% Facts of the edges between two adjacent parishes of Jamaica. Can be
% any edge or link between the facts in order to be generic.
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

% Available colours to choose from a given set
colour(red).
colour(blue).
colour(green).
colour(yellow).


% Method to run the graph colouring
execute:-
	colour_map([],Solution),
	writeln(Solution).

% Checks the parishes and colours in the working list to ensure it is
% true
valid_assignment(Workinglist , Parish ,Colour):-
	not(member([Parish, _], Workinglist)),
	not(prohibited(Parish , Colour, Workinglist)).


% Searches for correct coloured parishes to store in Solution on
% Workinglist which is the working list of parishes.
% Loads a parish and a colour and executes valid_assignment to ensure it
% is true for the function to run recursively.
% Else it will go to the goal state

colour_map(Workinglist,Solution):-
	parish(Parish),
	colour(Colour),
	valid_assignment(Workinglist , Parish , Colour),
	colour_map([[Parish, Colour]|Workinglist],Solution).



% Goal State where there is no more colours to be loaded on the loaded
% parishes for the problem

colour_map(Solution,Solution).

% Parish cannot be coloured if the adjacent parish is already coloured
% based on Workinglist
%
prohibited(Parish1,Colour,Workinglist):-
	adjacent(Parish1,Parish2),
	member([Parish2,Colour],Workinglist).

% Checks if two parishes are adjacent
adjacent(Parish1,Parish2):-
        edge(Parish1,Parish2);
	edge(Parish2,Parish1).

% Writes to map the coloured map solution
writeln([]).
writeln([X|Y]):-
	write(X),nl,
	writeln(Y).

% Member functions for the variables
member(X,[X|_]).
member(X,[_|Y]):-
	member(X,Y).

















