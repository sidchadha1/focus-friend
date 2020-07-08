import UIKit

class Intro: UIViewController {
    
    override func viewDidLoad() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        self.performSegue(withIdentifier: "toGreet", sender: self)
    }
}
