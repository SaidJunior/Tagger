//
//  Controller.m
//  VGTagger
//
//  Created by Bilal Syed Hussain on 05/07/2011.
//  Copyright 2011 St. Andrews KY16 9XW. All rights reserved.
//

#import "MainController.h"
#import "TagsLib.h"
#import "VgmdbController.h"
#import "DisplayController.h"

@implementation MainController

@synthesize title, window, vgc, ssc;


#pragma mark -
#pragma mark Gui Callback

- (IBAction) getData:(id)sender
{
	TagsLib *tl  = [[TagsLib alloc] initWithFilename:@"/Users/bilalh/Programming/Cocoa/VGTagger/Test Files/aac.m4a"];
	
	NSString *s  = [tl getTitle];
	NSLog(@"Title is %@", s);
	[title setStringValue:s];
}

- (IBAction)onTextChange:(id)sender
{
	NSString *s = [sender stringValue] ;
	NSLog(@"Text is Now %@", s );
	if (s != @""){
		TagsLib *tl  = [[TagsLib alloc] initWithFilename:@"/Users/bilalh/Programming/Cocoa/VGTagger/Test Files/aac.m4a"];
		[tl setTitle:s];
	}
	
}

- (IBAction) search:(id)sender{
	if (vgc == nil){
		vgc = [[VgmdbController alloc] init];	
	}else{
		[vgc reset];	
	}
	
	[NSApp beginSheet: [vgc window]
	   modalForWindow: self.window
		modalDelegate: vgc 
	   didEndSelector: @selector(didEndSheet:returnCode:mainWindow:)
		  contextInfo: self.window]; 	
}

#pragma mark -
#pragma mark Alloc

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
	
    return self;
}


- (void)dealloc
{
    [super dealloc];
}


@end