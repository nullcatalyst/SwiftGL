//
//  Shader.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Darwin

class Shader {
    typealias GLprogram = GLuint
    typealias GLattrib  = GLint
    typealias GLuniform = GLint
    
    var id: GLprogram
    
    init() {
        id = 0
    }
    
    deinit {
        glDeleteProgram(id)
    }
    
    /// @return true on success
    func compile(vertexSource: String, fragmentSource: String) -> Bool {
        glDeleteProgram(id)
        id = glCreateProgram();
        
        var vertexShader   = swglCompileShader(GL_VERTEX_SHADER,   vertexSource)
        var fragmentShader = swglCompileShader(GL_FRAGMENT_SHADER, fragmentSource)
        
        // Attach the shaders to our id
        glAttachShader(id, vertexShader)
        glAttachShader(id, fragmentShader)
        
        // Delete the shaders since they are now attached to the id, which will retain a reference to them
        glDeleteShader(vertexShader)
        glDeleteShader(fragmentShader)
        
        glLinkProgram(id)
        
        return swglVerifyProgram(id)
    }
    
    /// @return true on success
    func compile(vertexSource: String, fragmentSource: String, bindAttibutes: (GLprogram) -> Void) -> Bool {
        glDeleteProgram(id)
        id = glCreateProgram();
        
        var vertexShader   = swglCompileShader(GL_VERTEX_SHADER,   vertexSource)
        var fragmentShader = swglCompileShader(GL_FRAGMENT_SHADER, fragmentSource)
        
        // Call the external function to bind all of the default shader attributes
        bindAttibutes(id)
        
        // Attach the shaders to our id
        glAttachShader(id, vertexShader)
        glAttachShader(id, fragmentShader)
        
        // Delete the shaders since they are now attached to the id, which will retain a reference to them
        glDeleteShader(vertexShader)
        glDeleteShader(fragmentShader)
        
        glLinkProgram(id)
        
        return swglVerifyProgram(id)
    }
    
    /// @return true on success
    func load(vertexFile: String, fragmentFile: String) -> Bool {
        var vertexSource: String   = NSString(contentsOfFile: vertexFile,   encoding: NSASCIIStringEncoding, error: nil)
        var fragmentSource: String = NSString(contentsOfFile: fragmentFile, encoding: NSASCIIStringEncoding, error: nil)
        
        return self.compile(vertexSource, fragmentSource: fragmentSource)
    }
    
    /// @return true on success
    func load(vertexFile: String, fragmentFile: String, bindAttibutes: (GLprogram) -> Void) -> Bool {
        var vertexSource: String   = NSString(contentsOfFile: vertexFile,   encoding: NSASCIIStringEncoding, error: nil)
        var fragmentSource: String = NSString(contentsOfFile: fragmentFile, encoding: NSASCIIStringEncoding, error: nil)
        
        return self.compile(vertexSource, fragmentSource: fragmentSource, bindAttibutes)
    }
    
    func bind() {
        glUseProgram(id)
    }
    
    func attribute(name: String) -> GLint {
        return glGetAttribLocation(id, CStringPtr(name))
    }
    
    func uniform(name: String) -> GLuniform {
        return glGetUniformLocation(id, CStringPtr(name))
    }
    
    func toPtr(data: CConstVoidPointer) -> CConstPointer<CFloat> {
        return CConstPointer<CFloat>(self, data.value)
    }
    
    // Bind Uniforms using Uniform Location
    func bind(#uniform: GLuniform, x: CFloat) {glProgramUniform1f(id, uniform, x)}
    func bind(#uniform: GLuniform, x: CFloat, y: CFloat) {glProgramUniform2f(id, uniform, x, y)}
    func bind(#uniform: GLuniform, x: CFloat, y: CFloat, z: CFloat) {glProgramUniform3f(id, uniform, x, y, z)}
    func bind(#uniform: GLuniform, x: CFloat, y: CFloat, z: CFloat, w: CFloat) {glProgramUniform4f(id, uniform, x, y, z, w)}
    func bind(#uniform: GLuniform, v: Vec2) {glProgramUniform2fv(id, uniform, 1, toPtr([v]))}
    func bind(#uniform: GLuniform, v: Vec3) {glProgramUniform3fv(id, uniform, 1, toPtr([v]))}
    func bind(#uniform: GLuniform, v: Vec4) {glProgramUniform4fv(id, uniform, 1, toPtr([v]))}
    
    func bind(#uniform: GLuniform, m: Mat4, transpose: GLboolean = GL_FALSE) {glProgramUniformMatrix4fv(id, uniform, 1, transpose, toPtr([m]))}
    
    func bind(#uniform: GLuniform, texture: Texture, index: GLint = 0) {
        glProgramUniform1i(id, uniform, index)
        glActiveTexture(GL_TEXTURE0 + GLenum(index))
        glBindTexture(GL_TEXTURE_2D, texture.id)
    }
    
    // Bind Uniforms using String
    func bind(#uniform: String, x: CFloat) {glProgramUniform1f(id, self.uniform(uniform), x)}
    func bind(#uniform: String, x: CFloat, y: CFloat) {glProgramUniform2f(id, self.uniform(uniform), x, y)}
    func bind(#uniform: String, x: CFloat, y: CFloat, z: CFloat) {glProgramUniform3f(id, self.uniform(uniform), x, y, z)}
    func bind(#uniform: String, x: CFloat, y: CFloat, z: CFloat, w: CFloat) {glProgramUniform4f(id, self.uniform(uniform), x, y, z, w)}
    func bind(#uniform: String, v: Vec2) {glProgramUniform2fv(id, self.uniform(uniform), 1, toPtr([v]))}
    func bind(#uniform: String, v: Vec3) {glProgramUniform3fv(id, self.uniform(uniform), 1, toPtr([v]))}
    func bind(#uniform: String, v: Vec4) {glProgramUniform4fv(id, self.uniform(uniform), 1, toPtr([v]))}
    
    func bind(#uniform: String, m: Mat4, transpose: GLboolean = GL_FALSE) {glProgramUniformMatrix4fv(id, self.uniform(uniform), 1, transpose, toPtr([m]))}
    
    func bind(#uniform: String, texture: Texture, index: GLint = 0) {
        glProgramUniform1i(id, self.uniform(uniform), index)
        glActiveTexture(GL_TEXTURE0 + GLenum(index))
        glBindTexture(GL_TEXTURE_2D, texture.id)
    }
}
