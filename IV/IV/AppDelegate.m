//
//  AppDelegate.m
//  IV
//
//  Created by Ethan Reesor on 8/31/12.
//  Copyright (c) 2012 Ethan Reesor. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize shelltext;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	
}

- (void)data:(NSString *)data {
	[shelltext setStringValue:[[shelltext stringValue] stringByAppendingString:data]];
}

@end
