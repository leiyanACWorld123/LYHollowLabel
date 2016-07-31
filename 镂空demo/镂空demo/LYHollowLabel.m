//
//  LYHollowLabel.m
//  镂空demo
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "LYHollowLabel.h"

@interface LYHollowLabel()
{
    CGFloat _WIDTH;
}
@property (nonatomic,strong) UILabel *hollowLabel;

@property (nonatomic,strong) UIView  *clipView;

@property (nonatomic,strong) UILabel *maskLabel;

@end



@implementation LYHollowLabel

-(instancetype)initWithFrame:(CGRect)frame type:(LYHollowType)type{
    if(self = [super initWithFrame:frame]){
        _WIDTH = frame.size.width;
        _type  = type;
        
        //底层label
        _hollowLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _hollowLabel.textColor = [UIColor whiteColor];
        [self addSubview:_hollowLabel];
        
        //镂空视图
        _clipView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, frame.size.height)];
        _clipView.backgroundColor = [UIColor clearColor];
        _clipView.clipsToBounds = YES;
        [self addSubview:_clipView];
        
        //镂空渲染视图
        _maskLabel = [[UILabel alloc]initWithFrame:_hollowLabel.frame];
        _maskLabel.textColor = [UIColor redColor];
        [_clipView addSubview:_maskLabel];
    }
    return self;
}


-(void)setTextString:(NSString *)textString{
    _textString = textString;
    _hollowLabel.text = textString;
    _maskLabel.text = textString;
}

-(void)setFontValue:(CGFloat)fontValue{
    _fontValue = fontValue;
    _hollowLabel.font = [UIFont systemFontOfSize:fontValue];
    _maskLabel.font = [UIFont systemFontOfSize:fontValue];
}

-(void)setLyTextAlignment:(LYHollowTextAlignment)lyTextAlignment{
    switch (lyTextAlignment) {
        case LYHollowTextAlignmentLeft:
            _hollowLabel.textAlignment = NSTextAlignmentLeft;
            _maskLabel.textAlignment = NSTextAlignmentLeft;
            break;
        case LYHollowTextAlignmentCenter:
            _hollowLabel.textAlignment = NSTextAlignmentCenter;
            _maskLabel.textAlignment = NSTextAlignmentCenter;
            break;
        case LYHollowTextAlignmentRight:
            _hollowLabel.textAlignment = NSTextAlignmentRight;
            _maskLabel.textAlignment = NSTextAlignmentRight;
            break;
        default:
            break;
    }
}

-(void)setBackcgroundColor:(UIColor *)backcgroundColor{
    _hollowLabel.textColor = backcgroundColor;
}
-(void)setMaskColor:(UIColor *)maskColor{
    _maskLabel.textColor = maskColor;
}
-(void)setProgress:(CGFloat)progress{
    switch (_type) {
        case LYHollowTypeSingle:
            _clipView.frame = CGRectMake(0, 0, _WIDTH*progress, _clipView.frame.size.height);
            break;
        case LYHollowTypeOther:
            _clipView.frame = CGRectMake(progress*(_WIDTH-_maskWidth), 0,  _clipView.frame.size.width, _clipView.frame.size.height);
            _maskLabel.frame = CGRectMake(-progress*(_WIDTH-_maskWidth), 0, _maskLabel.frame.size.width, _maskLabel.frame.size.height);
            break;
            
        default:
            break;
    }
}
-(void)setMaskBackgroundView:(UIColor *)backgroundColor maskColor:(UIColor *)maskColor
{
    _hollowLabel.backgroundColor = backgroundColor;
    _maskLabel.backgroundColor = maskColor;
}

-(void)setMaskWidth:(CGFloat)maskWidth{
    _maskWidth = maskWidth;
    _clipView.frame = CGRectMake(0, 0, maskWidth, _clipView.frame.size.height);
}

@end
