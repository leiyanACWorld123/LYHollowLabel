//
//  LYSegment.m
//  镂空demo
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "LYSegment.h"
#import "LYHollowLabel.h"

@interface LYSegment()
{
    CGFloat _WIDTH;
    NSInteger _INDEX;
}

@property (nonatomic,strong) UIView *clipView;
@property (nonatomic,strong) UIView *maskView;
@end


@implementation LYSegment

-(instancetype)initWithFrame:(CGRect)frame segments:(NSArray *)segments
{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor whiteColor];
        _WIDTH = frame.size.width/segments.count;
        _INDEX = segments.count;
    

        for(int i = 0 ; i < segments.count ; i++){
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(_WIDTH*i, 0, _WIDTH, frame.size.height);
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

            [button setTitle:segments[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
            button.backgroundColor = [UIColor clearColor];
            button.tag = i;
            [self addSubview:button];
        }
        
        _clipView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _WIDTH, frame.size.height)];
        _clipView.backgroundColor = [UIColor clearColor];
        _clipView.clipsToBounds = YES;
        [self addSubview:_clipView];
        
        _maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _maskView.backgroundColor = [UIColor redColor];
        [_clipView addSubview:_maskView];
        
        for(int i = 0 ; i < segments.count ; i++){
            UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
            button1.frame = CGRectMake(_WIDTH*i, 0, _WIDTH, frame.size.height);
            button1.titleLabel.textAlignment = NSTextAlignmentCenter;
            [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            
            [button1 setTitle:segments[i] forState:UIControlStateNormal];
            button1.backgroundColor = [UIColor clearColor];
            [button1 addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
            button1.tag = i;
            [_maskView addSubview:button1];
        }
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self selectBtn:(UIButton *)_maskView.subviews[0]];

}
-(void)selectBtn:(UIButton *)btn
{
    [UIView animateWithDuration:1 animations:^{
                         
     _clipView.frame = CGRectMake(btn.tag*_WIDTH, 0, _clipView.frame.size.width, _clipView.frame.size.height);
     _maskView.frame = CGRectMake(-btn.tag*_WIDTH, 0, _maskView.frame.size.width, _maskView.frame.size.height);
    
     }];

    self.segmentIndex(btn.tag);

}


-(void)setLy_backgroundColor:(UIColor *)ly_backgroundColor{
    _maskView.backgroundColor = ly_backgroundColor;
}
-(void)setLy_textColorNormal:(UIColor *)ly_textColorNormal{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[UIButton class]]){
            [(UIButton *)obj setTitleColor:ly_textColorNormal forState:UIControlStateNormal];
        }
    }];
}

-(void)setLy_textColorSelected:(UIColor *)ly_textColorSelected{
    [_maskView.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setTitleColor:ly_textColorSelected forState:UIControlStateNormal];
    }];
}

-(void)setLy_fontNormal:(UIFont *)ly_fontNormal{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[UIButton class]]){
            UIButton *button = (UIButton *)obj;
            button.titleLabel.font = ly_fontNormal;
        }
    }];
}

-(void)setLy_fontSelected:(UIFont *)ly_fontSelected{
    [_maskView.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.titleLabel.font = ly_fontSelected;
    }];
}
@end
