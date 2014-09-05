//
//  SwiftGLTests.swift
//  SwiftGLTests
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import XCTest
import Cocoa
import OpenGL
import SwiftGL

class SwiftGLTests: XCTestCase {
    var context: NSOpenGLContext! = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let attributes = [
            // Must specify the 3.2 Core Profile to use OpenGL 3.2
//            NSOpenGLPixelFormatAttribute(NSOpenGLPFAOpenGLProfile), NSOpenGLPixelFormatAttribute(NSOpenGLProfileVersion3_2Core),
            
            NSOpenGLPixelFormatAttribute(NSOpenGLPFADoubleBuffer),
            
            NSOpenGLPixelFormatAttribute(NSOpenGLPFAColorSize), NSOpenGLPixelFormatAttribute(32),
            NSOpenGLPixelFormatAttribute(NSOpenGLPFADepthSize), NSOpenGLPixelFormatAttribute(24),
            NSOpenGLPixelFormatAttribute(NSOpenGLPFAStencilSize), NSOpenGLPixelFormatAttribute(8),
            
            NSOpenGLPixelFormatAttribute(NSOpenGLPFAMultisample),
            NSOpenGLPixelFormatAttribute(NSOpenGLPFASampleBuffers), NSOpenGLPixelFormatAttribute(1),
            NSOpenGLPixelFormatAttribute(NSOpenGLPFASamples), NSOpenGLPixelFormatAttribute(4),
            NSOpenGLPixelFormatAttribute(0)
        ]
        
        let pixelFormat = NSOpenGLPixelFormat(attributes: attributes)
        context = NSOpenGLContext(format: pixelFormat, shareContext: nil)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        context = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
//    func toPtr(data: CConstVoidPointer) -> CConstPointer<Float> {
//        return CConstPointer<Float>(self, data.value)
//    }
    
    func testMatrix() {
        context.makeCurrentContext()
        
        if context != nil {
            println("Context is valid")
        }
        /*
        var ogl: Float[] = [
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
        ]
        var sgl = Mat4.identity()
        
        glMatrixMode(GLenum(GL_PROJECTION))
        glLoadIdentity()
        glFrustum(-3, 3, -2, 2, 1, 10)
        glGetFloatv(GLenum(GL_PROJECTION_MATRIX), &ogl)
        sgl *= Mat4.frustum(left: -3, right: 3, bottom: -2, top: 2, near: 1, far: 10)
        
        println("OpenGL Matrix:")
        println("(\(ogl[ 0]), \(ogl[ 1]), \(ogl[ 2]), \(ogl[ 3]))")
        println("(\(ogl[ 4]), \(ogl[ 5]), \(ogl[ 6]), \(ogl[ 7]))")
        println("(\(ogl[ 8]), \(ogl[ 9]), \(ogl[10]), \(ogl[11]))")
        println("(\(ogl[12]), \(ogl[13]), \(ogl[14]), \(ogl[15]))")
        
        println("SwiftGL Matrix:")
        println(sgl.x)
        println(sgl.y)
        println(sgl.z)
        println(sgl.w)
        */
//        XCTAssertEqual(oglMatrix, sglMatrix, "OpenGL Matrix does not match SwiftGL Matrix")
    }
    
    func testColorMix() {
        let white = Color(r: 255, g: 255, b: 255, a: 255)
        let black = Color(r: 0, g: 0, b: 0, a: 255)
        let grey  = Color(r: 127, g: 127, b: 127, a: 255)
        
        XCTAssertEqual(Color(rf: 0.5, gf: 0.5, bf: 0.5), grey)
        XCTAssertEqual(mix(black, white, Float(0.5)), grey)
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
