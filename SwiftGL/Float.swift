//
//  Float.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Darwin

let Pi = CFloat(M_PI)

func radians(degrees: CFloat) -> CFloat {return degrees * Pi / 180}
func degrees(radians: CFloat) -> CFloat {return radians * 180 / Pi}

func sign(value: CFloat) -> CFloat {return (value > 0 ? 1 : (value < 0 ? -1 : 0))}

// Overload some mathematical functions to make them easier to call without having to worry about as many casts
func sqrt(value: CFloat)  -> CFloat {return sqrtf(value);}
func sin(radians: CFloat) -> CFloat {return sinf(radians)}
func cos(radians: CFloat) -> CFloat {return cosf(radians)}
func tan(radians: CFloat) -> CFloat {return tanf(radians)}

func mix(a: CFloat, b: CFloat, t: CFloat) -> CFloat {return a + (b - a) * t}

func clamp(value: CFloat, min: CFloat, max: CFloat) -> CFloat {return value < min ? min : (value > max ? max : value)}
