import UIKit
import Firebase
import FirebaseFirestore

class Name: UIViewController {
    
    struct Constants {
        static var firstName = String()
    }
    
    @IBOutlet weak var firstNameIn: UITextField!
    @IBOutlet weak var goButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        goButton.layer.cornerRadius = 7.0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tap)
    }

    @IBAction func goTapped(_ sender: Any) {
        let error = validateFields()

        if error != nil {
            showError(error: error!)
        }

        else {
            let cleanFirstName = firstNameIn.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Constants.firstName = cleanFirstName

            self.performSegue(withIdentifier: "toEmail", sender: self)
        }
    }
    
    func validateFields() -> String? {
        if firstNameIn.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return ("Please fill in all fields!")
        }

        return nil
    }

    func showError(error: String) {

    }

    @objc func handleTap() {
        view.endEditing(true)
    }
}
