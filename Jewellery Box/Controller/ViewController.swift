//
//  ViewController.swift
//  Jewellery Box
//
//  Created by dharmanshu on 16/11/20.
//

import UIKit
import Alamofire
import AlamofireImage


class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var category : Category!
    var categoryNew: [Category] = []
    //var category = [Category]()
    //var categoryNew : Category!
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var collection : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collection.dataSource = self
        collection.delegate = self
        AF.request("\(URL_BASE)\(URL_CATEGORY)").responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let jsonDate = [value]
                for categoryData in jsonDate {
                    if let obj = categoryData as? [String: Any] {
                        if let type = obj["data"] as? [AnyObject],type.count>0{
                            let tList = type
                            for x in 0..<tList.count {
                                let id = tList[x]["id"]
                                let name = tList[x]["Name"]
                                let pathSrc : String!
                                pathSrc = tList[x]["Src"] as? String
                                let path = "http://cloudseven7-001-site2.ctempurl.com"+pathSrc
                                let cat = Category(name : name as! String,path : path, id: id as! Int)
                                self.categoryNew.append(cat)                                
                            }
                        }
                    }
                }
                self.collection.reloadData()
                break
            case .failure( _):
                break
            }
        }
        navView.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryNew.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ProductListVC", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemViewCell", for: indexPath) as? ItemViewCell{
            
            let cat : Category!
            cat = categoryNew[indexPath.row]            
            let url = URL(string: cat.Src)!
            let placeholderImage = UIImage(named: "default")!
            cell.thumbImg.af.setImage(withURL: url, placeholderImage: placeholderImage)
            cell.configureCell(category: cat)
            return cell
        }
        else{
            return UICollectionViewCell()
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 110)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProductListVC"{
            if let detailsVC = segue.destination as? ProductListVC {
                if let paths = collection?.indexPathsForSelectedItems {
                    let row = paths[0].row
                    detailsVC.category = categoryNew[row]
                }
            }
        }
    }
}

extension UIView {
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}
