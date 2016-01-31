//
//  ViewController.m
//  AFNetworking3.0
//
//  Created by 安其拉 on 16/1/30.
//  Copyright © 2016年 CK_chan. All rights reserved.
//

#import "ViewController.h"

#import "AFHTTPClient.h"
#import "UIImageView+AFNetworking.h"    //UIImageView加载图片

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[AFHTTPClient shareInstance] startRequestMethod:POST parameters:nil url:@"http://donghuahang.test.jingkaigz.com/index.php?s=/api/Indexlogistics/index" success:^(id responseObject) {
        NSLog(@"%@", responseObject);
    }];
    
    
    //UIImageView加载图片
    UIImageView *img = [[UIImageView alloc]init];
    img.frame = CGRectMake(10, 20, self.view.frame.size.width - 20, 100);
    [self.view addSubview:img];
    [img setImageWithURL:[NSURL URLWithString:@"http://static.oschina.net/uploads/img/201203/24233432_EmSY.png"] placeholderImage:[UIImage imageNamed:@"next"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
