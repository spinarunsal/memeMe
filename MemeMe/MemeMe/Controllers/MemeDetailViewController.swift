//
//  MemeDetailViewController.swift
//  MemeMe 2.0
//
//  Created by Pinar Unsal on 2021-04-02.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {
    
    // MARK: Properties
    var meme: Meme!
    @IBOutlet weak var memeImage: UIImageView!
    
    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        memeImage.image = meme.memedImage
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}
