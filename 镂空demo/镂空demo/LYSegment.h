//
//  LYSegment.h
//  镂空demo
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^clickSegment)();

@interface LYSegment : UIView



/**
 *  普通状态下，字体颜色
 */
@property (nonatomic,strong) UIColor *ly_textColorNormal;

/**
 *  普通状态下，字体
 */
@property (nonatomic,strong) UIFont *ly_fontNormal;

/**
 *  选中状态下，字体颜色
 */
@property (nonatomic,strong) UIColor *ly_textColorSelected;
/**
 *  选中状态下，背景色
 */
@property (nonatomic,strong) UIColor *ly_backgroundColor;
/**
 *  选中状态下，字体
 */
@property (nonatomic,strong) UIFont *ly_fontSelected;


/**
 *  选中第几个，利用block回调
 */
@property (nonatomic,assign) clickSegment segmentIndex;



/**
 *  初始化自定义segment
 *
 *  @param frame    位置大小
 *  @param segments 数组，用于显示标题，以及标题个数
 *
 *  @return LYSegment
 */
-(instancetype)initWithFrame:(CGRect)frame segments:(NSArray *)segments;


@end
