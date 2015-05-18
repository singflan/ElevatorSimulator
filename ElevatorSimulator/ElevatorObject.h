//
//  ElevatorObject.h
//  ElevatorSimulator
//
//  Created by Dustin Flanary on 5/17/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ElevatorObject : NSObject

@property (nonatomic, assign) NSInteger currentFloor;
@property (nonatomic, assign) NSInteger destinationFloor;
@property (nonatomic, assign) BOOL movingUp;
@property (nonatomic, assign) BOOL movingDown;
@property (nonatomic, assign) BOOL notMoving;
@property NSMutableArray *floorsPressed;

-(id)initWithValues:(NSInteger)floorNumber;
-(void)startMovingUp;
-(void)startMovingDown;
-(void)stopMoving;
-(void)addFloorToArray:(NSInteger)newFloor;

@end
