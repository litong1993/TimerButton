//
//  TimerButton.swift
//  TaobaoApp
//
//  Created by 李童 on 2016/9/30.
//  Copyright © 2016年 李童. All rights reserved.
//

import UIKit
protocol TimerButtonDelegate:NSObjectProtocol {
    func timerBtnTouchUpInside()
}
class TimerButton: UIButton {

    //设置每次不可用的时间间隔，单位秒
    var interval:Int = 60
    var noEnableFormateString:String = "%@秒后重发"
    var enableString:String = "点击重发"
    weak var delegate:TimerButtonDelegate?
    
    private var surplusTime:Int!
    private var timer:Timer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        timer = Timer(timeInterval: 1, target: self, selector: #selector(update_code_btn), userInfo: nil, repeats: true)
        
        super.addTarget(self, action: #selector(countdownAction), for: .touchUpInside)
    }
    @objc private func countdownAction(){
        delegate?.timerBtnTouchUpInside()
        beginCountdown()
    }
    func beginCountdown(){
        self.isEnabled = false
        surplusTime = self.interval
        RunLoop.main.add(timer, forMode: RunLoopMode.defaultRunLoopMode)
        timer.fireDate = NSDate.distantPast
    }
    @objc private func update_code_btn(timer:Timer){
        if self.surplusTime > 0{

            self.setTitle(NSString(format: noEnableFormateString as NSString, "\(surplusTime!)") as String, for: .normal)
            self.surplusTime = surplusTime - 1
        }else{
            timer.fireDate = NSDate.distantFuture
            self.setTitle(enableString, for: .normal)
            self.isEnabled = true
        }
    }
    deinit {
        timer.invalidate()
        timer = nil
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
/*
extension UIButton{
    private struct AssociatedKeys {
        static var countdown:NSInteger?
    }
    /// 倒计时为60秒
    var countdown:NSInteger? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.countdown) as? NSInteger
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.countdown, newValue as NSInteger?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    func beginCountdown(){
        self.enabled = false
        let timer = NSTimer(timeInterval: 1, target: self, selector: #selector(update_code_btn), userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode)
        timer.fireDate = NSDate.distantPast()
    }
    @objc private func update_code_btn(timer:NSTimer){
        if self.countdown > 0{
            if let countdown = self.countdown{
                self.setTitle("\(countdown)秒后可重发", forState: .Normal)
                self.countdown = countdown - 1
            }
        }else{
            timer.fireDate = NSDate.distantFuture()
            self.setTitle("重发验证码", forState: .Normal)
            self.enabled = true
        }
    }
}
 */
