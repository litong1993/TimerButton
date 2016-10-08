#TimerButton
点击后显示倒计时的按钮，可用来做发送验证码的按钮。
![](/TimerButtton.gif)

## 使用

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let timerBtn = TimerButton(type: .custom)
    //设置按钮默认标题
    timerBtn.setTitle("点击发送验证码", for: .normal)
    timerBtn.frame = CGRect(x: 0, y: 300, width: 150, height: 50)
    //设置倒计时格式
    timerBtn.noEnableFormateString = "%@秒"
    //设置可用状态标题
    timerBtn.enableString = "重发"
    //设置倒计时间
    timerBtn.interval = 3
    timerBtn.backgroundColor = UIColor.green
    //设置delegate
    timerBtn.delegate = self
    self.view.addSubview(timerBtn)
}
```

## delegate

```swift
//代理方法
func timerBtnTouchUpInside() {
    print("发送")
}
```

这是一个远程测试信息

第三次本地更新
