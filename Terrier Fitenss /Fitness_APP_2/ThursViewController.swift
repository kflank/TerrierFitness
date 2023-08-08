//
//  ViewController.swift
//  Fitness_APP_2
//
import UIKit

class ThursViewController: UIViewController {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var myInput: UITextField!
    @IBOutlet weak var myList: UITableView!
    @IBOutlet weak var setsRepsToggle: UISwitch!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    
    let backList = ["Pull ups", "Chin ups", "Deadlifts", "One arm dumbbell row"].shuffled()
    var backIndex = 0
    
    let chestList = ["Bench Press","incline Bench Press", "declined dumbell fly", "cable chest press", "pushups","floor press", "declined bench press","inclined dumbell press"].shuffled()
    var chestIndex = 0
    
    let bicepsList = ["Chin ups", "Barbell curls", "Dumbbell curls", "Zottman curls", "Hammer curls"].shuffled()
    var bicepsIndex = 0
    
    let tricepsList = ["Dips", "Narrow-grip bench press", "Dumbbell extensions", "Skull crushers", "Kickbacks"].shuffled()
    var tricepsIndex = 0
    
    let shouldersList = ["Overhead press", "Overhead dumbbell press", "Facepulls", "Side raises", "Front raises"].shuffled()
    var shouldersIndex = 0
    
    let legsList = ["medicine ball squat","walking lunge","glute bridges","lateral band walk","stadning calf raise","squats","hack squats", "leg extensions", "RDL","leg curls","hex bar deadlifts","bulgarian split sqauts","box jumps","pistol squats"].shuffled()
    var legsIndex = 0
    
    let coreList = ["plank","side plank","crunches","situps","bicycles","russian twists","hollow holds","ab roller","hanging leg raise"].shuffled()
    var coreIndex = 0

    let cardioList = ["Running", "Cycling", "Elliptical", "Treadmill", "Jumping jacks", "Jump rope","swimming"].shuffled()
    var cardioIndex = 0
    
    let stringArraySaved = UserDefaults.standard.object(forKey: "thursUserInputs") as? [String] ?? [String]()
    
    var stringArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        if stringArraySaved.count > 0 {
            stringArray = stringArraySaved
        }
    }
    
    @IBAction func setsStepper(_ sender: UIStepper) {
        setsLabel.text = Int(sender.value).description + " Sets"
    }
    
    @IBAction func repsStepper(_ sender: UIStepper) {
        repsLabel.text = Int(sender.value).description + " Reps"
    }
    
    @IBAction func backAdd(_ sender: Any) {
        if backIndex <= (backList.count - 1) {
            myInput.text = backList[backIndex]
            backIndex += 1
        }
    }
    
    @IBAction func chestAdd(_ sender: Any) {
        if chestIndex <= (chestList.count - 1) {
            myInput.text = chestList[chestIndex]
            chestIndex += 1
        }
    }
    
    @IBAction func bicepsAdd(_ sender: Any) {
        if bicepsIndex <= (bicepsList.count - 1) {
            myInput.text = bicepsList[bicepsIndex]
            bicepsIndex += 1
        }
    }
    
    @IBAction func tricepsAdd(_ sender: Any) {
        if tricepsIndex <= (tricepsList.count - 1) {
            myInput.text = tricepsList[tricepsIndex]
            tricepsIndex += 1
        }
    }
    
    @IBAction func shouldersAdd(_ sender: Any) {
        if shouldersIndex <= (shouldersList.count - 1) {
            myInput.text = shouldersList[shouldersIndex]
            shouldersIndex += 1
        }
    }
    
    @IBAction func legsAdd(_ sender: Any) {
        if legsIndex <= (legsList.count - 1) {
            myInput.text = legsList[legsIndex]
            legsIndex += 1
        }
    }
    
    @IBAction func coreAdd(_ sender: Any) {
        if coreIndex <= (coreList.count - 1) {
            myInput.text = coreList[coreIndex]
            coreIndex += 1
        }
    }
    
    @IBAction func cardioAdd(_ sender: Any) {
        if cardioIndex <= (cardioList.count - 1) {
            myInput.text = cardioList[cardioIndex]
            cardioIndex += 1
        }
    }
    
    @IBAction func tapAddButton(_ sender: Any) {
        if var txt = myInput.text, !txt.isEmpty {
            if setsRepsToggle.isOn {
                txt += " - " + setsLabel.text! + ", " + repsLabel.text!
            }
            self.stringArray.insert(txt, at: 0)
            myList.beginUpdates()
            myList.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
            myList.endUpdates()
            
            myInput.text = nil
        }
        else {
            let alert = UIAlertController(title: "Enter an exercise!", message: "Type in your own exercise or tap the kind of exercise you want.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        UserDefaults.standard.set(stringArray, forKey: "thursUserInputs")
    }
    
    @IBAction func tapDeleteButton(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: myList)
        guard let indexpath = myList.indexPathForRow(at: point) else {return}
        stringArray.remove(at: indexpath.row)
        myList.beginUpdates()
        myList.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .fade)
        myList.endUpdates()
        UserDefaults.standard.set(stringArray, forKey: "thursUserInputs")
    }
    
}

extension ThursViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myList.dequeueReusableCell(withIdentifier: "EditTableViewCell", for: indexPath) as? EditTableViewCell else {return UITableViewCell()}
        cell.labelText.text = stringArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
