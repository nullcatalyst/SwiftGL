//
//  GLView.m
//  SwiftGL-Demo
//
//  Created by Scott Bennett on 2014-06-09.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

#import "GLView.h"

// Import the Swift classes
#import "SwiftGL_Demo_OSX-Swift.h"

@implementation GLView

- (CVReturn) getFrameForTime:(const CVTimeStamp *)outputTime {
    // There is no autorelease pool when this method is called
    // because it will be called from a background thread.
    // It's important to create one or app can leak objects.
    @autoreleasepool {
        [self drawView];
    }
    
    return kCVReturnSuccess;
}

// This is the renderer output callback function
static CVReturn displayLinkCallback(CVDisplayLinkRef displayLink, const CVTimeStamp *now, const CVTimeStamp *outputTime, CVOptionFlags flagsIn, CVOptionFlags *flagsOut, void *displayLinkContext) {
    CVReturn result = [(__bridge GLView *) displayLinkContext getFrameForTime:outputTime];
    return result;
}

- (void) prepareOpenGL {
    [super prepareOpenGL];
    
    // Make all the OpenGL calls to setup rendering
    //  and build the necessary rendering objects
    [self initGL];
    
    // Create a display link capable of being used with all active displays
    CVDisplayLinkCreateWithActiveCGDisplays(&_displayLink);
    
    // Set the renderer output callback function
    CVDisplayLinkSetOutputCallback(_displayLink, &displayLinkCallback, (__bridge void *) self);
    
    // Set the display link for the current renderer
    CGLContextObj cglContext = (CGLContextObj) self.openGLContext.CGLContextObj;
    CGLPixelFormatObj cglPixelFormat = (CGLPixelFormatObj) self.pixelFormat.CGLPixelFormatObj;
    CVDisplayLinkSetCurrentCGDisplayFromOpenGLContext(_displayLink, cglContext, cglPixelFormat);
    
    
    // Change the working directory so that we can use C code to grab resource files
    [NSFileManager.defaultManager changeCurrentDirectoryPath:NSBundle.mainBundle.resourcePath];
    [Engine initialize];
    
    // Activate the display link
    CVDisplayLinkStart(_displayLink);
    
    // Register to be notified when the window closes so we can stop the displaylink
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(windowWillClose:) name:NSWindowWillCloseNotification object:self.window];
}

- (void) initGL {
    // The reshape function may have changed the thread to which our OpenGL
    // context is attached before prepareOpenGL and initGL are called.  So call
    // makeCurrentContext to ensure that our OpenGL context current to this
    // thread (i.e. makeCurrentContext directs all OpenGL calls on this thread
    // to [self openGLContext])
    [self.openGLContext makeCurrentContext];
    
    // Synchronize buffer swaps with vertical refresh rate
    GLint swapInt = 1;
    [self.openGLContext setValues:&swapInt forParameter:NSOpenGLCPSwapInterval];
}

- (void) reshape {
    [super reshape];
    
    // We draw on a secondary thread through the display link. However, when
    // resizing the view, -drawRect is called on the main thread.
    // Add a mutex around to avoid the threads accessing the context
    // simultaneously when resizing.
    CGLLockContext((CGLContextObj) self.openGLContext.CGLContextObj);
    
    // Get the view size in Points
    NSRect viewRectPoints = self.bounds;
    
    // Rendering at retina resolutions will reduce aliasing, but at the potential
    // cost of framerate and battery life due to the GPU needing to render more
    // pixels.
    
    // Any calculations the renderer does which use pixel dimentions, must be
    // in "retina" space.  [NSView convertRectToBacking] converts point sizes
    // to pixel sizes.  Thus the renderer gets the size in pixels, not points,
    // so that it can set it's viewport and perform and other pixel based
    // calculations appropriately.
    // viewRectPixels will be larger (2x) than viewRectPoints for retina displays.
    // viewRectPixels will be the same as viewRectPoints for non-retina displays
    NSRect viewRectPixels = [self convertRectToBacking:viewRectPoints];
    
    // Set the new dimensions in our renderer
    [Engine resizeWithWidth:viewRectPixels.size.width height:viewRectPixels.size.height];
    
    CGLUnlockContext((CGLContextObj) self.openGLContext.CGLContextObj);
}

- (void) renewGState {
    // Called whenever graphics state updated (such as window resize)
    
    // OpenGL rendering is not synchronous with other rendering on the OSX.
    // Therefore, call disableScreenUpdatesUntilFlush so the window server
    // doesn't render non-OpenGL content in the window asynchronously from
    // OpenGL content, which could cause flickering.  (non-OpenGL content
    // includes the title bar and drawing done by the app with other APIs)
    [self.window disableScreenUpdatesUntilFlush];
    
    [super renewGState];
}

- (void) dealloc {
    // Stop the display link BEFORE releasing anything in the view
    // otherwise the display link thread may call into the view and crash
    // when it encounters something that has been release
    CVDisplayLinkStop(_displayLink);
    CVDisplayLinkRelease(_displayLink);
    
    // Release the renderer AFTER display link has been released
    [Engine finalize];
}

@end
