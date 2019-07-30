//
//  CollectionViewController.swift
//  Demotool2
//
//  Created by takuya.tominaga on 2019/07/30.
//  Copyright © 2019 takuya.tominaga. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let mainBundle = Bundle(path: "/Users/takuya.tominaga/Library/Developer")
    //リソースのあるパスの配列
    var resources:[URL]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAudioFile()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func loadAudioFile(){
        resources = mainBundle?.urls(forResourcesWithExtension: "mp3", subdirectory: "sandbox")
    }
    
}

extension CollectionViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            performSegue(withIdentifier: "toAudioPlayerViewController",sender: nil)
    }

    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toAudioPlayerViewController") {
            let audioPlayerViewController: AudioPlayerViewController = (segue.destination as? AudioPlayerViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
//            subVC.selectedImg = selectedImage
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resources!.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        cell.albumTitle.text = "titleSample"
        cell.teacherName.text = "teacherSample"
        let audioURL = resources?[indexPath.row].deletingPathExtension()
        guard let imageURL = audioURL?.appendingPathExtension("jpg") else {
            cell.albumImage.image = UIImage(named:"sampleImage")
            return cell
        }
        cell.albumImage.image = UIImage(contentsOfFile: imageURL.path)
        return cell

    }
}
