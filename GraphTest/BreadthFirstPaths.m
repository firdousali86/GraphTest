//
//  BreadthFirstPaths.m
//  GraphTest
//
//  Created by Firdous Ali on 31/12/2015.
//  Copyright © 2015 Firdous Ali. All rights reserved.
//

#import "BreadthFirstPaths.h"
#import "Graph.h"
#import "Queue.h"

@implementation BreadthFirstPaths{
    NSMutableArray *_marked;
    NSMutableArray *_edgeTo;
    NSInteger _s;
}

-(id)initWithGraph:(Graph*)graph s:(NSInteger)s{
    self = [super init];
    
    if (self) {
        _s = s;
        _marked = [[NSMutableArray alloc] initWithCapacity:graph.vertices];
        _edgeTo = [[NSMutableArray alloc] initWithCapacity:graph.vertices];
        
        for (NSInteger i = 0; i < graph.vertices; i++) {
            _marked[i] = @(0);
            _edgeTo[i] = @(0);
        }
        
        [self bfs:graph v:s];
    }
    
    return self;
}

-(void)bfs:(Graph*)graph v:(NSInteger)s{
    Queue *q = [Queue new];
    [q enqueue:@(s)];
    _marked[s] = @(YES);
    
    while (![q isEmpty]) {
        NSInteger v = [[q dequeue] integerValue];
        
        for (NSNumber *w in [graph getAdj:v]) {
            NSNumber *isMarked = [_marked objectAtIndex:[w integerValue]];
            if (![isMarked boolValue]) {
                [q enqueue:w];
                _marked[[w integerValue]] = @(YES);
                _edgeTo[[w integerValue]] = @(v);
            }
        }
    }
}

-(BOOL)hasPathTo:(NSInteger)v{
    return [_marked[v] boolValue];
}

-(NSArray*)pathTo:(NSInteger)v{
    if (![self hasPathTo:v]) {
        return nil;
    }
    
    NSMutableArray *path = [NSMutableArray new];
    for (NSInteger x = v; x != _s; x = [_edgeTo[x] integerValue]) {
        [path addObject:@(x)];
    }
    [path addObject:@(_s)];
    
    return [NSArray arrayWithArray:path];
}

@end
