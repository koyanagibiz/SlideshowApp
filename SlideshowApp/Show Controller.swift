//
//  Show Controller.swift
//  SlideshowApp
//
//  Created by 小柳貴志 on 2018/10/21.
//  Copyright © 2018年 takashi.koyanagi. All rights reserved.
//

import UIKit

class Show_Controller: UIViewController {

    @IBOutlet weak var showimageView: UIImageView!
    var x:UIImage = UIImage(named: "1.jpg")!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let image = x
        showimageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
