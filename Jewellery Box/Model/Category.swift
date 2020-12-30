//
//  Jewellery.swift
//  Jewellery Box
//
//  Created by dharmanshu on 17/11/20.
//

import Foundation
import Alamofire

class Category {
    
    private var _Name:String!
    private var _categoryURL:String!
    
    private var _CreatedBy:String!
    private var _CreatedOn:String!
    private var _HasSub:String!
    private var _ModifiedOn:String!
    private var _ParentID:String!
    private var _Src:String!
    private var _id:Int!
    private var _isAllowed:String!
    
    var categoryNew: [Category] = []
    
    var Name : String {
        return _Name
    }
    var id : Int{
        if _id == nil {
            _id = 0
        }
        return _id
    }
    var Src : String {
        if _Src == nil {
            _Src = ""
        }
        return _Src
    }
    var CreatedBy : String {
        if _CreatedBy == nil {
            _CreatedBy = ""
        }
        return _CreatedBy
    }
    var CreatedOn : String {
        if _CreatedOn == nil {
            _CreatedOn = ""
        }
        return _CreatedOn
    }
    var HasSub : String {
        if _HasSub == nil {
            _HasSub = ""
        }
        return _HasSub
    }
    var ModifiedOn : String {
        if _ModifiedOn == nil {
            _ModifiedOn = ""
        }
        return _ModifiedOn
    }
    var ParentID : String {
        if _ParentID == nil {
            _ParentID = ""
        }
        return _ParentID
    }
    var isAllowed: String {
        if _isAllowed == nil {
            _isAllowed = ""
        }
        return _isAllowed
    }
    
    init(name : String,path : String,id: Int) {
        self._Name = name
        self._id = id
        self._Src = path//"\(URL_BASE)\(URL_CATEGORY)"
        self._categoryURL = "\(URL_BASE)\(URL_CATEGORY)"
    }
    init()
    {
    }
    func downloadCategories(completed: @escaping DownloadComplete){
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
                                self._id = id as! Int
                                
                                let name = tList[x]["Name"]
                                self._Name = name as! String
                                
                                let pathSrc : String!
                                pathSrc = tList[x]["Src"] as? String
                                self._categoryURL = pathSrc
                                
                                let path = "http://cloudseven7-001-site2.ctempurl.com"+pathSrc
                                self._Src = path
                                
                                let cat = Category(name : name as! String,path : path, id: id as! Int)
                                self.categoryNew.append(cat)
                            }
                        }
                    }
                    completed()
                }
                //self.collection.reloadData()
                break
            case .failure( _):
                break
            }
            //completed()
        }
    }
}
