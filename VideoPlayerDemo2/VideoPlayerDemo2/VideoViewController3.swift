//
//  VideoViewController3.swift
//  VideoPlayerDemo2
//
//  Created by takuya.tominaga on 2019/07/17.
//  Copyright © 2019 takuya.tominaga. All rights reserved.
//

import UIKit
import AVFoundation

class VideoViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var AVPlayerView: UIView!
    

    @IBAction func playMovie(_ sender: UIButton) {
        let manager = FileManager.default
        let documentDir = manager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentDir.appendingPathComponent("【日本史編ついにスタート】中田敦彦のエクストリーム授業！今さら聞けない「日本は元々どうやって始まったのか！？」縄文〜平安時代前編.mp4")
        let player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        AVPlayerView.layer.addSublayer(playerLayer)
        player.play()
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
