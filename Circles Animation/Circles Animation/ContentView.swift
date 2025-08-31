//
//  ContentView.swift
//  Circles Animation
//
//  Created by Emilie on 30/08/2025.
//
import SwiftUI

struct ContentView: View {
    @State private var offset: CGFloat = -130
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ZStack {
                ForEach(0..<20) { i in
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.cyan)
                        .offset(y: offset)
                        .animation(.easeInOut(duration: 0.5)
                            .repeatForever(autoreverses: true)
                            .delay(0.5 * Double(i)), value: offset)
                        .rotationEffect(.degrees((360/20) * Double(i)))
                }
                
                ForEach(0..<20) { i in
                    Circle()
                        .frame(width: 5, height: 5)
                        .foregroundColor(.cyan)
                        .offset(y: offset + 60)
                        .animation(.easeInOut(duration: 0.5)
                            .repeatForever(autoreverses: true)
                            .delay(0.5 * Double(i)), value: offset)
                        .rotationEffect(.degrees((360/20) * Double(i)))
                }
            }
            .rotationEffect(.degrees(rotation))
            .animation(.linear(duration: 5)
                .repeatForever(autoreverses: false), value: rotation)
            
        }
        .onAppear {
            offset += 30
            rotation = 360
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
