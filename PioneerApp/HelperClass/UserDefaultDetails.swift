//
//  UserDefault.swift
//  AchieversClub
//
//  Created by Sanjay Mali on 12/02/18.
//  Copyright © 2018 Sanjay Mali. All rights reserved.
//

import Foundation
import UIKit
//AppConstants

enum appConstants: String{
    case isLocationBusApi = "isLocationBusApi"
    case isLocationApi = "isLocationApi"
    
    case isLocationFlightApi = "isLocationFlightApi"
    case isLocationTravellerApi = "isLocationTravellerApi"
    
    case isLogeddIN = "isLoggedIn"
    case isLogeddOUT = "isLogeddOUT"
    case UserInfo = "userInfo"
    case DeviceToken = "deviceToken"
    case FirbaseToken = "firbaseToken"
    case Color = "AppColor"
    
    case UDID = "ffffffff-90a9-3083-0000-000066de8519"
    case UserAgent = "android"
    case LRSignAuth = "LRSignAuth"
    case Channel = "Android"
    case ModuleId = "ModuleId"
    case HttpMethod = "GET"
    case UserIp = "192.168.98.87"
    case ProgramID = "ff80808161d2b00c0162295447e10008"
    //case ProgramID = "ff80808162f69a650163ee34557e000d"
    
    case MEMBER_MODULE_ID="fa69d163-ba2c-11e7-8376-00155d0a0867"
    case MOBILE_MODULE_ID="99aff46f-bdfa-11e7-8376-00155d0a0867"
    case MERCHANDISE_MODULE_ID="825362de-db45-11e7-960e-00155dc90735"
    case PAYMENT_MODULE_ID="94a6ff9c-bdfa-11e7-8376-00155d0a0867"
    case MOVIE_MODULE_ID="ac8469c0-d430-11e7-960e-00155dc90735"
    case HOTEL_MODULE_ID="e1427d3b-db3f-11e7-960e-00155dc90735"
    case DTH_MODULE_ID="f5bd690b-d9cd-11e7-960e-00155dc90735"
    case ORDER_MODULE_ID = "0f57b4ef-bdfa-11e7-8376-00155d0a0867"
    //case REGISTER_MODULE_ID = "fa69d163-ba2c-11e7-8376-00155d0a0867"
    case AIRMILES_MODULE_ID = "a875d9e5-f928-11e8-83a3-00155dc997a9"
    case FLIGHT_MODULE_ID="ba28f740-da29-11e7-960e-00155dc90735"
    case BUS_MODULE_ID = "df7691da-282f-11e8-931f-00155dc905b9"
    case EVG_MODULE_ID = "3a0d3ee2-e422-11e8-9b38-00155dc9974a"
}
struct UserDefaultDetails{
    
    func setUserLocationMovieCode (regionCode : String)
    {
        UserDefaults.standard.set(regionCode, forKey:"LocationMovieCode")
        UserDefaults.standard.synchronize()
    }
    
    func getUserLocationMovieCode() -> String {
        let userid = UserDefaults.standard.value(forKey: "LocationMovieCode")
        return (userid ?? "") as! String
    }
    
    func setUserLocationMovieName (regionName : String)
    {
        UserDefaults.standard.set(regionName, forKey:"LocationMovieName")
        UserDefaults.standard.synchronize()
    }
    
    func getUserLocationMovieName() -> String {
        let userid = UserDefaults.standard.value(forKey: "LocationMovieName")
        return (userid ?? "") as! String
    }
    
    func getUDID()->String{
        let uid = UIDevice.current.identifierForVendor!.uuidString
        return uid
    }
    
    static func getEGVModuleID () -> String
    {
        return appConstants.EVG_MODULE_ID.rawValue
        
    }
    static func getAirMilesModuleID () -> String
    {
        return appConstants.AIRMILES_MODULE_ID.rawValue
        
    }
    static func getMemberModuleID () -> String
    {
        return appConstants.MEMBER_MODULE_ID.rawValue
        
    }
    static func getMobileModuleID () -> String
    {
        return appConstants.MOBILE_MODULE_ID.rawValue
        
    }
    static func getMerchandiseModuleID () -> String
    {
        return appConstants.MERCHANDISE_MODULE_ID.rawValue
        
    }
    func getPaymentModuleID () -> String
    {
        return appConstants.PAYMENT_MODULE_ID.rawValue
        
    }
    func getMovieModuleID () -> String
    {
        return appConstants.MOVIE_MODULE_ID.rawValue
        
    }
    func getHotelModuleID () -> String
    {
        return appConstants.HOTEL_MODULE_ID.rawValue
        
    }
    func getDTHModuleID () -> String
    {
        return appConstants.DTH_MODULE_ID.rawValue
        
    }
    func getOrderModuleID () -> String
    {
        return appConstants.ORDER_MODULE_ID.rawValue
        
    }
    func getRegisterModuleID () -> String
    {
        return appConstants.MEMBER_MODULE_ID.rawValue
        
    }
    func getFlightModuleID () -> String
    {
        return  appConstants.FLIGHT_MODULE_ID.rawValue
        
    }
    
    func getBusModuleID () -> String
    {
        return appConstants.BUS_MODULE_ID.rawValue
        
    }
    
