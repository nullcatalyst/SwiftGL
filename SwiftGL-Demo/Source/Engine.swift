//
//  Engine.swift
//  SwiftGL-Demo
//
//  Created by Scott Bennett on 2014-06-09.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Foundation

var viewWidth: CFloat  = 1
var viewHeight: CFloat = 1
var currentScene: Scene?

@objc class Engine {
    // "Class variables are not yet supported"
//    class var width: CFloat
//    class var height: CFloat
//    class var scene: Scene?
    
    class var scene: Scene? {
        get {
            return currentScene
        }
        set {
            currentScene = scene
            currentScene?.resize(width: viewWidth, height: viewHeight)
        }
    }
    
    class func update() {
        currentScene?.update()
    }
    
    class func render() {
        currentScene?.render()
    }
    
    class func resize(#width: CFloat, height: CFloat) {
        viewWidth  = width
        viewHeight = height
        currentScene?.resize(width: viewWidth, height: viewHeight)
    }
}

extension Engine {
    class func initialize() {
        currentScene = DemoScene()
    }
    
    class func finalize() {
        currentScene = nil
    }
}
