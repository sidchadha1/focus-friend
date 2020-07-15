import UIKit
import Firebase
import FirebaseFirestore

class QuestionOne: UIViewController {
    
    struct QuestionOneData {
        static var MusicList = [String()]
        static var StudySettingList = [String()]
        static var OtherFactor = String()
        
        static var musicBoolean = false
        static var coloredPensBoolean = false
        static var studySettingBoolean = false
        static var noNearbyDevicesBoolean = false
        static var pacingBoolean = false
        static var otherBoolean = false
    }
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var musicButton: UIButton!
    @IBOutlet weak var coloredPensButton: UIButton!
    @IBOutlet weak var studySettingButton: UIButton!
    @IBOutlet weak var noNearbyDevicesButton: UIButton!
    @IBOutlet weak var pacingButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let darkGray: UIColor = .darkGray
    let lightGray: UIColor = .lightGray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicButton.layer.cornerRadius = 7.0
        coloredPensButton.layer.cornerRadius = 7.0
        studySettingButton.layer.cornerRadius = 7.0
        noNearbyDevicesButton.layer.cornerRadius = 7.0
        pacingButton.layer.cornerRadius = 7.0
        otherButton.layer.cornerRadius = 7.0
        nextButton.layer.cornerRadius = 7.0
        
        if QuestionOneData.musicBoolean == true {
            musicButton.backgroundColor = darkGray
        }
        
        if QuestionOneData.coloredPensBoolean == true {
            coloredPensButton.backgroundColor = darkGray
        }
        
        if QuestionOneData.studySettingBoolean == true {
            studySettingButton.backgroundColor = darkGray
        }
        
        if QuestionOneData.noNearbyDevicesBoolean == true {
            noNearbyDevicesButton.backgroundColor = darkGray
        }
        
        if QuestionOneData.pacingBoolean == true {
            pacingButton.backgroundColor = darkGray
        }
        
        if QuestionOneData.otherBoolean == true {
            otherButton.backgroundColor = darkGray
        }
    }
    
    @IBAction func musicTapped(_ sender: Any) {
        if QuestionOneData.musicBoolean == false {
            QuestionOneData.musicBoolean = true
            musicButton.backgroundColor = .darkGray
            self.performSegue(withIdentifier: "toMusicDetails", sender: self)
        }
        
        else {
            QuestionOneData.musicBoolean = false
            musicButton.backgroundColor = .lightGray
        }
    }
    
    @IBAction func coloredPensTapped(_ sender: Any) {
        if QuestionOneData.coloredPensBoolean == false {
            QuestionOneData.coloredPensBoolean = true
            coloredPensButton.backgroundColor = .darkGray
        }
        
        else {
            QuestionOneData.coloredPensBoolean = false
            coloredPensButton.backgroundColor = .lightGray
        }
    }
    
    @IBAction func studySettingTapped(_ sender: Any) {
        if QuestionOneData.studySettingBoolean == false {
            QuestionOneData.studySettingBoolean = true
            studySettingButton.backgroundColor = .darkGray
            self.performSegue(withIdentifier: "toStudySettingDetails", sender: self)
        }
        
        else {
            QuestionOneData.studySettingBoolean = false
            studySettingButton.backgroundColor = .lightGray
        }
    }
    
    @IBAction func noNearbyDevicesTapped(_ sender: Any) {
        if QuestionOneData.noNearbyDevicesBoolean == false {
            QuestionOneData.noNearbyDevicesBoolean = true
            noNearbyDevicesButton.backgroundColor = .darkGray
        }
        
        else {
            QuestionOneData.noNearbyDevicesBoolean = false
            noNearbyDevicesButton.backgroundColor = .lightGray
        }
    }
    
    @IBAction func pacingTapped(_ sender: Any) {
        if QuestionOneData.pacingBoolean == false {
            QuestionOneData.pacingBoolean = true
            pacingButton.backgroundColor = .darkGray
        }
        
        else {
            QuestionOneData.pacingBoolean = false
            pacingButton.backgroundColor = .lightGray
        }
    }
    
    @IBAction func otherTapped(_ sender: Any) {
        if QuestionOneData.otherBoolean == false {
            QuestionOneData.otherBoolean = true
            otherButton.backgroundColor = .darkGray
            self.performSegue(withIdentifier: "toOtherDetails", sender: self)
        }
        
        else {
            QuestionOneData.otherBoolean = false
            otherButton.backgroundColor = .lightGray
        }
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
        let cleanEmail = Email.Constants.email
        
        let user = self.db.collection("factors").document(cleanEmail)
        user.setData(["music": QuestionOneData.MusicList, "coloredPens": QuestionOneData.coloredPensBoolean, "studySetting": QuestionOneData.StudySettingList, "noNearbyDevices": QuestionOneData.noNearbyDevicesBoolean, "constantPacing": QuestionOneData.pacingBoolean, "other": QuestionOneData.OtherFactor])
        
        self.performSegue(withIdentifier: "toThanks", sender: self)
    }
    
}
