import UIKit
import Firebase
import FirebaseFirestore

class Password: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var passIn: UITextField!
    @IBOutlet weak var letsGo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tap)
        
        letsGo.layer.cornerRadius = 7.0
    }
    
    @IBAction func letsGoTapped(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            showError(error: error!)
        }
        
        else {
            let cleanEmail = Email.Constants.email
            let cleanPassword = passIn.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
            Auth.auth().createUser(withEmail: cleanEmail, password: cleanPassword) { (result, err) in
                if err != nil {
                    self.showError(error: "There was an error in creating your account.")
                }
        
                else {
                    self.performSegue(withIdentifier: "toHome", sender: self)
                }
            }
        }
    }
    
    
    func validateFields() -> String? {
        if passIn.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
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
