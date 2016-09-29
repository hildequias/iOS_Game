//
//  Level.h
//  CookieCrunch
//
//  Created by Rafael Baraldi on 9/26/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

#import "Cookie.h"
#import "Tile.h"

static const NSInteger NumColumns   = 9;
static const NSInteger NumRows      = 9;

@interface Level : NSObject

- (NSSet *) shuffle;
- (Cookie *) cookieAtColumn:(NSInteger) column row:(NSInteger) row;
- (instancetype) initWithFile:(NSString *) filename;
- (Tile *) tileAtColumn:(NSInteger) column row:(NSInteger) row;

@end
