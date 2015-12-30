//
//  ViewController.m
//  GraphTest
//
//  Created by Firdous Ali on 30/12/2015.
//  Copyright © 2015 Firdous Ali. All rights reserved.
//

#import "ViewController.h"
#import "Graph.h"
#import "DepthFirstPaths.h"
#import "BreadthFirstPaths.h"
#import "Queue.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Graph *graph = [[Graph alloc] initWithLength:13];
    
    [graph addEdge:0 w:1];
    [graph addEdge:0 w:2];
    [graph addEdge:0 w:6];
    [graph addEdge:0 w:5];
    [graph addEdge:4 w:6];
    [graph addEdge:4 w:5];
    [graph addEdge:3 w:4];
    [graph addEdge:3 w:5];
    [graph addEdge:7 w:8];
    [graph addEdge:9 w:10];
    [graph addEdge:9 w:11];
    [graph addEdge:11 w:12];
    [graph addEdge:9 w:12];
    
    DepthFirstPaths *dfp = [[DepthFirstPaths alloc] initWithGraph:graph s:10];
    NSLog(@"path: %@", [dfp pathTo:12]);
    
    BreadthFirstPaths *bfp = [[BreadthFirstPaths alloc] initWithGraph:graph s:10];
    NSLog(@"path: %@", [bfp pathTo:12]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
