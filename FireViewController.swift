//
//  FireViewController.swift
//  yuu
//
//  Created by 楠田悠人 on 2016/05/22.
//  Copyright © 2016年 楠田悠人. All rights reserved.
//

import UIKit
import AVFoundation


class FireViewController: UIViewController {
    
    let saveData1: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let saveData000: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var number : Int!
    
    var numbera : Int!
    var numberb : Int!
    var numberc : Int!
    
    var number1 : Int!
    
    var fire:Int!
    
    
    
    @IBOutlet var labelx: UILabel!
    @IBOutlet var labely: UILabel!
    @IBOutlet var labelz: UILabel!


    var audioPlayer: AVAudioPlayer?
    var rank:[Int] = []
    
    @IBOutlet var aaa: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = NSBundle.mainBundle().pathForResource("haku2", ofType: "mp3") {
            audioPlayer = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path), fileTypeHint: "mp3")
        }
        
        
        
        // Do any additional setup after loading the view.
        if number  > 50 {
            saveData000.setObject(number, forKey: "pass")
            if number1 == 0 {
                audioPlayer?.play()
            }
        }
        labelx.text = String(number)
        
        if rank.isEmpty{
            rank = (saveData1.arrayForKey("rankup") as! [Int]?)!
            
        }
        rank.append(number)
        
        if rank.count == 1 {
            print(rank)
            
        }else{
            for i in 1...rank.count-1{
                for j in 1...rank.count-1{
                    if rank[j-1] < rank[j] {
                        let temp = rank [j-1]
                        rank [j-1] = rank[j]
                        rank [j] = temp
                    }
                }
            }
            print(rank)
        }
        
        saveData1.setObject(rank, forKey: "rankup")
        //        if rank[0] == number {
        //            aaa.text = String("1")
        //        }else if rank[1] == number {
        //            aaa.text = String("2")
        //        }else if rank[2] == number {
        //            aaa.text = String("3")
        //        }else{
        //            aaa.text = String("圏外")
        //        }
        //        if rank.count == 1 {
        //            numbera = saveData1.objectForKey("ranka") as! Int?
        //            numbera = rank[0]
        //            saveData1.setObject(numbera, forKey: "ranka")
        //        }else{
        //            numbera = saveData1.objectForKey("ranka") as! Int?
        //            numbera = rank[0]
        //            saveData1.setObject(numbera, forKey: "ranka")
        //            numberb = saveData2.objectForKey("rankb") as! Int?
        //            numberb = rank[1]
        //            saveData2.setObject(numberb, forKey: "rankb")
        //            numberc = saveData3.objectForKey("rankc") as! Int?
        //            numberc = rank[2]
        //            saveData3.setObject(numberc, forKey: "rankc")
        //        }
        
        fire = rank.indexOf(number)! + 1
        print(fire)
        labely.text = String(fire)
        labelz.text = String(rank.count)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
        
        
        
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