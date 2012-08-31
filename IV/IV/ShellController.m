//
//  ShellController.m
//  IV
//
//  Created by Ethan Reesor on 8/31/12.
//  Copyright (c) 2012 Ethan Reesor. All rights reserved.
//

#import "ShellController.h"

@implementation ShellController

@synthesize delegate;

#pragma mark Lifecycle Methods

- (id) init {
	if (self = [super init]) {
		shell = [[NSTask alloc] init];
		[shell setLaunchPath:@"/bin/ls"];
		[shell setArguments:[NSArray arrayWithObject:@"/"]];
//		[shell setLaunchPath:[NSString stringWithCString:getenv("SHELL") encoding:NSASCIIStringEncoding]];
		
		NSPipe *outp = [NSPipe pipe];
		[shell setStandardOutput:outp];
		[shell setStandardError:outp];
		NSFileHandle *froms = [outp fileHandleForReading];
		[froms waitForDataInBackgroundAndNotify];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataAvailable:) name:NSFileHandleDataAvailableNotification object:nil];
		
		NSPipe *inp = [NSPipe pipe];
		[shell setStandardInput:inp];
		
		[shell launch];
	}
	return self;
}

- (void) dealloc {
	if ([shell isRunning])
		[shell terminate];
	[shell release];
	[super dealloc];
}

#pragma mark Notification Methods

- (void) dataAvailable:(NSNotification *)notification {
	NSData *data = [[notification object] readDataToEndOfFile];
	NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	if (delegate)
		[delegate data:[NSString stringWithString:string]];
	[string release];
};

@end
