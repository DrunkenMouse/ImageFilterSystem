//
//  ViewController.h
//  图像滤镜
//
//  Created by 王奥东 on 16/11/10.
//  Copyright © 2016年 王奥东. All rights reserved.
//  参考： 实战宝典 进阶篇

#import <UIKit/UIKit.h>

/**
    要实现滤镜效果需要四个步骤:
    1.存储图片数据所用的CIImage
    2.对图片数据处理用的CIContext
    3.图片的滤镜CIFilter
    [CIFilter filterWithName:items[row] keysAndValues:kCIInputImageKey,ciImage, nil];
    其中name为滤镜的名称，keysAndValues是滤镜的建和值
    4.输出滤镜[filter outputImage]
    而后将CGImage转换成UIImage使用
 
 */


@interface ViewController : UIViewController{
    
   IBOutlet UIImageView *imageView;
    UIImage *orgImage;
    NSArray *items;

}

@end

