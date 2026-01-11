import Foundation

struct Pad: Identifiable {
    let id = UUID()
    let displayName: String
    let sampleName: String
}

let defaultPads: [Pad] = [
    Pad(displayName: "Kick", sampleName: "Kick_Dirt_SP1200_14"),
    Pad(displayName: "Snare", sampleName: "Snare_707_SP1200_04"),
    Pad(displayName: "Hat", sampleName: "Tambo_707_Moog_SP1200_09"),
    Pad(displayName: "Clap", sampleName: "Clap_Disco_2_Short_SP1200_07")
]
