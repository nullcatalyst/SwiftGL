//
//  Shader.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

#if os(OSX)
    import Cocoa
    import OpenGL
#else
    import Foundation
    import OpenGLES

    func glProgramUniform1i(_ program: GLuint, _ location: GLint, _ x: GLint) { return glProgramUniform1iEXT(program, location, x) }
    func glProgramUniform2i(_ program: GLuint, _ location: GLint, _ x: GLint, _ y: GLint) { return glProgramUniform2iEXT(program, location, x, y) }
    func glProgramUniform3i(_ program: GLuint, _ location: GLint, _ x: GLint, _ y: GLint, _ z: GLint) { return glProgramUniform3iEXT(program, location, x, y, z) }
    func glProgramUniform4i(_ program: GLuint, _ location: GLint, _ x: GLint, _ y: GLint, _ z: GLint, _ w: GLint) { return glProgramUniform4iEXT(program, location, x, y, z, w) }

    func glProgramUniform1iv(_ program: GLuint, _ location: GLint, _ count: GLsizei, _ value: UnsafePointer<GLint>) { return glProgramUniform1ivEXT(program, location, count, value) }
    func glProgramUniform2iv(_ program: GLuint, _ location: GLint, _ count: GLsizei, _ value: UnsafePointer<GLint>) { return glProgramUniform2ivEXT(program, location, count, value) }
    func glProgramUniform3iv(_ program: GLuint, _ location: GLint, _ count: GLsizei, _ value: UnsafePointer<GLint>) { return glProgramUniform3ivEXT(program, location, count, value) }
    func glProgramUniform4iv(_ program: GLuint, _ location: GLint, _ count: GLsizei, _ value: UnsafePointer<GLint>) { return glProgramUniform4ivEXT(program, location, count, value) }

    func glProgramUniform1f(_ program: GLuint, _ location: GLint, _ x: GLfloat) { return glProgramUniform1fEXT(program, location, x) }
    func glProgramUniform2f(_ program: GLuint, _ location: GLint, _ x: GLfloat, _ y: GLfloat) { return glProgramUniform2fEXT(program, location, x, y) }
    func glProgramUniform3f(_ program: GLuint, _ location: GLint, _ x: GLfloat, _ y: GLfloat, _ z: GLfloat) { return glProgramUniform3fEXT(program, location, x, y, z) }
    func glProgramUniform4f(_ program: GLuint, _ location: GLint, _ x: GLfloat, _ y: GLfloat, _ z: GLfloat, _ w: GLfloat) { return glProgramUniform4fEXT(program, location, x, y, z, w) }

    func glProgramUniform1fv(_ program: GLuint, _ location: GLint, _ count: GLsizei, _ value: UnsafePointer<GLfloat>) { return glProgramUniform1fvEXT(program, location, count, value) }
    func glProgramUniform2fv(_ program: GLuint, _ location: GLint, _ count: GLsizei, _ value: UnsafePointer<GLfloat>) { return glProgramUniform2fvEXT(program, location, count, value) }
    func glProgramUniform3fv(_ program: GLuint, _ location: GLint, _ count: GLsizei, _ value: UnsafePointer<GLfloat>) { return glProgramUniform3fvEXT(program, location, count, value) }
    func glProgramUniform4fv(_ program: GLuint, _ location: GLint, _ count: GLsizei, _ value: UnsafePointer<GLfloat>) { return glProgramUniform4fvEXT(program, location, count, value) }

    func glProgramUniformMatrix4fv(_ program: GLuint, _ location: GLint, _ count: GLsizei, _ transpose: GLboolean, _ value: UnsafePointer<GLfloat>) {
        return glProgramUniformMatrix4fvEXT(program, location, count, transpose, value)
    }

#endif

open class Shader {
    public typealias GLprogram = GLuint
    public typealias GLattrib = GLint
    public typealias GLuniform = GLint

    var id: GLprogram = 0

    public init() {

    }

    public init(vertexSource: String, fragmentSource: String) {
        _ = compile(vertexSource, fragmentSource)
    }

    public init(vertexSource: String, fragmentSource: String, bindAttibutes: (GLprogram) -> ()) {
        _ = compile(vertexSource, fragmentSource, bindAttibutes)
    }

    public init(vertexFile: String, fragmentFile: String) {
        _ = load(vertexFile, fragmentFile)
    }

