//
//  SettingsViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/8/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    

    @IBOutlet weak var redSlider: UISlider!
    
    @IBAction func inputRedSlider(_ sender: UISlider) {
        Settings.red = sender.value
    }
    
    @IBAction func inputGreenSlider(_ sender: UISlider) {
        Settings.green = sender.value
    }
    
    @IBAction func inputBlueSlider(_ sender: UISlider) {
        Settings.blue = sender.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.blueSlider.value = Settings.blue
        self.redSlider.value = Settings.red
        self.greenSlider.value = Settings.green

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
