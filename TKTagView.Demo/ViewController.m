//
//  ViewController.m
//  TKTagView.Demo
//
//  Created by Pro on 16/2/2.
//  Copyright © 2016年 Pro. All rights reserved.
//

#import "ViewController.h"

#import "TKTagView.h"

@interface ViewController ()<TKTagViewTapDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self defalutTagView];
    
    [self roundTagView];
    
    [self fixRowTagView];
    
    [self changePropertyForTagView];
    
    [self addActionToTagView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)defalutTagView
{
    TKTagView *tagView = [[TKTagView alloc]initWithFrame:CGRectMake(8, 64, self.view.bounds.size.width - 16, 1)];
    
    tagView.tagTitleArray = @[@"酒店",@"西伯利亚",@"H姓小鲜肉",@"啊，王尼马",@"富士康首席翻译－－张全蛋",@"Github",@"tomcat",@"Android"];
    
    [tagView createTags];
    
    [self.view addSubview:tagView];
}

- (void)roundTagView
{
    TKTagView *tagView = [[TKTagView alloc]initWithFrame:CGRectMake(8, 164, self.view.bounds.size.width - 16, 1)];
    
    tagView.tagTitleArray = @[@"酒店",@"西伯利亚",@"H姓小鲜肉",@"啊，王尼马",@"富士康首席翻译－－张全蛋",@"Github",@"tomcat",@"Android"];
    
    tagView.isRound = YES;
    
    [tagView createTags];
    
    [self.view addSubview:tagView];
}

- (void)fixRowTagView
{
    TKTagView *tagView = [[TKTagView alloc]initWithFrame:CGRectMake(8, 244, self.view.bounds.size.width - 16, 1)];
    
    tagView.tagTitleArray = @[@"酒店",@"西伯利亚",@"H姓小鲜肉",@"啊，王尼马",@"富士康首席翻译－－张全蛋",@"Github",@"tomcat",@"Android"];
    
    [tagView CreateTagswithFixRow:1];
    
    [self.view addSubview:tagView];
}

- (void)changePropertyForTagView
{
    TKTagView *tagView = [[TKTagView alloc]initWithFrame:CGRectMake(8, 304, self.view.bounds.size.width - 16, 1)];
    
    tagView.tagTitleArray = @[@"酒店",@"西伯利亚",@"H姓小鲜肉",@"啊，王尼马",@"富士康首席翻译－－张全蛋",@"Github",@"tomcat",@"Android"];
    
    tagView.tagColorArray = @[[UIColor blackColor]];
    
    tagView.tagTitleColorArray = @[[UIColor cyanColor],[UIColor purpleColor],[UIColor brownColor]];
    
    tagView.tagFontSize = 16;
    
    tagView.tagCornerRadius = 14;//设置圆角弧度
    
    tagView.isRound = YES;
    
    [tagView createTags];
    
    [self.view addSubview:tagView];
}

- (void)addActionToTagView
{
    TKTagView *tagView = [[TKTagView alloc]initWithFrame:CGRectMake(8, 424, self.view.bounds.size.width - 16, 1)];
    
    tagView.tagTitleArray = @[@"酒店",@"西伯利亚",@"H姓小鲜肉",@"啊，王尼马",@"富士康首席翻译－－张全蛋",@"Github",@"tomcat",@"Android"];
    
    tagView.isRound = YES;
    
    [tagView createTags];
    
    tagView.delegate = self;
    
    [self.view addSubview:tagView];
}

- (void)tapTag:(UILabel *)aTag index:(NSInteger)index
{
    NSLog(@"title--%@,index--%d",aTag.text,index);
}

@end
