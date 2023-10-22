import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var `Type`: UILabel!
    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet weak var Num1: UILabel!
    @IBOutlet weak var Num2: UILabel!
    @IBOutlet weak var Number1: UITextField!
    @IBOutlet weak var Number2: UITextField!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var Result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Type.text = "Find GCD"
    }
    
    @IBAction func SwitchUpdate(_ sender: Any) {
        switchUpdate()
    }
    
    @IBAction func Calculation(_ sender: Any) {
        if let aText = Number1.text, let bText = Number2.text,
            let a = Int(aText), let b = Int(bText) {
            if Switch.isOn {
                let result = gcd(a: a,b: b)
                Result.text = "GCD: \(result)"
            } else {
                let result = lcm(a: a, b: b)
                Result.text = "LCM: \(result)"
            }
        }
        
    }
   
    func switchUpdate () {
        if Switch.isOn {
            Type.text = "Find GCD"
        } else {
            Type.text = "Find LCM"
        }
    }
    
    func lcm (a: Int, b: Int) -> Int {
        var max = max(a,b)
        while true {
            if max % a == 0 && max % b == 0 {
                return max
            } else {
                max += 1
            }
        }
    }
    
    func gcd (a: Int, b: Int) -> Int {
        var num1 = a
        var num2 = b
        while num2 != 0 {
            let c = num2
            num2 = num1 % num2
            num1 = c
        }
        return num1
    }
}

