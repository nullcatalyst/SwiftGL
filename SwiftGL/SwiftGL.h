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

#if TARGET_OS_IPHONE
    #import <OpenGLES/ES2/gl.h>
#elif TARGET_OS_MAC
    #import <OpenGL/gl3.h>
#endif

unsigned int swglCompileShader(GLenum type, NSString *source);
