//
//  ViewController.m
//  Mediator
//
//  Created by 王祥伟 on 2024/3/18.
//

#import "ViewController.h"
#import "NSObject+Mediator.h"
#import "NSString+Demo.h" ///处理硬编码问题
@interface ViewController ()
@property (nonatomic, strong) NSObject *obj;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //NSObject+Mediator 使用demo
    NSObject *obj = [NSObject performTarget:NSString.tableViewDemo.classString action:NSString.tableViewDemo_action object:NSString.tableViewCellString object:self];
    self.obj = obj;
    
    ///加载数据 实际开发中使用YYModel解析不存在硬编码问题
    ///可以去 https://github.com/xiangwei17521000579/OCProject 查看如何统一处理硬编码
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableArray *data = [NSMutableArray array];
        for (int i = 0; i < 100; i++) {
            NSObject *model = [NSObject performTarget:NSString.modelString.classString action:NSString.newString];
            [model performAction:@"setContent:" object:[NSString stringWithFormat:@"this index = %d",i]];
            [data addObject:model];
        }
        [obj performAction:NSString.reloadDataString object:data];
    });
}


@end
