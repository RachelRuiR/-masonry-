

#import "WREditController.h"

@interface WREditController ()

/**
 *  姓名
 */
@property (weak, nonatomic) UITextField *nameField;

/**
 *  密码
 */
@property (weak, nonatomic) UITextField *psdField;

/**
 *  编辑按钮
 */
@property (weak, nonatomic) UIButton *editBtn;

@end

@implementation WREditController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"编辑联系人";
    
    [self setupUI];
    
    [self addContrains];
}


#pragma mark - 编辑按钮的点击事件
- (void)editBtnClick {
    
}

#pragma mark - 创建并添加子控件
- (void)setupUI {
    
    UITextField *nameField = [[UITextField alloc] init];
    nameField.borderStyle = UITextBorderStyleRoundedRect;
    
    
    
    UITextField *psdField = [[UITextField alloc] init];
    psdField.borderStyle = UITextBorderStyleRoundedRect;
    
    
    UIButton *editBtn = [[UIButton alloc] init];
    [editBtn setTitle:@"编      辑" forState:UIControlStateNormal];
    [editBtn setBackgroundColor:[UIColor lightGrayColor]];
    
    
    // 添加
    [self.view addSubview:nameField];
    [self.view addSubview:psdField];
    [self.view addSubview:editBtn];
    
    // 赋值
    self.nameField = nameField;
    self.psdField = psdField;
    self.editBtn = editBtn;
    
    
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editBtnClick)];
    
    self.navigationItem.rightBarButtonItem = editItem;
    
}

#pragma mark - 添加约束
- (void)addContrains {
    
    CGFloat top = 110;
    CGFloat margin = 30;
    CGFloat height = 30;
    
    // 姓名框
    [self.nameField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.view).offset(top);    // y
        make.left.mas_equalTo(self.view).offset(margin);    // x
        make.right.mas_equalTo(self.view).offset(-margin);  // w
        make.height.offset(height); // h
        
    }];
    
    // 密码框
    [self.psdField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(self.nameField);   // x
        make.trailing.mas_equalTo(self.nameField);  // w
        make.height.mas_equalTo(self.nameField);    // h
        make.top.mas_equalTo(self.nameField.mas_bottom).offset(margin);   // y
        
    }];
    
    // 编辑按钮
    [self.editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.mas_equalTo(self.nameField);   // x
        make.trailing.mas_equalTo(self.nameField);  // w
        make.top.mas_equalTo(self.psdField.mas_bottom).offset(2 * margin);  // y
        
    }];
    
    
}




@end
