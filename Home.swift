import UIKit

class Home: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text? = Name.Constants.firstName
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        self.performSegue(withIdentifier: "toSubject", sender: self)
    }
    
}
