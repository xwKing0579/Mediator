//
//  TableViewDemo.m
//  Meditaor
//
//  Created by 王祥伟 on 2024/3/18.
//

#import "TableViewDemo.h"
#import "NSObject+Mediator.h"
#import <Masonry.h>
@interface TableViewDemo ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSString *cellString;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) UIViewController *viewController;
@end
@implementation TableViewDemo

+ (instancetype)initWithTableViewCellString:(NSString *)cellString viewControlle:(UIViewController *)viewController{
    TableViewDemo *demo = [TableViewDemo new];
    demo.cellString = cellString;
    demo.viewController = viewController;
    return demo;
}

- (void)reloadData:(NSArray *)data{
    self.data = data;
    [self.tableView reloadData];
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [NSObject performTarget:self.cellString.classString action:[self actionString] object:tableView object:self.data[indexPath.row]] ?: [UITableViewCell new];
}

- (NSString *)actionString{
    return @"initWithTableView:withObject:";
}

#pragma mark -- setter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        [self.viewController.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}
@end
