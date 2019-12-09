//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var seasonEpisode = [[GOTEpisode]](){
        didSet{
            tableView.reloadData()
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError ("no segue")
        }
        
//        let episode = seasonEpisode[indexPath.section][indexPath.row]
//        
        detailViewController.episode = seasonEpisode[indexPath.section][indexPath.row]
        
    }
    
    func loadData(){
        seasonEpisode = GOTEpisode.seasonSections()
    }
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasonEpisode[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        var cell: EpisodeCell!
        
        if indexPath.section % 2  == 0 {
            guard let seasonCell = tableView.dequeueReusableCell(withIdentifier: "rightDetail", for: indexPath) as? EpisodeCell else {
                fatalError("couldn't deque a right image cell")
            }
            cell = seasonCell
        }else {
            guard let seasonCell = tableView.dequeueReusableCell(withIdentifier: "leftDetail", for: indexPath) as? EpisodeCell else{
                fatalError("couldn't deque a left image cell")
            }
            cell = seasonCell
        }
        let episode = seasonEpisode[indexPath.section][indexPath.row]
        cell.cellConfigure(for: episode)
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(seasonEpisode[section].first!.season)"
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return seasonEpisode.count
    }
    
    
}


extension ViewController:  UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 140
        
    }
    
    
}


