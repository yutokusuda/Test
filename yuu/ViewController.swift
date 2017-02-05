//
//  ViewController.swift
//  yuu
//
//  Created by 楠田悠人 on 2016/05/08.
//  Copyright © 2016年 楠田悠人. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label: UILabel!
    @IBOutlet var label10:UILabel!
    @IBOutlet var label11:UILabel!
    @IBOutlet var label12:UILabel!
    @IBOutlet var label13:UILabel!
    @IBOutlet var label14:UILabel!
    @IBOutlet var labelout1: UILabel!
    @IBOutlet var labelout2: UILabel!
    @IBOutlet var labelout3: UILabel!
    @IBOutlet var labelout4: UILabel!
    @IBOutlet var labelA: UILabel!
    @IBOutlet var labelB: UILabel!
    @IBOutlet var labelC: UILabel!
    @IBOutlet var labelD: UILabel!
    
    var number1 : Int!
    
    @IBOutlet var momo1ImageView: UIImageView!
    @IBOutlet var momo2ImageView: UIImageView!
    @IBOutlet var momo3ImageView: UIImageView!
    @IBOutlet var momo4ImageView: UIImageView!
    @IBOutlet var backImageView: UIImageView!
    
    
    // let sound_data = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("punch", ofType: "mp3")!)
    // var audioPlayer: AVAudioPlayer = AVAudioPlayer(contentsOfURL: sound_data, error: nil)
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let saveData2: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    
    let saveData000 : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    
    
    @IBOutlet var numberLabel: UILabel!
    
    @IBOutlet var timerCount: UILabel!
    var GameTimer: NSTimer!
    
    
    var audio: AVAudioPlayer!
    
    var number : Int = 0
    var random : Int = 0
    var random2 : Int = 0
    var number2 : Int!
    
    var timeCount = 3
    
    var check : Bool = false
    
    
    var audioPlayer: AVAudioPlayer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelA.text = String("")
        labelB.text = String("")
        labelC.text = String("")
        labelD.text = String("")
        number1 = saveData000.integerForKey("pass")
        number2 = saveData2.integerForKey("mode")
        if number2 == 0 {
            backImageView.image = UIImage(named: "hiru2.jpg")
            label10.textColor = UIColor.blackColor()
            label11.textColor = UIColor.blackColor()
            label12.textColor = UIColor.blackColor()
            label13.textColor = UIColor.blackColor()
            label14.textColor = UIColor.blackColor()
        }else {
            backImageView.image = UIImage(named: "yoru.png")
            label10.textColor = UIColor.whiteColor()
            label11.textColor = UIColor.whiteColor()
            label12.textColor = UIColor.whiteColor()
            label13.textColor = UIColor.whiteColor()
            label14.textColor = UIColor.whiteColor()
        }
        
        
        if let audioPath = NSBundle.mainBundle().URLForResource("music2", withExtension: "mp3"){
            
            do{
                audio = try AVAudioPlayer(contentsOfURL: audioPath)
                
            }catch{
                fatalError("プレイヤーがつくれませんでした")
            }
        }else{
            fatalError("audioPathに数値が入りませんでした")
        }
        
        
        if number1 == 1 {
            audio.play()
        }
        
        
        
        label.text = String("開始")
        number = 0
        saveData.setObject(number, forKey: "pool")
        if let path = NSBundle.mainBundle().pathForResource("punch", ofType: "mp3") {
            audioPlayer = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path), fileTypeHint: "mp3")
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        number1 = saveData000.integerForKey("pass")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    @IBAction func start(){
        if check == false {
            yoru()
            asa()
            label.text = String("リセット")
            check = true
        }else{
            asa()
            
            
        }
        
        
        
    }
    @IBAction func pushA (){
        if check == true {
            
            if random == 0 {
                self.labelout1.text = "💥"
                if random2 == 1 {
                    labelA.text = String("+5")
                    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.4 * Double(NSEC_PER_SEC)))
                    dispatch_after(delayTime, dispatch_get_main_queue()) {
                        self.labelA.text = ""
                        
                    }
                    
                }else {
                    labelA.text = String("+1")
                    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.4 * Double(NSEC_PER_SEC)))
                    dispatch_after(delayTime, dispatch_get_main_queue()) {
                        self.labelA.text = ""
                    }
                }
                print(number1)
                if number1 == 1 {
                    audioPlayer?.play()
                }
                let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.1 * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    self.labelout1.text = ""
                    
                }
                if random2 == 1 {
                    number = number + 5
                    numberLabel.text = String(number)
                }else{
                    number = number + 1
                    numberLabel.text = String(number)
                }
                asa()
                
            }else {
                number = number - 1
                numberLabel.text = String(number)
                asa()
            }
        }
    }
    @IBAction func pushB (){
        if check == true {
            
            if random == 1 {
                self.labelout2.text = "💥"
                print(number1)
                if random2 == 1 {
                    labelB.text = String("+5")
                    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.4 * Double(NSEC_PER_SEC)))
                    dispatch_after(delayTime, dispatch_get_main_queue()) {
                        self.labelB.text = ""
                    }
                }else {
                    labelB.text = String("+1")
                    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.4 * Double(NSEC_PER_SEC)))
                    dispatch_after(delayTime, dispatch_get_main_queue()) {
                        self.labelB.text = ""
                    }
                }
                
                if number1 == 1 {
                    audioPlayer?.play()
                }
                let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.1 * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    self.labelout2.text = ""
                }
                if random2 == 1 {
                    number = number + 5
                    numberLabel.text = String(number)
                }else{
                    number = number + 1
                    numberLabel.text = String(number)
                }
                asa()
            }else{
                number = number - 1
                numberLabel.text = String(number)
                asa()
            }
        }
    }
    
    @IBAction func pushC (){
        if check == true {
            
            if random == 2 {
                self.labelout3.text = "💥"
                
                print(number1)
                if random2 == 1 {
                    labelC.text = String("+5")
                    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.4 * Double(NSEC_PER_SEC)))
                    dispatch_after(delayTime, dispatch_get_main_queue()) {
                        self.labelC.text = ""
                    }
                }else {
                    labelC.text = String("+1")
                    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.4 * Double(NSEC_PER_SEC)))
                    dispatch_after(delayTime, dispatch_get_main_queue()) {
                        self.labelC.text = ""
                    }
                }
                
                if number1 == 1 {
                    audioPlayer?.play()
                }
                
                let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.1 * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    self.labelout3.text = ""
                }
                if random2 == 1 {
                    number = number + 5
                    numberLabel.text = String(number)
                }else{
                    number = number + 1
                    numberLabel.text = String(number)
                }
                asa()
            }else{
                number = number - 1
                numberLabel.text = String(number)
                asa()
            }
        }
    }
    @IBAction func pushD (){
        if check == true {
            
            if random == 3 {
                self.labelout4.text = "💥"
                print(number1)
                if random2 == 1 {
                    labelD.text = String("+5")
                    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.4 * Double(NSEC_PER_SEC)))
                    dispatch_after(delayTime, dispatch_get_main_queue()) {
                        self.labelD.text = ""
                    }
                }else {
                    labelD.text = String("+1")
                    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.4 * Double(NSEC_PER_SEC)))
                    dispatch_after(delayTime, dispatch_get_main_queue()) {
                        self.labelD.text = ""
                    }
                }
                
                
                if number1 == 1 {
                    audioPlayer?.play()
                }
                
                let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.1 * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    self.labelout4.text = ""
                }
                if random2 == 1 {
                    number = number + 5
                    numberLabel.text = String(number)
                }else {
                    number = number + 1
                    numberLabel.text = String(number)
                }
                
                asa()
            }else{
                number = number - 1
                numberLabel.text = String(number)
                asa()
            }
        }
    }
    func countUp() {
        //カウントを１減らす
        timeCount-=1
        print("\(timeCount)")  //60→59→58→...と出力
        timerCount.text = String(timeCount)
        if timeCount < 1 {
            //タイマー止める
            GameTimer.invalidate()
            
            saveData.setObject(number, forKey: "pool")
            
            let alert = UIAlertController(title:"終了",
                                          message: "結果画面へ移動します",
                                          preferredStyle:  UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(
                title:"OK",
                style: UIAlertActionStyle.Default,
                handler:{action in
                    NSLog("okボタンが押されましたよ")
                    if self.audio.playing{
                        self.audio.pause()
                    }
                    //                      self.dismissViewControllerAnimated(true, completion: nil)
                    self.performSegueWithIdentifier("ahiru", sender: self)
            }
                
                )
                
            )
            
            presentViewController(alert, animated: true, completion: nil)
            
            
        }
    }
    func asa (){
        random = Int(arc4random_uniform(4))
        if number2 == 0{
            
        }else{
            random2 = Int(arc4random_uniform(10))
        }
        
        if random == 0 {
            
            if random2 == 1 {
                momo1ImageView.image = UIImage(named:"kin.png")
                momo2ImageView.image = UIImage()
                momo3ImageView.image = UIImage()
                momo4ImageView.image = UIImage()
            }else{
                momo1ImageView.image = UIImage(named:"mo.png")
                momo2ImageView.image = UIImage()
                momo3ImageView.image = UIImage()
                momo4ImageView.image = UIImage()
                
            }
        }else if random == 1 {
            
            if random2 == 1 {
                momo1ImageView.image = UIImage()
                momo2ImageView.image = UIImage(named:"kin.png")
                momo3ImageView.image = UIImage()
                momo4ImageView.image = UIImage()
            }else{
                momo1ImageView.image = UIImage()
                momo2ImageView.image = UIImage(named:"mo.png")
                momo3ImageView.image = UIImage()
                momo4ImageView.image = UIImage()
            }
        }else if random == 2 {
            if random2 == 1 {
                momo1ImageView.image = UIImage()
                momo2ImageView.image = UIImage()
                momo3ImageView.image = UIImage(named:"kin.png")
                momo4ImageView.image = UIImage()
            }else{
                momo1ImageView.image = UIImage()
                momo2ImageView.image = UIImage()
                momo3ImageView.image = UIImage(named:"mo.png")
                momo4ImageView.image = UIImage()
            }
            
        }else if random == 3 {
            if random2 == 1 {
                momo1ImageView.image = UIImage()
                momo2ImageView.image = UIImage()
                momo3ImageView.image = UIImage()
                momo4ImageView.image = UIImage(named:"kin.png")
            }else{
                momo1ImageView.image = UIImage()
                momo2ImageView.image = UIImage()
                momo3ImageView.image = UIImage()
                momo4ImageView.image = UIImage(named:"mo.png")
            }
        }
    }
    func yoru (){
        GameTimer = NSTimer.scheduledTimerWithTimeInterval(
            1.0,    //何秒ごとにこのメソッドを実行するか。
            target: self,
            selector: "countUp",  //どの関数を実行するか
            userInfo: nil,
            repeats: true    //繰り返し実行するかどうか
        )
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //var fireViewController = segue.desinationViewController as! FireViewController
        
        let fireViewController = segue.destinationViewController as! FireViewController
        fireViewController.number = self.number
    }
    
    
    
}
