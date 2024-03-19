//
//  ContentView.swift
//  Clock
//
//  Created by Damiaan Dufaux on 19/03/2024.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.TimerPublisher(interval: 0.2, runLoop: .main, mode: .default).autoconnect()
    @State var time = Date()
    
    var body: some View {
        Indicators(date: time)
        .foregroundColor(.red)
        .padding()
        .onReceive(timer) { newTime in time = newTime }
    }
}

#Preview {
    ContentView()
}
