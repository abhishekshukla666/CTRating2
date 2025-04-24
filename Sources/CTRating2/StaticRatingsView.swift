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
    /// - width: The width of the rating stars
    let ratingValue: Double
    let foregroundColor: Color
    let width: CGFloat
    
    public init(ratingValue: Double, foregroundColor: Color = .yellow, width: CGFloat = 50) {
        self.ratingValue = ratingValue
        self.foregroundColor = foregroundColor
        self.width = width
    }

    public var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: imageName(for: index, ratingValue: ratingValue))
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(foregroundColor)
                    
            }
        }
        .frame(width: width * ratingValue)
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
    StaticRatingsView(ratingValue: 3.5, foregroundColor: .yellow, width: 100)
}
