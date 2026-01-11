//  Refactored code based on ChatGPT chat:
//  https://chatgpt.com/c/694c6e67-8b78-832d-a6c9-e332ab5606ce

import AudioKit
import AVFoundation
import Combine

@MainActor
class InstrumentEngine: ObservableObject {
    private var engine = AudioEngine()
    private var mixer = Mixer();
    private var players: [String: AudioPlayer] = [:]

    init() {
        setupAudio()
    }
    
    private func setupAudio() {
        loadSamples()
        engine.output = mixer
        
        do {
            try engine.start()
        } catch {
            print("AudioKit failed to start:", error)
        }
    }

    private func loadSamples() {
        let pads = defaultPads
        
        for pad in pads {
            guard let url = Bundle.main.url(
                forResource: pad.sampleName,
                withExtension: "wav"
            ) else {
                print("Missing sample", pad.sampleName)
                continue
            }
            
            do {
                let file = try AVAudioFile(forReading: url)
                guard let player = AudioPlayer(file: file) else {
                    print("AudioPlayer failed to init for:", pad.sampleName)
                    continue
                }
                
                player.isLooping = false
                mixer.addInput(player)
                players[pad.sampleName] = player
                
            } catch {
                print("Failed loading sample", pad.sampleName, error)
            }
        }
    }

    func play(_ pad: Pad) {
        guard let player = players[pad.sampleName] else { return }
        
        player.stop()   // retrigger cleanly
        player.play()
    }
}
