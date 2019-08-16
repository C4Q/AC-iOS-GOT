//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Alexander George Legaspi on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var got: GOTEpisode!
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailSeason: UILabel!
    
    @IBOutlet weak var detailEpisode: UILabel!
    
    @IBOutlet weak var detailRuntime: UILabel!
    
    @IBOutlet weak var detailAirdate: UILabel!
    
    @IBOutlet weak var detailDescription: UITextView!
    
    override func viewDidLoad() {
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
