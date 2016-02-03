//
//  TKTagView.m
//  
//
//  Created by tongkai on 16/1/7.
//  Copyright © 2016年 tongkai. All rights reserved.
//

#import "TKTagView.h"

@interface TKTagView()

@end

@implementation TKTagView



- (instancetype)init
{
    if (self = [super init]) {
        [self defaultValue];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       [self defaultValue];
    }
    return self;
}

- (void)defaultValue
{
    _tagColorArray = @[[UIColor redColor],[UIColor purpleColor],[UIColor brownColor],[UIColor orangeColor]];
    
    _tagTitleColorArray = @[[UIColor whiteColor]];
    
    _tagFontSize = 11;
    
    //设置了_isRound = YES，请不要设置 TKTagView 的背景色和tag的背景色相同
    // 会有bug，标签上方会有一条黑线
    
    //if you set _isRound = YES,
    //please don't make TKTagView has the same background with the tag
    //it will cause bug
    _isRound = NO;
   
    //建议_tagFontSize和_cornerRadius的比例接近1:1,
    
    //suggest _tagFontSize:_cornerRadius nearly equals 1:1
    _tagCornerRadius = 10;
    
}

- (void)createTags
{
    if (_tagTitleArray.count <= 0) {
        NSLog(@"_tagTitleArray can not be nil or empty");
        return;
    }
    
    for (UIView *view in [self subviews])
    {
        [view removeFromSuperview];
    }
    
    NSDictionary *fontAttributesDict = @{NSFontAttributeName:[UIFont systemFontOfSize:_tagFontSize + 4]};
    
    CGFloat lastMaxX = 0.0f;
    CGFloat lastMaxY = 0.0f;
    
    for (int i = 0; i < _tagTitleArray.count; i++) {
        
        NSString *labelText = _tagTitleArray[i];
        
        UILabel *label = [[UILabel alloc]init];
        
        if (_isRound) {
            label.layer.cornerRadius = _tagCornerRadius;
            label.layer.masksToBounds = YES;
        }
        
        CGRect frame = [labelText boundingRectWithSize:CGSizeMake(MAXFLOAT, 21) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontAttributesDict context:nil];
       
        //有误差，原因不明
        if (lastMaxX + 3 + frame.size.width > CGRectGetMaxX(self.frame)) {
            lastMaxY = frame.size.height + lastMaxY + 8 ;
            lastMaxX = 0;
        }
        
        label.frame = CGRectMake(lastMaxX ,lastMaxY,_isRound?frame.size.width + _tagFontSize - 0.5:frame.size.width, _isRound?frame.size.height + 1.5:frame.size.height);
        
        lastMaxX = CGRectGetMaxX(label.frame) + 8;
        
        label.font = [UIFont systemFontOfSize:_tagFontSize];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.text = labelText;
        
        label.textColor = _tagTitleColorArray[arc4random() % _tagTitleColorArray.count];
        
        label.backgroundColor = _tagColorArray[arc4random() % _tagColorArray.count];
        
        label.tag = 1000 + i;
        
        label.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        
        [label addGestureRecognizer:tap];
        
        [self addSubview:label];
    }
    
    if (lastMaxY < CGRectGetMaxY(self.subviews.lastObject.frame)) {
        lastMaxY = CGRectGetMaxY(self.subviews.lastObject.frame) ;
    }
    
    CGRect frame = self.frame;
    
    frame.size.height = lastMaxY;
    
    self.frame = frame;
}

- (void)CreateTagswithFixRow:(NSInteger) row
{
    if (_tagTitleArray.count <= 0) {
        NSLog(@"_tagTitleArray can not be nil or empty");
        return;
    }
    
    for (UIView *view in [self subviews])
    {
        [view removeFromSuperview];
    }
    
    NSDictionary *fontAttributesDict = @{NSFontAttributeName:[UIFont systemFontOfSize:_tagFontSize + 4]};
    
    NSMutableArray *maxY = [NSMutableArray new];
    NSMutableArray *maxX = [NSMutableArray new];
    
     for (int j = 0; j <  row; j++) {
         
         maxX[j] = @0.0f;
         maxY[j] = @0.0f;
     }
    
    for (int i = 0; i < _tagTitleArray.count; i++) {
        
            NSString *labelText = _tagTitleArray[i];
        
            int j = i % row;
        
            UILabel *label = [[UILabel alloc]init];
            
            if (self.isRound) {
                label.layer.cornerRadius = _tagCornerRadius;
                label.layer.masksToBounds = YES;
            }
            
            CGRect frame = [labelText boundingRectWithSize:CGSizeMake(MAXFLOAT, 21) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontAttributesDict context:nil];
            
            if ([maxX[j] floatValue] + 3 + (_isRound?frame.size.width + _tagFontSize - 0.5:frame.size.width) > CGRectGetMaxX(self.frame)) {
                
                for (int k = 0; k < row; k++) {
                    if ([maxX[k] floatValue] + 3 + (_isRound?frame.size.width + _tagFontSize - 0.5:frame.size.width) <= CGRectGetMaxX(self.frame)) {
                        j = k;
                        break;
                    }
                }
                
                if ([maxX[j] floatValue] + 3 + (_isRound?frame.size.width + _tagFontSize - 0.5:frame.size.width) > CGRectGetMaxX(self.frame))
                {
                    return;
                }
            }
            
            if (self.frame.size.height != (_isRound?frame.size.height + 1.5:frame.size.height) * row + (row - 1) * 8) {
                
                CGRect tempFrame = self.frame;
                
                tempFrame.size.height = (_isRound?frame.size.height + 1.5:frame.size.height) * row + (row - 1) * 8;
                
                self.frame = tempFrame;
            }
        
            if ([maxY[j] floatValue] + (_isRound?frame.size.height + 1.5:frame.size.height) > CGRectGetHeight(self.frame) + 3) {

                j = 0;
            }
        
            label.frame = CGRectMake([maxX[j] floatValue] ,[maxY[j] floatValue],_isRound?frame.size.width + _tagFontSize - 0.5:frame.size.width, _isRound?frame.size.height + 1.5:frame.size.height);
            
            maxY[j+1]  = @(CGRectGetMaxY(label.frame) + 8);
            
            maxX[j] = @([maxX[j] floatValue] + label.frame.size.width + 8);
            
            label.font = [UIFont systemFontOfSize:self.tagFontSize];
            
            label.textAlignment = NSTextAlignmentCenter;
            
            label.text = labelText;
            
            label.textColor = _tagTitleColorArray[arc4random() % _tagTitleColorArray.count];
            
            label.backgroundColor = _tagColorArray[arc4random() % _tagColorArray.count];
        
            label.userInteractionEnabled = YES;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
            
            [label addGestureRecognizer:tap];
            
            [self addSubview:label];
        
    }
    
}

# pragma  mark - 监听事件,tag click event
- (void)tapAction:(UITapGestureRecognizer *)tapGestureRecognizer
{
    UILabel *aTag = (UILabel *)tapGestureRecognizer.view;
    
    if (aTag.tag < 1000) {
        [self.delegate tapTag:aTag index:-1];
    }else{
        [self.delegate tapTag:aTag index:aTag.tag - 1000];
    }
}

@end
