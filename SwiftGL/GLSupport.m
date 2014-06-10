//
//  GLSupport.m
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

#import <stdio.h>
#import <Foundation/Foundation.h>

#import "GLSupport.h"

const float *CFloatPtr(const void *ptr) {
    return ptr;
}

const char *CStringPtr(const NSString *string) {
    return [string cStringUsingEncoding:NSASCIIStringEncoding];
}

unsigned int swglCompileShader(int type, NSString *source) {
    const char *csource = [source cStringUsingEncoding:NSASCIIStringEncoding];
    
    GLuint shader = glCreateShader(type);
    glShaderSource(shader, 1, &csource, nil);
    glCompileShader(shader);
    
    GLint logLength;
    glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &logLength);
    
    if (logLength > 0) {
        GLchar *log = (GLchar *) malloc(logLength);
        glGetShaderInfoLog(shader, logLength, &logLength, log);
        fprintf(stderr, "Shader compile log: %s\n", log);
        free(log);
    }
    
    GLint status;
    glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
    if (status == GL_FALSE) {
        fprintf(stderr, "Failed to compile shader");
        return 0;
    }
    
    return shader;
}

BOOL swglVerifyProgram(unsigned int program) {
#ifdef DEBUG
    // Assert that the id was successfully linked
    GLint logLength;
    glGetProgramiv(program, GL_INFO_LOG_LENGTH, &logLength);
    if (logLength > 0) {
        GLchar *log = (GLchar *) malloc(logLength);
        glGetProgramInfoLog(program, logLength, &logLength, log);
        fprintf(stderr, "Program link log:\n%s\n", log);
        free(log);
    }
#endif /* defined(DEBUG) */
    
    GLint status;
    glGetProgramiv(program, GL_LINK_STATUS, &status);
    if (status == 0) {
        fprintf(stderr, "Failed to link shader program");
        return false;
    }
    
    return true;
}
