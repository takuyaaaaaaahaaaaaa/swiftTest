//
//  AudioPlayerViewController.swift
//  Demotool2
//
//  Created by takuya.tominaga on 2019/07/29.
//å  Copyright © 2019 takuya.tominaga. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class AudioPlayerViewController: UIViewController,AVAudioPlayerDelegate{
    
    var audioPlayer:AVAudioPlayer?
    var mediaPlayer:MPMusicPlayerController?

    @IBOutlet weak var audioImageView: UIImageView!
    @IBOutlet weak var audioTime: UISlider!
    @IBOutlet weak var audioTitle: UILabel!
    @IBOutlet weak var audioTeacher: UILabel!
    @IBOutlet weak var audioVolume: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMedia()
        // Do any additional setup after loading the view.
    }
    
    func loadMedia(){
        guard let audioUrl = URL(string:"/Users/takuya.tominaga/Library/Developer/sandbox/kiyosi.mp3")else {
                print("imageURL取得失敗")
                return
            }
        let imageUrl = "/Users/takuya.tominaga/Library/Developer/sandbox/kiyosi.jpg"
        print("URL取得成功")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf:audioUrl)
            audioImageView.image = UIImage(contentsOfFile:imageUrl)
            print("AVAudioPlayer")
        } catch{
            print("AVAudioPlayer失敗")
            return
            }
        }
        
    // MARK: Action
    @IBAction func pushPlay(_ sender: Any) {
        guard let player = audioPlayer else{
            return
        }
        player.play()
    }
    
    @IBAction func pushForward(_ sender: Any) {
        let forwardTimeInterval = 5.0
        guard let player = audioPlayer,
            player.currentTime + forwardTimeInterval < player.duration else{
                return
        }
        player.currentTime = player.currentTime + forwardTimeInterval
    }
    @IBAction func pushBackward(_ sender: Any) {
        let backwardTimeInterval = 5.0
        guard let player = audioPlayer,
            player.currentTime - backwardTimeInterval > 0 else{
                return
        }
        player.currentTime = player.currentTime - backwardTimeInterval
    }
}


