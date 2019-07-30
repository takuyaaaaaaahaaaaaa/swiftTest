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

class AudioPlayerViewController: UIViewController,AVAudioPlayerDelegate,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var audioImageView: UIImageView!
    @IBOutlet weak var audioTime: UISlider!
    @IBOutlet weak var audioTitle: UILabel!
    @IBOutlet weak var audioTeacher: UILabel!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var tableView: UITableView!
    
    var audioPlayer:AVAudioPlayer!
    var mediaPlayer:MPMusicPlayerController?
    var audioAsset:AVAsset?
    let CENTER_BUTTON = 4
    let chapter = ["chapter1","chapter2","chapter3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMedia()
        audioPlayer.delegate = self
        audioTime.maximumValue = Float(audioPlayer.duration)
        let timer = Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(updateSlider),
            userInfo: nil,
            repeats: true)
        timer.fire()
    }
    
    func loadMedia(){
        guard let audioUrl = URL(string:"/Users/takuya.tominaga/Library/Developer/sandbox/kiyosi.mp3"),
        let imageUrl = URL(string:"/Users/takuya.tominaga/Library/Developer/sandbox/kiyosi.jpg")
        else {
                print("imageURL取得失敗")
                return
        }
        print("URL取得成功")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf:audioUrl)
            audioImageView.image = UIImage(contentsOfFile:imageUrl.absoluteString)
            audioPlayer.enableRate = true
            audioAsset = AVAsset(url:audioUrl)
            print("AVAudioPlayer成功")
            print(audioAsset!.metadata)
            for metadata in audioAsset!.metadata{
                print("metadata")
                print(metadata)
            }
            print("metadata完了")
        } catch{
            print("AVAudioPlayer失敗")
            return
        }
    }
    
    // MARK: Action
    @IBAction @objc func pushPlay(_ sender: Any) {
        if audioPlayer.isPlaying{
            audioPlayer.pause()
            toolBar.items![CENTER_BUTTON] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.play, target: self, action: #selector(pushPlay(_:)))
        } else{
            audioPlayer.play()
            toolBar.items![CENTER_BUTTON] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.pause, target: self, action: #selector(pushPlay(_:)))
        }
        toolBar.setItems(toolBar.items, animated: true)
    }
    
    @IBAction func pushForward(_ sender: Any) {
        let forwardTimeInterval = 5.0
        guard audioPlayer.currentTime + forwardTimeInterval < audioPlayer.duration
            else{
                return
        }
        audioPlayer.currentTime = audioPlayer.currentTime + forwardTimeInterval
    }
    @IBAction func pushBackward(_ sender: Any) {
        let backwardTimeInterval = 5.0
        guard audioPlayer.currentTime - backwardTimeInterval > 0
            else{
                return
        }
        audioPlayer.currentTime = audioPlayer.currentTime - backwardTimeInterval
    }
    @IBAction func onChange(_ sender: UISlider) {
        audioPlayer.currentTime = Double(sender.value)
    }
    @IBAction func onChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = sender.value
    }
    @IBAction func pushHighSpeed(_ sender: Any) {
        audioPlayer.rate = audioPlayer.rate * 1.25
        print(audioPlayer.rate)
    }
    @IBAction func pushLowSpeed(_ sender: Any) {
        audioPlayer.rate = audioPlayer.rate * 0.8
        print(audioPlayer.rate)
    }
    
    @objc func updateSlider(){
        audioTime.value = Float(audioPlayer.currentTime)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool){
        audioPlayer.rate = 1
        toolBar.items![CENTER_BUTTON] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.play, target: self, action: #selector(pushPlay(_:)))
        toolBar.setItems(toolBar.items, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:
        Int) -> Int {
        return chapter.count
    }

    //追加④ セルに値を設定するデータソースメソッド（必須）
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = chapter[indexPath.row]
        return cell
    }
}


