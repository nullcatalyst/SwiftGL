//
//  Mat4.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-10.
//
//

import Cocoa

struct Mat4 {
    var x, y, z, w: Vec4
    
    init(x: Vec4, y: Vec4, z: Vec4, w: Vec4) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
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
    
    static func identity() -> Mat4 {
        return Mat4(xx: 1, yx: 0, zx: 0, wx: 0,
                    xy: 0, yy: 1, zy: 0, wy: 0,
                    xz: 0, yz: 0, zz: 1, wz: 0,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func rotateX(radians: CFloat) -> Mat4 {
        var c = cos(radians)
        var s = sin(radians)
        return Mat4(xx: 1, yx:  0, zx: 0, wx: 0,
                    xy: 0, yy:  c, zy: s, wy: 0,
                    xz: 0, yz: -s, zz: c, wz: 0,
                    xw: 0, yw:  0, zw: 0, ww: 1)
    }
    
    static func rotateY(radians: CFloat) -> Mat4 {
        var c = cos(radians)
        var s = sin(radians)
        return Mat4(xx: c, yx: 0, zx: -s, wx: 0,
                    xy: 0, yy: 1, zy:  0, wy: 0,
                    xz: s, yz: 0, zz:  c, wz: 0,
                    xw: 0, yw: 0, zw:  0, ww: 1)
    }
    
    static func rotateZ(radians: CFloat) -> Mat4 {
        var c = cos(radians)
        var s = sin(radians)
        return Mat4(xx:  c, yx: s, zx: 0, wx: 0,
                    xy: -s, yy: c, zy: s, wy: 0,
                    xz:  0, yz: 0, zz: 1, wz: 0,
                    xw:  0, yw: 0, zw: 0, ww: 1)
    }
    
    static func translate(offset: Vec3) -> Mat4 {
        return Mat4(xx: 1, yx: 0, zx: 0, wx: offset.x,
                    xy: 0, yy: 1, zy: 0, wy: offset.y,
                    xz: 0, yz: 0, zz: 1, wz: offset.z,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func translate(x: CFloat, y: CFloat, z: CFloat) -> Mat4 {
        return Mat4(xx: 1, yx: 0, zx: 0, wx: x,
                    xy: 0, yy: 1, zy: 0, wy: y,
                    xz: 0, yz: 0, zz: 1, wz: z,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func scale(scale: Vec3) -> Mat4 {
        return Mat4(xx: scale.x, yx: 0, zx: 0, wx: 0,
                    xy: 0, yy: scale.y, zy: 0, wy: 0,
                    xz: 0, yz: 0, zz: scale.z, wz: 0,
                    xw: 0, yw: 0, zw: 0, ww: 1)
    }
    
    static func scale(x: CFloat, y: CFloat, z: CFloat) -> Mat4 {
        return Mat4(xx: x, yx: 0, zx: 0, wx: x,
                    xy: 0, yy: y, zy: 0, wy: y,
                    xz: 0, yz: 0, zz: z, wz: z,
                    xw: 0, yw: 0, zw: 0, ww: 1)
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
