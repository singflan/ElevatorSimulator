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
@property UIImage *upArrow;
@property UIImage *downArrow;
@property NSInteger currentFloorNumber; // Which floor is the elevator on now
@property NSInteger destinationFloor; // Which floor are we headed to
@property NSInteger direction; // Is elevator on the way up or down
@property BOOL *arrowButtonLit;
@property BOOL *numberButtonLit;
@property NSArray *floors;
@property UIColor *numberButtonColor;
@property NSTimer *betweenFloorsTimer;

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

    _floors = @[@1,@2,@3,@4,@5];
    _arrowButtonLit = NO;
    _numberButtonLit = NO;
    
}

-(IBAction)upButtonPressed:(UIButton *)sender {
    if (!_arrowButtonLit) {
        _arrowButtonLit = YES;
        if ([sender.currentAttributedTitle isEqual:@"Floor5Down"]) {
            self.floor5DownButton.backgroundColor = [UIColor redColor];
        } else if ([sender.currentAttributedTitle isEqual:@"Floor4Down"]) {
            self.floor4DownButton.backgroundColor = [UIColor redColor];
        } else if ([sender.currentAttributedTitle isEqual:@"Floor3Down"]) {
            self.floor3DownButton.backgroundColor = [UIColor redColor];
        } else if ([sender.currentAttributedTitle isEqual:@"Floor2Down"]) {
            self.floor2DownButton.backgroundColor = [UIColor redColor];
        } else if ([sender.currentAttributedTitle isEqual:@"Floor4Up"]) {
            self.floor4UpButton.backgroundColor = [UIColor redColor];
        } else if ([sender.currentAttributedTitle isEqual:@"Floor3Up"]) {
            self.floor3UpButton.backgroundColor = [UIColor redColor];
        } else if ([sender.currentAttributedTitle isEqual:@"Floor2Up"]) {
            self.floor2UpButton.backgroundColor = [UIColor redColor];
        } else if ([sender.currentAttributedTitle isEqual:@"Floor1Up"]) {
            self.floor1UpButton.backgroundColor = [UIColor redColor];
        }
    }
}

-(IBAction)downButtonPressed:(UIButton *)sender {
    if (!_arrowButtonLit) {
       _arrowButtonLit = YES;
    }
}

-(IBAction)numberButtonPressed:(UIButton *)sender {
    if (!self.arrowButtonLit) {
        int buttonNumber;
        if ([sender.currentAttributedTitle isEqual: @"1"]) {
            buttonNumber = 1;
        }
        else if ([sender.currentAttributedTitle isEqual: @"2"]){
            buttonNumber = 2;
        }
        else if ([sender.currentAttributedTitle isEqual: @"3"]){
            buttonNumber = 3;
        }
        else if ([sender.currentAttributedTitle isEqual: @"4"]) {
            buttonNumber = 4;
        }
        else {
            buttonNumber = 5;
        }
       
        [self changeNumberButtonColor:buttonNumber]; //Method to change the button color
       
     //  [self.betweenFloorsTimer ]
//        if (<#condition#>) {
//            <#statements#>
//        }
//        for (i = buttonNumber) {
//            
//        }
        
//        _betweenFloorsTimer = [NSTimer scheduledTimerWithTimeInterval: 2.0
//                                                               target: self
//                                                             selector:@selector(onTick:)
//                                                             userInfo: nil
//                                                              repeats:NO];
        self.currentFloorNumber = buttonNumber;
        NSString *floorNumber =[NSString stringWithFormat:@"%i", buttonNumber];
        self.outsideFloorIndicator.text = floorNumber;
        self.insideFloorIndicator.text = floorNumber;
            
        self.arrowButtonLit = NO;
    }
    
}

-(void)changeNumberButtonColor:(int)buttonNumber {
    
    if (!self.numberButtonLit) {
        self.numberButtonLit = YES;
        self.numberButtonColor = [UIColor blueColor];
    
        if (buttonNumber == 1) {
            self.floor1Button.backgroundColor = _numberButtonColor;
        } else if (buttonNumber == 2) {
            self.floor2Button.backgroundColor = _numberButtonColor;
        } else if (buttonNumber == 3) {
            self.floor3Button.backgroundColor = _numberButtonColor;
        } else if (buttonNumber == 4) {
            self.floor4Button.backgroundColor = _numberButtonColor;
        } else {
            self.floor5Button.backgroundColor = _numberButtonColor;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
