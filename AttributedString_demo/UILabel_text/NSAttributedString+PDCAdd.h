//
//  NSAttributedString+PDCAdd.h
//  UILabel_text
//
//  Created by KH on 16/6/22.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface NSAttributedString (PDCAdd)
/**
 *  带下划线的字符串
 */
+(instancetype )linkString:(NSString *)linkString;
+(instancetype )linkString:(NSString *)linkString range:(NSRange )range;
+(instancetype )linkString:(NSString *)linkString font:(UIFont *)font range:(NSRange )range;
+(instancetype )linkString:(NSString *)linkString font:(UIFont *)font color:(UIColor *)color range:(NSRange )range;
+(instancetype )linkString:(NSString *)linkString font:(UIFont *)font color:(UIColor *)color backgroundColor:(UIColor *)backgroundColor range:(NSRange )range;

@end

@interface NSMutableAttributedString (PDCAdd)
//样式
@property (nonatomic, strong) UIFont *font;
-(void )setFont:(UIFont *)font range:(NSRange )range;

//字体颜色
@property (nonatomic, strong) UIColor *color;
-(void )setColor:(UIColor *)color range:(NSRange )range;

//背景颜色
@property (nonatomic, strong) UIColor *backgroundColor;
-(void )setBackgroundColor:(UIColor *)color range:(NSRange )range;

//下滑线颜色
@property (nonatomic, strong) UIColor *underlineColor;
-(void )setUnderlineColor:(UIColor *)color range:(NSRange )range;

//删除线颜色
@property (nonatomic, strong) UIColor *strikethroughColor;
-(void )setStrikethroughColor:(UIColor *)color range:(NSRange )range;

/* NSURL or NSString */
//下划线
@property (nonatomic, strong) id link;
-(void )setLink:(id )value range:(NSRange )range;

/* float */
//连体字体
@property (nonatomic, strong) NSNumber *ligature;
-(void )setLigature:(NSNumber *)value range:(NSRange )range;

//字体间距
@property (nonatomic, strong) NSNumber *kern;
-(void )setKern:(NSNumber *)value range:(NSRange )range;

//字体粗细
@property (nonatomic, strong) NSNumber *strokeWidth;
-(void )setStrokeWidth:(NSNumber *)value range:(NSRange )range;

//基线偏移
@property (nonatomic, strong) NSNumber *baselineOffset;
-(void )setBaselineOffset:(NSNumber *)value range:(NSRange )range;

//斜体
@property (nonatomic, strong) NSNumber *obliqueness;
-(void )setObliqueness:(NSNumber *)value range:(NSRange )range;

//膨胀
@property (nonatomic, strong) NSNumber *expansion;
-(void )setExpansion:(NSNumber *)value range:(NSRange )range;

/* NSUnderlineStyle */
//删除线样式
@property (nonatomic, assign) NSUnderlineStyle strikethroughStyle;
-(void )setStrikethroughStyle:(NSUnderlineStyle )style range:(NSRange )range;

//下划线样式
@property (nonatomic, assign) NSUnderlineStyle underlineStyle;
-(void )setUnderlineStyle:(NSUnderlineStyle )style range:(NSRange )range;

//文字方向  0：水平 或 1：垂直
@property (nonatomic, strong) NSNumber *verticalGlyph;
-(void )setVerticalGlyph:(NSNumber *)value range:(NSRange )range;

//阴影
@property (nonatomic, strong) NSShadow *shadow;
-(void )setShadow:(NSShadow *)value range:(NSRange )range;

@end