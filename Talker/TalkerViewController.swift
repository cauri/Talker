import UIKit

class TalkerViewController: UIViewController {
    @IBOutlet weak var textView: UITextView?
    @IBOutlet weak var button: UIButton?
    @IBOutlet weak var talkBackLabel: UILabel?
    @IBOutlet weak var settingsButton: UIButton?

    var talker = Talker()

    override func viewDidLoad() {
        super.viewDidLoad()

        textView?.layer.borderWidth = 1.0
        textView?.layer.borderColor = UIColor.black.cgColor
        textView?.layer.cornerRadius = 10
    }

    func showEmptyTextAlert() {
        let alertController = UIAlertController(title: "Need text", message: "Please enter some text to speak", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(defaultAction)

        present(alertController, animated: true, completion: nil)
    }

    @IBAction func onTap() {
        talkBackLabel?.text = textView?.text

        // This is a good, safe way to unwrap optionals
        if let userWords = textView?.text {
            talker.say(words: userWords)
            if userWords == "" {
                showEmptyTextAlert()
            }
        } else {
            showEmptyTextAlert()
        }
    }
}

