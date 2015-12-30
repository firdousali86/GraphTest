//
//  DepthFirstPaths.m
//  GraphTest
//
//  Created by Firdous Ali on 30/12/2015.
//  Copyright © 2015 Firdous Ali. All rights reserved.
//

#import "DepthFirstPaths.h"
#import "Graph.h"

@implementation DepthFirstPaths{
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
        
        [self dfs:graph v:s];
    }
    
    return self;
}

-(void)dfs:(Graph*)graph v:(NSInteger)v{
    _marked[v] = @(YES);
    
    for (NSNumber *w in [graph getAdj:v]) {
        NSNumber *isMarked = [_marked objectAtIndex:[w integerValue]];
        if (![isMarked boolValue]) {
            [self dfs:graph v:[w integerValue]];
            [_edgeTo setObject:@(v) atIndexedSubscript:[w integerValue]];
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
