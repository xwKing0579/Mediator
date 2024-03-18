//
//  BaseTableViewCell.h
//  Mediator
//
//  Created by 王祥伟 on 2024/3/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewCell : UITableViewCell
+ (instancetype)initWithTableView:(UITableView *)tableView;
+ (instancetype)initWithTableView:(UITableView *)tableView andIdentifier:(NSString *)identifier;
- (void)setUpSubViews;
@end

NS_ASSUME_NONNULL_END
