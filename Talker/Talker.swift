import Foundation
import AVFoundation

class Talker {
    func say(words: String) {
        let synth = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: words)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        
        synth.speak(utterance)
    }
}
