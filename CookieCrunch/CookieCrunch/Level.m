//
//  Level.m
//  CookieCrunch
//
//  Created by Rafael Baraldi on 9/26/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

#import "Level.h"

@implementation Level {
    Cookie *_cookies[NumColumns][NumRows];
    Tile *_tiles[NumColumns][NumRows];
}

- (NSSet *) shuffle {
    
    return [self createInitialCookies];
}

- (instancetype) initWithFile:(NSString *)filename {
    self = [super init];
    if (self != nil) {
        NSDictionary *dictionary = [self loadJSON:filename];
        
        // Loop through the rows
        [dictionary[@"tiles"] enumerateObjectsUsingBlock:^(NSArray *array, NSUInteger row, BOOL *stop){
            
            // Loop through the columns in the current row
            [array enumerateObjectsUsingBlock:^(NSNumber *value, NSUInteger column, BOOL *stop){
               
                // Note: In Sprite Kit (0,0) is at the bottom of the screen,
                // so we need to read this file upside down.
                NSInteger tileRow = NumRows - row -1;
                
                // If the value is 1, create a tile object.
                if([value integerValue] == 1) {
                    _tiles[column][tileRow] = [[Tile alloc] init];
                }
            }];
        }];
    }
    return self;
}

- (Tile *)tileAtColumn:(NSInteger)column row:(NSInteger)row {
    NSAssert1(column >= 0 && column < NumColumns, @"Invalid column: %ld", (long)column);
    NSAssert1(row >= 0 && row < NumRows, @"Invalid row: %ld", (long)row);
    
    return _tiles[column][row];
}

- (Cookie *) cookieAtColumn:(NSInteger) column row:(NSInteger) row {
    NSAssert1(column >=0 && column < NumColumns, @"Invalid column: %ld", (long) column);
    NSAssert1(row >=0 && row < NumRows, @"Invalid row: %ld", (long) row);
    
    return _cookies[column][row];
}

- (NSSet *) createInitialCookies {
    
    NSMutableSet *set = [NSMutableSet set];
    
    //1
    for(NSInteger row = 0; row < NumRows; row++) {
        for (NSInteger column=0; column < NumColumns; column++) {
            
            if (_tiles[column][row] != nil) {
            
                //2
                NSUInteger cookieType = arc4random_uniform(NumCookieTypes) +1;
                
                //3
                Cookie *cookie = [self createCookieAtColumn:column row:row withType:cookieType];
                
                //4
                [set addObject:cookie];
            }
        }
    }
    return set;
}

- (Cookie *)createCookieAtColumn:(NSInteger)column row:(NSInteger)row withType:(NSUInteger)cookieType {
    
    Cookie *cookie = [[Cookie alloc] init];
    cookie.cookieType = cookieType;
    cookie.column = column;
    cookie.row = row;
    _cookies[column][row] = cookie;
    return cookie;
}

- (NSDictionary *)loadJSON:(NSString *)filename {
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@"json"];
    if (path == nil) {
        NSLog(@"Could not find level file: %@", filename);
        return nil;
    }
    
    NSError *error;
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    if (data == nil) {
        NSLog(@"Could not load level file: %@, error: %@", filename, error);
        return nil;
    }
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (dictionary == nil || ![dictionary isKindOfClass:[NSDictionary class]]) {
        NSLog(@"Level file '%@' is not valid JSON: %@", filename, error);
        return nil;
    }
    
    return dictionary;
}

@end
