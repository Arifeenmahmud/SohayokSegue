//
//  ViewController.swift
//  collectionViewSegue
//
//  Created by Arifeen Mahmud on 3/14/20.
//  Copyright © 2020 Arifeen Mahmud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var slider: UIImageView!
    
    var imageNames = ["1","2","3","4","5"]//List of image names
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in
            self.slider.image = UIImage(named: self.imageNames.randomElement()!) //Slideshow logic
        }
        
        timer.fire() //Starts timer
        //timer.invalidate() //Stops timer
        
    }
    
    // MARK: Collection View Images
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let Imgname = ["National Info","Foreigners","ID Cards","Emergency"]
    
    let mainImg:[UIImage] = [
        
        UIImage(named: "ni")!,
        UIImage(named: "fn")!,
        UIImage(named: "id")!,
        UIImage(named: "em")!
        
    ]
    
}

// MARK: Collection View
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        cell.mainText.text = Imgname[indexPath.item]
        cell.mainImageView.image = mainImg[indexPath.item]
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let text = mainImg[indexPath.row]
        print("Selected \(text)")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        controller.selectedIndex = indexPath.row //pass selected cell index to next view.
        self.navigationController?.pushViewController(controller, animated: true)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "DetailSegue"{
//        if let dest = segue.destination as? DetailViewController,
//            let index = myCollectionView.indexPathsForSelectedItems?.first {
//           dest.selection = Imgname[index.row]
//            }
//        }
//    }
    
}


