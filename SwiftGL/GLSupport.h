//
//  GLSupport.h
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

#import <stdio.h>
#import <OpenGL/gl3.h>

#pragma mark - Conversions

/*
 * Swift (in its current state) appears to be lacking the option to easily switch
 * between certain types -- especially when it comes to using C Types / Pointers
 * These conversion functions are here to augment and remove those limitations
 */

const float *CFloatPtr(const void *ptr);
const char *CStringPtr(const NSString *string);

#pragma mark - Shader

unsigned int swglCompileShader(int type, NSString *source);
BOOL swglVerifyProgram(unsigned int program);
