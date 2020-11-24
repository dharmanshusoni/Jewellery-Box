//
//  ProductListVC.swift
//  Jewellery Box
//
//  Created by dharmanshu on 18/11/20.
//

import UIKit
import  Alamofire

class ProductListVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var productCollection: UICollectionView!

    var category : Category!
    var product : Product!
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = category.Name
        
        productCollection.dataSource = self
        productCollection.delegate = self
        
        AF.request("\(URL_BASE)\(URL_PRODUCT)").responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let jsonDate = [value]
                for productData in jsonDate {
                    if let obj = productData as? [String: Any] {
                        if let type = obj["data"] as? [AnyObject],type.count>0{
                            let tList = type
                            for x in 0..<tList.count {
                                let Id = tList[x]["id"]
                                let code = tList[x]["CODE"]
                                let weight = tList[x]["Weight"]
                                let karat = tList[x]["Karat"]
                                let name = tList[x]["ProName"]
                                let metal = tList[x]["Metal"]
                                let categoryId = tList[x]["CategoryID"]
                                let description = tList[x]["Description"]
                                
                                let proo = Product(ProductName: name as! String, Code: code as! String, id: Id as! Int, Karat: karat as! String, Weight: weight as! String, Metal: metal as! String, Description: description as! String, categoryId: categoryId as! Int)
                                
                                self.products.append(proo)
                            }
                        }
                    }
                }
                self.productCollection.reloadData()
                break
            case .failure( _):
                break
            }
        }
        navView.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "ProductListVC", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductListViewCell", for: indexPath) as? ProductListViewCell{
            
            let pro : Product!
            pro = products[indexPath.row]
            //let url = URL(string: pro.Src)!
            //let placeholderImage = UIImage(named: "default")!
            //cell.thumbImg.af.setImage(withURL: url, placeholderImage: placeholderImage)
            cell.configureCell(product: pro)
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
        return CGSize(width: 150, height: 187)
    }
    
    @IBAction func BackBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
