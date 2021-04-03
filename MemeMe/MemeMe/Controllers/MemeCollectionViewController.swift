//
//  MemeCollectionViewController.swift
//  MemeMe 2.0
//
//  Created by Pinar Unsal on 2021-04-02.
//

import Foundation
import UIKit

class MemeCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: Properties
    @IBOutlet weak var layoutFlow: UICollectionViewFlowLayout!
    @IBOutlet var collectionView: UICollectionView!
    var memes: [Meme]! {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBarItem()
        configureLayoutSize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    // MARK: Data Source Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        
        let meme = self.memes[indexPath.row]
        cell.memeImage.image = meme.memedImage
        cell.memeLabel.text = meme.bottomText
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailContainer = self.storyboard?.instantiateViewController(identifier: "MemeDetailViewController") as! MemeDetailViewController
        detailContainer.meme = self.memes[indexPath.row]
        
        self.navigationController?.pushViewController(detailContainer, animated: true)
    }
    
    // MARK: Functions
    // Layout Configuration
    func configureLayoutSize(){
        let spacex: CGFloat = 0.5
        let spacey: CGFloat = 0.5
        
        let dimensionx = (self.view.frame.width -  2*spacex)/3
        layoutFlow.minimumLineSpacing = spacey
        layoutFlow.minimumInteritemSpacing = spacex
        if self.view.frame.width < self.view.frame.height{
            layoutFlow.itemSize = CGSize( width: dimensionx , height: dimensionx)}
        else{
            layoutFlow.itemSize = CGSize( width: dimensionx/1.5 , height: dimensionx/1.5)
        }
        
        //make Sure the tab bar is present and navigation bar are present
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        
        //reload the data in case there is new memes
        self.collectionView?.reloadData()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition( to: size, with: coordinator)
        
        
        let spacex: CGFloat = 0.5
        let spacey: CGFloat = 0.5
        let dimensionx = (size.width - 2*spacex)/3
       
        layoutFlow.minimumLineSpacing = spacey
        layoutFlow.minimumInteritemSpacing = spacex
        if size.width < size.height{
            layoutFlow.itemSize = CGSize( width: dimensionx , height: dimensionx)}
        else{
            layoutFlow.itemSize = CGSize( width: dimensionx/1.5 , height: dimensionx/1.5)
        }
    }
    // Set Nav Item
    func setNavBarItem() {
        navigationItem.title = "Sent Memes"
    }
}
