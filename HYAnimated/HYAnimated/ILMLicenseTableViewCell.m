//
//  ILMLicenseTableViewCell.m
//  HYAnimated
//
//  Created by wuhaoyuan on 2016/10/27.
//  Copyright © 2016年 HYModel. All rights reserved.
//

#import "ILMLicenseTableViewCell.h"

@interface ILMLicenseTableViewCell ()
{
    UIImageView *image;
}
@end

@implementation ILMLicenseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        image = [[UIImageView alloc] init];
        image.layer.masksToBounds = YES;
        image.image = [UIImage imageNamed:@"mg_bananer"];
        image.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:image];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    image.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
