//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let test = Functions()
        return test.rows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "sea1", for: indexPath) as? Sea1TableViewCell{
                cell.nameLabel1.text = GOTEpisode.num1[indexPath.row].name
                
                cell.epNumber.text = "Episode: \(GOTEpisode.num1[indexPath.row].number) Season: \(GOTEpisode.num1[indexPath.row].season)"
                
                cell.image1.image = UIImage(named:  GOTEpisode.num1[indexPath.row].originalImageID )
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "sea2", for: indexPath) as? Sea2TableViewCell{
                cell.nameLabel2.text = GOTEpisode.num2[indexPath.row].name
                
                cell.epLabel2.text = "Episode: \(GOTEpisode.num2[indexPath.row].number) Season: \(GOTEpisode.num2[indexPath.row].season)"
                
                cell.image2.image = UIImage(named:  GOTEpisode.num2[indexPath.row].originalImageID )
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "sea1", for: indexPath) as? Sea1TableViewCell{
                cell.nameLabel1.text = GOTEpisode.num3[indexPath.row].name
                
                cell.epNumber.text = "Episode: \(GOTEpisode.num3[indexPath.row].number) Season: \(GOTEpisode.num3[indexPath.row].season)"
                
                cell.image1.image = UIImage(named:  GOTEpisode.num3[indexPath.row].originalImageID )
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "sea2", for: indexPath) as? Sea2TableViewCell{
                cell.nameLabel2.text = GOTEpisode.num4[indexPath.row].name
                
                cell.epLabel2.text = "Episode: \(GOTEpisode.num4[indexPath.row].number) Season: \(GOTEpisode.num4[indexPath.row].season)"
                
                cell.image2.image = UIImage(named:  GOTEpisode.num4[indexPath.row].originalImageID )
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "sea1", for: indexPath) as? Sea1TableViewCell{
                cell.nameLabel1.text = GOTEpisode.num5[indexPath.row].name
                
                cell.epNumber.text = "Episode: \(GOTEpisode.num5[indexPath.row].number) Season: \(GOTEpisode.num5[indexPath.row].season)"
                
                cell.image1.image = UIImage(named:  GOTEpisode.num5[indexPath.row].originalImageID )
                return cell
            }
        case 5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "sea2", for: indexPath) as? Sea2TableViewCell{
                cell.nameLabel2.text = GOTEpisode.num6[indexPath.row].name
                
                cell.epLabel2.text = "Episode: \(GOTEpisode.num6[indexPath.row].number) Season: \(GOTEpisode.num6[indexPath.row].season)"
                
                cell.image2.image = UIImage(named:  GOTEpisode.num6[indexPath.row].originalImageID )
                return cell
            }
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "sea1", for: indexPath) as? Sea1TableViewCell{
                cell.nameLabel1.text = GOTEpisode.num7[indexPath.row].name
                
                cell.epNumber.text = "Episode: \(GOTEpisode.num7[indexPath.row].number) Season: \(GOTEpisode.num7[indexPath.row].season)"
                
                cell.image1.image = UIImage(named:  GOTEpisode.num7[indexPath.row].originalImageID )
                return cell
            }
            
        default:
            print("nice try")
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let header = Functions()
        return header.title(section)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

