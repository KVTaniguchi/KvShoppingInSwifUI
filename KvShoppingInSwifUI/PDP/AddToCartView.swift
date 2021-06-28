import SwiftUI

struct AddToCartView: View {
    var quantity: Int
    @State private var shouldShow = true
    
    // if cart has item, show added
    // else when press add to cart
    // show an animation
    
    var body: some View {
        HStack {
            if shouldShow {
                Text("Added ").transition(.opacity)
            }
            Button("Add To Cart") {
                withAnimation(.easeInOut(duration: 3.0)) {
                    self.shouldShow.toggle()
                }
            }
        }
    }
}
