import UIKit

class MusicDetails: UIViewController {
    
    struct MusicList {
        static var myMusicList = [String()]
    }
    
    @IBOutlet weak var hipHopButton: UIButton!
    @IBOutlet weak var popButton: UIButton!
    @IBOutlet weak var countryButton: UIButton!
    @IBOutlet weak var jazzButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var metalButton: UIButton!
    @IBOutlet weak var classicalButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    
    var hipHopBoolean: Bool = false
    var popBoolean: Bool = false
    var countryBoolean: Bool = false
    var jazzBoolean: Bool = false
    var rockBoolean: Bool = false
    var metalBoolean: Bool = false
    var classicalBoolean: Bool = false
    
    var lightGray: UIColor = .lightGray
    var darkGray: UIColor = .darkGray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hipHopButton.layer.cornerRadius = 7.0
        popButton.layer.cornerRadius = 7.0
        countryButton.layer.cornerRadius = 7.0
        jazzButton.layer.cornerRadius = 7.0
        rockButton.layer.cornerRadius = 7.0
        metalButton.layer.cornerRadius = 7.0
        classicalButton.layer.cornerRadius = 7.0
        enterButton.layer.cornerRadius = 7.0
    }
    
    @IBAction func hipHopTapped(_ sender: Any) {
        if hipHopBoolean == false {
            hipHopButton.backgroundColor = darkGray
            hipHopBoolean = true
            MusicList.myMusicList.append("Hip Hop")
        }
        
        else {
            hipHopButton.backgroundColor = lightGray
            hipHopBoolean = false
            
            var const = 0
            for (index, music) in MusicList.myMusicList.enumerated() {
                if music == "Metal" {
                    const = index
                }
            }
            
            MusicList.myMusicList.remove(at: const)
        }
    }
    
    @IBAction func popTapped(_ sender: Any) {
        if popBoolean == false {
            popButton.backgroundColor = darkGray
            popBoolean = true
            MusicList.myMusicList.append("Pop")
        }
        
        else {
            popButton.backgroundColor = lightGray
            popBoolean = false
            
            var const = 0
            for (index, music) in MusicList.myMusicList.enumerated() {
                if music == "Pop" {
                    const = index
                }
            }
            
            MusicList.myMusicList.remove(at: const)
        }
    }
    
    @IBAction func countryTapped(_ sender: Any) {
        if countryBoolean == false {
            countryButton.backgroundColor = darkGray
            countryBoolean = true
            MusicList.myMusicList.append("Country")
        }
        
        else {
            countryButton.backgroundColor = lightGray
            countryBoolean = false
            
            var const = 0
            for (index, music) in MusicList.myMusicList.enumerated() {
                if music == "Country" {
                    const = index
                }
            }
            
            MusicList.myMusicList.remove(at: const)
        }
    }
    
    @IBAction func jazzTapped(_ sender: Any) {
        if jazzBoolean == false {
            jazzButton.backgroundColor = darkGray
            jazzBoolean = true
            MusicList.myMusicList.append("Jazz")
        }
        
        else {
            jazzButton.backgroundColor = lightGray
            jazzBoolean = false
            
            var const = 0
            for (index, music) in MusicList.myMusicList.enumerated() {
                if music == "Jazz" {
                    const = index
                }
            }
            
            MusicList.myMusicList.remove(at: const)
        }
    }
    
    @IBAction func rockTapped(_ sender: Any) {
        if rockBoolean == false {
            rockButton.backgroundColor = darkGray
            rockBoolean = true
            MusicList.myMusicList.append("Rock")
        }
        
        else {
            rockButton.backgroundColor = lightGray
            rockBoolean = false
            
            var const = 0
            for (index, music) in MusicList.myMusicList.enumerated() {
                if music == "Rock" {
                    const = index
                }
            }
            
            MusicList.myMusicList.remove(at: const)
        }
    }
    
    @IBAction func metalTapped(_ sender: Any) {
        if metalBoolean == false {
            metalButton.backgroundColor = darkGray
            metalBoolean = true
            MusicList.myMusicList.append("Metal")
        }
        
        else {
            metalButton.backgroundColor = lightGray
            metalBoolean = false
            
            var const = 0
            for (index, music) in MusicList.myMusicList.enumerated() {
                if music == "Metal" {
                    const = index
                }
            }
            
            MusicList.myMusicList.remove(at: const)
        }
    }
    
    @IBAction func classicalTapped(_ sender: Any) {
        if classicalBoolean == false {
            classicalButton.backgroundColor = darkGray
            classicalBoolean = true
            MusicList.myMusicList.append("Classical")
        }
        
        else {
            classicalButton.backgroundColor = lightGray
            classicalBoolean = false
            
            var const = 0
            for (index, music) in MusicList.myMusicList.enumerated() {
                if music == "Classical" {
                    const = index
                }
            }
            
            MusicList.myMusicList.remove(at: const)
        }
    }
    
    @IBAction func enterTapped(_ sender: Any) {
        QuestionOne.QuestionOneData.MusicList = MusicList.myMusicList
        self.dismiss(animated: true, completion: nil)
        //self.performSegue(withIdentifier: "backQuestionOneTwo", sender: self)
    }
}
