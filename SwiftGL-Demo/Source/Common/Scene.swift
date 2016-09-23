//
//  Scene.swift
//  SwiftGL-Demo
//
//  Created by Scott Bennett on 2014-06-09.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Foundation

protocol Scene {
    func update()
    func render()

    func resize(width: Float, height: Float)
}
