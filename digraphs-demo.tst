# Digraph by out neighbours
gap> gr := Digraph([[4], [2, 2], [2, 3, 1, 4], [1]]);
<immutable multidigraph with 4 vertices, 8 edges>
gap> OutNeighbours(gr);
[ [ 4 ], [ 2, 2 ], [ 2, 3, 1, 4 ], [ 1 ] ]
gap> OutNeighboursOfVertex(gr, 3);
[ 2, 3, 1, 4 ]
gap> InNeighbours(gr);
[ [ 3, 4 ], [ 2, 2, 3 ], [ 3 ], [ 1, 3 ] ]
gap> InNeighboursOfVertex(gr, 2);
[ 2, 2, 3 ]
gap> InDegreeOfVertex(gr, 2);
3

# Digraph by source and range
gap> gr := Digraph(5, [1, 2, 2, 4, 1, 1], [2, 3, 5, 5, 1, 1]);
<immutable multidigraph with 5 vertices, 6 edges>
gap> DigraphSource(gr);
[ 1, 1, 1, 2, 2, 4 ]
gap> DigraphRange(gr);
[ 2, 1, 1, 3, 5, 5 ]
gap> DigraphEdges(gr);
[ [ 1, 2 ], [ 1, 1 ], [ 1, 1 ], [ 2, 3 ], [ 2, 5 ], [ 4, 5 ] ]
gap> OutNeighbours(gr);
[ [ 2, 1, 1 ], [ 3, 5 ], [  ], [ 5 ], [  ] ]

# Digraph by name
gap> gr := Digraph("ethane");
<immutable digraph with 8 vertices, 14 edges>
gap> gr := Digraph("twoheptagons");
<immutable digraph with 14 vertices, 28 edges>
gap> gr := Digraph("coxeter");
<immutable digraph with 28 vertices, 84 edges>
gap> gr := BananaTree(5, 2);
<immutable undirected tree digraph with 11 vertices>
gap> gr := WindmillGraph(4, 3);
<immutable symmetric digraph with 10 vertices, 36 edges>

# Digraph by function
gap> adj := function(x, y) return x >= y*2; end;
function( x, y ) ... end
gap> gr := Digraph([1..12], adj);
<immutable digraph with 12 vertices, 36 edges>

# Digraph by group
gap> petersen := Digraph(Group((1,2,3,4,5)(6,7,8,9,10)),
>                        [1..10],
>                        OnPoints,
>                        {x, y} -> [x,y] in [[1,6], [1,2], [6,8]]);
<immutable digraph with 10 vertices, 15 edges>
gap> DigraphGroup(petersen);
Group([ (1,2,3,4,5)(6,7,8,9,10) ])
gap> AutomorphismGroup(petersen);
Group([ (1,2,3,4,5)(6,7,8,9,10) ])
gap> ChromaticNumber(petersen);
3

# Digraph by edges
gap> DigraphByEdges(
> [[1, 3], [2, 1], [2, 3], [2, 5], [3, 6],
>  [4, 6], [5, 2], [5, 4], [5, 6], [6, 6]]);
<immutable digraph with 6 vertices, 10 edges>

# Digraph by adjacency matrix
gap> DigraphByAdjacencyMatrix([
> [true, false, true],
> [false, false, true],
> [false, true, false]]);
<immutable digraph with 3 vertices, 4 edges>

# Random digraph
gap> RandomDigraph(30);
gap> RandomDigraph(50, 0.2);
gap> RandomDigraph(IsConnectedDigraph, 1000, 0.75);
gap> RandomDigraph(IsHamiltonianDigraph, 70, 1/2);

# Simple things we can find
gap> gr := Digraph([[3, 5, 2, 2], [3], [], [5, 2, 5, 3], []]);
<immutable multidigraph with 5 vertices, 9 edges>
gap> DigraphSinks(gr);
[ 3, 5 ]
gap> DigraphSources(gr);
[ 1, 4 ]
gap> DigraphMaximumMatching(gr);
[ [ 1, 3 ], [ 4, 2 ] ]

# Connectivity
gap> gr := Digraph([[2], [3], [4, 5], [5], [1, 2, 3, 4, 5]]);
<immutable digraph with 5 vertices, 10 edges>
gap> IsStronglyConnectedDigraph(gr);
true
gap> IsBiconnectedDigraph(gr);
true
gap> DigraphDiameter(gr);
3
gap> DigraphShortestDistances(gr);
[ [ 0, 1, 2, 3, 3 ], [ 3, 0, 1, 2, 2 ], [ 2, 2, 0, 1, 1 ], [ 2, 2, 2, 0, 1 ], [ 1, 1, 1, 1, 0 ] ]
gap> DigraphShortestDistance(gr, 2, 4);
2
gap> DigraphGirth(gr);
1
gap> DigraphAllSimpleCircuits(gr);
[ [ 5 ], [ 1, 2, 3, 4, 5 ], [ 1, 2, 3, 5 ], [ 2, 3, 4, 5 ], [ 2, 3, 5 ], [ 3, 4, 5 ], [ 3, 5 ], [ 4, 5 ] ]
gap> IsBridgelessDigraph(gr);
true
gap> IsEulerianDigraph(gr);
false
gap> IsHamiltonianDigraph(gr);
true
gap> HamiltonianPath(gr);
[ 1, 2, 3, 4, 5 ]

# More types of graph
gap> gr := Digraph([[1, 2, 3, 2], [2, 1], [3]]);
<immutable multidigraph with 3 vertices, 7 edges>
gap> IsMultiDigraph(gr);
true
gap> gr := EdgeWeightedDigraph([[2,3],[4],[4],[]], [[5,1],[6],[11],[]]);
<immutable digraph with 4 vertices, 4 edges>
gap> tree := EdgeWeightedDigraphMinimumSpanningTree(gr);
<immutable digraph with 4 vertices, 3 edges>
gap> DigraphEdges(tree);
[ [ 1, 3 ], [ 1, 2 ], [ 2, 4 ] ]

# Regularity
gap> IsRegularDigraph(CompleteDigraph(4));
true
gap> IsRegularDigraph(ChainDigraph(4));
false
gap> gr := DigraphSymmetricClosure(ChainDigraph(5));;
gap> IsDistanceRegularDigraph(gr);
false
gap> IsVertexTransitive(gr);
false
gap> IsEdgeTransitive(gr);
false

# Trees
gap> gr := Digraph([[2, 3], [6], [4, 5], [], [], []]);
<immutable digraph with 6 vertices, 5 edges>
gap> IsUndirectedTree(gr);
false
gap> IsUndirectedForest(gr);
false

# Planarity
gap> IsPlanarDigraph(CompleteDigraph(4));
true
gap> IsPlanarDigraph(CompleteBipartiteDigraph(3, 3));
false
