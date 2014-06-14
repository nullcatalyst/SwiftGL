//
//  Mat4.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-10.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Darwin

struct Mat4 {
    var x, y, z, w: Vec4
    
    init(xCol: Vec4, yCol: Vec4, zCol: Vec4, wCol: Vec4) {
        self.x = xCol
        self.y = yCol
        self.z = zCol
        self.w = wCol
    }
    
    init(xx: CFloat, yx: CFloat, zx: CFloat, wx: CFloat,
         xy: CFloat, yy: CFloat, zy: CFloat, wy: CFloat,
         xz: CFloat, yz: CFloat, zz: CFloat, wz: CFloat,
         xw: CFloat, yw: CFloat, zw: CFloat, ww: CFloat) {
        self.x = Vec4(x: xx, y: xy, z: xz, w: xw)
        self.y = Vec4(x: yx, y: yy, z: yz, w: yw)
        self.z = Vec4(x: zx, y: zy, z: zz, w: zw)
        self.w = Vec4(x: wx, y: wy, z: wz, w: ww)
    }
}

@infix func * (m: Mat4, v: Vec4) -> Vec4 {
    return Vec4(x: m.x.x * v.x + m.y.x * v.y + m.z.x * v.z + m.w.x * v.w,
                y: m.x.y * v.x + m.y.y * v.y + m.z.y * v.z + m.w.y * v.w,
                z: m.x.z * v.x + m.y.z * v.y + m.z.z * v.z + m.w.z * v.w,
                w: m.x.w * v.x + m.y.w * v.y + m.z.w * v.z + m.w.w * v.w)
}

@infix func * (a: Mat4, b: Mat4) -> Mat4 {
    return Mat4(xx: a.x.x * b.x.x + a.y.x * b.x.y + a.z.x * b.x.z + a.w.x * b.x.w,
				yx: a.x.x * b.y.x + a.y.x * b.y.y + a.z.x * b.y.z + a.w.x * b.y.w,
				zx: a.x.x * b.z.x + a.y.x * b.z.y + a.z.x * b.z.z + a.w.x * b.z.w,
				wx: a.x.x * b.w.x + a.y.x * b.w.y + a.z.x * b.w.z + a.w.x * b.w.w,
                xy: a.x.y * b.x.x + a.y.y * b.x.y + a.z.y * b.x.z + a.w.y * b.x.w,
				yy: a.x.y * b.y.x + a.y.y * b.y.y + a.z.y * b.y.z + a.w.y * b.y.w,
				zy: a.x.y * b.z.x + a.y.y * b.z.y + a.z.y * b.z.z + a.w.y * b.z.w,
				wy: a.x.y * b.w.x + a.y.y * b.w.y + a.z.y * b.w.z + a.w.y * b.w.w,
				xz: a.x.z * b.x.x + a.y.z * b.x.y + a.z.z * b.x.z + a.w.z * b.x.w,
				yz: a.x.z * b.y.x + a.y.z * b.y.y + a.z.z * b.y.z + a.w.z * b.y.w,
				zz: a.x.z * b.z.x + a.y.z * b.z.y + a.z.z * b.z.z + a.w.z * b.z.w,
				wz: a.x.z * b.w.x + a.y.z * b.w.y + a.z.z * b.w.z + a.w.z * b.w.w,
                xw: a.x.w * b.x.x + a.y.w * b.x.y + a.z.w * b.x.z + a.w.w * b.x.w,
                yw: a.x.w * b.y.x + a.y.w * b.y.y + a.z.w * b.y.z + a.w.w * b.y.w,
                zw: a.x.w * b.z.x + a.y.w * b.z.y + a.z.w * b.z.z + a.w.w * b.z.w,
                ww: a.x.w * b.w.x + a.y.w * b.w.y + a.z.w * b.w.z + a.w.w * b.w.w)
}

