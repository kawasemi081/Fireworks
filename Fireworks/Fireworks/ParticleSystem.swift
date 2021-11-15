//
//  ParticleSystem.swift
//  Fireworks
//
//  Created by kawasemi081on 2021/11/15.
//

import SwiftUI

class ParticleSystem: ObservableObject {
    let colors: [Color] = [.red, .green, .blue, .orange, .yellow, .mint]
    let image = Image("spark")
    var particles = Set<Particle>()
    var lastUpate = Date()
    var lastCreationDate = Date()

    @Published var birthRate = 10.0 // make 10 objects in each time
    @Published var lifetime = 500.0
    @Published var lifetimeRange = 25.0
    @Published var xPosition = 50.0
    @Published var yPosition = 0.0
    @Published var xPositionRange = 100.0
    @Published var yPositionRange = 0.0
    @Published var angle = 90.0
    @Published var angleRange = 5.0
    @Published var speed = 50.0
    @Published var speedRange = 25.0
    @Published var opacity = 50.0
    @Published var opacityRange = 50.0
    @Published var opacitySpeed = -10.0
    @Published var scale = 100.0
    @Published var scaleRange = 50.0
    @Published var scaleSpeed = 10.0
    @Published var enableBlending = false
    @Published var rotation = 0.0
    @Published var rotationRange = 0.0
    @Published var rotationSpeed = 0.0
    
    func update(date: Date) {
        let elapsedTime = date.timeIntervalSince1970 - lastUpate.timeIntervalSince1970
        lastUpate = date
        particles.insert(makeParticle())
        
        for particle in particles {
            if particle.deathDate < date {
                particles.remove(particle)
                continue
            }
            /// - SeeAlso: circular function: https://ja.wikipedia.org/wiki/単位円
            particle.x += cos(particle.angle) * particle.speed * elapsedTime / 100
            particle.y += sin(particle.angle) * particle.speed * elapsedTime / 100
            particle.scale += scaleSpeed * elapsedTime / 50
            particle.opacity += opacitySpeed * elapsedTime / 50
            particle.rotation += rotationSpeed * elapsedTime
        }
        
        let birthSpeed = 1 / birthRate
        let elapsedSinceCreation = date.timeIntervalSince1970 - lastCreationDate.timeIntervalSince1970
        let amountToCreate = Int(elapsedSinceCreation / birthSpeed)
        
        for _ in 0..<amountToCreate {
            particles.insert(makeParticle())
            lastCreationDate = date
        }
    }
    
    private func makeParticle() -> Particle {
        let angleDegrees = angle + Double.random(in: -angleRange / 2...angleRange / 2)
        let angleRadians = angleDegrees * .pi / 180
        
        return Particle(
            x: xPosition / 100 + Double.random(in: -xPositionRange / 200...xPositionRange / 200),
            y: yPosition / 100 + Double.random(in: -yPositionRange / 200...yPositionRange / 200),
            angle: angleRadians,
            speed: speed + Double.random(in: -speedRange / 2...speedRange / 2),
            scale: scale / 100 + Double.random(in: -scaleRange / 200...scaleRange / 200),
            opacity: opacity / 100 + Double.random(in: -opacityRange / 200...opacityRange / 200),
            deathDate: Date() + lifetime / 100 + Double.random(in: -lifetimeRange / 200...lifetimeRange / 200),
            rotation: rotation  + Double.random(in: -rotationRange / 2...rotationRange / 2),
            color: colors.randomElement() ?? .white
        )
    }
}
