//
//  ViewController.m
//  MovingAverage
//
//  Created by simpro on 10/06/19.
//  Copyright © 2019 Kishore. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    movingAverage = [[MovingAverage alloc] init];
    // Do any additional setup after loading the view.
  
    NSMutableArray *aV = [NSMutableArray arrayWithObjects:@"7953",@"8441",@"9545",@"11690",@"10725",@"10611",@"11889",@"10865",@"11528",@"9693",@"7613",@"9159",@"9490",@"10123",@"9775", nil];
    NSLog(@"The Acceleration Values %@",aV);
 
    NSMutableArray *accelerationValues =[NSMutableArray arrayWithObjects:@"1280",@"2304",@"7168",@"8448",@"8704",@"8960",@"9472",@"10240",@"10496",@"11008",@"11520",@"12288",@"13056",@"13312",@"13568", nil];
    int count = 1;
    
    
    NSNumber *convertedAV;
    NSLog(@"THe array Count %lu",(unsigned long)accelerationValues.count);
    //    NSNumber *convertedAV=[NSNumber numberWithInt:[[accelerationValues objectAtIndex: 1] intValue]];
    
    [movingAverage initWithPeriod:5];
    for(int i=0 ;i<=accelerationValues.count-1;i++)
    {
        NSLog(@"The Count Value %d::::",count++);
        convertedAV =[NSNumber numberWithDouble:[[accelerationValues objectAtIndex: i] doubleValue]];
        [movingAverage addDatum:convertedAV];
    }
}


@end
