//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 小柳貴志 on 2018/10/19.
//  Copyright © 2018年 takashi.koyanagi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var playbtn: UIButton!
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var nextbtn: UIButton!
    
    var timer: Timer!
    var timer_sec: Float = 0
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "1.jpg",
            "2.jpg",
            "3.jpg",
            ]
        
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        
        
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "1.jpg")
        
        imageView.image = image
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
   
    
    
   
    @IBAction func play(_ sender: Any) {
    
        displayImage()
    
        
        
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.onUpdate(timer:)), userInfo: nil, repeats: true)
            playbtn.setTitle("停止", for:[])
            backbtn.isEnabled = false
            nextbtn.isEnabled = false
            
        }else{
            timer.invalidate()
            self.timer = nil
            displayImage()
            playbtn.setTitle("再生", for:[])
            backbtn.isEnabled = true
            nextbtn.isEnabled = true
        }
        
        
        
    }
    
    /// Timerによって、一定の間隔で呼び出される関数
    @objc func onUpdate(timer: Timer) {
        
        // 関数が呼ばれていることを確認
        print("onUpdate")
        
        // 表示している画像の番号を1増やす
        
            dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func 進む(_ sender: Any) {
        
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    @IBAction func 戻る(_ sender: Any) {
        
        dispImageNo -= 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    
    @IBAction func onTapImage(_ sender: Any) {
        
        if self.timer != nil{
        timer.invalidate()
        self.timer = nil
        displayImage()
        playbtn.setTitle("再生", for:[])
        backbtn.isEnabled = true
        nextbtn.isEnabled = true
        }
        
        print("Show")
        
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let showcontroller:Show_Controller = segue.destination as! Show_Controller
        let showimage = imageView.image
        showcontroller.x = showimage!
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
    
}
