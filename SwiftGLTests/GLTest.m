//
//  GLTest.m
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-19.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

#import <OpenGL/gl.h>

void swglGetMatrix(float matrix[]) {
    glGetFloatv(GL_MODELVIEW_MATRIX, matrix);
}
