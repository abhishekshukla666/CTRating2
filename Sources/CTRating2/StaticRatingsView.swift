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
    let ratingValue: Double
    let foregroundColor: Color
    
    public init(ratingValue: Double, foregroundColor: Color = .yellow) {
        self.ratingValue = ratingValue
        self.foregroundColor = foregroundColor
    }

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<5) { index in
                Image(systemName: imageName(for: index, ratingValue: ratingValue))
                    .foregroundColor(foregroundColor)
            }
        }
    }
    
    func imageName(for starIndex: Int, ratingValue: Double) -> String {
        if ratingValue >= Double(starIndex + 1) {
            return "star.fill"
        } else if ratingValue >= Double(starIndex) + 0.5 {
            return "star.leadinghalf.filled"
        } else {
            return "star"
        }
        
    }
}

#Preview {
    StaticRatingsView(ratingValue: 3.5, foregroundColor: .yellow)
}
