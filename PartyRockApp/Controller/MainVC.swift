//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Руслан Акберов on 01.10.2017.
//  Copyright © 2017 Руслан Акберов. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var partyRocks = [PartyRock]()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "http://sub-cult.ru/images/news/metallica-live-photo.jpg", videoURL: """
<iframe width="560" height="315" src="https://www.youtube.com/embed/IRQhbTxrNds" frameborder="0" allowfullscreen></iframe>
""", videoTitle: "Metallica - Enter Sandman [Live Nimes 2009]")
        
        let p2 = PartyRock(imageURL: "http://images6.fanpop.com/image/photos/32400000/Metallica-metallica-32496204-1174-1313.jpg", videoURL: """
<iframe width="1252" height="576" src="https://www.youtube.com/embed/LjDmfU4zB7o" frameborder="0" allowfullscreen></iframe>
""", videoTitle: "Metallica - Blackened [MetOnTour - Detroit, MI - 2017]")
        
        let p3 = PartyRock(imageURL: "http://metbash.ru/wp-content/uploads/2011/10/metallica-30th-anniversary-metallibash.jpg", videoURL: """
<iframe width="1252" height="576" src="https://www.youtube.com/embed/huwbzOboWDw" frameborder="0" allowfullscreen></iframe>
""", videoTitle: "Metallica - Dream No More [Live - Mexico City, Mexico - 2017]")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }

}

