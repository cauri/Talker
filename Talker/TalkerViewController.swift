import UIKit

class TalkerViewController: UIViewController {
    @IBOutlet weak var textField: UITextField?
    @IBOutlet weak var button: UIButton?
    @IBOutlet weak var talkBackLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onTap() {
        talkBackLabel?.text = textField?.text
    }
}

