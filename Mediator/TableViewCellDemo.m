//
//  TableViewCellDemo.m
//  Meditaor
//
//  Created by 王祥伟 on 2024/3/18.
//

#import "TableViewCellDemo.h"
#import "ModelDemo.h"
#import <Masonry.h>

@interface TableViewCellDemo()
@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation TableViewCellDemo

+ (instancetype)initWithTableView:(UITableView *)tableView withObject:(ModelDemo *)object{
    TableViewCellDemo *cell = [self initWithTableView:tableView];
    cell.contentLabel.text = object.content;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUpSubViews];
        
    }
    return self;
}

- (void)setUpSubViews{
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.bottom.mas_equalTo(-10);
    }];
}

- (UILabel *)contentLabel{
    if (!_contentLabel){
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = UIColor.blackColor;
        _contentLabel.font = [UIFont systemFontOfSize:14];
    }
    return _contentLabel;
}

@end
