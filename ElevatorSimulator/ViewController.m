//
//  ViewController.m
//  ElevatorSimulator
//
//  Created by Dustin Flanary on 5/12/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "ViewController.h"
#import "ElevatorController.h"

@interface ViewController ()
@property (strong, nonatomic) ElevatorController *elevController;
@property (weak, nonatomic) IBOutlet UILabel *outsideFloorIndicator;
@property (weak, nonatomic) IBOutlet UILabel *insideFloorIndicator;
@property (weak, nonatomic) IBOutlet UIButton *floor1Button;
@property (weak, nonatomic) IBOutlet UIButton *floor2Button;
@property (weak, nonatomic) IBOutlet UIButton *floor3Button;
@property (weak, nonatomic) IBOutlet UIButton *floor4Button;
@property (weak, nonatomic) IBOutlet UIButton *floor5Button;
@property (weak, nonatomic) IBOutlet UIButton *floor5DownButton;
@property (weak, nonatomic) IBOutlet UIButton *floor4UpButton;
@property (weak, nonatomic) IBOutlet UIButton *floor4DownButton;
@property (weak, nonatomic) IBOutlet UIButton *floor3UpButton;
@property (weak, nonatomic) IBOutlet UIButton *floor3DownButton;
@property (weak, nonatomic) IBOutlet UIButton *floor2UpButton;
@property (weak, nonatomic) IBOutlet UIButton *floor2DownButton;
@property (weak, nonatomic) IBOutlet UIButton *floor1UpButton;
@property (weak, nonatomic) IBOutlet UILabel *doorLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentStateLabel;
@property UIImage *upArrow;
@property UIImage *downArrow;
@property NSInteger currentFloorNumber; // Which floor is the elevator on now
@property NSInteger passengerFloorNumber; // From which floor is the elevator request made?
@property NSInteger destinationFloor; // Which floor are we headed to
@property NSInteger direction; // Is elevator on the way up or down
@property BOOL arrowButtonLit;
@property BOOL numberButtonLit;
@property BOOL upArrowPressed;
@property UIColor *numberButtonColor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _currentFloorNumber = 0;
    // Formatting the look of the buttons
    // Inside-elevator buttons
    _floor1Button.backgroundColor = [UIColor cyanColor];
    _floor2Button.backgroundColor = [UIColor cyanColor];
    _floor3Button.backgroundColor = [UIColor cyanColor];
    _floor4Button.backgroundColor = [UIColor cyanColor];
    _floor5Button.backgroundColor = [UIColor cyanColor];
    self.floor1Button.layer.cornerRadius = 15;
    self.floor1Button.layer.borderWidth = 1.5;
    self.floor1Button.layer.borderColor = [UIColor blueColor].CGColor;
    self.floor2Button.layer.cornerRadius = 15;
    self.floor2Button.layer.borderWidth = 1.5;
    self.floor2Button.layer.borderColor = [UIColor blueColor].CGColor;
    self.floor3Button.layer.cornerRadius = 15;
    self.floor3Button.layer.borderWidth = 1.5;
    self.floor3Button.layer.borderColor = [UIColor blueColor].CGColor;
    self.floor4Button.layer.cornerRadius = 15;
    self.floor4Button.layer.borderWidth = 1.5;
    self.floor4Button.layer.borderColor = [UIColor blueColor].CGColor;
    self.floor5Button.layer.cornerRadius = 15;
    self.floor5Button.layer.borderWidth = 1.5;
    self.floor5Button.layer.borderColor = [UIColor blueColor].CGColor;
    
    // Outside-elevator Buttons
    self.floor5DownButton.layer.cornerRadius = 15;
    self.floor5DownButton.layer.borderWidth = 1.5;
    self.floor5DownButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.floor4UpButton.layer.cornerRadius = 15;
    self.floor4UpButton.layer.borderWidth = 1.5;
    self.floor4UpButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.floor4DownButton.layer.cornerRadius = 15;
    self.floor4DownButton.layer.borderWidth = 1.5;
    self.floor4DownButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.floor3UpButton.layer.cornerRadius = 15;
    self.floor3UpButton.layer.borderWidth = 1.5;
    self.floor3UpButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.floor3DownButton.layer.cornerRadius = 15;
    self.floor3DownButton.layer.borderWidth = 1.5;
    self.floor3DownButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.floor2UpButton.layer.cornerRadius = 15;
    self.floor2UpButton.layer.borderWidth = 1.5;
    self.floor2UpButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.floor2DownButton.layer.cornerRadius = 15;
    self.floor2DownButton.layer.borderWidth = 1.5;
    self.floor2DownButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.floor1UpButton.layer.cornerRadius = 15;
    self.floor1UpButton.layer.borderWidth = 1.5;
    self.floor1UpButton.layer.borderColor = [UIColor blackColor].CGColor;
    _floor5DownButton.backgroundColor = [UIColor orangeColor];
    _floor4DownButton.backgroundColor = [UIColor orangeColor];
    _floor3DownButton.backgroundColor = [UIColor orangeColor];
    _floor2DownButton.backgroundColor = [UIColor orangeColor];
    _floor4UpButton.backgroundColor = [UIColor orangeColor];
    _floor3UpButton.backgroundColor = [UIColor orangeColor];
    _floor2UpButton.backgroundColor = [UIColor orangeColor];
    _floor1UpButton.backgroundColor = [UIColor orangeColor];
    
    self.elevController = [ElevatorController new];
    [ElevatorController sharedInstance].elevObject = [[ElevatorController sharedInstance]createElevator:1];
    _currentFloorNumber = [[ElevatorController sharedInstance] getCurrentFloor];
    [self displayCurrentFloor:_currentFloorNumber];
  //  [ElevatorController sharedInstance].elevObject = [[ElevatorController sharedInstance]createElevator:1];

    _arrowButtonLit = NO;
    _numberButtonLit = NO;
    

    
}

