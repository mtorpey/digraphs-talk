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
<immutable digraph with 30 vertices, 749 edges>
gap> RandomDigraph(50, 0.2);
<immutable digraph with 50 vertices, 502 edges>
gap> RandomDigraph(IsConnectedDigraph, 1000, 0.75);
<immutable digraph with 1000 vertices, 750346 edges>
gap> RandomDigraph(IsHamiltonianDigraph, 70, 1/2);
<immutable digraph with 70 vertices, 2529 edges>

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
[ [ 0, 1, 2, 3, 3 ], [ 3, 0, 1, 2, 2 ], [ 2, 2, 0, 1, 1 ], [ 2, 2, 2, 0, 1 ], 
  [ 1, 1, 1, 1, 0 ] ]
gap> DigraphShortestDistance(gr, 2, 4);
2
gap> DigraphGirth(gr);
1
gap> DigraphAllSimpleCircuits(gr);
[ [ 5 ], [ 1, 2, 3, 4, 5 ], [ 1, 2, 3, 5 ], [ 2, 3, 4, 5 ], [ 2, 3, 5 ], 
  [ 3, 4, 5 ], [ 3, 5 ], [ 4, 5 ] ]
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

# Symmetric digraphs (i.e. undirected graphs)
gap> gr := RandomDigraph(IsSymmetricDigraph, 10, 0.1);
<immutable digraph with 10 vertices, 4 edges>
gap> IsSymmetricDigraph(gr);
true
gap> Splash(DotSymmetricDigraph(gr));
gap> UndirectedSpanningTree(gr);
fail
gap> DigraphUndirectedGirth(gr);
infinity
gap> DigraphSymmetricClosure(gr);
<immutable symmetric digraph with 10 vertices, 4 edges>
gap> IsReflexiveDigraph(gr);
false
gap> IsTransitiveDigraph(gr);
false
gap> DigraphSymmetricClosure(gr);
<immutable symmetric digraph with 10 vertices, 4 edges>

# Multidigraphs (multiple edges)
gap> gr := Digraph([[1, 3, 3, 4], [1, 1], [], []]);
<immutable multidigraph with 4 vertices, 6 edges>
gap> Splash(DotDigraph(gr));
gap> IsMultiDigraph(gr);
true
gap> IsCompleteDigraph(gr);
false
gap> DigraphRemoveAllMultipleEdges(gr);
<immutable digraph with 4 vertices, 4 edges>
gap> DigraphContractEdge(gr, 1, 3);
Error, The 1st argument (a digraph) must not satisfy IsMultiDigraph
gap> DigraphReflexiveTransitiveClosure(gr);
Error, the argument <D> must be a digraph with no multiple edges,
gap> DigraphStronglyConnectedComponents(gr);
rec( comps := [ [ 3 ], [ 4 ], [ 1 ], [ 2 ] ], id := [ 3, 4, 1, 2 ] )
gap> DigraphAbsorptionProbabilities(gr);
[ [ 2/3, 1/3, 0, 0 ], [ 2/3, 1/3, 0, 0 ], [ 1, 0, 0, 0 ], [ 0, 1, 0, 0 ] ]

# Edge weights
gap> gr := EdgeWeightedDigraph([[1, 3], [1], [4], []], [[1, 2], [1], [1], []]);
<immutable digraph with 4 vertices, 4 edges>
gap> EdgeWeights(gr);
[ [ 1, 2 ], [ 1 ], [ 1 ], [  ] ]
gap> EdgeWeightedDigraphTotalWeight(gr);
5
gap> EdgeWeightedDigraphMinimumSpanningTree(gr);                      
<immutable digraph with 4 vertices, 3 edges>

# Orders
gap> gr := Digraph([[1], [2, 3], [2, 3]]);
<immutable digraph with 3 vertices, 5 edges>
gap> Splash(DotDigraph(gr));
gap> IsPreorderDigraph(gr);
true
gap> IsQuasiorderDigraph(gr);
true
gap> IsPartialOrderDigraph(gr);
false
gap> Splash(DotPreorderDigraph(gr));

