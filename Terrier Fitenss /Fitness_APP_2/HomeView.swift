import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view

        }
    
    
    @IBOutlet weak var Weight: UITextField!
    @IBOutlet weak var Height: UITextField!
    @IBOutlet weak var textfieldbmi: UILabel!
    @IBAction func BMIbutton(_ sender: Any) {
        if let name = textfieldbmi.text {
            var weight = Double(Weight.text!)
            if let name1 = Height.text {
                 var heightvar  = Double(Height.text!)
                 heightvar! = heightvar! * heightvar!
                 var height =  (703 * weight!) / heightvar!
                textfieldbmi.text! = "BMI is: " + String(format: "%.1f", height)
               
             }
            
        }
    }
    
}
