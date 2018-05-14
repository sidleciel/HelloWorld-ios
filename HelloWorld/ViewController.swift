//
//  ViewController.swift
//  HelloWorld
//
//  Created by user on 2018/5/2.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initLable()
        initButton()
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


}

