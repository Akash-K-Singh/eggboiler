

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft" : 5, "Medium" : 8, "Hard" : 12];
    var timer = Timer();
    var player : AVAudioPlayer!
    var totalTime = 0;
    var secondPassed = 0;

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        secondPassed = 0;
        progressBar.progress = 0.0;
        titleLabel.text = hardness
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if(secondPassed < totalTime){
            secondPassed += 1;
            progressBar.progress = Float(secondPassed) / Float(totalTime)
        }else{
            timer.invalidate();
            titleLabel.text = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                        player = try! AVAudioPlayer(contentsOf: url!)
                        player.play()
        }
    }
    
}
