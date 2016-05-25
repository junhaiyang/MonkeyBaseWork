

#import "BaseViewController.h"

@interface BaseViewController (){
    
    UIButton *button;
}

@end

@implementation BaseViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        if(!keyboardCenter)
            keyboardCenter  = [SBKeyboardCenter new];
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        if(!keyboardCenter)
            keyboardCenter  = [SBKeyboardCenter new];
        
    }
    return self;
}
-(void)dealloc{
    [keyboardCenter removeKeyboardEvent];
    keyboardCenter = nil;
}

//添加键盘监听事件
-(void)addKeyboardEventWithShowKeyboard:(SBKeyboardShowCallBlock)showBlock tapGesture:(SBKeyboardTapCallBlock)tapBlock hideKeyboard:(SBKeyboardHideCallBlock)hideBlock{
    [keyboardCenter addKeyboard:self.view showKeyboard:showBlock tapGesture:tapBlock hideKeyboard:hideBlock];
}

//置键盘生效
-(void)invalidteKeyboardTap{
    [keyboardCenter invalidteKeyboardTap];
}

//置键盘无效
-(void)uninvalidteKeyboardTap{
    [keyboardCenter uninvalidteKeyboardTap];
}

//移除键盘监听
-(void)removeKeyboardEvent{
    [keyboardCenter removeKeyboardEvent];
}
-(void)leftBackHidden:(BOOL)hidden
{
    button.hidden=hidden;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;  //防止内边距被调整
    self.extendedLayoutIncludesOpaqueBars = NO;      //是否被导航条覆盖
    // Do any additional setup after loading the view.
    [self setupleftMenuButton];
}
-(void)setupleftMenuButton
{
    self.navigationItem.hidesBackButton=YES;
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 10 , 16);
    [button.titleLabel setFont:[UIFont fontWithName:@"Arial" size:15]];
    [button addTarget:self action:@selector(navigationLeftButton) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"goback"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
}
-(void)navigationLeftButton
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotate
{
    return NO;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

@end
