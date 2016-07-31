//
//  LYGuideView.m
//  镂空demo
//
//  Created by apple on 16/7/31.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "LYGuideView.h"

@interface LYGuideView()
@property (nonatomic,strong) UIImageView *showImageView;
@end

@implementation LYGuideView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        UIView *contraint = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
        contraint.backgroundColor = [UIColor clearColor];
        contraint.clipsToBounds = YES;
        contraint.layer.cornerRadius = 100;
        contraint.userInteractionEnabled = YES;
        [self addSubview:contraint];
        
        _showImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.jpg"]];
        _showImageView.frame = CGRectMake(-100, -200, frame.size.width, frame.size.height);
        _showImageView.contentMode = UIViewContentModeScaleAspectFill;
        [contraint addSubview:_showImageView];

        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGR:)];
        [contraint addGestureRecognizer:pan];
    }
    return self;
}

-(void)panGR:(UIPanGestureRecognizer *)sender
{
    CGPoint point = [sender locationInView:sender.view.superview];
    sender.view.center = point;
    _showImageView.frame = CGRectMake(-sender.view.frame.origin.x, -sender.view.frame.origin.y, _showImageView.frame.size.width, _showImageView.frame.size.height);
}
@end
