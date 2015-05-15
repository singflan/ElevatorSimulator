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
@property NSInteger floorNumber; // Which floor is the elevator on now
@property NSInteger destinationFloor; // Which floor are we headed to
@property NSInteger direction; // Is elevator on the way up or down
@property BOOL *arrowButtonLit;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _floorNumber = 0;
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


    _arrowButtonLit = false;

    
    
}



-(IBAction)upButtonPressed:(id)sender {
    
}

-(IBAction)downButtonPressed:(id)sender {
    
}

-(IBAction)numberButtonPressed:(id)sender {
    int buttonNumber;
    switch (sender currentAttributedTitle) {
        case 1:
            <#statements#>
            break;
        case 2:
            
            break;
        case 3:
            
            break;
            
        case 4:
            
            break;
            
        default:
            
            break;
    }
    if (sender currentAttributedTitle = "1") {
        
    }
    
    if (self.arrowButtonLit = true) { // if the outside light is on
        [self advanceFloor]; //do something like this
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
