import SwiftUI

struct PadsGridView: View {
    @ObservedObject var engine: InstrumentEngine
    
    private var pads: [Pad] {
        // Repeat your four pads to make 16 for now (simple placeholder)
        Array(repeating: defaultPads, count: 4).flatMap { $0 }
    }
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 4), spacing: 12) {
            ForEach(pads) { pad in
                PadView(pad: pad) {
                    engine.play(pad)
                }
                .frame(height: 80) // TODO: adjust later for phone ergonomics
            }
        }
        .padding()
    }
}
