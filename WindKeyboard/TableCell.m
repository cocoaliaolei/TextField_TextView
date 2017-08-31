//
//  TableCell.m
//  WindKeyboard
//
//  Created by 廖磊 on 2017/8/24.
//  Copyright © 2017年 东边的风. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _textFeld = [[UITextField alloc]initWithFrame:CGRectMake(10, 5, 200, 30)];
        _textFeld.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_textFeld];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
