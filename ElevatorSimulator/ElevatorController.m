//
//  ElevatorController.m
//  ElevatorSimulator
//
//  Created by Dustin Flanary on 5/15/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "ElevatorController.h"
#import "ViewController.h"

@implementation ElevatorController

// This is a singleton method so that I always use the same elevator object
+ (ElevatorController *)sharedInstance {
    static ElevatorController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ElevatorController alloc] init];
    });
    
    return sharedInstance;
}

// This method creates the elevator object for the first time
-(ElevatorObject *)createElevator:(NSInteger)startingFloor {
    ElevatorObject *elevatorObject = [[ElevatorObject alloc] initWithValues:startingFloor];
    
    return elevatorObject;
}

// A new request comes in to the elevator
-(void)newElevatorRequest:(NSInteger)newFloor {
    
    if (self.elevObject.notMoving) {
        if (newFloor > self.elevObject.currentFloor) {
            [self.elevObject startMovingUp];
        } else if (newFloor < self.elevObject.currentFloor) {
            [self.elevObject startMovingDown];
        }
        // Make the new floor the destination floor
        self.elevObject.destinationFloor = newFloor;

    } else if (self.elevObject.movingUp) {
        if (newFloor < self.elevObject.destinationFloor) {
            self.elevObject.destinationFloor = newFloor;
        }
    } else {
        if (newFloor > self.elevObject.destinationFloor) {
            self.elevObject.destinationFloor = newFloor;
        }
    }
    
    // If the new floor is not already in the array, add it.
    for (NSNumber *floor in self.elevObject.floorsPressed) {
        if (!newFloor == floor) {
            [self.elevObject addFloorToArray:newFloor];
        }
    }
}

-(void)moveToNextFloor {
    //
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self changeCurrentFloor];
        
        if (self.elevObject.currentFloor == self.elevObject.destinationFloor) {
            
            // Open door comment in View Controller
            [self removeDestinationFloor];
        
        }
        [self setDestinationFloor];
        
        });

}

-(void)changeCurrentFloor { 
    sleep (2);
    if (self.elevObject.movingUp) {
        self.elevObject.currentFloor++;
        
    } else if (self.elevObject.movingDown) {
        self.elevObject.currentFloor--;
    }
    
}

-(void)addAdditionalDestination {
    
}

-(void)removeDestinationFloor {
    NSNumber *currentFloor = [NSNumber numberWithInteger:self.elevObject.currentFloor];
    [self.elevObject.floorsPressed removeObject:currentFloor];
}

-(void)setDestinationFloor {
    if (self.elevObject.floorsPressed.count < 1) {
        [self.elevObject stopMoving];
    } else {
        if (self.elevObject.movingUp) {
            
            NSInteger potentialNewFloor = 6;
            for (NSNumber* floor in self.elevObject.floorsPressed) {
                if (floor.integerValue > self.elevObject.currentFloor) {
                    if (floor.integerValue < potentialNewFloor) {
                        self.elevObject.destinationFloor = floor.integerValue;
                        potentialNewFloor = floor.integerValue;
                    }
                }
            }
            
            
        } else if (self.elevObject.movingDown) {
            NSInteger potentialNewFloor = 0;
            for (NSNumber* floor in self.elevObject.floorsPressed) {
                if (floor.integerValue < self.elevObject.currentFloor) {
                    if (floor.integerValue > potentialNewFloor) {
                        self.elevObject.destinationFloor = floor.integerValue;
                        potentialNewFloor = floor.integerValue;
                    }
                }
            }
        }
        
        
    }
}

-(NSInteger)checkDestinationFloor {
    
    return self.elevObject.destinationFloor;
}


@end
