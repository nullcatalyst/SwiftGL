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

func glProgramUniform1i(program: GLuint, location: GLint, x: GLint)                                            {return glProgramUniform1iEXT(program, location, x)}
func glProgramUniform2i(program: GLuint, location: GLint, x: GLint, y: GLint)                                  {return glProgramUniform2iEXT(program, location, x, y)}
func glProgramUniform3i(program: GLuint, location: GLint, x: GLint, y: GLint, z: GLint)                        {return glProgramUniform3iEXT(program, location, x, y, z)}
func glProgramUniform4i(program: GLuint, location: GLint, x: GLint, y: GLint, z: GLint, w: GLint)              {return glProgramUniform4iEXT(program, location, x, y, z, w)}

func glProgramUniform1iv(program: GLuint, location: GLint, count: GLsizei, value: UnsafePointer<GLint>)   {return glProgramUniform1ivEXT(program, location, count, value)}
func glProgramUniform2iv(program: GLuint, location: GLint, count: GLsizei, value: UnsafePointer<GLint>)   {return glProgramUniform2ivEXT(program, location, count, value)}
func glProgramUniform3iv(program: GLuint, location: GLint, count: GLsizei, value: UnsafePointer<GLint>)   {return glProgramUniform3ivEXT(program, location, count, value)}
func glProgramUniform4iv(program: GLuint, location: GLint, count: GLsizei, value: UnsafePointer<GLint>)   {return glProgramUniform4ivEXT(program, location, count, value)}

func glProgramUniform1f(program: GLuint, location: GLint, x: GLfloat)                                          {return glProgramUniform1fEXT(program, location, x)}
func glProgramUniform2f(program: GLuint, location: GLint, x: GLfloat, y: GLfloat)                              {return glProgramUniform2fEXT(program, location, x, y)}
func glProgramUniform3f(program: GLuint, location: GLint, x: GLfloat, y: GLfloat, z: GLfloat)                  {return glProgramUniform3fEXT(program, location, x, y, z)}
func glProgramUniform4f(program: GLuint, location: GLint, x: GLfloat, y: GLfloat, z: GLfloat, w: GLfloat)      {return glProgramUniform4fEXT(program, location, x, y, z, w)}

func glProgramUniform1fv(program: GLuint, location: GLint, count: GLsizei, value: UnsafePointer<GLfloat>) {return glProgramUniform1fvEXT(program, location, count, value)}
func glProgramUniform2fv(program: GLuint, location: GLint, count: GLsizei, value: UnsafePointer<GLfloat>) {return glProgramUniform2fvEXT(program, location, count, value)}
func glProgramUniform3fv(program: GLuint, location: GLint, count: GLsizei, value: UnsafePointer<GLfloat>) {return glProgramUniform3fvEXT(program, location, count, value)}
func glProgramUniform4fv(program: GLuint, location: GLint, count: GLsizei, value: UnsafePointer<GLfloat>) {return glProgramUniform4fvEXT(program, location, count, value)}

func glProgramUniformMatrix4fv(program: GLuint, location: GLint, count: GLsizei, transpose: GLboolean, value: UnsafePointer<GLfloat>) {
    return glProgramUniformMatrix4fvEXT(program, location, count, transpose, value)
}

#endif
    
public class Shader {
    public typealias GLprogram = GLuint
    public typealias GLattrib  = GLint
    public typealias GLuniform = GLint
    
    var id: GLprogram
    
    public init() {
        id = 0
    }
    
    deinit {
        glDeleteProgram(id)
    }
    
    /// @return true on success
    public func compile(#vertexSource: String, fragmentSource: String) -> Bool {
        glDeleteProgram(id)
        id = glCreateProgram();
        
        var vertexShader   = Shader.compile(type: GL_VERTEX_SHADER,   source: vertexSource)
        var fragmentShader = Shader.compile(type: GL_FRAGMENT_SHADER, source: fragmentSource)
        
        // Attach the shaders to our id
        glAttachShader(id, vertexShader)
        glAttachShader(id, fragmentShader)
        
        // Delete the shaders since they are now attached to the id, which will retain a reference to them
        glDeleteShader(vertexShader)
        glDeleteShader(fragmentShader)
        
        glLinkProgram(id)
        
        return Shader.verify(program: id)
    }
    
