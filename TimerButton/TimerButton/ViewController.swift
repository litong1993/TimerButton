//
//  ViewController.swift
//  TimerButton
//
//  Created by 李童 on 2016/10/6.
//  Copyright © 2016年 李童. All rights reserved.
//

import UIKit

class ViewController: UIViewController,TimerButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let timerBtn = TimerButton(type: .custom)
        timerBtn.setTitle("点击发送验证码", for: .normal)
        timerBtn.frame = CGRect(x: 0, y: 300, width: 150, height: 50)
        timerBtn.noEnableFormateString = "%@秒"
        timerBtn.enableString = "重发"
        timerBtn.interval = 3
        timerBtn.backgroundColor = UIColor.green
        timerBtn.delegate = self
        self.view.addSubview(timerBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func timerBtnTouchUpInside() {
        print("发送")
    }

}

