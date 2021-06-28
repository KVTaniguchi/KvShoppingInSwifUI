import SwiftUI

struct QuantityPicker: View {
    @State private var revealDetails = false
    @Binding var quantity: Int
    
    var body: some View {
        DisclosureGroup("Quantity: \(quantity)", isExpanded: $revealDetails) {
            Picker(selection: $quantity, label: Text("Please choose a quantity")) {
                ForEach(0 ..< 10) {
                   Text("\($0)")
                }
            }
        }
    }
}
