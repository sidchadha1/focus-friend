import UIKit
import Firebase
import FirebaseFirestore

class Subject: UIViewController {
    
    struct SubjectStruct {
        static var mySubjects = [String()]
        static var myTimes = [String()]
        static var myBreaks = [String()]
        static var myUID = String()
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = 7.0
        nextButton.layer.cornerRadius = 7.0
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView?.rowHeight = 40.0
    }
    
    @IBAction func addTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toAddSubjects", sender: self)
    }
    
    
    @IBAction func nextTapped(_ sender: Any) {
        
        let cleanEmail = Email.Constants.email
        
        let subjectDoc = self.db.collection("subjects").document()
        subjectDoc.setData(["subjectArray": SubjectStruct.mySubjects, "timeArray": SubjectStruct.myTimes, "breakArray": SubjectStruct.myBreaks], merge: true)
        
        let user = self.db.collection("users").document(cleanEmail)
        user.setData(["subjectUID": subjectDoc.documentID], merge: true)
        
        self.performSegue(withIdentifier: "toQuestionOne", sender: self)
    }
}

extension Subject: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SubjectStruct.mySubjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        if cell.label.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            cell.alpha = 0.0
        }
        cell.label.text? = SubjectStruct.mySubjects[indexPath.row]
        return cell
    }
}
