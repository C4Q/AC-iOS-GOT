//
//  DetailedViewController.swift
//  GOT-StudentVersion
//
//  Created by Kary Martinez on 8/19/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController  {
 
    
var currentSeason: GOTEpisode?
    @IBOutlet weak var DescriptionText: UITextView!
    @IBOutlet weak var DetailedImage: UIImageView!
   
    override func viewDidLoad() {
        DescriptionText.text = currentSeason?.summary
        DetailedImage.image = currentSeason?.getImage()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