-(IBAction)upButtonPressed:(UIButton *)sender {
    
    if (!_arrowButtonLit) {
        _arrowButtonLit = YES;
        _upArrowPressed = YES;
        
        if ([sender.currentTitle isEqual:@"Floor4Up"]) {
            self.floor4UpButton.backgroundColor = [UIColor redColor];
            _passengerFloorNumber = 4;
        } else if ([sender.currentTitle isEqual:@"Floor3Up"]) {
            self.floor3UpButton.backgroundColor = [UIColor redColor];
            _passengerFloorNumber = 3;
        } else if ([sender.currentTitle isEqual:@"Floor2Up"]) {
            self.floor2UpButton.backgroundColor = [UIColor redColor];
            _passengerFloorNumber = 2;
        } else if ([sender.currentTitle isEqual:@"Floor1Up"]) {
            self.floor1UpButton.backgroundColor = [UIColor redColor];
            _passengerFloorNumber = 1;
        }
    }
    [[ElevatorController sharedInstance] newElevatorRequest:_passengerFloorNumber];
    _destinationFloor = [[ElevatorController sharedInstance] checkDestinationFloor];
    
    [[ElevatorController sharedInstance] getElevatorState];
    [self displayCurrentElevatorState];
    
    [self elevatorCycle];
    
    switch (_passengerFloorNumber) {
        case 1:
            self.floor1UpButton.backgroundColor = [UIColor orangeColor];
            break;
        case 2:
            self.floor2UpButton.backgroundColor = [UIColor orangeColor];
            break;
        case 3:
            self.floor3UpButton.backgroundColor = [UIColor orangeColor];
            break;
        case 4:
            self.floor4UpButton.backgroundColor = [UIColor orangeColor];
            break;
        default:
            break;
    }
    
    
//    if ([ElevatorController sharedInstance].elevObject.notMoving) {
//        
//        [[ElevatorController sharedInstance] moveToNextFloor];
//        _currentFloorNumber = [ElevatorController sharedInstance].elevObject.currentFloor;
//        [self displayCurrentFloor:_currentFloorNumber];
//        [self elevatorCycle];
//    
//    }
    
    
    
    
//    [[ElevatorController sharedInstance] get:self.currentParty.pdfFile Callback:^(NSData *pdfData) {
//        
//    }
//    
    
    
}
     
-(void)elevatorCycle {
    _doorLabel.text = @"Moving";

    [[ElevatorController sharedInstance] changeCurrentFloor];
    _currentFloorNumber = [[ElevatorController sharedInstance] getCurrentFloor];
    [self displayCurrentFloor:_currentFloorNumber];
    
    [[ElevatorController sharedInstance] getElevatorState];
    [self displayCurrentElevatorState];
   
    
    
    if (_currentFloorNumber == _destinationFloor) {
        _doorLabel.text = @"Open Doors";
        [[ElevatorController sharedInstance] removeDestinationFloor];
        [[ElevatorController sharedInstance] setDestinationFloor];
        [[ElevatorController sharedInstance] getElevatorState];
        [self displayCurrentElevatorState];
        sleep(1);
    }
    
    if ([ElevatorController sharedInstance].elevObject.notMoving) {
        _doorLabel.text = @"Waiting for passenger to choose floor";
    } else {
        //[[ElevatorController sharedInstance] changeCurrentFloor];
        [self elevatorCycle];
    }
    
    
    
//    if ([ElevatorController sharedInstance].elevObject.movingUp) {
//        
//    } else if ([ElevatorController sharedInstance].elevObject.movingDown) {
//        
//    }
}

