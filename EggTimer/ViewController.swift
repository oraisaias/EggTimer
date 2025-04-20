import UIKit
import AVFoundation // 🎵 Importamos librería para sonido

class ViewController: UIViewController {

    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var secondsRemaining = 0
    var totalTime = 0
    var player: AVAudioPlayer? // 🎧 Reproductor de audio

    @IBOutlet weak var ProgressView: UIProgressView!
    @IBOutlet weak var TitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressView.progress = 0.0
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()

        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness] ?? 0
        secondsRemaining = totalTime

        TitleLabel.text = "Cocinando \(hardness.lowercased())..."
        ProgressView.progress = 0.0

        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }

    @objc func updateTimer() {
        if secondsRemaining > 0 {
            let progress = 1.0 - (Float(secondsRemaining) / Float(totalTime))
            ProgressView.progress = progress
            print("\(secondsRemaining) segundos restantes")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            ProgressView.progress = 1.0
            TitleLabel.text = "Done! 🍳"
            playSound() // 🔊 Reproducir audio al terminar
        }
    }

    func playSound() {
        if let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") {
            player = try? AVAudioPlayer(contentsOf: url)
            player?.play()
        } else {
            print("⚠️ No se encontró el archivo de sonido.")
        }
    }
}
