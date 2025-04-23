How to use it?

import SwiftUI
import CTRating2

struct ContentView: View {
    
    @State private var currentRating = 0
    
    var body: some View {
        VStack {
            Text("My Ratings!")
                .foregroundStyle(.secondary)
            CTRating2(maxRating: 5,
                      currentRating: $currentRating, width: 40, color: .red, ratingImage: .custom)
        }
    }
}

#Preview {
    ContentView()
}
