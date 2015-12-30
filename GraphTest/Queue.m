//
//  Queue.m
//  GraphTest
//
//  Created by Firdous Ali on 31/12/2015.
//  Copyright © 2015 Firdous Ali. All rights reserved.
//

#import "Queue.h"

@implementation Queue

-(void)enqueue:(id)object{
    if (!_queueArray) {
        _queueArray = [NSMutableArray new];
    }
    [_queueArray addObject:object];
}

-(id)dequeue{
    id returnObject = [[_queueArray objectAtIndex:0] copy];
    [_queueArray removeObjectAtIndex:0];
    return returnObject;
}

-(BOOL)isEmpty{
    return [_queueArray count] == 0;
}

@end
