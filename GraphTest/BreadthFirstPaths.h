//
//  BreadthFirstPaths.h
//  GraphTest
//
//  Created by Firdous Ali on 31/12/2015.
//  Copyright © 2015 Firdous Ali. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Graph;

@interface BreadthFirstPaths : NSObject

-(id)initWithGraph:(Graph*)graph s:(NSInteger)s;
-(BOOL)hasPathTo:(NSInteger)v;
-(NSArray*)pathTo:(NSInteger)v;

@end
