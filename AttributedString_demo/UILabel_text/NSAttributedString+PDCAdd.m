//
//  NSAttributedString+PDCAdd.m
//  UILabel_text
//
//  Created by KH on 16/6/22.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "NSAttributedString+PDCAdd.h"
@implementation NSAttributedString (PDCAdd)

+(instancetype )linkString:(NSString *)linkString
{
    return [NSAttributedString linkString:linkString range:NSMakeRange(0, linkString.length)];
}

+(instancetype )linkString:(NSString *)linkString range:(NSRange )range
{
    return [NSAttributedString linkString:linkString font:nil range:range];
}

+(instancetype )linkString:(NSString *)linkString font:(UIFont *)font range:(NSRange )range
{
    return [NSAttributedString linkString:linkString font:font color:nil range:range];
}

+(instancetype )linkString:(NSString *)linkString font:(UIFont *)font color:(UIColor *)color range:(NSRange )range
{
    return [NSAttributedString linkString:linkString font:font color:nil backgroundColor:nil range:range];
}

+(instancetype )linkString:(NSString *)linkString font:(UIFont *)font color:(UIColor *)color backgroundColor:(UIColor *)backgroundColor range:(NSRange )range
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (font){
        [dict setObject:font forKey:NSFontAttributeName];
    }
    if (color){
        [dict setObject:color forKey:NSForegroundColorAttributeName];
    }
    if (backgroundColor){
        [dict setObject:backgroundColor forKey:NSBackgroundColorAttributeName];
    }
    [dict setObject:@(range.length - range.location) forKey:NSLinkAttributeName];
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:linkString];
    [attr setAttributes:[dict copy] range:range];
    return [attr copy];
}

@end


@implementation NSMutableAttributedString (PDCAdd)
-(id )attribute:(NSString *)attrName{
    return [self attribute:attrName atIndex:0 effectiveRange:NULL];
};

//样式
-(void )setFont:(UIFont *)font{
    [self setFont:font range:NSMakeRange(0, self.length)];
}

-(UIFont *)font{
    return [self attribute:NSFontAttributeName];
}

-(void )setFont:(UIFont *)font range:(NSRange )range{
    if (font) {
        [self addAttribute:NSFontAttributeName value:font range:range];
    }
}

//字体颜色
-(UIColor *)color{
    return [self attribute:NSForegroundColorAttributeName];
}

-(void )setColor:(UIColor *)color{
    [self setColor:color range:NSMakeRange(0, self.length)];
}

