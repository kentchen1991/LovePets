//
//  TestViewController.m
//  LovePets
//
//  Created by chenshaohai on 15/10/30.
//  Copyright (c) 2015年 zf. All rights reserved.
//

#import "TestViewController.h"
#import <libkern/OSAtomic.h>
@interface TestViewController ()

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(101, 100, 100, 30)];
    lab.text=@"横屏测试";
    [self.view addSubview:lab];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom]
    ;
    btn.frame=CGRectMake(40, 200, 200, 30);
    [btn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.backgroundColor =[UIColor yellowColor];
    [btn setTitle:@"返回" forState:0];
    self.view.backgroundColor =[UIColor whiteColor];
   
}

-(void)pop{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
