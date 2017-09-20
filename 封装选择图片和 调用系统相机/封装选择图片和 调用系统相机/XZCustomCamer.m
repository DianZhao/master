//
//  XZCustomCamer.m
//  封装选择图片和 调用系统相机
//
//  Created by Henry on 2017/9/20.
//  Copyright © 2017年 kmwl. All rights reserved.
//

#import "XZCustomCamer.h"

@interface XZCustomCamer ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation XZCustomCamer {
    UIImagePickerController *_imagePickerVC;
}

- (void)pushPhotoAlbumcholoes:(XZCustomCamerType)type setPhotoBlock:(PhotoBlock)block {
    
    _imagePickerVC = [[UIImagePickerController alloc] init];
    _imagePickerVC.delegate = self;
    _imagePickerVC.allowsEditing = YES;
    if (type == 0) {
        _imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    } else {
        _imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:_imagePickerVC animated:YES completion:nil];
    _photoBlock = [block copy];
}

// 选择图片成功调用此方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // dismiss UIImagePickerController
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:^{
        
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            UIImage *image = info[UIImagePickerControllerOriginalImage];
            if (_photoBlock) {
                _photoBlock(image);
            }
        } else {
            UIImage *image = info[UIImagePickerControllerOriginalImage];
            if (_photoBlock) {
                _photoBlock(image);
            }
        }
        NSLog(@"%@", info);
    }];
}



@end
