//
//  GameViewController.swift
//  SwiftGL-Demo-iOS
//
//  Created by Scott Bennett on 2015-04-14.
//  Copyright (c) 2015 Scott Bennett. All rights reserved.
//

//NOTE: The OpenGL ES option is still in progress for Swift.

import Foundation
import GLKit
import OpenGLES

class GameViewController: GLKViewController {
    var context: EAGLContext? = nil

    deinit {
        self.tearDownGL()

        if EAGLContext.current() === self.context {
            EAGLContext.setCurrent(nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        context = EAGLContext(api: .openGLES2)
        if context == nil {
            print("Failed to create ES context")
        }

        let view = self.view as! GLKView
        view.context = self.context!
        view.drawableDepthFormat = .format24

        self.setupGL()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        if self.isViewLoaded && self.view.window != nil {
            self.view = nil

            self.tearDownGL()

            if EAGLContext.current() === self.context {
                EAGLContext.setCurrent(nil)
            }
            self.context = nil
        }
    }

    func setupGL() {
        EAGLContext.setCurrent(self.context)

        // Change the working directory so that we can use C code to grab resource files
        if let path = Bundle.main.resourcePath {
            FileManager.default.changeCurrentDirectoryPath(path)
        }

        Engine.initialize()

        let width = Float(view.frame.size.width) // * view.contentScaleFactor)
        let height = Float(view.frame.size.height) // * view.contentScaleFactor)
        Engine.resize(width: width, height: height)
    }

    func tearDownGL() {
        EAGLContext.setCurrent(self.context)

        Engine.finalize()
    }

    // MARK: - GLKView and GLKViewController delegate methods

    func update() {
        Engine.update()
    }

    // Render
    override func glkView(_ view: GLKView, drawIn rect: CGRect) {
        Engine.render()
    }
}
