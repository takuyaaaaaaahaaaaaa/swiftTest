//
//  SafariViewController.swift
//  VideoPlayerDemo2
//
//  Created by takuya.tominaga on 2019/07/17.
//  Copyright © 2019 takuya.tominaga. All rights reserved.
//

import UIKit

class SafariViewController: UIViewController {

    @IBAction func playSafari(_ sender: UIButton) {
        let url = URL(string: "https://www.jmca.co.jp/")

        //UIApplication.shared.openURL(url!)
        // iOS 10以降利用可能
        UIApplication.shared.open(url!)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
