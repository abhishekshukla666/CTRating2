//
//  StaticRatingsView.swift
//  CTRating2
//
//  Created by Abhishek Shukla on 23/04/25.
//

import SwiftUI

public struct StaticRatingsView: View {
    
    /// Static Rating view(non interactive, show the ratings in decimal
    /// - Parameters:
    /// - value: The decimal value for rating view
    /// - foregroundColor: The foreground color for the rating view
    let value: Double
    var foregroundColor = Color.yellow

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<5) { index in
                Image(systemName: imageName(for: index, value: value))
                    .foregroundColor(foregroundColor)
            }
        }
    }
    
    func imageName(for starIndex: Int, value: Double) -> String {
        if value >= Double(starIndex + 1) {
            return "star.fill"
        } else if value >= Double(starIndex) + 0.5 {
            return "star.leadinghalf.filled"
        } else {
            return "star"
        }
        
    }
}

#Preview {
    StaticRatingsView(value: 3.5, foregroundColor: .yellow)
}