-(IBAction)downButtonPressed:(UIButton *)sender {
    if (!_arrowButtonLit) {
        _arrowButtonLit = YES;
        _upArrowPressed = NO;
        if ([sender.currentTitle isEqual:@"Floor5Down"]) {
            self.floor5DownButton.backgroundColor = [UIColor redColor];
            _passengerFloorNumber = 5;
        } else if ([sender.currentTitle isEqual:@"Floor4Down"]) {
            self.floor4DownButton.backgroundColor = [UIColor redColor];
            _passengerFloorNumber = 4;
        } else if ([sender.currentTitle isEqual:@"Floor3Down"]) {
            self.floor3DownButton.backgroundColor = [UIColor redColor];
            _passengerFloorNumber = 3;
        } else if ([sender.currentTitle isEqual:@"Floor2Down"]) {
            self.floor2DownButton.backgroundColor = [UIColor redColor];
            _passengerFloorNumber = 2;
        }
      
    }
    
    [[ElevatorController sharedInstance] newElevatorRequest:_passengerFloorNumber];
    _destinationFloor = [[ElevatorController sharedInstance] checkDestinationFloor];

    
    [[ElevatorController sharedInstance] getElevatorState];
    [self displayCurrentElevatorState];
    
    [self elevatorCycle];
    
    switch (_passengerFloorNumber) {
        
        case 2:
            self.floor2DownButton.backgroundColor = [UIColor orangeColor];
            break;
        case 3:
            self.floor3DownButton.backgroundColor = [UIColor orangeColor];
            break;
        case 4:
            self.floor4DownButton.backgroundColor = [UIColor orangeColor];
            break;
        case 5:
            self.floor5DownButton.backgroundColor = [UIColor orangeColor];
            break;
        default:
            break;
    }
    
//    if ([ElevatorController sharedInstance].elevObject.notMoving) {
//        
//        //[[ElevatorController sharedInstance] moveToNextFloor];
//        [[ElevatorController sharedInstance] changeCurrentFloor];
//        _currentFloorNumber = [ElevatorController sharedInstance].elevObject.currentFloor;
//        
//        [self displayCurrentFloor:_currentFloorNumber];
//    }
//    
//    
//    if (_passengerFloorNumber > _currentFloorNumber) {
////        for (<#initialization#>; <#condition#>; _currentFloorNumber) {
////            <#statements#>
////        }
//    } else if (_passengerFloorNumber < _currentFloorNumber) {
//        
//    } else {
//        
//    }
//    
}

-(IBAction)numberButtonPressed:(UIButton *)sender {
    if (self.arrowButtonLit) {
        int buttonNumber;
        if ([sender.currentTitle isEqual: @"1"]) {
            buttonNumber = 1;
        }
        else if ([sender.currentTitle isEqual: @"2"]){
            buttonNumber = 2;
        }
        else if ([sender.currentTitle isEqual: @"3"]){
            buttonNumber = 3;
        }
        else if ([sender.currentTitle isEqual: @"4"]) {
            buttonNumber = 4;
        }
        else {
            buttonNumber = 5;
        }
       // _destinationFloor = buttonNumber;
       
        [self changeNumberButtonColor:buttonNumber]; //Method to change the button color

        [[ElevatorController sharedInstance] newElevatorRequest:buttonNumber];
        _destinationFloor = [[ElevatorController sharedInstance] checkDestinationFloor];

        
        [self displayCurrentElevatorState];
        [self elevatorCycle];
        
        self.currentFloorNumber = buttonNumber;
       // NSString *floorNumber =[NSString stringWithFormat:@"%i", buttonNumber];
        
        self.arrowButtonLit = NO;
        [self changeNumberButtonColor:buttonNumber];
    }
    
}

-(void)displayCurrentFloor:(NSInteger)currentFloor {
    NSString *floorNumber =[NSString stringWithFormat:@"%ld", (long)currentFloor];
    self.outsideFloorIndicator.text = floorNumber;
    self.insideFloorIndicator.text = floorNumber;
}

-(void)displayCurrentElevatorState {
    NSString *state = [[ElevatorController sharedInstance] getElevatorState];
    self.currentStateLabel.text = state;
}


-(void)changeNumberButtonColor:(int)buttonNumber {
    
    if (!self.numberButtonLit) {
        self.numberButtonLit = YES;
        self.numberButtonColor = [UIColor blueColor];
    } else {
        self.numberButtonColor = [UIColor cyanColor];
        self.numberButtonLit = NO;
    }
    
    if (buttonNumber == 1) {
        _floor1Button.backgroundColor = _numberButtonColor;
    } else if (buttonNumber == 2) {
        _floor2Button.backgroundColor = _numberButtonColor;
    } else if (buttonNumber == 3) {
        _floor3Button.backgroundColor = _numberButtonColor;
    } else if (buttonNumber == 4) {
        _floor4Button.backgroundColor = _numberButtonColor;
    } else {
        _floor5Button.backgroundColor = _numberButtonColor;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
