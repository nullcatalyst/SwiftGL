//
//  Float.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Darwin

public let Pi = CFloat(M_PI)

public func radians(degrees: CFloat) -> CFloat {return degrees * Pi / 180}
public func degrees(radians: CFloat) -> CFloat {return radians * 180 / Pi}

public func sign(value: CFloat) -> CFloat {return (value > 0 ? 1 : (value < 0 ? -1 : 0))}

// Overload some mathematical functions to make them easier to call without having to worry about as many casts
public func sqrt(value: CFloat)  -> CFloat {return sqrtf(value);}

public func sin(radians: CFloat) -> CFloat {return sinf(radians)}
public func cos(radians: CFloat) -> CFloat {return cosf(radians)}
public func tan(radians: CFloat) -> CFloat {return tanf(radians)}

public func sin(#radians: CFloat) -> CFloat {return sinf(radians)}
public func cos(#radians: CFloat) -> CFloat {return cosf(radians)}
public func tan(#radians: CFloat) -> CFloat {return tanf(radians)}

public func sin(#degrees: CFloat) -> CFloat {return sinf(radians(degrees))}
public func cos(#degrees: CFloat) -> CFloat {return cosf(radians(degrees))}
public func tan(#degrees: CFloat) -> CFloat {return tanf(radians(degrees))}

public func mix(a: CFloat, b: CFloat, t: CFloat) -> CFloat {return a + (b - a) * t}

public func clamp(value: CFloat, min: CFloat, max: CFloat) -> CFloat {return value < min ? min : (value > max ? max : value)}
