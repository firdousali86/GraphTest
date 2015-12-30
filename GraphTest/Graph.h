//
//  Graph.h
//  GraphTest
//
//  Created by Firdous Ali on 30/12/2015.
//  Copyright © 2015 Firdous Ali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Graph : NSObject

@property (nonatomic, assign) NSInteger vertices;

-(id)initWithLength:(NSInteger)vertices;
-(void)addEdge:(NSInteger)v w:(NSInteger)w;
-(NSArray*)getAdj:(NSInteger)v;

@end
