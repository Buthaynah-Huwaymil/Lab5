% FACTS

% Males
male(abraham).
male(herb).
male(homer).
male(clancy).
male(bart).

% Females
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent relationships
parent(abraham, herb).
parent(mona, herb).

parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).

% RULES

father(X, Y) :-
    male(X),
    parent(X, Y).

mother(X, Y) :-
    female(X),
    parent(X, Y).

son(X, Y) :-
    male(X),
    parent(Y, X).

daughter(X, Y) :-
    female(X),
    parent(Y, X).

brother(X, Y) :-
    male(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

sister(X, Y) :-
    female(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

grandfather(X, Y) :-
    male(X),
    parent(X, P),
    parent(P, Y).

aunt(X, Y) :-
    sister(X, P),
    parent(P, Y).

uncle(X, Y) :-
    brother(X, P),
    parent(P, Y).

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    brother(P1, P2),
    X \= Y.

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sister(P1, P2),
    X \= Y.

ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(P, Y),
    ancestor(X, P).

% QUERIES AND RESULTS

% 1. Father
% Query: father(homer, bart).
% Result: true.

% Query: father(homer, lisa).
% Result: true.


% 2. Mother
% Query: mother(marge, bart).
% Result: true.

% Query: mother(marge, lisa).
% Result: true.


% 3. Son
% Query: son(bart, homer).
% Result: true.

% Query: son(bart, marge).
% Result: true.


% 4. Daughter
% Query: daughter(lisa, homer).
% Result: true.

% Query: daughter(maggie, marge).
% Result: true.


% 5. Brother
% Query: brother(herb, homer).
% Result: true.

% Query: brother(bart, lisa).
% Result: true.


% 6. Sister
% Query: sister(patty, marge).
% Result: true.

% Query: sister(lisa, bart).
% Result: true.


% 7. Grandfather
% Query: grandfather(abraham, bart).
% Result: true.

% Query: grandfather(abraham, maggie).
% Result: true.


% 8. Aunt
% Query: aunt(patty, bart).
% Result: true.

% Query: aunt(selma, lisa).
% Result: true.


% 9. Uncle
% Query: uncle(herb, bart).
% Result: true.

% Query: uncle(herb, lisa).
% Result: true.


% 10. Cousin
% Query: cousin(bart, ling).
% Result: true.

% Query: cousin(lisa, ling).
% Result: true.


% 11. Ancestor
% Query: ancestor(abraham, bart).
% Result: true.

% Query: ancestor(clancy, ling).
% Result: true.