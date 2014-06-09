//
//  Shader.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Darwin

typealias GLprogram = GLuint
typealias GLattrib  = GLint
typealias GLuniform = GLint

class Shader {
    var program: GLprogram
    
    init() {
        program = 0
    }
    
    deinit {
        glDeleteProgram(program)
    }
    
    func compile(vertexSource: String, fragmentSource: String) -> Bool {
        glDeleteProgram(program)
        program = glCreateProgram();
        
        var vertexShader   = swglCompileShader(GL_VERTEX_SHADER,   vertexSource)
        var fragmentShader = swglCompileShader(GL_FRAGMENT_SHADER, fragmentSource)
        
        // Attach the shaders to our id
        glAttachShader(program, vertexShader)
        glAttachShader(program, fragmentShader)
        
        // Delete the shaders since they are now attached to the id, which will retain a reference to them
        glDeleteShader(vertexShader)
        glDeleteShader(fragmentShader)
        
        glLinkProgram(program)
        
        return swglVerifyProgram(program)
    }
    
    func bind() {
        glUseProgram(program)
    }
    
    func attribute(name: String) -> GLint {
        return glGetAttribLocation(program, CStringPtr(name))
    }
    
    func uniform(name: String) -> GLuniform {
        return glGetUniformLocation(program, CStringPtr(name))
    }
    
    // Bind Uniforms using Int
    func bindUniform(uniform: GLuniform, x: CFloat) {glProgramUniform1f(program, uniform, x)}
    func bindUniform(uniform: GLuniform, x: CFloat, y: CFloat) {glProgramUniform2f(program, uniform, x, y)}
    func bindUniform(uniform: GLuniform, x: CFloat, y: CFloat, z: CFloat) {glProgramUniform3f(program, uniform, x, y, z)}
    func bindUniform(uniform: GLuniform, x: CFloat, y: CFloat, z: CFloat, w: CFloat) {glProgramUniform4f(program, uniform, x, y, z, w)}
    func bindUniform(uniform: GLuniform, v: Vec2) {glProgramUniform2fv(program, uniform, 1, CFloatPtr([v]))}
    func bindUniform(uniform: GLuniform, v: Vec3) {glProgramUniform3fv(program, uniform, 1, CFloatPtr([v]))}
    func bindUniform(uniform: GLuniform, v: Vec4) {glProgramUniform4fv(program, uniform, 1, CFloatPtr([v]))}
    
    // Bind Uniforms using String
    func bindUniform(name: String, x: CFloat) {glProgramUniform1f(program, uniform(name), x)}
    func bindUniform(name: String, x: CFloat, y: CFloat) {glProgramUniform2f(program, uniform(name), x, y)}
    func bindUniform(name: String, x: CFloat, y: CFloat, z: CFloat) {glProgramUniform3f(program, uniform(name), x, y, z)}
    func bindUniform(name: String, x: CFloat, y: CFloat, z: CFloat, w: CFloat) {glProgramUniform4f(program, uniform(name), x, y, z, w)}
    func bindUniform(name: String, v: Vec2) {glProgramUniform2fv(program, uniform(name), 1, CFloatPtr([v]))}
    func bindUniform(name: String, v: Vec3) {glProgramUniform3fv(program, uniform(name), 1, CFloatPtr([v]))}
    func bindUniform(name: String, v: Vec4) {glProgramUniform4fv(program, uniform(name), 1, CFloatPtr([v]))}
}