extension Mat4 { // Affine transformations
    static func identity() -> Mat4 {
        return Mat4(xx: 1, yx: 0, zx: 0, wx: 0,
                    xy: 0, yy: 1, zy: 0, wy: 0,
                    xz: 0, yz: 0, zz: 1, wz: 0,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func rotateX(radians: CFloat) -> Mat4 {
        var c = cos(radians)
        var s = sin(radians)
        return Mat4(xx: 1, yx: 0, zx:  0, wx: 0,
                    xy: 0, yy: c, zy: -s, wy: 0,
                    xz: 0, yz: s, zz:  c, wz: 0,
                    xw: 0, yw: 0, zw:  0, ww: 1)
    }
    
    static func rotateY(radians: CFloat) -> Mat4 {
        var c = cos(radians)
        var s = sin(radians)
        return Mat4(xx:  c, yx: 0, zx: s, wx: 0,
                    xy:  0, yy: 1, zy: 0, wy: 0,
                    xz: -s, yz: 0, zz: c, wz: 0,
                    xw:  0, yw: 0, zw: 0, ww: 1)
    }
    
    static func rotateZ(radians: CFloat) -> Mat4 {
        var c = cos(radians)
        var s = sin(radians)
        return Mat4(xx: c, yx: -s, zx: 0, wx: 0,
                    xy: s, yy:  c, zy: 0, wy: 0,
                    xz: 0, yz:  0, zz: 1, wz: 0,
                    xw: 0, yw:  0, zw: 0, ww: 1)
    }
    
    static func rotate(radians: CFloat, x: CFloat, y: CFloat, z: CFloat) -> Mat4 {
        var v = normalize(Vec3(x: x, y: y, z: z))
        var c = cos(radians)
        var p = 1 - c
        var s = sin(radians)
        return Mat4(xx: c + p * v.x * v.x, yx: p * v.x * v.y - v.z * s, zx: p * v.x * v.z + v.y * s, wx: 0,
                    xy: p * v.x * v.y + v.z * s, yy: c + p * v.y * v.y, zy: p * v.y * v.z - v.x * s, wy: 0,
                    xz: p * v.x * v.z - v.y * s, yz: p * v.y * v.z + v.x * s, zz: c + p * v.z * v.z, wz: 0,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func rotate(radians: CFloat, v: Vec3) -> Mat4 {
        var u = normalize(v)
        var c = cos(radians)
        var p = 1 - c
        var s = sin(radians)
        return Mat4(xx: c + p * u.x * u.x, yx: p * u.x * u.y - u.z * s, zx: p * u.x * u.z + u.y * s, wx: 0,
                    xy: p * u.x * u.y + u.z * s, yy: c + p * u.y * u.y, zy: p * u.y * u.z - u.x * s, wy: 0,
                    xz: p * u.x * u.z - u.y * s, yz: p * u.y * u.z + u.x * s, zz: c + p * u.z * u.z, wz: 0,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func translate(#x: CFloat, y: CFloat) -> Mat4 {
        return Mat4(xx: 1, yx: 0, zx: 0, wx: x,
                    xy: 0, yy: 1, zy: 0, wy: y,
                    xz: 0, yz: 0, zz: 1, wz: 0,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func translate(#x: CFloat, y: CFloat, z: CFloat) -> Mat4 {
        return Mat4(xx: 1, yx: 0, zx: 0, wx: x,
                    xy: 0, yy: 1, zy: 0, wy: y,
                    xz: 0, yz: 0, zz: 1, wz: z,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func translate(offset: Vec2) -> Mat4 {
        return Mat4(xx: 1, yx: 0, zx: 0, wx: offset.x,
                    xy: 0, yy: 1, zy: 0, wy: offset.y,
                    xz: 0, yz: 0, zz: 1, wz: 0,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func translate(offset: Vec3) -> Mat4 {
        return Mat4(xx: 1, yx: 0, zx: 0, wx: offset.x,
                    xy: 0, yy: 1, zy: 0, wy: offset.y,
                    xz: 0, yz: 0, zz: 1, wz: offset.z,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func scale(s: CFloat) -> Mat4 {
        return Mat4(xx: s, yx: 0, zx: 0, wx: 0,
                    xy: 0, yy: s, zy: 0, wy: 0,
                    xz: 0, yz: 0, zz: s, wz: 0,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func scale(#x: CFloat, y: CFloat) -> Mat4 {
        return Mat4(xx: x, yx: 0, zx: 0, wx: 0,
                    xy: 0, yy: y, zy: 0, wy: 0,
                    xz: 0, yz: 0, zz: 1, wz: 0,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func scale(#x: CFloat, y: CFloat, z: CFloat) -> Mat4 {
        return Mat4(xx: x, yx: 0, zx: 0, wx: 0,
                    xy: 0, yy: y, zy: 0, wy: 0,
                    xz: 0, yz: 0, zz: z, wz: 0,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func scale(scale: Vec2) -> Mat4 {
        return Mat4(xx: scale.x, yx: 0, zx: 0, wx: 0,
                    xy: 0, yy: scale.y, zy: 0, wy: 0,
                    xz: 0, yz: 0, zz: 1, wz: 0,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func scale(scale: Vec3) -> Mat4 {
        return Mat4(xx: scale.x, yx: 0, zx: 0, wx: 0,
                    xy: 0, yy: scale.y, zy: 0, wy: 0,
                    xz: 0, yz: 0, zz: scale.z, wz: 0,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
}

extension Mat4 {
    static func ortho(#width: CFloat, height: CFloat, depth: CFloat) -> Mat4 {
        return Mat4(xx: 0.5 / width, yx: 0, zx: 0, wx: 0,
                    xy: 0, yy: 0.5 / height, zy: 0, wy: 0,
                    xz: 0, yz: 0, zz: -0.5 / depth, wz: 0,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func ortho(#width: CFloat, height: CFloat, near: CFloat, far: CFloat) -> Mat4 {
        var fan = far + near
        var fsn = far - near
        return Mat4(xx: 0.5 / width, yx: 0, zx: 0, wx: 0,
                    xy: 0, yy: 0.5 / height, zy: 0, wy: 0,
                    xz: 0, yz: 0, zz: -2 / fsn, wz: -fan / fsn,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func ortho(#left: CFloat, right: CFloat, bottom: CFloat, top: CFloat, near: CFloat, far: CFloat) -> Mat4 {
        var ral = right + left
        var rsl = right - left
        var tab = top + bottom
        var tsb = top - bottom
        var fan = far + near
        var fsn = far - near
        return Mat4(xx: 2 / rsl, yx: 0, zx: 0, wx: -ral / rsl,
                    xy: 0, yy: 2 / tsb, zy: 0, wy: -tab / tsb,
                    xz: 0, yz: 0, zz: -2 / fsn, wz: -fan / fsn,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func frustum(#width: CFloat, height: CFloat, near: CFloat, far: CFloat) -> Mat4 {
        var fan = far + near
        var fsn = far - near
        return Mat4(xx: near / width, yx: 0, zx: 0, wx: 0,
                    xy: 0, yy: near / height, zy: 0, wy: 0,
                    xz: 0, yz: 0, zz: -fan / fsn, wz: (-2 * far * near) / fsn,
                    xw: 0, yw: 0, zw: -1, ww: 0)
    }
    
    static func frustum(#left: CFloat, right: CFloat, bottom: CFloat, top: CFloat, near: CFloat, far: CFloat) -> Mat4 {
        var ral = right + left
        var rsl = right - left
        var tsb = top - bottom
        var tab = top + bottom
        var fan = far + near
        var fsn = far - near
        return Mat4(xx: 2 * near / rsl, yx: 0, zx: ral / rsl, wx: 0,
                    xy: 0, yy: 2 * near / tsb, zy: tab / tsb, wy: 0,
                    xz: 0, yz: 0, zz: -fan / fsn, wz: (-2 * far * near) / fsn,
                    xw: 0, yw: 0, zw: -1, ww: 0)
    }
    
    static func perspective(#fovy: CFloat, aspect: CFloat, near: CFloat, far: CFloat) -> Mat4 {
        var cot = 1 / tan(fovy / 2)
        
        return Mat4(xx: cot / aspect, yx: 0, zx: 0, wx: 0,
                    xy: 0, yy: cot, zy: 0, wy: 0,
                    xz: 0, yz: 0, zz: (far + near) / (near - far), wz: (2 * far * near) / (near - far),
                    xw: 0, yw: 0, zw: -1, ww: 0)
    }
    
    static func perspective(#fovy: CFloat, width: CFloat, height: CFloat, near: CFloat, far: CFloat) -> Mat4 {
        var cot = 1 / tan(fovy / 2)
        var aspect = width / height
        
        return Mat4(xx: cot / aspect, yx: 0, zx: 0, wx: 0,
            xy: 0, yy: cot, zy: 0, wy: 0,
            xz: 0, yz: 0, zz: (far + near) / (near - far), wz: (2 * far * near) / (near - far),
            xw: 0, yw: 0, zw: -1, ww: 0)
    }
    
    static func lookAt(#eye: Vec3, center: Vec3, up: Vec3) -> Mat4 {
        var n = normalize(eye - center)
        var u = normalize(cross(up, n))
        var v = cross(n, u)
        return Mat4(xx: u.x, yx: u.y, zx: u.z, wx: dot(-u, eye),
                    xy: v.x, yy: v.y, zy: v.z, wy: dot(-v, eye),
                    xz: n.x, yz: n.y, zz: n.z, wz: dot(-n, eye),
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
}
