//
//  GLView.swift
//  SwiftGL-Demo
//
//  Created by Scott Bennett on 2014-07-12.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Foundation

extension GLView {
//    deinit {
//        // Stop the display link BEFORE releasing anything in the view
//        // otherwise the display link thread may call into the view and crash
//        // when it encounters something that has been release
//        CVDisplayLinkStop(displayLink)
//        CVDisplayLinkRelease(displayLink)
//        
//        // Release the renderer AFTER display link has been released
//        Engine.finalize()
//    }
    
    override public func awakeFromNib() {
        let attributes: [NSOpenGLPixelFormatAttribute] = [
            // Must specify the 3.2 Core Profile to use OpenGL 3.2
            NSOpenGLPixelFormatAttribute(NSOpenGLPFAOpenGLProfile), NSOpenGLPixelFormatAttribute(NSOpenGLProfileVersion3_2Core),
            NSOpenGLPixelFormatAttribute(NSOpenGLPFADoubleBuffer),
            NSOpenGLPixelFormatAttribute(NSOpenGLPFAColorSize), NSOpenGLPixelFormatAttribute(32),
            NSOpenGLPixelFormatAttribute(NSOpenGLPFADepthSize), NSOpenGLPixelFormatAttribute(24),
            NSOpenGLPixelFormatAttribute(NSOpenGLPFAStencilSize), NSOpenGLPixelFormatAttribute(8),
            NSOpenGLPixelFormatAttribute(NSOpenGLPFAMultisample),
            NSOpenGLPixelFormatAttribute(NSOpenGLPFASampleBuffers), NSOpenGLPixelFormatAttribute(1),
            NSOpenGLPixelFormatAttribute(NSOpenGLPFASamples), NSOpenGLPixelFormatAttribute(4),
            NSOpenGLPixelFormatAttribute(0)
        ]
        
        let pf = NSOpenGLPixelFormat(attributes: attributes)
        
        if let context = NSOpenGLContext(format: pf, shareContext: nil) {
            // When we're using a CoreProfile context, crash if we call a legacy OpenGL function
            // This will make it much more obvious where and when such a function call is made so
            // that we can remove such calls.
            // Without this we'd simply get GL_INVALID_OPERATION error for calling legacy functions
            // but it would be more difficult to see where that function was called.
            CGLEnable(context.CGLContextObj, kCGLCECrashOnRemovedFunctions)
            
            pixelFormat = pf
            openGLContext = context
            
            // Opt-In to Retina resolution
            wantsBestResolutionOpenGLSurface = true
        }
    }
    
//    func initGL() {
//        // The reshape function may have changed the thread to which our OpenGL
//        // context is attached before prepareOpenGL and initGL are called.  So call
//        // makeCurrentContext to ensure that our OpenGL context current to this
//        // thread (i.e. makeCurrentContext directs all OpenGL calls on this thread
//        // to [self openGLContext])
//        openGLContext.makeCurrentContext()
//        
//        // Synchronize buffer swaps with vertical refresh rate
//        var swapInt = GLint(1)
//        openGLContext.setValues(&swapInt, forParameter: .GLCPSwapInterval)
//    }
    
//    override func reshape() {
//        super.reshape()
//        
//        // We draw on a secondary thread through the display link. However, when
//        // resizing the view, -drawRect is called on the main thread.
//        // Add a mutex around to avoid the threads accessing the context
//        // simultaneously when resizing.
//        CGLLockContext(openGLContext.CGLContextObj)
//        
//        // Get the view size in Points
//        let viewRectPoints = self.bounds
//        
//        // Rendering at retina resolutions will reduce aliasing, but at the potential
//        // cost of framerate and battery life due to the GPU needing to render more
//        // pixels.
//        
//        // Any calculations the renderer does which use pixel dimentions, must be
//        // in "retina" space.  [NSView convertRectToBacking] converts point sizes
//        // to pixel sizes.  Thus the renderer gets the size in pixels, not points,
//        // so that it can set it's viewport and perform and other pixel based
//        // calculations appropriately.
//        // viewRectPixels will be larger (2x) than viewRectPoints for retina displays.
//        // viewRectPixels will be the same as viewRectPoints for non-retina displays
//        let viewRectPixels = convertRectToBacking(viewRectPoints)
//        
//        // Set the new dimensions in our renderer
//        Engine.resize(width: Float(viewRectPixels.size.width), height: Float(viewRectPixels.size.height))
//        
//        CGLUnlockContext(openGLContext.CGLContextObj)
//    }
    
    override public func drawRect(dirtyRect: NSRect) {
        // Called during resize operations
        
        // Avoid flickering during resize by drawiing
        drawView()
    }
    
    func drawView() {
        openGLContext.makeCurrentContext()
        
        // We draw on a secondary thread through the display link
        // When resizing the view, -reshape is called automatically on the main
        // thread. Add a mutex around to avoid the threads accessing the context
        // simultaneously when resizing
        CGLLockContext(openGLContext.CGLContextObj)
        
        Engine.update()
        Engine.render()
        
        CGLFlushDrawable(openGLContext.CGLContextObj)
        CGLUnlockContext(openGLContext.CGLContextObj)
    }
    
//    override func renewGState() {
//        // Called whenever graphics state updated (such as window resize)
//        
//        // OpenGL rendering is not synchronous with other rendering on the OSX.
//        // Therefore, call disableScreenUpdatesUntilFlush so the window server
//        // doesn't render non-OpenGL content in the window asynchronously from
//        // OpenGL content, which could cause flickering.  (non-OpenGL content
//        // includes the title bar and drawing done by the app with other APIs)
//        window.disableScreenUpdatesUntilFlush()
//        
//        super.renewGState()
//    }
    
    func windowWillClose(notification: NSNotification) {
        // Stop the display link when the window is closing because default
        // OpenGL render buffers will be destroyed.  If display link continues to
        // fire without renderbuffers, OpenGL draw calls will set errors.
        CVDisplayLinkStop(displayLink)
    }
}
