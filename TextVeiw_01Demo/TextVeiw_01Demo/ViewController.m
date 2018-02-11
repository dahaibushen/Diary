//
//  ViewController.m
//  TextVeiw_01Demo
//
//  Created by HU on 2018/2/11.
//  Copyright © 2018年 HU. All rights reserved.
// 书写一个日记本

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()<UITextViewDelegate>
@property(nonatomic,strong)UITextView *textView;
@property(nonatomic,strong)UITextView *writeTextView;
@end

@implementation ViewController

-(UITextView*)textView{
    if (!_textView) {
        _textView = [UITextView new];
        _textView.delegate = self;
        _textView.backgroundColor = [UIColor whiteColor];
//        _textView.userInteractionEnabled = NO;
    }
    return _textView;
}
-(UITextView*)writeTextView{
    if (!_writeTextView) {
        _writeTextView = [UITextView new];
        _writeTextView.delegate = self;
        _writeTextView.backgroundColor = [UIColor clearColor];
    }
    return _writeTextView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.textView];
    [self settingLayoutContraintWithView:self.textView];
    for (int i=0; i<10; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor orangeColor];
        view.frame = CGRectMake(0, 28*(i+1), self.view.frame.size.width-160, 1);
        [self.textView addSubview:view];
    }
    
//    [self.view addSubview:self.writeTextView];
//    [self settingLayoutContraintWithView:self.writeTextView];
   
    //用这个的先画线，上边再加一个textview 去用这个线，不是无用代码
//    [self resettingTextViewWithString:@"sdkskskdskldksdkskdskldlkskdslkdlksdkskdklsdklskdskldsksdksdkldskskdskdskdslkdklslkdskldkskldkslkdkldsksdklsdkdsksldksskdsksdkldslkskdslksdkdsklsdkdsksdklsdlkdskdskdskdskdslksdkdlsdskdsklsdlkdslksdkskskdskldksdkskdskldlkskdslkdlksdkskdklsdklskdskldsksdksdkldskskdskdskdslkdklslkdskldkskldkslkdkldsksdklsdkdsksldksskdsksdkldslkskdslksdkdsklsdkdsksdklsdlkdskdskdskdskdslksdkdlsdskdsklsdlkdslk" withTextView:self.textView withLineColor:[UIColor blackColor] withTextClolr:[UIColor clearColor]];
}

-(void)settingLayoutContraintWithView:(UIView*)view{
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(20);
        make.left.mas_equalTo(self.view).offset(80);
        make.right.mas_equalTo(self.view).offset(-80);
        make.bottom.mas_equalTo(self.view);
    }];
}

-(void)textViewDidChange:(UITextView *)textView{
    [self resettingTextViewWithString:textView.text withTextView:textView withLineColor:[UIColor clearColor] withTextClolr:[UIColor blackColor]];
    NSLog(@"look here sssss---: %f",textView.contentSize.height);
   
}
-(void)resettingTextViewWithString:(NSString*)str withTextView:(UITextView*)textView withLineColor:(UIColor*)color withTextClolr:(UIColor*)textColor{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.firstLineHeadIndent = 20.0f;//首行缩进
    paragraphStyle.minimumLineHeight = 25;//最低行高
    paragraphStyle.maximumLineHeight = 25;//最大行高
    NSDictionary *attrs2 = @{NSStrokeWidthAttributeName:@-5,
                             NSStrokeColorAttributeName:[UIColor clearColor],
                             NSFontAttributeName:[UIFont systemFontOfSize:15],
                                                     NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                             NSParagraphStyleAttributeName:paragraphStyle,
//                             NSBaselineOffsetAttributeName:@(3),
//                             NSVerticalGlyphFormAttributeName:@(3),
                             NSUnderlineColorAttributeName:color,
                             NSForegroundColorAttributeName:textColor
                             };
    textView.attributedText = [[NSAttributedString alloc] initWithString:str attributes:attrs2];
}


@end
