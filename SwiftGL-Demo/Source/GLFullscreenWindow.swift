//
//  GLFullscreenWindow.swift
//  SwiftGL-Demo
//
//  Created by Scott Bennett on 2014-07-12.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Foundation
import CoreGraphics

class GLFullscreenWindow: NSWindow {
    
    init() {
        // Create a screen-sized window on the display you want to take over
        let screenRect = NSScreen.mainScreen().frame
        
        // Initialize the window making it size of the screen and borderless
        super.init(contentRect:screenRect, styleMask:NSBorderlessWindowMask, backing:.Buffered, defer:true)
        
        // Set the window level to be above the menu bar to cover everything else
        level = Int(CGWindowLevelForKey(CGWindowLevelKey(kCGMainMenuWindowLevelKey)) + 1)
        
        // Set opaque
        opaque = true
        
        // Hide this when user switches to another window (or app)
        hidesOnDeactivate = true
    }
    
    required init(coder: NSCoder!) {
        super.init(coder: coder)
    }
    
    func canBecomeKeyWindow() -> Bool {
        // Return true so that this borderless window can receive input
        return true
    }
    
    override func keyDown(event: NSEvent) {
        // Implement keyDown since controller will not get [ESC] key event which
        // the controller uses to kill fullscreen
        let windowController = self.windowController() as NSWindowController
        windowController.keyDown(event)
    }
}