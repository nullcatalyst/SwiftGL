//
//  Float.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Project Catalyst. All rights reserved.
//

import Darwin

let Pi: CFloat = CFloat(M_PI)

func radians(degrees: CFloat) -> CFloat {return degrees * Pi / 180.0}
func degrees(radians: CFloat) -> CFloat {return radians * 180.0 / Pi}

func mix(a: CFloat, b: CFloat, t: CFloat) -> CFloat {return a + (b - a) * t}
