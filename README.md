# TKTagView

![image](https://github.com/TongKai/TKTagView/blob/master/demo.png)

一个用来创建tag效果的封装类，效果如截图所示。

### 如何使用 How to use

把TKTagView文件夹复制到你到项目当中。 Copy the TKTagView folder to your project

### 用法 Usage
    
    TKTagView *tagView = [[TKTagView alloc]initWithFrame:CGRectMake(8, 64, self.view.bounds.size.width - 16, 1)];
    //设置_tagTitleArray set _tagTitleArray
    tagView.tagTitleArray = @[@"酒店",@"西伯利亚",@"H姓小鲜肉",@"啊，王尼马",@"富士康首席翻译－－张全蛋",@"Github",@"tomcat",@"Android"];
    //调用 createTags call createTags
    [tagView createTags];
    
    [self.view addSubview:tagView];

支持自定义tag背景色，tag文字颜色，tag文字大小，圆角效果，点击事件，具体请看demo。
