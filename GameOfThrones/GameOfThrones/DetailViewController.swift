//
//  DetailViewController.swift
//  GameOfThrones
//
//  Created by Tanya Burke on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var gotDetailImageView: UIImageView!
       @IBOutlet weak var gotNameLabel: UILabel!
       @IBOutlet weak var gotContentDetailLabel: UITextView!
       @IBOutlet weak var gotDescLabel: UITextView!
       
       var episode: GOTEpisode?
       
       override func viewDidLoad() {
           super.viewDidLoad()
           updatedUI()
           gotContentDetailLabel.isEditable = false
           gotDescLabel.isEditable = false
           // Do any additional setup after loading the view.
       }
       
       func updatedUI(){
           guard let episodeName = episode else {
               fatalError("Verify prepare(for segue: )")
           }
           navigationItem.title = episodeName.name
           gotDetailImageView.image = UIImage(named: episodeName.originalImageID)
           gotNameLabel.text = episodeName.name
           gotContentDetailLabel.text = "Season:  \(episodeName.season)\nEpisode: \(episodeName.number)\nRuntime:  \(episodeName.runtime)\nAirDate: \(episodeName.airdate)"
           gotDescLabel.text = episodeName.summary
       }
}
