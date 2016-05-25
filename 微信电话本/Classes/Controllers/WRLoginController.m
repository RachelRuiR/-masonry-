

#import "WRLoginController.h"
#import "WRListController.h"

@interface WRLoginController ()

/**
 *  用户名框
 */
@property (nonatomic, weak) UITextField *nameField;

/**
 *  密码框
 */
@property (nonatomic, weak) UITextField *psdField;

/**
 *  登录按钮
 */
@property (weak, nonatomic) UIButton *loginBtn;

/**
 *  自动登录label
 */
@property (weak, nonatomic) UILabel *autoLbl;

/**
 *  记住密码label
 */
@property (weak, nonatomic) UILabel *rememberLbl;

/**
 *  自动登录按钮
 */
@property (weak, nonatomic) UISwitch *autoSwitch;

/**
 *  记住密码按钮
 */
@property (weak, nonatomic) UISwitch *rememberSwitch;

@end

@implementation WRLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"登录";
    
    // 添加子控件
    [self setupUI];
    
    // 添加约束
    [self addConstraints];
    
}

#pragma mark - 登录按钮的点击事件
- (void)loginBtnClick {
    
    WRListController *listVc = [[WRListController alloc] init];
    
    [self.navigationController pushViewController:listVc animated:YES];
    
}


#pragma mark - 添加子控件
- (void)setupUI {
    
    // 创建并设置子控件
    UITextField *nameField = [[UITextField alloc] init];
    nameField.placeholder = @"请输入用户名";
    nameField.borderStyle = UITextBorderStyleRoundedRect;
    
    
    UITextField *psdField = [[UITextField alloc] init];
    psdField.placeholder = @"请输入密码";
    psdField.borderStyle = UITextBorderStyleRoundedRect;
    
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setTitle:@"登      录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [loginBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [loginBtn setFont:[UIFont systemFontOfSize:14.0]];
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *rememberLbl = [[UILabel alloc] init];
    rememberLbl.text = @"记住密码";
    rememberLbl.font = [UIFont systemFontOfSize:14.0];
    
    UISwitch *rememberSwitch = [[UISwitch alloc] init];
    
    UILabel *autoLabel = [[UILabel alloc] init];
    autoLabel.text = @"自动登录";
    autoLabel.font = [UIFont systemFontOfSize:14.0];
    
    UISwitch *autoSwitch = [[UISwitch alloc] init];
    
    
    // 添加
    [self.view addSubview:nameField];
    [self.view addSubview:psdField];
    [self.view addSubview:loginBtn];
    [self.view addSubview:rememberLbl];
    [self.view addSubview:rememberSwitch];
    [self.view addSubview:autoLabel];
    [self.view addSubview:autoSwitch];
    
    // 赋值
    self.nameField = nameField;
    self.psdField = psdField;
    self.loginBtn = loginBtn;
    self.rememberLbl = rememberLbl;
    self.rememberSwitch = rememberSwitch;
    self.autoLbl = autoLabel;
    self.autoSwitch = autoSwitch;
    
}

#pragma mark - 布局子控件
- (void)addConstraints {
    
    CGFloat topM = 110;
    CGFloat height = 30;
    CGFloat margin = 30;
    CGFloat rowMargin = 60;
    CGFloat colMargin = 8;
    
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
    
    // 登录按钮
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.psdField).offset(2 * rowMargin);    // y
        make.leading.mas_equalTo(self.nameField.mas_leading);   // x
        make.trailing.mas_equalTo(self.nameField.mas_trailing); // w
        
    }];
    
    // 记住密码label
    [self.rememberLbl mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.psdField.mas_bottom).offset(margin);   // y
        make.leading.mas_equalTo(self.nameField.mas_leading);   // x
        
    }];
    
    // 记住密码Switch
    [self.rememberSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.mas_equalTo(self.rememberLbl); // y
        make.leading.mas_equalTo(self.rememberLbl.mas_trailing).offset(colMargin);   // x
        
    }];
    
    // 自动登录Switch
    [self.autoSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.mas_equalTo(self.rememberLbl); // y
        make.trailing.mas_equalTo(self.nameField);  // x
        
    }];
    
    // 自动登录label
    [self.autoLbl mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.mas_equalTo(self.rememberLbl); // y
        make.trailing.mas_equalTo(self.autoSwitch.mas_leading).offset(-colMargin);   // x
        
    }];
    
}




@end
