//
//  NSMutableDictionary+Safe.h
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Safe)
- (void)safeSetObject:(id)obj forKey:(id<NSCopying>)key;
@end
