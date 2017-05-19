import UIKit
import AVFoundation

class TalkerViewController: UIViewController {
    @IBOutlet weak var textField: UITextField?
    @IBOutlet weak var button: UIButton?
    @IBOutlet weak var talkBackLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onTap() {
        talkBackLabel?.text = textField?.text
        
        let synth = AVSpeechSynthesizer()
        
        // This is a good, safe way to unwrap optionals
        if let words = textField?.text {
            let utterance = AVSpeechUtterance(string: words)
            //        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            
            synth.speak(utterance)
        } else {
            // report that the optional had `nil`
        }
    }
}

