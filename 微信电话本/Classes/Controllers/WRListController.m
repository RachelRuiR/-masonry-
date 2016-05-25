

#import "WRListController.h"
#import "WRAddController.h"
#import "WREditController.h"

@interface WRListController ()

/**
 *  取消按钮
 */
@property (weak, nonatomic) UIBarButtonItem *cancelBtn;

/**
 *  弹簧
 */
@property (weak, nonatomic) UIBarButtonItem *flexibleItem;

/**
 *  删除按钮
 */
@property (weak, nonatomic) UIBarButtonItem *deleteBtn;

/**
 *  添加按钮
 */
@property (weak, nonatomic) UIBarButtonItem *addBtn;

@end

@implementation WRListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"通讯录";
    
    [self setupUI];

}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    return cell;
    
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WREditController *edicVc = [[WREditController alloc] init];
    
    [self.navigationController pushViewController:edicVc animated:YES];
    
}




#pragma mark - 创建并添加子控件
- (void)setupUI {
    
    // 左侧取消按钮
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(cancelBtnClick)];
    
    self.navigationItem.leftBarButtonItem = cancelItem;
    
    // 右侧删除和添加按钮
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBtnClick)];
    
    UIBarButtonItem *trashItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(trashBtnClick)];
    
    self.navigationItem.rightBarButtonItems = @[addItem, trashItem];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    
}


#pragma mark - 取消按钮的点击事件
- (void)cancelBtnClick {
    
}

#pragma mark - 添加按钮的点击事件
- (void)addBtnClick {
    
    WRAddController *addVc = [[WRAddController alloc] init];
    
    [self.navigationController pushViewController:addVc animated:YES];
    
}

#pragma mark - 删除按钮的点击事件
- (void)trashBtnClick {
    
}

@end