# Acting
gap> D := Digraph([[3], [1, 3, 5], [1], [1, 2, 4], [2, 3, 5]]);
<immutable digraph with 5 vertices, 11 edges>
gap> new := OnDigraphs(D, (1, 2));
<immutable digraph with 5 vertices, 11 edges>
gap> OutNeighbours(new);
[ [ 2, 3, 5 ], [ 3 ], [ 2 ], [ 2, 1, 4 ], [ 1, 3, 5 ] ]
gap> D := Digraph([[2], [], [2]]);
<immutable digraph with 3 vertices, 2 edges>
gap> new := OnDigraphs(D, Transformation([1, 2, 1]));
<immutable multidigraph with 3 vertices, 2 edges>
gap> OutNeighbours(new);
[ [ 2, 2 ], [  ], [  ] ]

# Automorphisms
gap> digraph1 := ChainDigraph(4);
<immutable chain digraph with 4 vertices>
gap> digraph2 := DigraphReverse(digraph1);
<immutable digraph with 4 vertices, 3 edges>
gap> IsomorphismDigraphs(digraph1, digraph2);
(1,4)(2,3)
gap> gr := CompleteDigraph(6);
<immutable complete digraph with 6 vertices>
gap> AutomorphismGroup(gr);
Sym( [ 1 .. 6 ] )
gap> AutomorphismGroup(gr, [1, 1, 1, 2, 2, 2]);
Group([ (5,6), (4,5), (2,3), (1,2) ])
gap> J := JohnsonDigraph(4, 2);                            
<immutable symmetric digraph with 6 vertices, 24 edges>
gap> G := AutomorphismGroup(J);
Group([ (3,4), (2,3)(4,5), (1,2)(5,6) ])
gap> IsDigraphCore(gr);
true
gap> IsVertexTransitive(gr);
true
gap> IsEdgeTransitive(gr);
true

# Homomorphisms
gap> gr1 := ChainDigraph(3);;
gap> gr2 := Digraph([[3, 5], [2], [3, 1], [], [4]]);
<immutable digraph with 5 vertices, 6 edges>
gap> Splash(DotDigraph(gr1)); Splash(DotDigraph(gr2));
gap> DigraphHomomorphism(gr1, gr2);
Transformation( [ 3, 1, 5, 4, 5 ] )
gap> HomomorphismsDigraphs(gr1, gr2);
[ Transformation( [ 1, 3, 1 ] ), Transformation( [ 1, 3, 3 ] ), 
  Transformation( [ 1, 5, 4, 4, 5 ] ), Transformation( [ 2, 2, 2 ] ), 
  Transformation( [ 3, 1, 3 ] ), Transformation( [ 3, 1, 5, 4, 5 ] ), 
  Transformation( [ 3, 3, 1 ] ), Transformation( [ 3, 3, 3 ] ) ]
gap> HomomorphismsDigraphsRepresentatives(gr1, CompleteDigraph(3));
[ Transformation( [ 2, 1 ] ), Transformation( [ 2, 1, 2 ] ) ]

# Monomorphisms
gap> gr1 := ChainDigraph(3);;
gap> gr2 := Digraph([[3, 5], [2], [3, 1], [], [4]]);
<immutable digraph with 5 vertices, 6 edges>
gap> DigraphMonomorphism(gr1, gr1);
IdentityTransformation
gap> DigraphMonomorphism(gr1, gr2);
Transformation( [ 3, 1, 5, 4, 5 ] )
gap> emb := DigraphEmbedding(gr1, CompleteDigraph(4));
fail
gap> emb := DigraphEmbedding(gr1, Digraph([[3], [1, 4], [1], [3]]));
Transformation( [ 2, 4, 3, 4 ] )

# Epimorphisms
gap> gr1 := DigraphReverse(ChainDigraph(4));
<immutable digraph with 4 vertices, 3 edges>
gap> gr2 := DigraphRemoveEdge(CompleteDigraph(3), [1, 2]);
<immutable digraph with 3 vertices, 5 edges>
gap> DigraphEpimorphism(gr2, gr1);
fail
gap> DigraphEpimorphism(gr1, gr2);
Transformation( [ 3, 1, 2, 3 ] )

