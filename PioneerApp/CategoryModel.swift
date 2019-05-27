//
//  CategoryModel.swift
//  PioneerApp
//
//  Created by Sanjay Mali on 26/05/19.
//  Copyright © 2019 theappmaker. All rights reserved.
//

import Foundation
struct CategoryModel:Decodable{
//    let meta:DataModel?
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
//    let category:String?
    let state:String?
    let city:String?
    let created_date:String?
}
