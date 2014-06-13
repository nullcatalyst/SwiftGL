//
//  Vao.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-09.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Foundation

class Vao {
    var id: GLuint
    
    init() {
        id = 0
        glGenVertexArrays(1, &id)
    }
    
    deinit {
        glDeleteVertexArrays(1, &id)
    }
    
    func bind() {
        glBindVertexArray(id);
    }
}

extension Vao {
    func bindFloat(attribute: GLuint, vbo: Vbo, offset: GLsizeiptr) {
        glBindVertexArray(id)
        glEnableVertexAttribArray(attribute)
        
        glBindBuffer(GLenum(GL_ARRAY_BUFFER), vbo.id)
        glVertexAttribPointer(attribute, 1, GLenum(GL_FLOAT), GLboolean(GL_FALSE), GLsizei(vbo.stride), COffsetPtr(offset))
    }
    
    func bindVec2(attribute: GLuint, vbo: Vbo, offset: GLsizeiptr) {
        glBindVertexArray(id)
        glEnableVertexAttribArray(attribute)
        
        glBindBuffer(GLenum(GL_ARRAY_BUFFER), vbo.id)
        glVertexAttribPointer(attribute, 2, GLenum(GL_FLOAT), GLboolean(GL_FALSE), GLsizei(vbo.stride), COffsetPtr(offset))
    }
    
    func bindVec3(attribute: GLuint, vbo: Vbo, offset: GLsizeiptr) {
        glBindVertexArray(id)
        glEnableVertexAttribArray(attribute)
        
        glBindBuffer(GLenum(GL_ARRAY_BUFFER), vbo.id)
        glVertexAttribPointer(attribute, 3, GLenum(GL_FLOAT), GLboolean(GL_FALSE), GLsizei(vbo.stride), COffsetPtr(offset))
    }
    
    func bindVec4(attribute: GLuint, vbo: Vbo, offset: GLsizeiptr) {
        glBindVertexArray(id)
        glEnableVertexAttribArray(attribute)
        
        glBindBuffer(GLenum(GL_ARRAY_BUFFER), vbo.id)
        glVertexAttribPointer(attribute, 4, GLenum(GL_FLOAT), GLboolean(GL_FALSE), GLsizei(vbo.stride), COffsetPtr(offset))
    }
}

extension Vao {
    func bindElements(vbo: Vbo) {
        glBindVertexArray(id)
        glBindBuffer(GLenum(GL_ELEMENT_ARRAY_BUFFER), vbo.id)
    }
}
