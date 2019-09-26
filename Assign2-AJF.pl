% CSCI 320 Assignment 2.
% Pothering.
% Jack Fraser.
% 9/26/2019.


% myLength(List, Len).
% find length of list (done).
myLength([], 0).
myLength([_|Rest], Len) :- myLength(Rest, X), Len is +(1, X).


% myLast(List, L).
% find last entry in list (done).
myLast([L], L).
myLast([_|Rest], L) :- myLast(Rest, L).


% myMax(List, MaxVal).
% find max val in list (incomplete; works for ascending values, but not for descending).
% utilizes append predicate which is not the subject of any of the questions in this assignment; as such by the wording of the questions it should be valid.

% base condition and submethods.
myMax([MaxVal], MaxVal).
myTop([], 0).
myTop([Head|_], Head).
myRest([Head], []).
myRest([_|Rest], Rest).

% condition for ascending segment.
myMax([Head|Rest], MaxVal) :- myTop(Rest, X), X >= Head, myMax(Rest, MaxVal).

% condition for descending segment.
myMax([Head|Rest], MaxVal) :- myTop(Rest, X), X < Head, myRest(Rest, Y), append([Head], Y, HeadY), myMax(HeadY, MaxVal).

% remove val from list.
myRemove()

% run by typing swipl prolog.pro.
% commands are run by typing myLength([1,2,3],X).