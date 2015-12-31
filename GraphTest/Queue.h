//
//  Queue.h
//  GraphTest
//
//  Created by Firdous Ali on 31/12/2015.
//  Copyright © 2015 Firdous Ali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

@property (nonatomic, strong) NSMutableArray *queueArray;

-(void)enqueue:(id)object;
-(id)dequeue;
-(BOOL)isEmpty;

@end