    /// @return true on success
    public func compile(#vertexSource: String, fragmentSource: String, bindAttibutes: (GLprogram) -> Void) -> Bool {
        glDeleteProgram(id)
        id = glCreateProgram();
        
        var vertexShader   = Shader.compile(type: GL_VERTEX_SHADER,   source: vertexSource)
        var fragmentShader = Shader.compile(type: GL_FRAGMENT_SHADER, source: fragmentSource)
        
        // Call the external function to bind all of the default shader attributes
        bindAttibutes(id)
        
        // Attach the shaders to our id
        glAttachShader(id, vertexShader)
        glAttachShader(id, fragmentShader)
        
        // Delete the shaders since they are now attached to the id, which will retain a reference to them
        glDeleteShader(vertexShader)
        glDeleteShader(fragmentShader)
        
        glLinkProgram(id)
        
        return Shader.verify(program: id)
    }
    
    /// @return true on success
    public func load(#vertexFile: String, fragmentFile: String) -> Bool {
        let vertexSource: String   = String.stringWithContentsOfFile(vertexFile,   encoding: NSASCIIStringEncoding, error: nil)!
        let fragmentSource: String = String.stringWithContentsOfFile(fragmentFile, encoding: NSASCIIStringEncoding, error: nil)!
        
        return self.compile(vertexSource: vertexSource, fragmentSource: fragmentSource)
    }
    
    /// @return true on success
    public func load(#vertexFile: String, fragmentFile: String, bindAttibutes: (GLprogram) -> Void) -> Bool {
        let vertexSource: String   = String.stringWithContentsOfFile(vertexFile,   encoding: NSASCIIStringEncoding, error: nil)!
        let fragmentSource: String = String.stringWithContentsOfFile(fragmentFile, encoding: NSASCIIStringEncoding, error: nil)!
        
        return self.compile(vertexSource: vertexSource, fragmentSource: fragmentSource, bindAttibutes)
    }
    
    public func bind() {
        glUseProgram(id)
    }
    
    public func attribute(name: String) -> GLint {
        return glGetAttribLocation(id, UnsafePointer<CChar>(name.cStringUsingEncoding(NSASCIIStringEncoding)!))
    }
    
    public func uniform(name: String) -> GLuniform {
        return glGetUniformLocation(id, UnsafePointer<CChar>(name.cStringUsingEncoding(NSASCIIStringEncoding)!))
    }
    
