//
//  GameScene.h
//  CookieCrunch
//
//  Created by Rafael Baraldi on 9/26/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Level.h"

static const CGFloat TileWidth  = 32.0;
static const CGFloat TileHeight = 36.0;

@interface GameScene : SKScene

@property (strong, nonatomic) SKNode *gameLayer;
@property (strong, nonatomic) SKNode *cookiesLayer;
@property (strong, nonatomic) Level *level;
@property (strong, nonatomic) SKNode *tilesLayer;

@property (assign, nonatomic) NSInteger swipeFromColumn;
@property (assign, nonatomic) NSInteger swipeFromRow;

- (void) addSpritesForCookies:(NSSet *) cookies;
- (void)addTiles;

@end
