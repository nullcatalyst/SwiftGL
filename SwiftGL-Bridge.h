//
//  SwiftGL-Bridge.h
//  SwiftGL
//
//  Created by Scott Bennett on 2014-07-03.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

#import <Availability.h>
#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
    #import <OpenGLES/ES2/gl.h>
    #import <OpenGLES/ES2/glext.h>

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
    #import <OpenGL/gl3.h>
    #import <OpenGL/gl3ext.h>
#endif /* defined(__IPHONE_OS_VERSION_MIN_REQUIRED) */

#pragma mark - Shader Support Functions

unsigned int swglCompileShader(GLenum type, NSString *source);

#pragma mark - Texture Support Functions

void *swglLoadTexture(NSString *filename, GLsizei *width, GLsizei *height, BOOL flipVertical);
