//
// Created by wanhongbin on 16/12/19.
// Copyright (c) 2016 wanhongbin. All rights reserved.
//

#import "LGUITableViewCell.h"


@implementation LGUITableViewCell

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@>", NSStringFromClass([self class])];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }

    return self;
}


@end
