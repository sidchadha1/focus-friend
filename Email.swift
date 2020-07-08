import UIKit
import Firebase
import FirebaseFirestore

class Email: UIViewController {
    
    struct Constants {
        static var email = String()
    }
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var emailIn: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 7.0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            showError(error: error!)
        }
        
        else {
            let cleanEmail = emailIn.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Constants.email = cleanEmail
            
            let user = db.collection("users").document(cleanEmail)
            user.setData(["firstName": Name.Constants.firstName, "email": cleanEmail])
            
            self.performSegue(withIdentifier: "toPassword", sender: self)
        }
    }
    
    func validateFields() -> String? {
        if emailIn.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
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
