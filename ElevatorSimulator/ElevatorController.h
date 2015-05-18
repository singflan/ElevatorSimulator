//
//  ElevatorController.h
//  ElevatorSimulator
//
//  Created by Dustin Flanary on 5/15/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ElevatorObject.h"

@interface ElevatorController : NSObject

@property (strong, nonatomic) ElevatorObject *elevObject;

+(ElevatorController *)sharedInstance;
-(ElevatorObject *)createElevator:(NSInteger)startingFloor;
-(void)changeCurrentFloor;
-(void)newElevatorRequest:(NSInteger)newFloor;
//-(void)moveToNextFloor;
-(NSInteger)getCurrentFloor;
-(NSInteger)checkDestinationFloor;
-(void)setDestinationFloor;
-(void)removeDestinationFloor;
-(NSString *)getElevatorState;


@end
