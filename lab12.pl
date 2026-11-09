% Facts

edge('Dammam', 'Qatif').
edge('Dammam', 'Riyadh').
edge('Riyadh', 'Dammam').
edge('Qatif',  'Madinah').
edge('Madinah','Makkah').
edge('Madinah','Taif').
edge('Madinah','Tabuk').
edge('Tabuk',  'Taif').
edge('Taif',   'Dammam').
edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').

% Rules
travel(Start, End, Path) :-
    path(Start, End, [Start], RevPath),
    reverse(RevPath, Path).

path(End, End, Visited, Visited).

path(Current, End, Visited, Path) :-
    edge(Current, Next),
    \+ memberchk(Next, Visited),
    path(Next, End, [Next|Visited], Path).
