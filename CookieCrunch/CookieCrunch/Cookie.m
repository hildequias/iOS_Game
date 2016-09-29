//
//  Cookie.m
//  CookieCrunch
//
//  Created by Rafael Baraldi on 9/26/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

#import "Cookie.h"

@implementation Cookie

- (NSString *) spriteName {
    static NSString *const spriteNames[] = {
        @"Croissant",
        @"Cupcake",
        @"Danish",
        @"Danish",
        @"Macaroon",
        @"SugarCookie"
    };
    
    return spriteNames[self.cookieType -1];
}

- (NSString *)highlightedSpriteName {
    static NSString * const highlightedSpriteNames[] = {
        @"Croissant-Highlighted",
        @"Cupcake-Highlighted",
        @"Danish-Highlighted",
        @"Donut-Highlighted",
        @"Macaroon-Highlighted",
        @"SugarCookie-Highlighted",
    };
    
    return highlightedSpriteNames[self.cookieType - 1];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"type:%ld square:(%ld,%ld)", (long)self.cookieType,
            (long)self.column, (long)self.row];
}

@end
