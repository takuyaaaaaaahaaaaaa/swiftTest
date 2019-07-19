//
//  ViewController.swift
//  VideoPlayerDemo2
//
//  Created by takuya.tominaga on 2019/07/17.
//  Copyright © 2019 takuya.tominaga. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBAction func playVideo(_ sender: UIButton) {
        let manager = FileManager.default
        let documentDir = manager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentDir.appendingPathComponent("【日本史編ついにスタート】中田敦彦のエクストリーム授業！今さら聞けない「日本は元々どうやって始まったのか！？」縄文〜平安時代前編.mp4")
        let player = AVPlayer(url: url)

        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player
        controller.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width,height: 300);

        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

