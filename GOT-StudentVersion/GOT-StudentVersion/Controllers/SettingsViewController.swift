//
//  SettingsViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/8/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var myPickerView: UIPickerView!
    // Mark: -- Picker View methods Required && delegate and data source needs to be intialized in the viewDidLoad
    let fonts = Settings.fonts
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 1:
            return fonts.count
        default:
            return Settings.fontSizes.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 1:
            return "\(fonts[row])"
        case 0:
            return "\(Settings.fontSizes[row])"
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 1:
            Settings.currentFont = fonts[row]
            print("row has been selected \(fonts[row])")
        case 0:
            Settings.fontSize = Settings.fontSizes[row]
        default:
            break
        }

    }
    //--PickerView Methods End
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
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.selectRow(Settings.fonts.count/2, inComponent: 0, animated: true)
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
