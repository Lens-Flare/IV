//
//  AppDelegate.h
//  IV
//
//  Created by Ethan Reesor on 8/31/12.
//  Copyright (c) 2012 Ethan Reesor. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ShellController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, ShellDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *shelltext;

@end
