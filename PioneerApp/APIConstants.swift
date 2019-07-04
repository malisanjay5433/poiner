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
//        static var qa_url = "http://159.89.162.248/v1/dev/"
        static var qa_url = "http://139.59.42.154/v1/dev/"
//        static var qa_url = "http://205b1287.ngrok.io/v1/dev/"
        static var media = "http://139.59.42.154/media/"
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
        static let users_Details = "users/details/"
        static let users_DetailsUpdate = "users/update_details/"
        static let users_Otpauthenticate = "users/otp-authenticate/"
        static let generateToken = "token/"
        static let like = "news/like_news/"
        static let searchbar = "GetPointBalance"
        static let categoryDesh = "news/?category__category=Desh"
        static let categoryVidesh = "news/?category__category=Videsh"
        static let categoryTechnology = "news/?category__category=Technology"
        static let categoryPhotos = "news/?category__category=photo-gallery"
        static let categoryVideos = "videos/"
        static let categoryHealth = "news/?category__category=Health"
        static let searchBox = "/news/?search="
        static let Sports = "news/?category__category=Sports"
        static let Bollywood = "news/?category__category=Bollywood"
        static let State = "state/"
        static let StateWiseNews = "news/?state_id__name="
    }
}