    // Bind Uniforms using Uniform Location
    public func bind(#uniform: GLuniform, x: CFloat) {glProgramUniform1f(id, uniform, x)}
    public func bind(#uniform: GLuniform, x: CFloat, y: CFloat) {glProgramUniform2f(id, uniform, x, y)}
    public func bind(#uniform: GLuniform, x: CFloat, y: CFloat, z: CFloat) {glProgramUniform3f(id, uniform, x, y, z)}
    public func bind(#uniform: GLuniform, x: CFloat, y: CFloat, z: CFloat, w: CFloat) {glProgramUniform4f(id, uniform, x, y, z, w)}
    public func bind(#uniform: GLuniform, v: Vec2) {glProgramUniform2fv(id, uniform, 1, UnsafePointer([v]))}
    public func bind(#uniform: GLuniform, v: Vec3) {glProgramUniform3fv(id, uniform, 1, UnsafePointer([v]))}
    public func bind(#uniform: GLuniform, v: Vec4) {glProgramUniform4fv(id, uniform, 1, UnsafePointer([v]))}
    
    public func bind(#uniform: GLuniform, m: Mat4, transpose: GLboolean = GL_FALSE) {glProgramUniformMatrix4fv(id, uniform, 1, transpose, UnsafePointer([m]))}
    
    public func bind(#uniform: GLuniform, texture: Texture, index: GLint = 0) {
        glProgramUniform1i(id, uniform, index)
        glActiveTexture(GL_TEXTURE0 + GLenum(index))
        glBindTexture(GL_TEXTURE_2D, texture.id)
    }
    
    // Bind Uniforms using String
    public func bind(#uniform: String, x: CFloat) {glProgramUniform1f(id, self.uniform(uniform), x)}
    public func bind(#uniform: String, x: CFloat, y: CFloat) {glProgramUniform2f(id, self.uniform(uniform), x, y)}
    public func bind(#uniform: String, x: CFloat, y: CFloat, z: CFloat) {glProgramUniform3f(id, self.uniform(uniform), x, y, z)}
    public func bind(#uniform: String, x: CFloat, y: CFloat, z: CFloat, w: CFloat) {glProgramUniform4f(id, self.uniform(uniform), x, y, z, w)}
    public func bind(#uniform: String, v: Vec2) {glProgramUniform2fv(id, self.uniform(uniform), 1, UnsafePointer([v]))}
    public func bind(#uniform: String, v: Vec3) {glProgramUniform3fv(id, self.uniform(uniform), 1, UnsafePointer([v]))}
    public func bind(#uniform: String, v: Vec4) {glProgramUniform4fv(id, self.uniform(uniform), 1, UnsafePointer([v]))}
    
    public func bind(#uniform: String, m: Mat4, transpose: GLboolean = GL_FALSE) {glProgramUniformMatrix4fv(id, self.uniform(uniform), 1, transpose, UnsafePointer([m]))}
    
    public func bind(#uniform: String, texture: Texture, index: GLint = 0) {
        glProgramUniform1i(id, self.uniform(uniform), index)
        glActiveTexture(GL_TEXTURE0 + GLenum(index))
        glBindTexture(GL_TEXTURE_2D, texture.id)
    }
    
    private class func compile(#type: GLenum, source: String) -> GLprogram {
        /*if let csource = source.cStringUsingEncoding(NSASCIIStringEncoding) {
            var csrcptr = ConstUnsafePointer<CChar>(csource)
            var ptrptr: ConstUnsafePointer<ConstUnsafePointer<CChar>> = &csrcptr
        }
        
        
        let shader = glCreateShader(type)
        glShaderSource(shader, 1, ptrptr, nil)
        glCompileShader(shader)
        
        var logLength: GLint = 0
        glGetShaderiv(shader, GLenum(GL_INFO_LOG_LENGTH), &logLength)
        if logLength > 0 {
            let log = UnsafePointer<CChar>(malloc(UInt(logLength)))
            glGetShaderInfoLog(shader, logLength, &logLength, log)
            println("Shader compile log: \(String.stringWithCString(log, encoding: NSASCIIStringEncoding)!)")
            free(log)
        }
        
        var status: GLint = 0
        glGetShaderiv(shader, GLenum(GL_COMPILE_STATUS), &status)
        if status == GLint(GL_FALSE) {
            println("Failed to compile shader: \(csource)")
            return 0
        }
        
        return shader*/
        
        return swglCompileShader(type, source)
    }
    
    private class func verify(#program: GLprogram) -> Bool {
//        #if DEBUG
        // Assert that the program was successfully linked
        var logLength: GLint = 0
        glGetProgramiv(program, GLenum(GL_INFO_LOG_LENGTH), &logLength)
        
        if logLength > 0 {
            let log = UnsafeMutablePointer<CChar>(malloc(UInt(logLength)))
            glGetProgramInfoLog(program, logLength, &logLength, log)
            println("Program link log:\n\(String.stringWithCString(log, encoding: NSASCIIStringEncoding)!)")
            free(log)
        }
//        #endif
        
        var status: GLint = 0
        glGetProgramiv(program, GLenum(GL_LINK_STATUS), &status)
        
        if status == 0 {
            println("Failed to link shader program")
            return false
        }
        
        return true
    }
}
