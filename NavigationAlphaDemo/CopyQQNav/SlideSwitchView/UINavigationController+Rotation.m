//
//  UINavigationController+Rotation.h
//  CopyQQNav
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 PersonLiu. All rights reserved.
//

#import "UINavigationController+Rotation.h"

static CGFloat kEndPoint = 1.5;

@implementation UINavigationController (Rotation)

- (BOOL)shouldAutorotate
{
    return [self.topViewController shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

#pragma mark - NavigationBar Color

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor)
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    CGPoint startPoint = CGPointMake(rect.size.width/2, 0);
    CGPoint endPoint = CGPointMake(rect.size.width/2, rect.size.height/kEndPoint);
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextSetStrokeColorWithColor(context, [[UIColor clearColor] CGColor]);
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)imageWithGradients:(NSArray *)colours
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor * beginColor = [colours objectAtIndex:0];
    UIColor * endColor = [colours objectAtIndex:1];
    drawLinearGradient(context, rect, beginColor.CGColor, endColor.CGColor);
    CGContextRestoreGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)setNavigationBarWithColor:(UIColor *)color
{
    if(color == nil) {
        [self.navigationBar setBarTintColor:[UIColor magentaColor]];
        [self.navigationBar setTranslucent:NO];
        [self.navigationBar setShadowImage:nil];
        [self.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    } else {
        UIImage *image = [self imageWithColor:color];
        
        [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setBarStyle:UIBarStyleDefault];
        [self.navigationBar setShadowImage:[UIImage new]];
        [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
        [self.navigationBar setTintColor:[UIColor whiteColor]];
        [self.navigationBar setTranslucent:YES];
    }
}

-(void)setNavigationBarWithColors:(NSArray *)colours
{
    UIImage *image = [self imageWithGradients:colours];
    
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setBarStyle:UIBarStyleDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationBar setTranslucent:YES];
}
@end