# Core
gap> D := DigraphSymmetricClosure(CycleDigraph(8));
<immutable symmetric digraph with 8 vertices, 16 edges>
gap> DigraphCore(D);
[ 1, 2 ]
gap> D := PetersenGraph();
<immutable digraph with 10 vertices, 30 edges>
gap> DigraphCore(D);
[ 1 .. 10 ]

# Colourings
gap> DigraphColouring(CompleteDigraph(5), 4);
fail
gap> DigraphColouring(ChainDigraph(10), 1);
fail
gap> D := ChainDigraph(10);;
gap> t := DigraphColouring(D, 2);
Transformation( [ 1, 2, 1, 2, 1, 2, 1, 2, 1, 2 ] )
gap> IsDigraphColouring(D, t); 
true
gap> DigraphGreedyColouring(D);
Transformation( [ 2, 1, 2, 1, 2, 1, 2, 1, 2, 1 ] )
gap> ChromaticNumber(D);
2

# Cliques
gap> D := CompleteDigraph(4);;
gap> IsClique(D, [1, 3, 2]);
true
gap> IsMaximalClique(D, [1, 3, 2]);
false
gap> D := Digraph([[2, 3, 4], [1, 3], [1, 2], [1, 5], []]);
<immutable digraph with 5 vertices, 9 edges>
gap> DigraphMaximalClique(D);
[ 5 ]
gap> DigraphMaximalClique(D, [1, 3]);
[ 1, 3, 2 ]
gap> DigraphClique(D, [1], [2]);
[ 1, 4 ]
gap> DigraphMaximalClique(D, [1], [3, 4]);
fail
gap> CliqueNumber(D);
3

# Anti-cliques
gap> D := CycleDigraph(4);;
gap> IsIndependentSet(D, [1, 4, 3]);
false
gap> IsIndependentSet(D, [2, 4]);
true

# Display colours
gap> D := CompleteDigraph(4);;
gap> vertcolors := ["lightblue", "thistle", "limegreen", "gold"];;
gap> edgecolors := [["navy", "red", "purple"],
>                   ["navy", "red", "purple"],
>                   ["navy", "red", "purple"],
>                   ["navy", "red", "purple"]];;
gap> Splash(DotColoredDigraph(D, vertcolors, edgecolors));
gap> Splash(DotSymmetricColoredDigraph(D, vertcolors, edgecolors));

# Display labels
gap> D := CompleteDigraph(4);;
gap> SetDigraphVertexLabels(D, ["James", "Wilf", "Michael", "Jan"]);
gap> Splash(DotVertexLabelledDigraph(D));

# Encoding digraphs
gap> G := PetersenGraph();
<immutable digraph with 10 vertices, 30 edges>
gap> Print(G, "\n");
DigraphFromGraph6String("IheA@GUAo")
gap> D := BananaTree(4, 4);
<immutable undirected tree digraph with 17 vertices>
gap> Print(D, "\n");
DigraphFromSparse6String(":Pa@?``eD?ddiH?hhmL?ll")
gap> Sparse6String(D);
":Pa@?``eD?ddiH?hhmL?ll"
gap> Graph6String(D);
"PYOCGGC?C?_A?C??O?G?A??O"

# Storing digraphs
gap> graphs := [JohnsonDigraph(4, 2), ChainDigraph(100), CompleteDigraph(6), Digraph("icosahedral"), EmptyDigraph(1000)];;
gap> WriteDigraphs("mygraphs", graphs);
#I  Writing to mygraphs.ds6
IO_OK
gap> new := ReadDigraphs("mygraphs.ds6");
[ <immutable digraph with 6 vertices, 24 edges>, 
  <immutable digraph with 100 vertices, 99 edges>, 
  <immutable digraph with 6 vertices, 30 edges>, 
  <immutable digraph with 12 vertices, 60 edges>, 
  <immutable empty digraph with 1000 vertices> ]
gap> new = graphs;
true