    func isLocationBusApi(){
        UserDefaults.standard.set(false, forKey:appConstants.isLocationBusApi.rawValue)
        UserDefaults.standard.synchronize()
    }
    func isLocationFlightApi(){
        UserDefaults.standard.set(false, forKey:appConstants.isLocationFlightApi.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func isLocationTravellerApi(){
        UserDefaults.standard.set(false, forKey:appConstants.isLocationTravellerApi.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    
    static func getisLocationBusApi() ->Bool{
        let isLocationBusApi = UserDefaults.standard.bool(forKey: appConstants.isLocationBusApi.rawValue)
        return isLocationBusApi
    }
    
    static func saveUserDetails(dic:[String:String]) {
        UserDefaults.standard.set(dic, forKey:  appConstants.UserInfo.rawValue)
        UserDefaults.standard.synchronize()
    }
    //    Save DeviceUDID
    static func saveDeviceUDID(udid:String){
        UserDefaults.standard.set(udid, forKey:appConstants.UDID.rawValue)
        UserDefaults.standard.synchronize()
    }
    func loggedIN(isLoggedIN:Bool){
        UserDefaults.standard.set(isLoggedIN, forKey:appConstants.isLogeddIN.rawValue)
        UserDefaults.standard.synchronize()
    }
    func isLocationApi(){
        UserDefaults.standard.set(false, forKey:appConstants.isLocationApi.rawValue)
        UserDefaults.standard.synchronize()
    }
    func saveDeviceToken(deviceToken:String) {
        UserDefaults.standard.set(deviceToken, forKey: appConstants.DeviceToken.rawValue)
        UserDefaults.standard.synchronize()
    }
    func saveFirebaseDeToken(deviceToken:String) {
        UserDefaults.standard.set(deviceToken, forKey: appConstants.FirbaseToken.rawValue)
        UserDefaults.standard.synchronize()
    }
    //    save userInfo
    func saveUserInfo(userInfo:[String:String]){
        UserDefaults.standard.set(userInfo, forKey:appConstants.UserInfo.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func getUserInfo() ->[String:String]{
        let login = UserDefaults.standard.value(forKey:appConstants.UserInfo.rawValue) as? [String:String]
        return login ?? [:]
    }
    func getDeviceToken() ->String{
        let deviceToken = UserDefaults.standard.value(forKey: appConstants.DeviceToken.rawValue)
        if deviceToken != nil{
            return deviceToken as! String
        }else{
            return ""
        }
    }
    func getFirebaseToken() ->String{
        let deviceToken = UserDefaults.standard.value(forKey: appConstants.FirbaseToken.rawValue)
        if deviceToken != nil{
            return deviceToken as! String
        }else{
            return ""
        }
    }
    static func isloggedIn() ->Bool{
        let isloggedIn = UserDefaults.standard.bool(forKey: appConstants.isLogeddIN.rawValue)
        return isloggedIn
    }
    static func getisLocationApi() ->Bool{
        let islocationApi = UserDefaults.standard.bool(forKey: appConstants.isLocationApi.rawValue)
        return islocationApi
    }
    
    static func getIsLocationFlightApi() ->Bool{
        let isLocationFlightApi = UserDefaults.standard.bool(forKey: appConstants.isLocationFlightApi.rawValue)
        return isLocationFlightApi
    }
    
    
    static func getIsLocationTravellerApi() ->Bool{
        let isLocationTravellerApi = UserDefaults.standard.bool(forKey: appConstants.isLocationTravellerApi.rawValue)
        return isLocationTravellerApi
    }
    
    static func getAppColor()->String{
        let color = "AppColor"
        //        let appColor = AppColor.hexStringToUIColor(hex:color ?? "")
        return color
    }
    static func saveAppColor(hex:String){
        UserDefaults.standard.set(hex, forKey: appConstants.Color.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func getUserDetails() ->[String:String]{
        let userInfo = UserDefaults.standard.value(forKey: appConstants.UserInfo.rawValue)
        if userInfo != nil{
            return userInfo as! [String : String]
            
        }else{
            return [:]
        }
    }
    
    func setUserIdPassword (userid : String, password : String)
    {
        UserDefaults.standard.set(userid, forKey:"userId")
        UserDefaults.standard.set(password, forKey:"password1")
        UserDefaults.standard.synchronize()
    }
    
    func getUserId() ->(String){
        let userid = UserDefaults.standard.value(forKey: "userId")
        return userid as! String
    }
    
    func getPassword() ->(String){
        let password = UserDefaults.standard.value(forKey: "password1")
        return password as! String
    }
    
    func setToken (token : String)
    {
        UserDefaults.standard.set(token, forKey:"Token")
        UserDefaults.standard.synchronize()
    }
    
    func setRefreshToken (token : String)
    {
        UserDefaults.standard.set(token, forKey:"RefreshToken")
        UserDefaults.standard.synchronize()
    }
    
    func getRefreshToken() ->(String){
        let refreshToken = UserDefaults.standard.value(forKey: "RefreshToken")
        return refreshToken as! String
    }
    func getToken() ->(String){
        let refreshToken = UserDefaults.standard.value(forKey: "Token")
        return refreshToken as? String ?? ""
    }
}

