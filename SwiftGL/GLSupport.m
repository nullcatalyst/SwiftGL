//
//  GLSupport.m
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

#import <stdio.h>
#import <Foundation/Foundation.h>
#import <ImageIO/CGImageSource.h>
#import <CoreGraphics/CoreGraphics.h>

#import "SwiftGL-Bridge.h"

unsigned int swglCompileShader(GLenum type, NSString *source) {
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
