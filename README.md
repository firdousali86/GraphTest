# GraphTest
Implementation of some graph algorithms, takes graph in the form of adjacency list and constructs graph, then uses depth first paths or breadth first paths to answer different user queries

<h2>How to input graph:</h2>

Can accept any kind of graph whether cyclic or non-cyclic. The user just have to provide the number of vertices (nodes) in graph to the graph constructer like this:

    Graph *graph = [[Graph alloc] initWithLength:13];

Then use the addEdge: to add all the edges (lines) between vertices.

    [graph addEdge:0 w:1];
    [graph addEdge:0 w:2];
    [graph addEdge:0 w:6];
    [graph addEdge:0 w:5];
    [graph addEdge:4 w:6];
    [graph addEdge:4 w:5];
    [graph addEdge:3 w:4];
    [graph addEdge:3 w:5];
  
<h2>Use Depth First Path:</h2>

Takes Graph object and source node reference to calculate path:

    DepthFirstPaths *dfp = [[DepthFirstPaths alloc] initWithGraph:graph s:10];

Then use different query functions to get information about the graph:

    NSLog(@"path: %@", [dfp pathTo:12]);

<h2>Use Breadth First Path:</h2>

Takes Graph object and source node reference to calculate path:

    BreadthFirstPaths *bfp = [[BreadthFirstPaths alloc] initWithGraph:graph s:10];
    
Then use different query functions to get information about the graph:

    NSLog(@"path: %@", [bfp pathTo:12]);
