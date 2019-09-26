% CSCI 320 Assignment 2.
% Pothering.
% Jack Fraser.
% 9/26/2019.

% find length of list (done).
myLength([], 0).
myLength([_|Rest], Len) :- myLength(Rest, X), Len is +(1, X).

% find last entry in list (done).
myLast([L], L).
myLast([_|Rest], L) :- myLast(Rest, L).

% find max val in list (incomplete; works for ascending values, but not for descending).
% utilizes append predicate which is not the subject of any of the questions in this assignment; as such by the wording of the questions it should be valid.

myMax([MaxVal], MaxVal).
myTop([], -1).
myTop([Head|_], Head).
myRest([], -1).
myRest([Head], -1).
myRest([_|Rest], Rest).
myMax([Head|Rest], MaxVal) :- myTop(Rest, X), X >= Head, myMax(Rest, MaxVal).
myMax([Head|Rest], MaxVal) :- myTop(Rest, X), X < Head, myRest(Rest, Y), myMax([Head, Y], MaxVal).

%MaxVal >= Head, myMax(Rest, MaxVal), MaxVal is X.
%myMax([Head|Rest], MaxVal) :- MaxVal < Head, myMax(Rest, Head), MaxVal is X.

% remove val from list.
myRemove()

% run by typing swipl prolog.pro.
% commands are run by typing myLength([1,2,3],X).