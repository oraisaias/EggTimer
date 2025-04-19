import UIKit

class ViewController: UIViewController {
    let add = Int.random(in: 0...100)
    let eggTimes = ["Soft":5, "Medium":12, "Hard":7]
    let softTime = 5
    let mediumTime = 12
    let hardTime = 7
    override func viewDidLoad() {
         super.viewDidLoad()
         
         print(add) // ✅ Ahora sí se puede ejecutar
     }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        let other = eggTimes[hardness];
        
        if hardness == "Soft" {
            print("Tiempo: \(softTime) segundos")
        } else if hardness == "Medium" {
            print("Tiempo: \(mediumTime) segundos")
        } else if hardness == "Hard" {
            print("Tiempo: \(hardTime) segundos")
        } else {
            print("Valor no reconocido")
        }
    }
}
