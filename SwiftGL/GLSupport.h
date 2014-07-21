//
//  GLSupport.h
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

#import <SwiftGL/SwiftGL.h>

#pragma mark - Shader Support Functions

unsigned int swglCompileShader(GLenum type, NSString *source);

#pragma mark - Texture Support Functions

void *swglLoadTexture(NSString *filename, GLsizei *width, GLsizei *height, BOOL flipVertical);
