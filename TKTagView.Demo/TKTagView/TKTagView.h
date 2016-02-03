//
//  TKTagView.h
//
//
//  Created by tongkai on 16/1/7.
//  Copyright © 2016年 tongkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TKTagViewTapDelegate <NSObject>

@optional

- (void)tapTag:(UILabel *)aTag index:(NSInteger)index;

@end

@interface TKTagView : UIView

@property (nonatomic,strong) NSArray *tagTitleArray;

@property (nonatomic,strong) NSArray *tagColorArray;

@property (nonatomic,assign) NSInteger tagFontSize;

@property (nonatomic,weak) id<TKTagViewTapDelegate> delegate;

@property (nonatomic,strong) NSArray *tagTitleColorArray;

@property (nonatomic,assign) BOOL isRound;

@property (nonatomic,assign) CGFloat tagCornerRadius;

- (void)createTags;

- (void)CreateTagswithFixRow:(NSInteger) row;
@end
