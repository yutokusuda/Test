//
//  FirstViewController.swift
//  yuu
//
//  Created by 楠田悠人 on 2016/09/18.
//  Copyright © 2016年 楠田悠人. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {

    let saveData000 : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let saveDatamusic: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    var number1 : Int!
    var audio: AVAudioPlayer!
    var audioPlayer: AVAudioPlayer?
    var musicnumber : Int!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        number1 = saveData000.integerForKey("pass")
        
        if let audioPath = NSBundle.mainBundle().URLForResource("music", withExtension: "mp3"){
            
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
        
    }
    @IBAction func settei() {
        if audio.playing {
            audio.pause()
        }
    }
    @IBAction func ranking (){
        if audio.playing {
            audio.pause()
        }
         performSegueWithIdentifier("play", sender: self)
    }
    
    @IBAction func start (){
        
        print(number1)
        if audio.playing {
            audio.pause()
        }
        
        
        performSegueWithIdentifier("play", sender: self)
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
