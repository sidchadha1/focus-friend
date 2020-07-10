import UIKit
import Firebase
import FirebaseFirestore

class Subject: UIViewController {
    
    struct SubjectList {
        static var myTempData = [String()]
        static var myTempTime = [String()]
        static var myTempBreak = [String()]
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var myData = SubjectList.myTempData
    var myTime = SubjectList.myTempTime
    var myBreak = SubjectList.myTempBreak
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        add.layer.cornerRadius = 7.0
        nextButton.layer.cornerRadius = 7.0
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func addTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toAddSubjects", sender: self)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        let subjectDoc = db.collection("subjects").document(Email.Constants.email)
        subjectDoc.setData(["Subjects": myData, "Times": myTime, "Breaks": myBreak])
        self.performSegue(withIdentifier: "toQuestionOne", sender: self)
    }
    
}

extension Subject: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.label?.text = myData[indexPath.row]
        return cell
    }
}
