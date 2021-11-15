//
//  ContentView.swift
//  Fireworks
//
//  Created by kawasemi081on 2021/11/15.
//

import SwiftUI

struct ContentView: View {
    @StateObject var particleSystem = ParticleSystem()
    
    var body: some View {
        HStack {
            EmitterView(particleSystem: particleSystem)
                .ignoresSafeArea()
                .background(.black)
            ControlsView(particleSystem: particleSystem)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
