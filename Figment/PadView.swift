import SwiftUI

struct PadView: View {
    let pad: Pad
    let action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Rectangle()
            // TODO: Refactor. 'foregroundColor' will be deprecated in a future version of iOS: renamed to 'foregroundStyle(_:)'
            .foregroundColor(isPressed ? Color.orange.opacity(0.8) : Color.orange.opacity(0.4))
            .cornerRadius(12)
            .overlay(Text(pad.displayName).font(.caption).foregroundColor(.white))
            .onTapGesture {
                isPressed = true
                action()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isPressed = false
                }
            }
    }
}
