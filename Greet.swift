import UIKit

class Greet: UIViewController {
    
    @IBOutlet weak var signUpLabel: UIButton!
    @IBOutlet weak var logInLabel: UIButton!
    @IBOutlet weak var caption: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpLabel.layer.cornerRadius = 7.0
        logInLabel.layer.cornerRadius = 7.0
        
        caption?.alpha = 0.0
        UIView.animate(withDuration: 1.5, delay: 0.5, options: .curveEaseIn, animations: {
            self.caption?.alpha = 1.0
        })
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toName", sender: self)
    }
    
    @IBAction func logInTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toLogIn", sender: self)
    }
    
}
