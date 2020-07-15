import UIKit

class StudySettingDetails: UIViewController {
    
    struct StudySettingList {
        static var myStudySettingList = [String()]
    }
    
    @IBOutlet weak var libraryButton: UIButton!
    @IBOutlet weak var bedroomButton: UIButton!
    @IBOutlet weak var familyButton: UIButton!
    @IBOutlet weak var otherTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    var libraryBoolean: Bool = false
    var bedroomBoolean: Bool = false
    var familyBoolean: Bool = false
    var otherBoolean: Bool = false
    
    var lightGray: UIColor = .lightGray
    var darkGray: UIColor = .darkGray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        libraryButton.layer.cornerRadius = 7.0
        bedroomButton.layer.cornerRadius = 7.0
        familyButton.layer.cornerRadius = 7.0
        enterButton.layer.cornerRadius = 7.0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func libraryTapped(_ sender: Any) {
        if libraryBoolean == false {
            libraryButton.backgroundColor = darkGray
            libraryBoolean = true
            StudySettingList.myStudySettingList.append("Library")
        }
        
        else {
            libraryButton.backgroundColor = lightGray
            libraryBoolean = false
            
            var const = 0
            for (index, setting) in StudySettingList.myStudySettingList.enumerated() {
                if setting == "Library" {
                    const = index
                }
            }
            
            StudySettingList.myStudySettingList.remove(at: const)
        }
    }
    
    @IBAction func bedroomTapped(_ sender: Any) {
        if bedroomBoolean == false {
            bedroomButton.backgroundColor = darkGray
            bedroomBoolean = true
            StudySettingList.myStudySettingList.append("Bedroom")
        }
        
        else {
            bedroomButton.backgroundColor = lightGray
            bedroomBoolean = false
            
            var const = 0
            for (index, setting) in StudySettingList.myStudySettingList.enumerated() {
                if setting == "Family Areas" {
                    const = index
                }
            }
            
            StudySettingList.myStudySettingList.remove(at: const)
        }
    }
    
    @IBAction func familyTapped(_ sender: Any) {
        if familyBoolean == false {
            familyButton.backgroundColor = darkGray
            familyBoolean = true
            StudySettingList.myStudySettingList.append("Family Areas")
        }
        
        else {
            familyButton.backgroundColor = lightGray
            familyBoolean = false
            
            var const = 0
            for (index, setting) in StudySettingList.myStudySettingList.enumerated() {
                if setting == "Family Areas" {
                    const = index
                }
            }
            
            StudySettingList.myStudySettingList.remove(at: const)
        }
    }
    
    @IBAction func enterTapped(_ sender: Any) {
        if otherTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            otherBoolean = true
            StudySettingList.myStudySettingList.append(otherTextField.text!)
        }
        QuestionOne.QuestionOneData.StudySettingList = StudySettingList.myStudySettingList
        //self.performSegue(withIdentifier: "backQuestionOneOne", sender: self)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}
