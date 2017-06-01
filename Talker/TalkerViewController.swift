import UIKit

class TalkerViewController: UIViewController {
    @IBOutlet weak var textField: UITextField?
    @IBOutlet weak var button: UIButton?
    @IBOutlet weak var talkBackLabel: UILabel?
    @IBOutlet weak var settingsButton: UIButton?

    var talker = Talker()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func showAlert() {
        let alertController = UIAlertController(title: "Need text", message: "Please enter some text to speak", preferredStyle: .alert)

        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)

        present(alertController, animated: true, completion: nil)
    }

    @IBAction func onTap() {
        talkBackLabel?.text = textField?.text

        // This is a good, safe way to unwrap optionals
        if let userWords = textField?.text {
            talker.say(words: userWords)
        } else {
            showAlert()
        }
    }


}

