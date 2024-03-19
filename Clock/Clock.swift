//
//  Indicators.swift
//  Clock
//
//  Created by Damiaan Dufaux on 19/03/2024.
//

import SwiftUI

struct Indicators: View {
    let date: Date
    
    var body: some View {
        GeometryReader { proxy in
            ForEach(0 ..< seconds, id: \.self) { index in
                Capsule()
                    .frame(width: 3, height: 16)
                    .position(x: proxy.size.width/2, y: 16)
                    .rotationEffect(.degrees(Double(index) * 6))
            }
            ForEach(seconds ..< 60, id: \.self) { index in
                Capsule()
                    .stroke(style: .init())
                    .frame(width: 3, height: 16)
                    .position(x: proxy.size.width/2, y: 16)
                    .rotationEffect(.degrees(Double(index) * 6))
            }
            VStack {
                Text("\(date, format: .dateTime.hour().minute().second())")
                    .font(.system(size: proxy.size.width/5.5))
                Text("\(date, format: .dateTime.day().month(.wide).year())")
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }.aspectRatio(1, contentMode: .fit)
    }
    
    var seconds: Int {
        Int(date.timeIntervalSinceReferenceDate) % 60
    }
}

#Preview {
    Indicators(date: Date())
}
