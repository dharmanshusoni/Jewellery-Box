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
    
    func downloadCategories(completed: @escaping DownloadComplete){
        AF.request(_categoryURL).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print(value)
                let jsonDate = [value]
                 for category in jsonDate {
                    print(jsonDate)
                    if let obj = category as? [String: Any] {
                    }
                    completed()
                }
                break
            case .failure(let error): print(error)
                break
            }
            completed()
        }
    }
}
