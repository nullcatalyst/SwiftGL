//
//  Engine.swift
//  SwiftGL-Demo
//
//  Created by Scott Bennett on 2014-06-09.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Foundation

var viewWidth: Float = 1
var viewHeight: Float = 1
var currentScene: Scene?
@objc class Engine: NSObject {
    // "Class variables are not yet supported"
//    class var width: Float
//    class var height: Float
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

    class func resize(width: Float, height: Float) {
        viewWidth = width
        viewHeight = height
        currentScene?.resize(width: viewWidth, height: viewHeight)
    }
}

extension Engine {
    override class func initialize() {
        currentScene = DemoScene()
    }

    override class func finalize() {
        currentScene = nil
    }
}
