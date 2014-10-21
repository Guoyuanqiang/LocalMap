//
//  ViewController.m
//  LocalMap
//
//  Created by 郭远强 on 14-10-21.
//  Copyright (c) 2014年 郭远强. All rights reserved.
//

#import "ViewController.h"
#import "Util.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *gerture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:gerture];
    LOG(@"string");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)tapClick
{
    LOG(@"999999");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
