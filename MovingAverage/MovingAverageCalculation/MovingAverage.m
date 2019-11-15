//
// Created by Alex Manarpies on 12/17/14.
//

#import "MovingAverage.h"


@interface MovingAverage ()

@property(nonatomic, strong) NSMutableArray *queue;
@property(nonatomic) NSUInteger period;
@property(nonatomic) NSUInteger count;

@property(nonatomic, readwrite) double movingAverage;
@property(nonatomic, readwrite) double cumulativeAverage;

@end

@implementation MovingAverage

- (instancetype)initWithPeriod:(NSUInteger)period {
    self = [self init];
    if (self) {
        _period = period;
        NSLog(@"Period %lu",(unsigned long)period);
        _queue = [[NSMutableArray alloc] initWithCapacity:period];
        
    }
    return self;
}

- (void)addDatum:(NSNumber *)datum {
    [self.queue insertObject:datum atIndex:0];
    NSLog(@"The Queue Values are %@",self.queue);

    double removed = 0;
    double datumd = [datum doubleValue];
    NSLog(@"Datumd %f",datumd);

    if (self.queue.count > self.period) {
        removed = [[self.queue lastObject] doubleValue];
        NSLog(@"THe Removed object %f",removed);
        [self.queue removeLastObject];
    }

    self.movingAverage = self.movingAverage - (removed / self.period) + (datumd / self.period);

    NSLog(@"Removed %f",removed);
    NSLog(@"Calculation Period %lu",(unsigned long)self.period);
    NSLog(@"Moving Average %f",self.movingAverage);
//    self.cumulativeAverage = self.cumulativeAverage + (datumd - self.cumulativeAverage) / ++self.count;
//    NSLog(@"self.count =%lu",++self.count);
//    NSLog(@"Cumulative Average %f",self.cumulativeAverage);
    
    NSMutableArray *movingAverageValues =[[NSMutableArray alloc]init];
//    [calibrationResponseArray addObject:[NSNumber numberWithDouble:angle]];
    [movingAverageValues addObject:[NSNumber numberWithDouble:self.movingAverage]];
    NSLog(@"Moving Average Values Stored %@",movingAverageValues);
    
//    NSLog(@"moving")
}

@end