    public init(vertexFile: String, fragmentFile: String, bindAttibutes: (GLprogram) -> ()) {
        _ = load(vertexFile, fragmentFile, bindAttibutes)
    }

    deinit {
        glDeleteProgram(id)
    }

    /// @return true on success
    open func compile(_ vertexSource: String, _ fragmentSource: String) -> Bool {
        glDeleteProgram(id)
        id = glCreateProgram();

        let vertexShader = Shader.compile(GL_VERTEX_SHADER, vertexSource)
        let fragmentShader = Shader.compile(GL_FRAGMENT_SHADER, fragmentSource)

        // Attach the shaders to our id
        glAttachShader(id, vertexShader)
        glAttachShader(id, fragmentShader)

        // Delete the shaders since they are now attached to the id, which will retain a reference to them
        glDeleteShader(vertexShader)
        glDeleteShader(fragmentShader)

        glLinkProgram(id)

        return Shader.verify(id)
    }

    /// @return true on success
    open func compile(_ vertexSource: String, _ fragmentSource: String, _ bindAttibutes: (GLprogram) -> ()) -> Bool {
        glDeleteProgram(id)
        id = glCreateProgram();

        let vertexShader = Shader.compile(GL_VERTEX_SHADER, vertexSource)
        let fragmentShader = Shader.compile(GL_FRAGMENT_SHADER, fragmentSource)

        // Call the external function to bind all of the default shader attributes
        bindAttibutes(id)

        // Attach the shaders to our id
        glAttachShader(id, vertexShader)
        glAttachShader(id, fragmentShader)

        // Delete the shaders since they are now attached to the id, which will retain a reference to them
        glDeleteShader(vertexShader)
        glDeleteShader(fragmentShader)

        glLinkProgram(id)

        return Shader.verify(id)
    }

    /// @return true on success
    open func load(_ shader: String) -> Bool {
        if let vertexSource = try? String(contentsOfFile: shader + ".vsh", encoding: String.Encoding.ascii) {
            if let fragmentSource = try? String(contentsOfFile: shader + ".fsh", encoding: String.Encoding.ascii) {
                return self.compile(vertexSource, fragmentSource)
            }
        }

        return false
    }

    /// @return true on success
    open func load(_ vertexFile: String, _ fragmentFile: String) -> Bool {
        if let vertexSource = try? String(contentsOfFile: vertexFile, encoding: String.Encoding.ascii) {
            if let fragmentSource = try? String(contentsOfFile: fragmentFile, encoding: String.Encoding.ascii) {
                return self.compile(vertexSource, fragmentSource)
            }
        }

        return false
    }

    /// @return true on success
    open func load(_ vertexFile: String, _ fragmentFile: String, _ bindAttibutes: (GLprogram) -> ()) -> Bool {
        if let vertexSource = try? String(contentsOfFile: vertexFile, encoding: String.Encoding.ascii) {
            if let fragmentSource = try? String(contentsOfFile: fragmentFile, encoding: String.Encoding.ascii) {
                return self.compile(vertexSource, fragmentSource, bindAttibutes)
            }
        }

        return false
    }

    open func bind() {
        glUseProgram(id)
    }

    open func attribute(_ name: String) -> GLint {
        return glGetAttribLocation(id, UnsafePointer<CChar>(name.cString(using: String.Encoding.ascii)!))
    }

    open func uniform(_ name: String) -> GLuniform {
        return glGetUniformLocation(id, UnsafePointer<CChar>(name.cString(using: String.Encoding.ascii)!))
    }
    // Bind Uniforms using Uniform Location
    open func bind(_ uniform: GLuniform, _ x: Float) { glProgramUniform1f(id, uniform, x) }
    open func bind(_ uniform: GLuniform, _ x: Float, _ y: Float) { glProgramUniform2f(id, uniform, x, y) }
    open func bind(_ uniform: GLuniform, _ x: Float, _ y: Float, _ z: Float) { glProgramUniform3f(id, uniform, x, y, z) }
    open func bind(_ uniform: GLuniform, _ x: Float, _ y: Float, _ z: Float, _ w: Float) { glProgramUniform4f(id, uniform, x, y, z, w) }
    open func bind(_ uniform: GLuniform, _ v: inout Vec2) { glProgramUniform2fv(id, uniform, 1, v.ptr) }
    open func bind(_ uniform: GLuniform, _ v: inout Vec3) { glProgramUniform3fv(id, uniform, 1, v.ptr) }
    open func bind(_ uniform: GLuniform, _ v: inout Vec4) { glProgramUniform4fv(id, uniform, 1, v.ptr) }

