//
//  ViewController.m
//  图像滤镜
//
//  Created by 王奥东 on 16/11/10.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    orgImage = [UIImage imageNamed:@"1.jpg"];
    imageView.image = orgImage;
    items = @[@"Original",@"CILinearToSRGBToneCurve",@"CIPhotoEffectChrome",@"CIPhotoEffectFade",@"CIPhotoEffectInstant",@"CIPhotoEffectMono",@"CIPhotoEffectNoir",@"CIPhotoEffectProcess",@"CIPhotoEffectTonal",@"CIPhotoEffectTransfer",@"CISRGBToneCurveToLinear",@"CIVignetteEffect"];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return items.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return items[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    if (row == 0) {
        imageView.image = orgImage;
        return;
    }
    
    //实例化图片与过滤器
    CIImage *ciImage = [[CIImage alloc]initWithImage:orgImage];
    CIFilter *filter = [CIFilter filterWithName:items[row] keysAndValues:kCIInputImageKey,ciImage, nil];

    //设置过滤器中所有的输入值为默认值
    [filter setDefaults];
    CIContext *context = [CIContext contextWithOptions:nil];
    //得到过滤后的图片
    CIImage *outputImage = [filter outputImage];
    CGImageRef cgImage = [context createCGImage:outputImage fromRect:[outputImage extent]];
    imageView.image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
}






@end
