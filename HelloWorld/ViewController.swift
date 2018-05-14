//
//  ViewController.swift
//  HelloWorld
//
//  Created by user on 2018/5/2.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var textF: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initLable()
        initButton()
        initTextField()
        initImageView()
        initTextView()
        initSwitch()
        initSegmentedControl()
        initSlider()
        initProgressView()
        initStepper()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        imageView3.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initLable(){
        label.textColor = UIColor.black
        label.text = "HelloWorld"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 14)
        //文本行数，为0就是自动换行
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        label.isUserInteractionEnabled = true
        label.isEnabled = true
        label.shadowColor = UIColor.blue
        label.shadowOffset = CGSize(width: 0.5, height: 0.5)
        label.isHighlighted = true
        label.highlightedTextColor = UIColor.red
    }
    
    func initButton(){
        button.backgroundColor = UIColor.cyan
        button.setBackgroundImage(UIImage(named: "background"), for: .normal)
        
        button1.setTitle("点我一下", for: UIControlState.normal)
        button1.addTarget(self, action: #selector(ViewController.clickButton(_:)), for: UIControlEvents.touchUpInside)
        
        button.setTitleShadowColor(UIColor.green, for: .normal)
        button.setTitleShadowColor(UIColor.yellow, for: .highlighted)
        button.setTitleShadowColor(UIColor.gray, for: .disabled)
        
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 6.0
        
        //        button.showsTouchWhenHighlighted = true
        
        button1.setTitleColor(UIColor.black, for: .normal)
        button1.setTitleColor(UIColor.green, for: .highlighted)
        button1.setTitleColor(UIColor.gray, for: .disabled)
        
        button1.setImage(UIImage(named: "info"), for: .normal)
        button1.adjustsImageWhenHighlighted = false //触摸模式下按钮也不会变暗
        button1.adjustsImageWhenDisabled = false //极浓模式下按钮也不会变暗
        
        //        button2.buttonType = UIButtonType.contactAdd
    }
    
    @IBAction func clickButton(_ sender: Any) {
        button1.setTitle("我被点了", for: UIControlState.normal)
    }
    
    func initTextField(){
        textF.borderStyle = UITextBorderStyle.roundedRect
        textF.placeholder = "text filed"
        //        textF.isSecureTextEntry = true//比如密码样式*
        textF.backgroundColor = UIColor.white
        
        //超出文本框宽度时候，自动调整文字大小
        textF.adjustsFontSizeToFitWidth = true
        textF.minimumFontSize = 14
        
        //horizontal
        textF.textAlignment = .left
        
        //vertical
        textF.contentVerticalAlignment = .center
        
        textF.clearButtonMode = UITextFieldViewMode.whileEditing
        //        textF.clearButtonMode = UITextFieldViewMode.unlessEditing
        //        textF.clearButtonMode = UITextFieldViewMode.always
        
        //keyboard type
        textF.keyboardType = UIKeyboardType.default
        //        textF.keyboardType = UIKeyboardType.numbersAndPunctuation//显示数字和标点的虚拟键盘
        //        textF.keyboardType = UIKeyboardType.URL//便于输入网址
        //        textF.keyboardType = UIKeyboardType.numberPad//纯数字
        //        textF.keyboardType = UIKeyboardType.phonePad//便于拨号的虚拟键盘
        //        textF.keyboardType = UIKeyboardType.namePhonePad//便于聊天
        //        textF.keyboardType = UIKeyboardType.emailAddress//
        //        textF.keyboardType = UIKeyboardType.decimalPad//数字和小数点
        //        textF.keyboardType = UIKeyboardType.twitter//跟default区别不大
        //        textF.keyboardType = UIKeyboardType.webSearch//跟default区别不大
        
        //界面打开时就获取焦点，并显示键盘
        textF.becomeFirstResponder()
        //失去焦点，收回键盘
        textF.resignFirstResponder()
        
        //return style
        textF.returnKeyType = UIReturnKeyType.done
        textF.delegate = self
        
        //attributedPlaceholder 设置相关属性 模块化
        var attributes:[String:AnyObject] = NSMutableDictionary() as! [String:AnyObject]
        attributes[NSFontAttributeName] = UIFont.systemFont(ofSize: 13)
        attributes[NSForegroundColorAttributeName] = UIColor.red
        let string:NSAttributedString = NSAttributedString.init(string: "身份证号中含字幕必须大写", attributes:attributes)
        textF.attributedPlaceholder = string
        
        //光标
//        textF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
//        textF.leftView?.backgroundColor = UIColor.blue
//        textF.leftViewMode = UITextFieldViewMode.always
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //隐藏输入键盘
        textF.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("开始输入")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("已经开始输入")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("结束输入")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("已经结束输入")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("清除用户输入")
        return true
    }
 
    func initImageView(){
        imageView.image = UIImage(named: "info")
        imageView.contentMode = .scaleAspectFit
        
        //
//        let path = Bundle.main.path(forResource: "info", ofType: "png")
//        let newImage = UIImage(contentsOfFile: path!)
//        imageView1.image = newImage
        
        //
//        let url = NSURL(string: "http://hangge.com/blog/images/logo.png")
//        let data = NSData(contentsOf: url! as URL)
//        do {
//            let image2 = try UIImage(data: data! as Data)
//            imageView2.image = image2
//        } catch {
//        }
        
        //
        imageView3.animationImages = [UIImage(named: "info")!, UIImage(named: "shop")!]
        imageView3.animationDuration = 1.0
        imageView3.startAnimating()
    }
    
    func initTextView(){
        textview.layer.borderWidth = 1
        textview.layer.borderColor = UIColor.gray.cgColor
        textview.backgroundColor = UIColor.clear
        textview.isEditable = true
        textview.selectedRange = NSMakeRange(0, Int.max)
        textview.isSelectable = true
    }
    
    func initSwitch(){
        switch1.isOn = true
        switch1.addTarget(self, action: #selector(ViewController.switchDisChange), for: .valueChanged)
        
    }
    
    func switchDisChange(sender:UISwitch){
        print("switch value = " + String.init(format: "%d", sender.isOn))
    }
    
    func initSegmentedControl(){
        segmentControl.removeAllSegments()
        
        let items = ["Hello" as AnyObject, "World" as AnyObject, UIImage(named: "info")!] as AnyObject
        segmentControl.insertSegment(withTitle: "Hello", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "World", at: 1, animated: true)
        segmentControl.insertSegment(with: UIImage(named: "info"), at: 2, animated: true)
        
        segmentControl.tintColor = UIColor.blue
        
        segmentControl.selectedSegmentIndex = 1
//        segmentControl.addTarget(self, action: Selector("segmentDidChange"), for: UIControlEvents.valueChanged)
        segmentControl.addTarget(self, action: #selector(ViewController.segmentDidChange(sender:)), for: UIControlEvents.valueChanged)
        
    }
    
    func segmentDidChange(sender:UISegmentedControl){
        print(sender.selectedSegmentIndex)
        print(sender.titleForSegment(at: sender.selectedSegmentIndex))
    }
    
    func initSlider(){
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.5
        slider.setValue(0.8, animated: true)
        slider.isContinuous = false //滑块停止后才触发valuechagned事件
//        slider.addTarget(self, action: "sliderDidChanged", for: UIControlEvents.valueChanged)
        slider.addTarget(self, action: #selector(ViewController.sliderDidChanged(sender:)), for: UIControlEvents.valueChanged)
    }
    
    func sliderDidChanged(sender:UISlider){
        print(sender.value)
    }
    
    func initProgressView(){
        progressView.progress = 0.5//默认进度
        progressView.setProgress(0.8, animated: true)
        progressView.progressTintColor = UIColor.green//已有进度
        progressView.trackTintColor = UIColor.blue//进度槽颜色
        
    }
    
    func initStepper(){
        stepper.maximumValue = 10
        stepper.minimumValue = 1
        stepper.value = 5.5
        stepper.stepValue = 0.5
        stepper.isContinuous = true
        stepper.wraps = true//是否循环
//        stepper.addTarget(self, action: "stepperValueIsChanged", for: UIControlEvents.valueChanged)
        stepper.addTarget(self, action: #selector(ViewController.stepperValueIsChanged(sender:)), for: UIControlEvents.valueChanged)
        
        stepper.setDecrementImage(UIImage(named: "sub"), for: .normal)
        stepper.setIncrementImage(UIImage(named: "add"), for: .normal)
    }
    
    func stepperValueIsChanged(sender:UIStepper){
        textF.text = "当前值为：\(stepper.value)"
    }
}
