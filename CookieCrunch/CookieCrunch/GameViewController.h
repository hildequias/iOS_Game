//
//  GameViewController.h
//  CookieCrunch
//
//  Created by Rafael Baraldi on 9/26/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>
#import "Level.h"
#import "GameScene.h"

@interface GameViewController : UIViewController

@property (strong, nonatomic) Level *level;
@property (strong, nonatomic) GameScene *scene;

@end
