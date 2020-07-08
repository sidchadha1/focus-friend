import UIKit

class Subject: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var myData = ["first", "second", "third"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        add.layer.cornerRadius = 7.0
        nextButton.layer.cornerRadius = 7.0
        
        let nib = UINib(nibName: "Subjects", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Subjects")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func addTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toAddSubjects", sender: self)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Subjects", for: indexPath) as! Subjects
        let cell = tableView.dequeueReusableCell(withIdentifier: "Subjects", for: indexPath) as! Subjects
        cell.label?.text = myData[indexPath.row]
        return cell
    }
    
}
