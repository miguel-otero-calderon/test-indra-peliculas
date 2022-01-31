//
//  Utils.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//

import UIKit

func degreesToRadians (_ value: CGFloat) -> CGFloat {
    let piDegrees: CGFloat = 180.0
    return (value * CGFloat.pi) / piDegrees
}

func radiansToDegrees (_ value: CGFloat) -> CGFloat {
    let piDegrees: CGFloat = 180.0
    return (value * piDegrees) / CGFloat.pi
}
