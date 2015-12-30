//
//  Graph.m
//  GraphTest
//
//  Created by Firdous Ali on 30/12/2015.
//  Copyright © 2015 Firdous Ali. All rights reserved.
//

#import "Graph.h"

@implementation Graph{
    NSMutableArray* _adjArray;
}

-(id)initWithLength:(NSInteger)vertices{
    self = [super init];
    
    if (self) {
        _vertices = vertices;
        _adjArray = [[NSMutableArray alloc] initWithCapacity:vertices];
        
        for (NSInteger i = 0; i < _vertices; i++) {
            _adjArray[i] = [NSMutableArray new];
        }
    }
    
    return self;
}

-(void)addEdge:(NSInteger)v w:(NSInteger)w{
    [_adjArray[v] addObject:@(w)];
    [_adjArray[w] addObject:@(v)];
}

-(NSArray*)getAdj:(NSInteger)v{
    return _adjArray[v];
}

#pragma GraphApi Client

+(NSInteger)getDegree:(Graph*)graph v:(NSInteger)v{
    NSInteger adjNodes = [[graph getAdj:v] count];
    
//    for (NSInteger i = 0; i < adjNodes; i++) {
//        degree++;
//    }
    
    return adjNodes;
}

+(NSInteger)maxDegree:(Graph*)graph{
    NSInteger max = 0;
    NSInteger vertices = graph.vertices;
    
    for (NSInteger v = 0; v < vertices; v++) {
        if ([Graph getDegree:graph v:v] > max) {
            max = [Graph getDegree:graph v:v];
        }
    }
    
    return max;
}

//+(NSNumber)getAverageDegree:(Graph*)graph{
//    return 2.0 *
//}

+(NSInteger)getNumberOfSelfLoops:(Graph *)graph{
    NSInteger count = 0;
    NSInteger vertices = graph.vertices;
    
    for (NSInteger v = 0; v < vertices; v++) {
        for (NSNumber *w in [graph getAdj:v]) {
            if (v == [w integerValue]) {
                count++;
            }
        }
    }
    
    return count/2;
}

@end
