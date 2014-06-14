//
//  Vbo.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-09.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Foundation

class Vbo {
    var id: GLuint
    var count: GLsizeiptr
    var stride: GLsizeiptr
    
    init() {
        id     = 0
        count  = 0
        stride = 0
        glGenBuffers(1, &id)
    }
    
    deinit {
        glDeleteBuffers(1, &id)
    }
    
    func reset() {
        count  = 0
        stride = 0
        glBindBuffer(GLenum(GL_ARRAY_BUFFER), id)
        glBufferData(GLenum(GL_ARRAY_BUFFER), 0, nil, GLenum(GL_DYNAMIC_DRAW))
    }
}

// NOTE: You cannot bind both vertex data and element data to the same VBO,
//       Two separate VBOs must be used (then bound to the same VAO)

extension Vbo {
    func bind <T> (data: CConstPointer<T>, count: GLsizeiptr) {
        self.count  = count
        self.stride = sizeof(T)
        var ptr = CConstVoidPointer(self, data.value)
        glBindBuffer(GLenum(GL_ARRAY_BUFFER), id)
        glBufferData(GLenum(GL_ARRAY_BUFFER), stride * count, ptr, GLenum(GL_DYNAMIC_DRAW))
    }
    
    func bindSubData <T> (data: CConstPointer<T>, start: GLsizeiptr, count: GLsizeiptr) {
        self.count  = count
        self.stride = sizeof(T)
        var ptr = CConstVoidPointer(self, data.value)
        glBindBuffer(GLenum(GL_ARRAY_BUFFER), id)
        glBufferSubData(GLenum(GL_ARRAY_BUFFER), stride * start, stride * count, ptr)
    }
}

extension Vbo {
    func bindElements <T> (data: CConstPointer<T>, count: GLsizeiptr) {
        self.count  = count
        self.stride = sizeof(T)
        var ptr = CConstVoidPointer(self, data.value)
        glBindBuffer(GLenum(GL_ELEMENT_ARRAY_BUFFER), id)
        glBufferData(GLenum(GL_ELEMENT_ARRAY_BUFFER), stride * count, ptr, GLenum(GL_STATIC_DRAW))
    }
    
    func bindSubElements <T> (data: CConstPointer<T>, count: GLsizeiptr) {
        self.count  = count
        self.stride = sizeof(T)
        var ptr = CConstVoidPointer(self, data.value)
        glBindBuffer(GLenum(GL_ELEMENT_ARRAY_BUFFER), id)
        glBufferSubData(GLenum(GL_ELEMENT_ARRAY_BUFFER), stride * count, stride * count, ptr)
    }
}
