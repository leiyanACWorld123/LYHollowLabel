//
//  LYHollowLabel.h
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,LYHollowTextAlignment){
    LYHollowTextAlignmentLeft   = 0,
    LYHollowTextAlignmentCenter = 1,
    LYHollowTextAlignmentRight  = 2
};
typedef NS_ENUM(NSInteger,LYHollowType){
    LYHollowTypeSingle,//逐渐渲染
    LYHollowTypeOther//只渲染一部分
};
@interface LYHollowLabel : UIView


/**
 *  模式
 */
@property (nonatomic,assign) LYHollowType type;


/**
 *  文字内容
 */
@property (nonatomic,copy) NSString *textString;

/**
 *  字体大小
 */
@property (nonatomic,assign) CGFloat  fontValue;

/**
 *  文字位置
 */
@property (nonatomic,assign) LYHollowTextAlignment lyTextAlignment;

/**
 *  字体背景色
 */
@property (nonatomic,strong) UIColor *backcgroundColor;

/**
 *  字体渲染色
 */
@property (nonatomic,strong) UIColor *maskColor;

/**
 *  渲染进度（0～1）
 */
@property (nonatomic,assign) CGFloat progress;

/************************Other只渲染一部分模式******************************/
/**
 *  这部分的宽度
 */
@property (nonatomic,assign) CGFloat maskWidth;
/**
 *  背景色，渲染背景色
 *
 *  @param backgroundColor 背景色
 *  @param maskColor       渲染背景色
 */
-(void)setMaskBackgroundView:(UIColor *)backgroundColor maskColor:(UIColor *)maskColor;




/**
 *  初始化方法
 *
 *  @param frame 位置
 *  @param type  类型
 *
 *  @return <#return value description#>
 */
-(instancetype)initWithFrame:(CGRect)frame type:(LYHollowType)type;
@end
