//
//  ViewController.m
//  封装选择图片和 调用系统相机
//
//  Created by Henry on 2017/9/20.
//  Copyright © 2017年 kmwl. All rights reserved.
//

#import "ViewController.h"
#import "XZCustomCamer.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController {
    XZCustomCamer *_camer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _camer = [XZCustomCamer new];
}
#pragma mark - 相册
- (IBAction)xiangji:(id)sender {
    
    [_camer pushPhotoAlbumcholoes:XZCustomCamerTypePhoto setPhotoBlock:^(UIImage *image) {
        _imageView.image = image;
    }];
}

#pragma mark - 相机
- (IBAction)xiangce:(id)sender {
    [_camer pushPhotoAlbumcholoes:XZCustomCamerTypeCamer setPhotoBlock:^(UIImage *image) {
        _imageView.image = image;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
