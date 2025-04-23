// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

public struct CTRating2: View {
    
    var maxRating: Int
    @Binding var currentRating: Int
    var width: Int
    var color: Color
    var ratingImage: RatingImage
    
    /// Only two required parameters are maxRating and the binding to currentRating. All other parameters have default values
    /// - Parameters:
    ///   - maxRating: The maximum rating on the scale
    ///   - currentRating: A binding to the current rating variable
    ///   - width: The width of the image used for the rating (Default = 20)
    ///   - color: The color of the image (Default = systemYellow)
    ///   - ratingImage: An enum representation of the image for the rating (Default = star)
    public init(maxRating: Int,
                currentRating: Binding<Int>,
                width: Int = 20,
                color: Color = Color(.systemYellow),
                ratingImage: RatingImage = .star) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.color = color
        self.ratingImage = ratingImage
    }
    
    public var body: some View {
        HStack {
            ForEach(0..<maxRating) { rating in
                correctImage(for: rating)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(color))
                    .onTapGesture {
                        self.currentRating = rating + 1
                    }
            }
        }.frame(width: CGFloat(maxRating * width))
    }
    
    func correctImage(for rating: Int) -> Image {
        if rating < currentRating {
            return ratingImage.fillImage
        } else {
            return ratingImage.openImage
        }
    }
}

#Preview {
    CTRating2(maxRating: 5, currentRating: .constant(3))
}
