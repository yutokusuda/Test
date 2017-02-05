//
//  CocoaaViewController.swift
//  yuu
//
//  Created by 楠田悠人 on 2016/06/19.
//  Copyright © 2016年 楠田悠人. All rights reserved.
//

import UIKit

class CocoaaViewController: UIViewController {
    
    var number : Int!
    var rank:[Int]!

    @IBOutlet var labely: UILabel!
    var score:[Int] = []
    
    @IBOutlet var labela: UILabel!
    @IBOutlet var labelb: UILabel!
    @IBOutlet var labelc: UILabel!
    
    var numbera : Int!
    var numberb : Int!
    var numberc : Int!

    let saveData1: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if ((saveData1.objectForKey("rankup")) != nil){
            rank = (saveData1.objectForKey("rankup") as! [Int]?)!
        }else{
            rank = [0,0,0]
            saveData1.setObject(rank, forKey: "rankup")
        }
        
        print(rank)
        
        
        if  rank.count == 0 {
            labela.text = String("-")
            labelb.text = String("-")
            labelc.text = String("-")
        }else{
            labela.text = String(rank[0])
        }
        if  rank.count <= 1 {
            labelb.text = String("-")
            labelc.text = String("-")
        }else{
            labelb.text = String(rank[1])
        }
        if  rank.count <= 2 {
            labelc.text = String("-")
        }else{
            labelc.text = String(rank[2])
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
