import UIKit

class AddSubjects: UIViewController {
    
    struct Subjects {
        static var enteredSubject = String()
    }
    
    @IBOutlet weak var subjectIn: UITextField!
    @IBOutlet weak var backButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.layer.cornerRadius = 7.0
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "back", sender: self)
    }
    
}
