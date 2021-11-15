//
//  Particle.swift
//  Fireworks
//
//  Created by kawasemi081on 2021/11/15.
//

import SwiftUI

class Particle: Hashable, Equatable {
    let id = UUID()
    var x: Double
    var y: Double
    var angle: Double
    var speed: Double
    var scale: Double
    var opacity: Double
    var deathDate: Date
    var rotation: Double
    var color: Color

    init(x: Double, y: Double, angle:Double, speed: Double, scale:Double, opacity: Double, deathDate: Date, rotation: Double, color: Color) {
        self.x = x
        self.y = y
        self.angle = angle
        self.speed = speed
        self.scale = scale
        self.opacity = opacity
        self.deathDate = deathDate
        self.rotation = rotation
        self.color = color
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Particle, rhs: Particle) -> Bool {
        lhs.id == rhs.id
    }
}
