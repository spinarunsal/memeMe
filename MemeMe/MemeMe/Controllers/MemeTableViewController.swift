//
//  MemeTableViewController.swift
//  MemeMe 2.0
//
//  Created by Pinar Unsal on 2021-04-02.
//

import Foundation
import UIKit

class MemeTableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource  {
    
    // MARK: Properties
    var appDelegateIdentifier = UIApplication.shared.delegate as! AppDelegate
    var memes: [Meme]! {
        return appDelegateIdentifier.memes
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var infoLabel: UILabel!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        setNavBarItem()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if appDelegateIdentifier.memes.count == 0 {
            infoLabel.text = "Make new Memes"
        }
        else {
            infoLabel.text = ""
        }
        self.tableView!.reloadData()
    }
    
    // MARK: Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    // Populate cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memeTableViewCell")!
        
        let meme = self.memes[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = meme.topText + " " + meme.bottomText
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected cell
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    // MARK: Functions
    
    // Set Nav Item
    func setNavBarItem() {
        navigationItem.title = "Sent Memes"
    }
}
