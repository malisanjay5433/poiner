//
//  APIConstants.swift
//  AchieversClub
//
//  Created by Siddhant on 01/03/18.
//  Copyright © 2018 loylty. All rights reserved.
//
import Foundation
public class APIConstants{
    public struct ROOT{
        static var qa_url = "http://159.89.162.248/v1/dev/"
        static var media = "http://159.89.162.248/media/"
        
        static var live_url = "http://qaphfl.corp.loylty.com"
        static var user_selected_url = qa_url
       static func currentURL (){
            #if DEBUG
            APIConstants.ROOT.SELECTED_URL = user_selected_url
            print("I'm running in DEBUG mode")
            #else
            APIConstants.ROOT.SELECTED_URL = live_url
            print("I'm running in a non-DEBUG mode")
            #endif
        }
        static var SELECTED_URL = ""
    }
  //  "/RefreshToken"
    public  struct LR_ENDPOINT{
        static let login = "users/login/"
        static let createUser = "users/create_user/"
        static let users_Details = "users/details"
        static let generateToken = "token/"
        static let searchbar = "GetPointBalance"
        static let categoryDesh = "news/?category__category=Desh"
        static let categoryVidesh = "news/?category__category=Videsh"
        static let categoryTechnology = "news/?category__category=Technology"
        static let categoryPhotos = "news/?category__category=photo-gallery"
        static let categoryHealth = "news/?category__category=Health"
    }
}
