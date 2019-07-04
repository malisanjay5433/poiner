//
//  CategoryModel.swift
//  PioneerApp
//
//  Created by Sanjay Mali on 26/05/19.
//  Copyright © 2019 theappmaker. All rights reserved.
//

import Foundation
struct CategoryModel:Decodable{
    let meta:CategoryData?
    let data:[CategoryDataModel]?
}
struct CategoryDataModel:Decodable{
    let id:Int?
    let title:String?
    let get_images:[String]?
    let description:String?
    let like:Int?
    let visit:Int?
//    let tag:Int?
    let url:String?
    let state:String?
    let city:String?
    let created_date:String?
    let name:String?
}
struct CategoryData:Decodable {
    let totalRecords:Int?
    let next:String?
//    JWT-Token : ""
//    totalRecords : 17
//    page-size : 10
//    next : "http://159.89.162.248/v1/dev/news/?category__category=Desh&page=2"
//    previous : null
}