    open func bind(_ uniform: GLuniform, _ m: inout Mat4, transpose: GLboolean = GL_FALSE) { glProgramUniformMatrix4fv(id, uniform, 1, transpose, m.ptr) }

    open func bind(_ uniform: GLuniform, _ texture: Texture, index: GLint = 0) {
        glProgramUniform1i(id, uniform, index)
        glActiveTexture(GL_TEXTURE0 + GLenum(index))
        glBindTexture(GL_TEXTURE_2D, texture.id)
    }

    // Bind Uniforms using String
    open func bind(_ uniform: String, _ x: Float) { glProgramUniform1f(id, self.uniform(uniform), x) }
    open func bind(_ uniform: String, _ x: Float, _ y: Float) { glProgramUniform2f(id, self.uniform(uniform), x, y) }
    open func bind(_ uniform: String, _ x: Float, _ y: Float, _ z: Float) { glProgramUniform3f(id, self.uniform(uniform), x, y, z) }
    open func bind(_ uniform: String, _ x: Float, _ y: Float, _ z: Float, _ w: Float) { glProgramUniform4f(id, self.uniform(uniform), x, y, z, w) }
    open func bind(_ uniform: String, _ v: inout Vec2) { glProgramUniform2fv(id, self.uniform(uniform), 1, v.ptr) }
    open func bind(_ uniform: String, _ v: inout Vec3) { glProgramUniform3fv(id, self.uniform(uniform), 1, v.ptr) }
    open func bind(_ uniform: String, _ v: inout Vec4) { glProgramUniform4fv(id, self.uniform(uniform), 1, v.ptr) }

    open func bind(_ uniform: String, _ m: inout Mat4, transpose: GLboolean = GL_FALSE) { glProgramUniformMatrix4fv(id, self.uniform(uniform), 1, transpose, m.ptr) }

    open func bind(_ uniform: String, _ texture: Texture, index: GLint = 0) {
        glProgramUniform1i(id, self.uniform(uniform), index)
        glActiveTexture(GL_TEXTURE0 + GLenum(index))
        glBindTexture(GL_TEXTURE_2D, texture.id)
    }

    fileprivate class func ptr <T> (_ ptr: UnsafePointer<T>) -> UnsafePointer<T> { return ptr }

    fileprivate class func compile(_ type: GLenum, _ source: String) -> GLprogram {
        if let csource: [GLchar] = source.cString(using: String.Encoding.ascii) {
            let cptr = ptr(csource)

            let shader = glCreateShader(type)
            glShaderSource(shader, 1, [cptr], nil)
            glCompileShader(shader)

            var logLength: GLint = 0
            glGetShaderiv(shader, GLenum(GL_INFO_LOG_LENGTH), &logLength)
            if logLength > 0 {
                let log = malloc(Int(logLength)).assumingMemoryBound(to: CChar.self)
                glGetShaderInfoLog(shader, logLength, &logLength, log)
                print("Shader compile log: \(String(describing: log))")
                free(log)
            }

            var status: GLint = 0
            glGetShaderiv(shader, GLenum(GL_COMPILE_STATUS), &status)
            if status == GLint(GL_FALSE) {
                print("Failed to compile shader: \(csource)")
                return 0
            }

            return shader
        }

        return 0
    }

    fileprivate class func verify(_ program: GLprogram) -> Bool {
//        #if DEBUG
        // Assert that the program was successfully linked
        var logLength: GLint = 0
        glGetProgramiv(program, GLenum(GL_INFO_LOG_LENGTH), &logLength)

        if logLength > 0 {
            let log = malloc(Int(logLength)).assumingMemoryBound(to: CChar.self)
            glGetProgramInfoLog(program, logLength, &logLength, log)
            print("Program link log:\n\(String(describing: log))")
            free(log)
        }
//        #endif

        var status: GLint = 0
        glGetProgramiv(program, GLenum(GL_LINK_STATUS), &status)

        if status == 0 {
            print("Failed to link shader program")
            return false
        }

        return true
    }
}
