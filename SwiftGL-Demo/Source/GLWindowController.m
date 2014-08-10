//
//  GLWindowController.m
//  SwiftGL-Demo
//
//  Created by Scott Bennett on 2014-06-09.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

#import "SwiftGL_Demo-Swift.h"

@implementation GLWindowController (Keyboard)

- (void) keyDown:(NSEvent *)event {
    unichar c = [[event charactersIgnoringModifiers] characterAtIndex:0];
    
    switch (c) {
            // Handle [ESC] key
        case 27:
            if (self.fullscreenWindow == nil) {
                exit(EXIT_SUCCESS);
            } else {
                [self goWindow];
            }
            return;
            
            // Have f key toggle fullscreen
        case 'f':
            if (self.fullscreenWindow == nil) {
                [self goFullscreen];
            } else {
                [self goWindow];
            }
            return;
    }
    
    // Allow other character to be handled (or not and beep)
    [super keyDown:event];
}

@end
