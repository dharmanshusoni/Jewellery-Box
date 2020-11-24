//
//  Product.swift
//  Jewellery Box
//
//  Created by dharmanshu on 19/11/20.
//

import Foundation

class Product {
    
    private var _id:Int!
    private var _CODE:String!
    private var _ProName:String!
    private var _Karat:String!
    private var _Weight:String!
    private var _Metal:String!
    private var _Description:String!
    private var _CategoryID:Int!
    private var _productURL:String!
    
    var id : Int{
        if _id == nil {
            _id = 0
        }
        return _id
    }
    var CODE : String {
        if _CODE == nil {
            _CODE = ""
        }
        return _CODE
    }
    var ProName : String {
        return _ProName
    }
    var Karat : String {
        if _Karat == nil {
            _Karat = ""
        }
        return _Karat
    }
    var Weight : String {
        if _Weight == nil {
            _Weight = ""
        }
        return _Weight
    }
    var Metal : String {
        if _Metal == nil {
            _Metal = ""
        }
        return _Metal
    }
    var Description : String {
        if _Description == nil {
            _Description = ""
        }
        return _Description
    }
    var CategoryID : Int {
        if _CategoryID == nil {
            _CategoryID = 0
        }
        return _CategoryID
    }
    
    init(ProductName : String,Code : String,id: Int,Karat : String , Weight : String , Metal : String , Description : String , categoryId : Int) {
        self._ProName = ProductName
        self._id = id
        self._Karat = Karat
        self._Weight = Weight
        self._Metal = Metal
        self._Description = Description
        self._CategoryID = categoryId
        self._productURL = "\(URL_BASE)\(URL_PRODUCT)"
        //self._Src = path//"\(URL_BASE)\(URL_CATEGORY)"
    }
}
