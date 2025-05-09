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
    /// - Rating start count
    let ratingValue: Double
    let foregroundColor: Color
    let width: CGFloat
    let starCount: Int
    
    public init(ratingValue: Double, foregroundColor: Color = .yellow, width: CGFloat = 15, startCount: Int = 5) {
        self.ratingValue = ratingValue
        self.foregroundColor = foregroundColor
        self.width = width
        self.starCount = startCount
    }

    public var body: some View {
        HStack {
            ForEach(0..<starCount, id:\.self) { index in
                Image(systemName: imageName(for: index, ratingValue: ratingValue))
                    .resizable()
                    .scaledToFit()
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
    StaticRatingsView(ratingValue: 4, foregroundColor: .yellow, width: 50, startCount: 10)
}
