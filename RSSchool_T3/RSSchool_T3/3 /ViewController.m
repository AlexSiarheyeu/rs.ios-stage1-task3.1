#import "ViewController.h"

@interface ViewController() <UITextFieldDelegate>

@property(nonatomic,strong) UILabel *labelResultColor;
@property(nonatomic,strong) UILabel *labelRed;
@property(nonatomic,strong) UILabel *labelGreen;
@property(nonatomic,strong) UILabel *labelBlue;


@property(nonatomic,strong) UITextField *textFieldBlue;
@property(nonatomic,strong) UITextField *textFieldRed;
@property(nonatomic,strong) UITextField *textFieldGreen;

@property(nonatomic,strong) UIView *viewResultColor;

@property(nonatomic,strong) UIButton *buttonProcess;


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
    [self.view addSubview:self.labelResultColor];

    
#pragma mark - Adding textField Red
    
    self.textFieldRed = [[UITextField alloc]initWithFrame:
                                      CGRectMake(90, 255, 290, 45)];
    
    self.textFieldRed.backgroundColor = [UIColor whiteColor];
    self.textFieldRed.placeholder = [NSString stringWithFormat: @"0..255"];
    self.textFieldRed.layer.cornerRadius = 10.f;
    self.textFieldRed.layer.borderWidth = 1.f;
    self.textFieldRed.layer.borderColor = [[UIColor systemGrayColor] CGColor];
    
    self.textFieldRed.delegate = self;
    [self.view addSubview: self.textFieldRed];
    
    self.labelRed = [[UILabel alloc]initWithFrame:CGRectMake(10, 270, 80, 20)];
    self.labelRed.backgroundColor = [UIColor whiteColor];
    self.labelRed.text = @"RED";
    [self.view addSubview:self.labelRed];

    
#pragma mark - Adding textField Green
    
    self.textFieldGreen = [[UITextField alloc]initWithFrame:
                                       CGRectMake(90, 355, 290, 45)];
    
    self.textFieldGreen.backgroundColor = [UIColor whiteColor];
    self.textFieldGreen.placeholder = [NSString stringWithFormat: @"0..255"];
    self.textFieldGreen.layer.cornerRadius = 10.f;
    self.textFieldGreen.layer.borderWidth = 1.f;
    self.textFieldGreen.layer.borderColor = [[UIColor systemGrayColor] CGColor];
    
    self.textFieldGreen.delegate = self;
    [self.view addSubview: self.textFieldGreen];
    
    self.labelGreen = [[UILabel alloc]initWithFrame: CGRectMake(10, 355, 60, 50)];
    self.labelGreen.backgroundColor = [UIColor whiteColor];
    self.labelGreen.text = @"GREEN";
    [self.view addSubview:self.labelGreen];

    
#pragma mark - Adding textField Blue
    
    self.textFieldBlue = [[UITextField alloc]initWithFrame:
                                       CGRectMake(90,455,290,45)];
    
    self.textFieldBlue.backgroundColor = [UIColor whiteColor];
    self.textFieldBlue.placeholder = [NSString stringWithFormat: @"0..255"];
    self.textFieldBlue.layer.cornerRadius = 10.f;
    self.textFieldBlue.layer.borderWidth = 1.f;
    self.textFieldBlue.layer.borderColor = [[UIColor systemGrayColor] CGColor];
    
    self.textFieldBlue.delegate = self;
    [self.view addSubview: self.textFieldBlue];

    self.labelBlue = [[UILabel alloc]initWithFrame:CGRectMake(10,455 , 60, 50)];
    self.labelBlue.backgroundColor = [UIColor whiteColor];
    self.labelBlue.text = @"BLUE";
    [self.view addSubview:self.labelBlue];

    
#pragma mark - Adding button
    
    self.buttonProcess = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonProcess.frame = CGRectMake(self.textFieldBlue.frame.origin.x * 2,
                                     self.textFieldBlue.frame.origin.y + 100,
                                     80, 50);
    [self.buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [self.buttonProcess setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    [self.view addSubview:self.buttonProcess];
    [self.buttonProcess addTarget:self action: @selector(buttonProcessPressed:)
                   forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark - Showing objects
    

    self.view.accessibilityIdentifier = @"mainView";
        self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
        self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
        self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
        self.buttonProcess.accessibilityIdentifier = @"buttonProcess";
        self.labelRed.accessibilityIdentifier = @"labelRed";
        self.labelGreen.accessibilityIdentifier = @"labelGreen";
        self.labelBlue.accessibilityIdentifier = @"labelBlue";
        self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
        self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
        
}
#pragma mark - Methods


-(void)buttonProcessPressed:(UIButton *)sender {
   
    
@end
