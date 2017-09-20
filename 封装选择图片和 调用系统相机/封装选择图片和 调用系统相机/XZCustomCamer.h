//
//  XZCustomCamer.h
//  封装选择图片和 调用系统相机
//
//  Created by Henry on 2017/9/20.
//  Copyright © 2017年 kmwl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    // 相册
    XZCustomCamerTypePhoto,
    // 相机
    XZCustomCamerTypeCamer
} XZCustomCamerType;

typedef void (^PhotoBlock)(UIImage *image);

@interface XZCustomCamer : NSObject

/* 回调照片 **/
@property (nonatomic, copy, readonly) PhotoBlock photoBlock;;

/* 0.调用相册
   1.调用相机
   block: 选择相片的Image. 
 **/
- (void)pushPhotoAlbumcholoes:(XZCustomCamerType)type setPhotoBlock:(PhotoBlock)block;

@end
