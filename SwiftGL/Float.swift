//
//  Float.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Darwin

let Pi: CFloat = CFloat(M_PI)

func radians(degrees: CFloat) -> CFloat {return degrees * Pi / 180.0}
func degrees(radians: CFloat) -> CFloat {return radians * 180.0 / Pi}

// Overload some trigonometic functions to make them easier to call without having to worry about as many casts
func sin(radians: CFloat) -> CFloat {return sinf(radians)}
func cos(radians: CFloat) -> CFloat {return cosf(radians)}

func mix(a: CFloat, b: CFloat, t: CFloat) -> CFloat {return a + (b - a) * t}
