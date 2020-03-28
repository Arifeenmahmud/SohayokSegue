//
//  DetailViewController.swift
//  collectionViewSegue
//
//  Created by Arifeen Mahmud on 3/15/20.
//  Copyright © 2020 Arifeen Mahmud. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selection: String!
    @IBOutlet private weak var detailsLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsLable.text = selection
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let Imgname = ["Transport","Hotels","Ecommerce","Online Food"]
    
    let mainImg:[UIImage] = [
        
        UIImage(named: "ts")!,
        UIImage(named: "ho")!,
        UIImage(named: "ec")!,
        UIImage(named: "on")!
        
    ]
    

}


// MARK: Collection View
extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = (view.frame.size.width - 40) / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Imgname.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       // print(collectionView.dequeueReusableCell(withReuseIdentifier: "mysecondCell", for: indexPath))
        //self.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mysecondCell", for: indexPath) as! detailCollectionViewCell
        cell.mainText.text = Imgname[indexPath.item]
        cell.mainImageView.image = mainImg[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let text = mainImg[indexPath.row]
        //        print("Selected \(text)")
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailSegue"{
            if let dest = segue.destination as? DetailViewController,
                let index = myCollectionView.indexPathsForSelectedItems?.first {
                dest.selection = Imgname[index.row]
            }
        }
    }
    
}
