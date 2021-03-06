//
//  GXDefine.h
//  自定义宏
//
//  Created by gaocaixin on 15/4/11.
//
//



#ifdef __OBJC__

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
// 分类
#import "UIImage+CXImage.h"

// 判读是否是ios7
#define iOS7   ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
// 自定义log
#ifdef DEBUG
#define CXLog(...) NSLog(__VA_ARGS__)
#else
#define CXLog(...)
#endif
// 宽度
#define CGW(rect)               rect.size.width
#define CGH(rect)               rect.size.height
#define CGX(rect)               rect.origin.x
#define CGY(rect)               rect.origin.y

#define HEIGHT_NAV              44
#define HEIGHT_STA              20
#define HEIGHT_TOOLBAR          49


#define NickNameFont 15
#define TimeLabelFont 12

#define kScreenWidth [[UIScreen mainScreen]bounds].size.width
#define kScreenHeight [[UIScreen mainScreen]bounds].size.height

#endif