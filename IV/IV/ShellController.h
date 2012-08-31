//
//  ShellController.h
//  IV
//
//  Created by Ethan Reesor on 8/31/12.
//  Copyright (c) 2012 Ethan Reesor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <strings.h>

@class AppDelegate;

@protocol ShellDelegate <NSObject>

- (void) data:(NSString *)data;

@end

@interface ShellController : NSObject {
	NSTask *shell;
	AppDelegate *delegate;
}

@property (assign) IBOutlet AppDelegate *delegate;

@end
