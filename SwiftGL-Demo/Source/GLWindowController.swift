//
//  GLWindowController.swift
//  SwiftGL-Demo
//
//  Created by Scott Bennett on 2014-07-12.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Foundation

class GLWindowController: NSWindowController {
    // IBOutlet must be used so that, in Inteface Builder,
    // we can connect the view in the NIB to windowedView
    @IBOutlet var view: GLView!
    
    // Fullscreen window
    @objc var fullscreenWindow: GLFullscreenWindow!
    
    // Non-Fullscreen window (also the initial window)
    @objc var standardWindow: NSWindow!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    func goFullscreen() {
        // If app is already fullscreen...
        if fullscreenWindow {
            // ...don't do anything
            return
        }
        
        // Allocate a new fullscreen window
        fullscreenWindow = GLFullscreenWindow()
        
        // Resize the view to screensize
        let viewRect = fullscreenWindow.frame
        
        // Set the view to the size of the fullscreen window
        view.frame.size = viewRect.size
        
        // Set the view in the fullscreen window
        fullscreenWindow.contentView = view
        
        standardWindow = self.window
        
        // Hide non-fullscreen window so it doesn't show up when switching out
        // of this app (i.e. with CMD-TAB)
        standardWindow.orderOut(self)
        
        // Set controller to the fullscreen window so that all input will go to
        // this controller (self)
        window = fullscreenWindow
        
        // Show the window and make it the key window for input
        fullscreenWindow.makeKeyAndOrderFront(self)
    }
    
    func goWindow() {
        // If controller doesn't have a full screen window...
        if fullscreenWindow == nil {
            // ...app is already windowed so don't do anything
            return
        }
        
        // Get the rectangle of the original window
        let viewRect = standardWindow.frame
        
        // Set the view rect to the new size
        view.frame = viewRect
        
        // Set controller to the standard window so that all input will go to
        // this controller (self)
        window = standardWindow
        
        // Set the content of the orginal window to the view
        window.contentView = view
        
        // Show the window and make it the key window for input
        window.makeKeyAndOrderFront(self)
        
        // Ensure we set fullscreen Window to nil so our checks for
        // windowed vs. fullscreen mode elsewhere are correct
        fullscreenWindow = nil
    }
}
