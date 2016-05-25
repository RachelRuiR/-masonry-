

#import "WRAddController.h"

@interface WRAddController ()

/**
 *  用户名框
 */
@property (nonatomic, weak) UITextField *nameField;

/**
 *  密码框
 */
@property (nonatomic, weak) UITextField *psdField;

/**
 *  添加按钮
 */
@property (weak, nonatomic) UIButton *loginBtn;

@end

@implementation WRAddController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"添加联系人";
    
    [self setupUI];
    
    [self addContrains];
    
}

#pragma mark - 创建并添加子控件
- (void)setupUI {
    
    // 创建并设置子控件
    UITextField *nameField = [[UITextField alloc] init];
    nameField.placeholder = @"请输入用户名";
    nameField.borderStyle = UITextBorderStyleRoundedRect;
    
    
    UITextField *psdField = [[UITextField alloc] init];
    psdField.placeholder = @"请输入密码";
    psdField.borderStyle = UITextBorderStyleRoundedRect;
    
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setTitle:@"添      加" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor lightGrayColor]];
//    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 添加
    [self.view addSubview:nameField];
    [self.view addSubview:psdField];
    [self.view addSubview:loginBtn];
    
    
    self.nameField = nameField;
    self.psdField = psdField;
    self.loginBtn = loginBtn;
    
    
}


- (void)addContrains {
    
    CGFloat topM = 110;
    CGFloat height = 30;
    CGFloat margin = 30;
    CGFloat rowMargin = 60;
    
    // 用户名框
    [self.nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.view).offset(topM);   // y
        make.left.mas_equalTo(self.view).offset(margin);    // x
        make.right.mas_equalTo(self.view.mas_right).offset(-margin);    // w
        make.height.offset(height); // h
        
    }];
    
    // 密码框
    [self.psdField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.nameField).offset(rowMargin);    // y
        make.leading.mas_equalTo(self.nameField.mas_leading);   // x
        make.trailing.mas_equalTo(self.nameField.mas_trailing);     // w
        make.height.offset(height);     // h
        
    }];
    
    // 添加按钮
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.psdField).offset(2 * rowMargin);    // y
        make.leading.mas_equalTo(self.nameField.mas_leading);   // x
        make.trailing.mas_equalTo(self.nameField.mas_trailing); // w
        
    }];
    
}

@end
