//
//  TripleBufferedVbo.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-23.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Foundation

#if os(OSX)
import OpenGL
#else
import OpenGLES
#endif

class TripleBufferedVbo<T> {
    let vbo = [Vbo(), Vbo(), Vbo()]
    let buffer: T[][] = [[], [], []]
    var next: Int // The buffer currently being used to render
    var prev: Int // This buffer has already been rendered, and can readily be updated
    
    init() {
        next = 1
        prev = 0
    }
    
    var renderCount: GLsizeiptr {
        get {
            return vbo[next].count
        }
    }
    
    var updateCount: GLsizeiptr {
        get {
            return vbo[prev].count
        }
    }
    
    func swap() {
        // Store the next index, so that they we can update the next index before we update the previous index
        // That way they are never actually set to the same value at the same time
        let temp = next
        
        if next != 2 {
            ++next
        } else {
            next = 0
        }
        
        prev = temp
        vbo[prev].bind(buffer[prev], count: buffer[prev].count)
    }
    
    func append(value: T) {
        buffer[prev].append(value)
    }
    
    func removeAll(keepCapacity: Bool = true) {
        buffer[prev].removeAll(keepCapacity: keepCapacity)
    }
}

extension Vao {
    func bind <T1: GLType, T2> (#attribute: GLuint, type: T1.Type, vbo tripleVbo: TripleBufferedVbo<T2>, offset: GLsizeiptr) {
        glBindVertexArray(id)
        glEnableVertexAttribArray(attribute)
        
        glBindBuffer(GL_ARRAY_BUFFER, tripleVbo.vbo[tripleVbo.next].id)
        glVertexAttribPointer(attribute, type.glSize, type.glType, type.glNormalized, GLsizei(tripleVbo.vbo[tripleVbo.next].stride), COffsetPtr(offset))
    }
}

extension Vao {
    func bindInstanced <T1: GLType, T2> (#attribute: GLuint, type: T1.Type, vbo: TripleBufferedVbo<T2>, offset: GLsizeiptr, divisor: GLuint = 1) {
        bind(attribute: attribute, type: type, vbo: vbo, offset: offset)
        glVertexAttribDivisor(attribute, divisor)
    }
}
