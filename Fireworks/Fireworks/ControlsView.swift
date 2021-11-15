//
//  ControlsView.swift
//  Fireworks
//
//  Created by misono on 2021/11/15.
//  Copyright © 2021 kawasemi081. All rights reserved.
//

import SwiftUI

struct ControlsView: View {
    @ObservedObject var particleSystem: ParticleSystem
    
    var body: some View {
        Form {
            Section {
                Stepper("Birth rate: \(particleSystem.birthRate, specifier: "%.0f")",
                        value: $particleSystem.birthRate,
                        in: 5...500,
                        step: 5)
                Stepper("Lifetime: \(particleSystem.lifetime / 100, specifier: "%g")",
                        value: $particleSystem.lifetime,
                        in: 25...10000,
                        step: 25)
                Stepper("Lifetime Range: \(particleSystem.lifetimeRange / 100, specifier: "%g")",
                        value: $particleSystem.lifetimeRange,
                        in: 25...10000,
                        step: 25)
            } header: {
                Text("Creation")
            }
            
            Section {
                HStack {
                    Stepper("X: \(particleSystem.xPosition, specifier: "%g")%",
                            value: $particleSystem.xPosition,
                            in: -20...120,
                            step: 5)
                    Spacer(minLength: 50)
                    Stepper("Range: \(particleSystem.xPositionRange, specifier: "%g")%",
                            value: $particleSystem.xPositionRange,
                            in: 0...100,
                            step: 5)
                }
                
                HStack {
                    Stepper("Y: \(particleSystem.yPosition, specifier: "%g")%",
                            value: $particleSystem.yPosition,
                            in: -20...120,
                            step: 5)
                    Spacer(minLength: 50)
                    Stepper("Range: \(particleSystem.yPositionRange, specifier: "%g")%",
                            value: $particleSystem.yPositionRange,
                            in: 0...100,
                            step: 5)
                }
            } header: {
                Text("Position")
            }
            
            Section {
                Stepper("Base: \(particleSystem.speed, specifier: "%g")",
                        value: $particleSystem.speed)
                Stepper("Range: \(particleSystem.speedRange, specifier: "%g")",
                        value: $particleSystem.speedRange, in: 0...1000)
            } header: {
                Text("Speed")
            }
            
            Section {
                Stepper("Base: \(particleSystem.angle, specifier: "%g")°",
                        value: $particleSystem.angle,
                        in: 0...360,
                        step: 5)
                Stepper("Range: \(particleSystem.angleRange, specifier: "%g")°",
                        value: $particleSystem.angleRange,
                        in: 0...360,
                        step: 5)
            } header: {
                Text("Angle")
            }
            
            Section {
                Stepper("Base: \(particleSystem.scale, specifier: "%g")",
                        value: $particleSystem.scale,
                        in: 5...1000,
                        step: 5)
                Stepper("Range: \(particleSystem.scaleRange, specifier: "%g")",
                        value: $particleSystem.scaleRange,
                        in: 0...1000,
                        step: 5)
                Stepper("Speed: \(particleSystem.scaleSpeed, specifier: "%g")",
                        value: $particleSystem.scaleSpeed,
                        in: -100...100,
                        step: 1)
            } header: {
                Text("Scale")
            }
            
            Section {
                Stepper("Base: \(particleSystem.opacity, specifier: "%g")%",
                        value: $particleSystem.opacity,
                        in: 0...100,
                        step: 5)
                Stepper("Range: \(particleSystem.opacityRange, specifier: "%g")%",
                        value: $particleSystem.opacityRange,
                        in: 0...100,
                        step: 5)
                Stepper("Speed: \(particleSystem.opacitySpeed, specifier: "%g")",
                        value: $particleSystem.opacitySpeed,
                        in: -100...100,
                        step: 1)
            } header: {
                Text("Opacity")
            }
            
            Section {
                Stepper("Base: \(particleSystem.rotation, specifier: "%g")°",
                        value: $particleSystem.rotation,
                        in: 0...360,
                        step: 5)
                Stepper("Range: \(particleSystem.rotationRange, specifier: "%g")°",
                        value: $particleSystem.rotationRange,
                        in: 0...360,
                        step: 5)
                Stepper("Speed: \(particleSystem.rotationSpeed, specifier: "%g")",
                        value: $particleSystem.rotationSpeed,
                        in: -100...100,
                        step: 1)
            } header: {
                Text("Rotation")
            }
            
            Toggle("Blend overlapping particles", isOn: $particleSystem.enableBlending)
        }
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView(particleSystem: ParticleSystem())
    }
}
