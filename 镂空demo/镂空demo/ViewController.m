//
//  ViewController.m
//  镂空demo
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "ViewController.h"
#import "LYHollowLabel.h"
#import "LYSegment.h"
#import "LYGuideView.h"

@interface ViewController ()
@property (nonatomic,weak)LYHollowLabel *customLabel;
@property (nonatomic,weak)LYHollowLabel *customLabel2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    LYHollowLabel *customLabel = [[LYHollowLabel alloc]initWithFrame:CGRectMake(30, 300, 200, 50) type:LYHollowTypeOther];
    customLabel.textString = @"这是一段镂空的文字";
    customLabel.backcgroundColor = [UIColor whiteColor];
    customLabel.maskColor = [UIColor redColor];
    customLabel.lyTextAlignment = LYHollowTextAlignmentCenter;
    customLabel.fontValue = 20;
    [customLabel setMaskBackgroundView:[UIColor blueColor] maskColor:[UIColor grayColor]];
    customLabel.maskWidth = 50;
    [self.view addSubview:customLabel];
    _customLabel = customLabel;
    
    
    
    LYHollowLabel *customLabel2 = [[LYHollowLabel alloc]initWithFrame:CGRectMake(30, 200, 200, 50) type:LYHollowTypeSingle];
    customLabel2.textString = @"这是一段镂空的文字";
    customLabel2.backcgroundColor = [UIColor whiteColor];
    customLabel2.maskColor = [UIColor redColor];
    customLabel2.lyTextAlignment = LYHollowTextAlignmentCenter;
    customLabel2.fontValue = 20;
    [self.view addSubview:customLabel2];
    _customLabel2 = customLabel2;
    
    LYSegment *seg = [[LYSegment alloc]initWithFrame:CGRectMake(30, 100, 200, 50) segments:@[@"One",@"Two",@"Three",@"Four"]];
    [self.view addSubview:seg];
    seg.ly_textColorNormal = [UIColor blueColor];
    seg.ly_textColorSelected = [UIColor yellowColor];
    seg.ly_backgroundColor = [UIColor greenColor];
    seg.ly_fontNormal = [UIFont systemFontOfSize:13];
    seg.ly_fontSelected = [UIFont systemFontOfSize:18];
    seg.segmentIndex = ^(NSInteger Index){
        NSLog(@"%ld",(long)Index);
    };
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(100, 400, 200, 30)];
    slider.minimumValue = 0;
    slider.maximumValue = 1;
    slider.value = 0;
    [slider addTarget:self action:@selector(changeEvent:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
//    LYGuideView *guideView = [[LYGuideView alloc]initWithFrame:self.view.bounds];
//    [self.view addSubview:guideView];
}

-(void)changeEvent:(UISlider *)slider
{
    _customLabel.progress = slider.value;
    _customLabel2.progress = slider.value;
}

@end
