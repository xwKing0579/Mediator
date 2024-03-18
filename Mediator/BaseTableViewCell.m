//
//  BaseTableViewCell.m
//  Mediator
//
//  Created by 王祥伟 on 2024/3/18.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

+ (instancetype)initWithTableView:(UITableView *)tableView{
    return [self initWithTableView:tableView andIdentifier:NSStringFromClass([self class])];
}

+ (instancetype)initWithTableView:(UITableView *)tableView andIdentifier:(NSString *)identifier{
    id cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews{}

@end
