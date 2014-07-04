//
//  SwiftGL.h
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for SwiftGL.
FOUNDATION_EXPORT double SwiftGLVersionNumber;

//! Project version string for SwiftGL.
FOUNDATION_EXPORT const unsigned char SwiftGLVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SwiftGL/PublicHeader.h>

#include <Availability.h>
#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
    #include <OpenGLES/ES2/gl.h>
    #include <OpenGLES/ES2/glext.h>

    // Redefine the functions that have different names so that we can use the exact same code
    #define glGenVertexArrays           glGenVertexArraysOES
    #define glDeleteVertexArrays        glDeleteVertexArraysOES
    #define glBindVertexArray           glBindVertexArrayOES
    #define glVertexAttribDivisor       glVertexAttribDivisorEXT
    #define glProgramUniform1i          glProgramUniform1iEXT
    #define glProgramUniform1f          glProgramUniform1fEXT
    #define glProgramUniform2f          glProgramUniform2fEXT
    #define glProgramUniform3f          glProgramUniform3fEXT
    #define glProgramUniform4f          glProgramUniform4fEXT
    #define glProgramUniform1fv         glProgramUniform1fvEXT
    #define glProgramUniform2fv         glProgramUniform2fvEXT
    #define glProgramUniform3fv         glProgramUniform3fvEXT
    #define glProgramUniform4fv         glProgramUniform4fvEXT
    #define glProgramUniformMatrix4fv   glProgramUniformMatrix4fvEXT
#else /* defined(__IPHONE_OS_VERSION_MIN_REQUIRED) */
    #include <OpenGL/gl3.h>
    #include <OpenGL/gl3ext.h>
#endif /* defined(__IPHONE_OS_VERSION_MIN_REQUIRED) */
