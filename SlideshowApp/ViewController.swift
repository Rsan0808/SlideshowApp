//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Rsan on 2019/08/13.
//  Copyright © 2019 Rsan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //タップによる遷移
    @IBAction func tapAction(_ sender: Any) {
    }
   
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let viewController2:ViewController2 = segue.destination as! ViewController2
        viewController2.image = imageView.image
    }
    
    //imegeView変数
    @IBOutlet weak var imageView: UIImageView!
    
    
    var imageIndex: Int = 0
    
    var timer: Timer!
    var timer_sec: Float = 0
    
    
    let images = [UIImage(named: "image1.jpg"),UIImage(named: "image2.jpg"),UIImage(named: "image3.jpg")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let image = images[0]
        imageView.image = image
        startButton1.setTitle("再生", for: .normal)
    }
    
    //戻るボタン
    @IBOutlet weak var backButton1: UIButton!
    
    @IBAction func backButton(_ sender: Any) {
        if imageIndex == 0{
           imageIndex = 2
        }else{
            imageIndex -= 1
        }
        imageView.image = images[imageIndex]
    }
    
    //進むボタン
    @IBOutlet weak var nextButton1: UIButton!
    
    @IBAction func nextButton(_ sender: Any) {
        if imageIndex == 2{
            imageIndex = 0
        }else{
            imageIndex += 1
        }
     imageView.image = images[imageIndex]
    }
    
    @objc func onTimer(_ timer: Timer){
        self.timer_sec += 1
        if imageIndex == 2{
            imageIndex = 0
        }else{
        imageIndex += 1
        }
        imageView.image = images[imageIndex]
    }
    
    //再生停止ボタン
    @IBOutlet weak var startButton1: UIButton!
    
    @IBAction func startButton(_ sender: Any) {
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.onTimer(_:)), userInfo: nil, repeats: true)
            
            startButton1.setTitle("停止", for: .normal)
            nextButton1.isEnabled = false
            backButton1.isEnabled = false
        } else {
            self.timer.invalidate()
            self.timer = nil
            startButton1.setTitle("再生", for: .normal)
            nextButton1.isEnabled = true
            backButton1.isEnabled = true
        }
        
    }
    
    

}

