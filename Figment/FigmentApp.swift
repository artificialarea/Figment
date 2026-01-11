import SwiftUI

@main
struct FigmentApp: App {
    @StateObject private var engine = InstrumentEngine()
    
    var body: some Scene {
        WindowGroup {
            // ContentView()
            PadsGridView(engine: engine)
        }
    }
}
