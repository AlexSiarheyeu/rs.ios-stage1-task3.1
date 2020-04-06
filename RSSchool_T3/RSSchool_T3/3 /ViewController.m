#import "ViewController.h"

@interface ViewController() <UITextFieldDelegate>

@property(nonatomic,weak) UILabel *labelResultColor;
@property(nonatomic,weak) UITextField *textFieldBlue;
@property(nonatomic,weak) UITextField *textFieldRed;
@property(nonatomic,weak) UITextField *textFieldGreen;
@property(nonatomic,weak) UIView *viewResultColor;

@end
@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];

#pragma mark - Adding UIVIEWs
    
    UIView *view = [[UIView alloc]initWithFrame: self.view.bounds];
    [self.view addSubview:view];
    
    self.viewResultColor = [[UIView alloc]initWithFrame:CGRectMake(120, 155, 260, 55)];
    self.viewResultColor.layer.borderWidth = 0.2;
    self.viewResultColor.layer.borderColor = [[UIColor blackColor] CGColor];
    [self.view addSubview: self.viewResultColor];

    self.labelResultColor = [[UILabel alloc]initWithFrame:
                                      CGRectMake(10, 175, 110, 20)];
    
    self.labelResultColor.backgroundColor = [UIColor whiteColor];
    self.labelResultColor.text = @"Color";
    
#pragma mark - Adding textField Red
    
    self.textFieldRed = [[UITextField alloc]initWithFrame:
                                      CGRectMake(90, 255, 290, 45)];
    
    self.textFieldRed.backgroundColor = [UIColor whiteColor];
    self.textFieldRed.placeholder = [NSString stringWithFormat: @"0..255"];
    self.textFieldRed.layer.cornerRadius = 10.f;
    self.textFieldRed.layer.borderWidth = 1.f;
    self.textFieldRed.layer.borderColor = [[UIColor systemGrayColor] CGColor];
    self.textFieldRed.delegate = self;
    
    UILabel *labelRed = [[UILabel alloc]initWithFrame:CGRectMake(10, 270, 80, 20)];
    labelRed.backgroundColor = [UIColor whiteColor];
    labelRed.text = @"RED";
    
#pragma mark - Adding textField Green
    
    self.textFieldGreen = [[UITextField alloc]initWithFrame:
                                       CGRectMake(90, 355, 290, 45)];
    
    self.textFieldGreen.backgroundColor = [UIColor whiteColor];
    self.textFieldGreen.placeholder = [NSString stringWithFormat: @"0..255"];
    self.textFieldGreen.layer.cornerRadius = 10.f;
    self.textFieldGreen.layer.borderWidth = 1.f;
    self.textFieldGreen.layer.borderColor = [[UIColor systemGrayColor] CGColor];
    self.textFieldGreen.delegate = self;

    
    UILabel *labelGreen = [[UILabel alloc]initWithFrame: CGRectMake(10, 355, 60, 50)];
            
    labelGreen.backgroundColor = [UIColor whiteColor];
    labelGreen.text = @"GREEN";
    
#pragma mark - Adding textField Blue
    
    self.textFieldBlue = [[UITextField alloc]initWithFrame:
                                       CGRectMake(90,455,290,45)];
    
    self.textFieldBlue.backgroundColor = [UIColor whiteColor];
    self.textFieldBlue.placeholder = [NSString stringWithFormat: @"0..255"];
    self.textFieldBlue.layer.cornerRadius = 10.f;
    self.textFieldBlue.layer.borderWidth = 1.f;
    self.textFieldBlue.layer.borderColor = [[UIColor systemGrayColor] CGColor];
    self.textFieldBlue.delegate = self;

    
    UILabel *labelBlue = [[UILabel alloc]initWithFrame:CGRectMake(10,455 , 60, 50)];
    labelBlue.backgroundColor = [UIColor whiteColor];
    labelBlue.text = @"BLUE";
    
#pragma mark - Adding button
    
    UIButton *buttonProcess = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonProcess.frame = CGRectMake(self.textFieldBlue.frame.origin.x * 2,
                                     self.textFieldBlue.frame.origin.y + 100,
                                     80, 50);
    [buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [buttonProcess setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    
    [buttonProcess addTarget:self action: @selector(buttonProcessPressed:)
                   forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark - Showing objects
    
    [self.view addSubview: self.textFieldRed];
    [self.view addSubview: self.textFieldGreen];
    [self.view addSubview: self.textFieldBlue];
    [self.view addSubview:labelRed];
    [self.view addSubview:labelGreen];
    [self.view addSubview:labelBlue];
    [self.view addSubview:self.labelResultColor];
    [self.view addSubview:buttonProcess];

    
    view.accessibilityIdentifier = @"mainView";
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    buttonProcess.accessibilityIdentifier = @"buttonProcess";
    labelRed.accessibilityIdentifier = @"labelRed";
    labelGreen.accessibilityIdentifier = @"labelGreen";
    labelBlue.accessibilityIdentifier = @"labelBlue";
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
    
}
#pragma mark - Methods


-(void)buttonProcessPressed:(UIButton *)sender {
   

    if ([self isValidTextField:self.textFieldRed.text] &&
        [self isValidTextField:self.textFieldGreen.text] &&
        [self isValidTextField:self.textFieldBlue.text]) {
        
            float red = [self.textFieldRed.text floatValue] / 255;
            float green = [self.textFieldGreen.text floatValue] / 255;
            float blue = [self.textFieldBlue.text floatValue] / 255;
        

        NSString *hexColor = [NSString stringWithFormat:@"0x%02X%02X%02X", [self.textFieldRed.text intValue],
            [self.textFieldGreen.text intValue],
            [self.textFieldBlue.text intValue]];

        self.viewResultColor.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.f];
        self.labelResultColor.text = hexColor;

    } else {
        self.labelResultColor.text = @"Error";
        self.viewResultColor.backgroundColor = [UIColor whiteColor];
    }

    [self.textFieldRed resignFirstResponder];
    [self.textFieldGreen resignFirstResponder];
    [self.textFieldBlue resignFirstResponder];
    self.textFieldRed.text = self.textFieldGreen.text = self.textFieldBlue.text = @"";


}

-(BOOL)isValidTextField:(NSString*)stringTextField {
    NSMutableSet *numbers = [[NSMutableSet alloc] init];

    for (int i = 0; i <= 255; i++) {
        [numbers addObject:[NSString stringWithFormat:@"%d", i]];
    }
    return  [numbers containsObject:stringTextField] ? YES : NO;
}


@end
