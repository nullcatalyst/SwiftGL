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

const char *CStringPtr(const NSString *string) {
    return [string cStringUsingEncoding:NSASCIIStringEncoding];
}

const GLvoid *COffsetPtr(GLsizeiptr offset) {
    return (const void *) offset;
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

void *swglLoadTexture(NSString *filename, GLsizei *widthOut, GLsizei *heightOut, BOOL flipVertical) {
    CFURLRef url = CFBundleCopyResourceURL(CFBundleGetMainBundle(), (CFStringRef) filename, CFSTR(""), NULL);
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL(url, NULL);
    CGImageRef image = CGImageSourceCreateImageAtIndex(imageSource, 0, NULL);
    CFRelease(imageSource);
    GLsizei width  = (GLsizei) CGImageGetWidth (image);
    GLsizei height = (GLsizei) CGImageGetHeight(image);
    CGRect rect = CGRectMake(0.0f, 0.0f, width, height);
    
    void *imageData = malloc(width * height * 4);
    CGColorSpaceRef colourSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(imageData, width, height, 8, width * 4, colourSpace, kCGBitmapByteOrder32Host | kCGImageAlphaPremultipliedFirst);
    CFRelease(colourSpace);
    
    if (flipVertical) {
        CGContextTranslateCTM(ctx, 0, height);
        CGContextScaleCTM(ctx, 1.0f, -1.0f);
    }
    
    CGContextSetBlendMode(ctx, kCGBlendModeCopy);
    CGContextDrawImage(ctx, rect, image);
    CGContextRelease(ctx);
    CFRelease(image);
    
    if (widthOut  != NULL) *widthOut  = width;
    if (heightOut != NULL) *heightOut = height;
    
    return imageData;
}
