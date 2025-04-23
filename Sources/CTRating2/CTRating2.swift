// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

struct CTRating2: View {
    
    var maxRating: Int
    @Binding var currentRating: Int
    var width: Int
    var color: Color
    var ratingImage: RatingImage
    
    init(maxRating: Int, currentRating: Binding<Int>, width: Int = 20, color: Color = Color(.systemYellow), ratingImage: RatingImage = .star) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.color = color
        self.ratingImage = ratingImage
    }
    
    var body: some View {
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