-(void )setColor:(UIColor *)color range:(NSRange )range{
    if (color) {
        [self addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
}

//背景颜色
-(UIColor *)backgroundColor{
    return [self attribute:NSBackgroundColorAttributeName];
}

-(void )setBackgroundColor:(UIColor *)backgroundColor{
    [self setBackgroundColor:backgroundColor range:NSMakeRange(0, self.length)];
}

-(void )setBackgroundColor:(UIColor *)color range:(NSRange )range{
    if (color) {
        [self addAttribute:NSBackgroundColorAttributeName value:color range:range];
    }
}

//下滑线颜色
-(UIColor *)underlineColor{
    return [self attribute:NSUnderlineColorAttributeName];
};

-(void )setUnderlineColor:(UIColor *)underlineColor{
    [self setUnderlineColor:underlineColor range:NSMakeRange(0, self.length)];
};

-(void )setUnderlineColor:(UIColor *)color range:(NSRange )range{
    if (color) {
        [self addAttribute:NSUnderlineColorAttributeName value:color range:range];
    }
}

//删除线颜色
-(UIColor *)strikethroughColor{
    return [self attribute:NSStrikethroughColorAttributeName];
};

-(void )setStrikethroughColor:(UIColor *)strikethroughColor{
    [self setStrikethroughColor:strikethroughColor range:NSMakeRange(0, self.length)];
};

-(void )setStrikethroughColor:(UIColor *)color range:(NSRange )range{
    if (color) {
        [self addAttribute:NSStrikethroughColorAttributeName value:color range:range];
    }
}

/* float */
-(NSNumber *)ligature{
    return [self attribute:NSLigatureAttributeName];
};

-(void )setLigature:(NSNumber *)ligature{
    [self setLigature:ligature range:NSMakeRange(0, self.length)];
};

-(void )setLigature:(NSNumber *)value range:(NSRange )range{
    if (value) {
        [self addAttribute:NSLigatureAttributeName value:value range:range];
    }
}

//字体间距
-(NSNumber *)kern{
    return [self attribute:NSKernAttributeName];
};

-(void )setKern:(NSNumber *)kern{
    [self setKern:kern range:NSMakeRange(0, self.length)];
};

-(void )setKern:(NSNumber *)value range:(NSRange )range{
    if (value) {
        [self addAttribute:NSKernAttributeName value:value range:range];
    }
}

//字体粗细
-(NSNumber *)strokeWidth{
    return [self attribute:NSStrokeWidthAttributeName];
};

-(void )setStrokeWidth:(NSNumber *)strokeWidth{
    [self setStrokeWidth:strokeWidth range:NSMakeRange(0, self.length)];
};

-(void )setStrokeWidth:(NSNumber *)value range:(NSRange )range{
    if (value) {
        [self addAttribute:NSStrokeWidthAttributeName value:value range:range];
    }
}

//基线偏移
-(NSNumber *)baselineOffset{
    return [self attribute:NSBaselineOffsetAttributeName];
};

-(void )setBaselineOffset:(NSNumber *)baselineOffset{
    [self setBaselineOffset:baselineOffset range:NSMakeRange(0, self.length)];
};

-(void )setBaselineOffset:(NSNumber *)value range:(NSRange )range{
    if (value) {
        [self addAttribute:NSBaselineOffsetAttributeName value:value range:range];
    }
}

//斜体
-(NSNumber *)obliqueness{
    return [self attribute:NSObliquenessAttributeName];
};

-(void )setObliqueness:(NSNumber *)obliqueness{
    [self setObliqueness:obliqueness range:NSMakeRange(0, self.length)];
};

-(void )setObliqueness:(NSNumber *)value range:(NSRange )range{
    if (value) {
        [self addAttribute:NSObliquenessAttributeName value:value range:range];
    }
}

//膨胀
-(NSNumber *)expansion{
    return [self attribute:NSExpansionAttributeName];
};

-(void )setExpansion:(NSNumber *)expansion{
    [self setExpansion:expansion range:NSMakeRange(0, self.length)];
};

-(void )setExpansion:(NSNumber *)value range:(NSRange )range{
    if (value) {
        [self addAttribute:NSExpansionAttributeName value:value range:range];
    }
}

/* NSUnderlineStyle */
//删除线样式
-(NSUnderlineStyle )strikethroughStyle{
    return [[self attribute:NSStrikethroughStyleAttributeName] integerValue];
};

-(void )setStrikethroughStyle:(NSUnderlineStyle )strikethroughStyle{
    [self setStrikethroughStyle:strikethroughStyle range:NSMakeRange(0, self.length)];
};

-(void )setStrikethroughStyle:(NSUnderlineStyle )value range:(NSRange )range{
    if (value) {
        [self addAttribute:NSStrikethroughStyleAttributeName value:@(value) range:range];
    }
}

//下划线样式
-(NSUnderlineStyle )underlineStyle{
    return [[self attribute:NSUnderlineStyleAttributeName] integerValue];
};

-(void )setUnderlineStyle:(NSUnderlineStyle )underlineStyle{
    [self setUnderlineStyle:underlineStyle range:NSMakeRange(0, self.length)];
};

-(void )setUnderlineStyle:(NSUnderlineStyle )value range:(NSRange )range{
    if (value) {
        [self addAttribute:NSUnderlineStyleAttributeName value:@(value) range:range];
    }
}

//文字方向  0：水平 或 1：垂直
-(NSNumber *)verticalGlyph{
    return [self attribute:NSVerticalGlyphFormAttributeName];
};

-(void )setVerticalGlyph:(NSNumber *)verticalGlyph{
    [self setVerticalGlyph:verticalGlyph range:NSMakeRange(0, self.length)];
};

-(void )setVerticalGlyph:(NSNumber *)value range:(NSRange )range{
    if (value) {
        [self addAttribute:NSVerticalGlyphFormAttributeName value:value range:range];
    }
}

/**/
//阴影
-(NSShadow *)shadow{
    return [self attribute:NSShadowAttributeName];
};

-(void )setShadow:(NSShadow *)shadow{
    [self setShadow:shadow range:NSMakeRange(0, self.length)];
};

-(void )setShadow:(NSShadow *)value range:(NSRange )range{
    if (value) {
        [self addAttribute:NSShadowAttributeName value:value range:range];
    }
}

/* NSURL or NSString */
//下划线
-(id )link{
    return [self attribute:NSLinkAttributeName];
};

-(void )setLink:(id)link{
    [self setLink:link range:NSMakeRange(0, self.length)];
}

-(void )setLink:(id )value range:(NSRange )range{
    if (value) {
        [self addAttribute:NSLinkAttributeName value:value range:range];
    }
}
@end