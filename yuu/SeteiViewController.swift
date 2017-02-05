//
//  SeteiViewController.swift
//  yuu
//
//  Created by 楠田悠人 on 2016/09/18.
//  Copyright © 2016年 楠田悠人. All rights reserved.
//

import UIKit
import AVFoundation

class SeteiViewController: UIViewController {
    
    @IBOutlet weak var mySwicth: UISwitch!
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var modeLabel : UILabel!
    @IBOutlet var nowlondingLabel : UILabel!
    
    var audio: AVAudioPlayer!
    var audioPlayer: AVAudioPlayer?
    
    let saveData1: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let saveData000 : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let saveData2: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    var number1 : Int!
    var musicnumber : Int!
    var rank:[Int]!
    var number2: Int!


    override func viewDidLoad() {
        super.viewDidLoad()
        nowlondingLabel.backgroundColor = UIColor.blackColor()
        nowlondingLabel.text = String("nowlonding")
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.nowlondingLabel.backgroundColor = UIColor.clearColor()
            self.nowlondingLabel.text = String("")
        }

        
        
//         mySwicth.addTarget(self, action: "onClickMySwicth:", forControlEvents: UIControlEvents.ValueChanged)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
//        saveData000.registerDefaults(["pass":0])    // NSUserDefaultsの"pass"にデータが入ってなかったら入れる
        number1 = saveData000.integerForKey("pass") // "pass"にデータがなければ0, あればそのデータを返す
        print(number1)
        if number1 == 0{
            mySwicth.on = false
            }
        number2 = saveData2.integerForKey("mode")
        if number2 == 0 {
            backgroundImageView.image = UIImage(named: "tuki.png")
            modeLabel.text = "Night Mode"
        }else {
            backgroundImageView.image = UIImage(named: "taiyou1.png")
            modeLabel.text = "Day Mode"

        }
        }
    @IBAction func reset (){
        let alert = UIAlertController(title: "リセット", message: "ランキングをリセットします。", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in
            self.rank = (self.saveData1.objectForKey("rankup") as! [Int]?)!
            print(self.rank)
            self.rank = []
            self.saveData1.setObject(self.rank, forKey: "rankup")
        }))
        alert.addAction(UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.Cancel, handler: {action in
            
        }))
        
        
        presentViewController(alert, animated: true, completion: nil)
       

        
    }
    
    @IBAction func back(){
        if mySwicth.on {
            
            number1 = 1
            saveData000.setObject(number1, forKey: "pass")
        }else {
            
            number1 = 0
            saveData000.setObject(number1, forKey: "pass")

        }
    }
    @IBAction func modechange (){
        number2 = saveData2.integerForKey("mode")
        if number2 == 0 {
            number2 = number2 + 1
            saveData2.setObject(number2, forKey: "mode")
            backgroundImageView.image = UIImage(named: "taiyou1.png")
            modeLabel.text = "Day Mode"
        }else {
            number2 = number2 - 1
            saveData2.setObject(number2, forKey: "mode")
            backgroundImageView.image = UIImage(named: "tuki.png")
            modeLabel.text = "Night Mode"

        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
