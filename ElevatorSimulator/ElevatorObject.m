//
//  ElevatorObject.m
//  ElevatorSimulator
//
//  Created by Dustin Flanary on 5/17/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "ElevatorObject.h"

@implementation ElevatorObject

-(id)initWithValues:(NSInteger)floorNumber {
    self = [super init];
    if (floorNumber < 6 && 0 < floorNumber) {
        self.currentFloor = floorNumber;
    }else{
        self.currentFloor = 1;
    }
    
    self.movingUp = NO;
    self.movingDown = NO;
    self.notMoving = YES;
    self.floorsPressed = [NSMutableArray array];
    return self;
}

-(void)startMovingUp {
    _movingDown = NO;
    _movingUp = YES;
    _notMoving = NO;
}

-(void)startMovingDown {
    _movingDown = YES;
    _movingUp = NO;
    _notMoving = NO;
}

-(void)stopMoving {
    _movingDown = NO;
    _movingUp = NO;
    _notMoving = YES;
}

-(void)addFloorToArray:(NSInteger)newFloor {
    NSNumber *newFloorNumber = [NSNumber numberWithInteger:newFloor];
    [self.floorsPressed addObject:newFloorNumber];
}

@end
