//
//
//
//  Constants.swift
//  OBC
//
//  Created by Aashish Chadha on 9/10/18.
//  Copyright © 2018 Loylty. All rights reserved.
//

import Foundation
import UIKit
class Constants {
    enum target : String {
        case OBC = "OBC"
        case PHFL = "PHFL"
        case LVB = "LVB"
        case CORP = "CORP"
        case L42Apps = "L42Apps"
        case OBCAboutUsUrl = "https://images.loylty.com/mcontent/lvb/AboutUs.html"
        case PHFLAboutUsUrl = "https://images.loylty.com/mcontent/lvb/AboutUs1.html"
        case LVBAboutUsUrl = "https://images.loylty.com/mcontent/lvb/AboutUs2.html"
        case L42AppsAboutUsUrl = "https://images.loylty.com/mcontent/lvb/AboutUs3.html"
        
    }
    
    struct ModuleHeaderGenerator
    {
        var moduleId = "ModuleID"
        func getMemberModuleHeader ()
        {
            UserDefaults.standard.setMemberModuleID(value: "fa69d163-ba2c-11e7-8376-00155d0a0867")
        }
    }
    func setQA (){
        
        
        #if OBC
        
        UserDefaults.standard.setClientID(value: "479049eb-6a56-11e8-8d62-00155dc9974a")
        UserDefaults.standard.setClientSecret(value: "6b985814-aa07-438f-a84a-193819cac95d")
        UserDefaults.standard.setProgramID(value: "ff80808162f69a650163ee34557e000d")
        
        #elseif CORP
        
        UserDefaults.standard.setClientID(value: "3685e1b5-81d8-4e81-9a16-36cacc64405f")
        UserDefaults.standard.setClientSecret(value: "68566D597133743677397A2443264629")
        UserDefaults.standard.setProgramID(value: "ff80808168f0c8e20169103834180004")
//        DataEncryptionKey: 28482B4D6251655468576D5A71347437
        
        
//        Android
//        ProgramId: ff80808168f0c8e20169103834180004
//        ClientId:e9e3b402-ae5d-46f1-9e8f-73e88debfc29
//        Secret: 217A25432A462D4A614E645267556B58

        #endif
        
        UserDefaults.standard.setRechargeBaseUrl(value: "http://192.168.61.203/LRAS.RSL.API/")
        UserDefaults.standard.setBusBaseUrl(value: "http://192.168.61.203/LRAS.BusAPI/")
        UserDefaults.standard.setCommonBaseUrl(value: "http://192.168.61.203/LRAS.CommonAPI/V1/")
        UserDefaults.standard.setFlightBaseUrl(value: "http://192.168.61.203/LRAS.FlightAPI/V3/")
        UserDefaults.standard.setHotelBaseUrl(value: "http://192.168.61.203/LRAS.HotelAPI/")
        UserDefaults.standard.setMemberBaseUrl(value: "http://192.168.61.203/LRAS.MemberAPI/V1/")
        UserDefaults.standard.setMerchandiseBaseUrl(value: "http://192.168.61.203/LRAS.MerchandiseAPI/Merchandise")
        UserDefaults.standard.setMovieBaseUrl(value: "http://192.168.61.203/LRAS.MovieAPI/")
        UserDefaults.standard.setOrderBaseUrl(value: "http://192.168.61.203/LRAS.OrderAPI/")
        UserDefaults.standard.setPaymentBaseUrl(value: "http://192.168.61.203/LRAS.PaymentAPI/")
        UserDefaults.standard.setPCIDSSUrl(value: "http://qalvb.corp.loylty.com/Rubicon_html/PCIDSS.html")
       
        UserDefaults.standard.setWebBaseUrl(value: "http://qalvb.corp.loylty.com")
        UserDefaults.standard.setAesKey(value: "wImKoNvsqbSswM/bO0FT4A==")
        UserDefaults.standard.setModuleID(value:"")
        UserDefaults.standard.setKnowMore(value:"https://images.loylty.com/mcontent/obc/Security.html")
        UserDefaults.standard.setAirMileBaseUrl(value: "http://192.168.61.203/LRAS.MilesAPI/")
    }
    func setUAT(){
        UserDefaults.standard.setBusBaseUrl(value: "https://uatbusb9.loylty.com/V1/")
        UserDefaults.standard.setCommonBaseUrl(value: "https://uatcomb9.loylty.com/V1/")
        UserDefaults.standard.setFlightBaseUrl(value: "https://uatfltb9.loylty.com/V1/")
        UserDefaults.standard.setHotelBaseUrl(value: "https://uathtlb9.loylty.com/V1/")
        UserDefaults.standard.setMemberBaseUrl(value: "https://uatmemb9.loylty.com/V1/")
        UserDefaults.standard.setMerchandiseBaseUrl(value: "https://uatmerb9.loylty.com/V1/Merchandise")
        UserDefaults.standard.setMovieBaseUrl(value: "https://uatmovb9.loylty.com/V1/")
        UserDefaults.standard.setOrderBaseUrl(value:"https://uatordb9.loylty.com/V1/")
        UserDefaults.standard.setPaymentBaseUrl(value:"https://uatpayb9.loylty.com/V1/")
        UserDefaults.standard.setPCIDSSUrl(value: "https://www.lvbrewardz.com/Rubicon_html/PCIDSS.html")
        UserDefaults.standard.setRechargeBaseUrl(value: "https://uatrecb9.loylty.com/V1/")
        UserDefaults.standard.setWebBaseUrl(value: "https://images.loylty.com/mcontent/lvb")
        UserDefaults.standard.setClientID(value: "1df561ba-6f9a-11e8-9023-00155d0a2840")
        UserDefaults.standard.setClientSecret(value: "432A462D4A614E645267556B58703273")
        UserDefaults.standard.setProgramID(value: "4028a9d2626c8b8f0163a64e389d00bd")
        UserDefaults.standard.setKnowMore(value:"https://images.loylty.com/mcontent/obc/Security.html")
        
        //        buildConfigField "String", "CLIENT_ID", '"1df561ba-6f9a-11e8-9023-00155d0a2840"'
        //        buildConfigField "String", "CLIENT_SECRET", '"432A462D4A614E645267556B58703273"'
        //        manifestPlaceholders = [PROGRAM_ID: "4028a9d2626c8b8f0163a64e389d00bd"]
        //        buildConfigField "String", "PROGRAM_ID", '"4028a9d2626c8b8f0163a64e389d00bd"
        UserDefaults.standard.setKnowMore(value:"https://images.loylty.com/mcontent/obc/Security.html")
        UserDefaults.standard.setAirMileBaseUrl(value: "")

        
        
        /*buildConfigField "String", "CLIENT_ID", '"1df561ba-6f9a-11e8-9023-00155d0a2840"'
         buildConfigField "String", "CLIENT_SECRET", '"432A462D4A614E645267556B58703273"'
         manifestPlaceholders = [PROGRAM_ID: "4028a9d2626c8b8f0163a64e389d00bd"]
         buildConfigField "String", "PROGRAM_ID", '"4028a9d2626c8b8f0163a64e389d00bd"'*/
        
    }
    
    func setPREPROD (){
        #if OBC
        
        UserDefaults.standard.setClientID(value: "b17904ea-2bf8-48d6-8e9d-a5be452f9d42")
        UserDefaults.standard.setClientSecret(value: "BED3D6529ADE43C5A0097CE1D4FD4D18")
        UserDefaults.standard.setProgramID(value: "4028c2ac63afff7c0164225afa430008")
        
        #elseif CORP
        UserDefaults.standard.setClientID(value: "b17904ea-2bf8-48d6-8e9d-a5be452f9d42")
        UserDefaults.standard.setClientSecret(value: "BED3D6529ADE43C5A0097CE1D4FD4D18")
        UserDefaults.standard.setProgramID(value: "4028c2ac63afff7c0164225afa430008")
        
        
        #endif
        
        UserDefaults.standard.setCommonBaseUrl(value: "https://comb9.loylty.com/V1/")
        UserDefaults.standard.setRechargeBaseUrl(value: "https://recb9.loylty.com/V1/")
        UserDefaults.standard.setOrderBaseUrl(value: "https://ordb9.loylty.com/V1/")
        UserDefaults.standard.setMemberBaseUrl(value: "https://memb9.loylty.com/V1/")
        UserDefaults.standard.setPaymentBaseUrl(value: "https://payb9.loylty.com/V1/")
        UserDefaults.standard.setMovieBaseUrl(value: "https://movb9.loylty.com/V1/")
        UserDefaults.standard.setMerchandiseBaseUrl(value: "https://merb9.loylty.com/V1/merchandise/")
        UserDefaults.standard.setFlightBaseUrl(value: "https://fltb9.loylty.com/V1/")
        UserDefaults.standard.setHotelBaseUrl(value: "https://htlb9.loylty.com/V1/")
        UserDefaults.standard.setBusBaseUrl(value: "https://busb9.loylty.com/V1/")
        UserDefaults.standard.setKnowMore(value:"https://images.loylty.com/mcontent/obc/Security.html")
        UserDefaults.standard.setEGVURL(value:"https://egvb9.loylty.com/V1/GiftCard/")

        
    }
    func setPROD (){
        
        #if OBC
        
        UserDefaults.standard.setClientID(value: "b17904ea-2bf8-48d6-8e9d-a5be452f9d42")
        UserDefaults.standard.setClientSecret(value: "BED3D6529ADE43C5A0097CE1D4FD4D18")
        UserDefaults.standard.setProgramID(value: "4028c2ac63afff7c0164225afa430008")
        
        #elseif CORP
        UserDefaults.standard.setClientID(value: "b17904ea-2bf8-48d6-8e9d-a5be452f9d42")
        UserDefaults.standard.setClientSecret(value: "BED3D6529ADE43C5A0097CE1D4FD4D18")
        UserDefaults.standard.setProgramID(value: "4028c2ac63afff7c0164225afa430008")
        
        
        #endif
        
        UserDefaults.standard.setCommonBaseUrl(value: "https://comb9.loylty.com/V1/")
        UserDefaults.standard.setRechargeBaseUrl(value: "https://recb9.loylty.com/V1/")
        UserDefaults.standard.setOrderBaseUrl(value: "https://ordb9.loylty.com/V1/")
        UserDefaults.standard.setMemberBaseUrl(value: "https://memb9.loylty.com/V1/")
        UserDefaults.standard.setPaymentBaseUrl(value: "https://payb9.loylty.com/V1/")
        UserDefaults.standard.setMovieBaseUrl(value: "https://movb9.loylty.com/V1/")
        UserDefaults.standard.setMerchandiseBaseUrl(value: "https://merb9.loylty.com/V1/merchandise/")
        UserDefaults.standard.setFlightBaseUrl(value: "https://fltb9.loylty.com/V1/")
        UserDefaults.standard.setHotelBaseUrl(value: "https://htlb9.loylty.com/V1/")
        UserDefaults.standard.setBusBaseUrl(value: "https://busb9.loylty.com/V1/")
        UserDefaults.standard.setKnowMore(value:"https://images.loylty.com/mcontent/obc/Security.html")
        UserDefaults.standard.setEGVURL(value:"https://egvb9.loylty.com/V1/GiftCard/")

    }
}
extension UserDefaults{
    enum UserDefaultsKeys : String {
        case CLIENT_ID
        case CLIENT_SECRET
        case PROGRAM_ID
        case WEB_BASE_URL
        case PCIDSS_BASE_URL
        case COMMON_BASE_URL
        case RECHARGE_BASE_URL
        case ORDER_BASE_URL
        case MEMEBER_BASE_URL
        case PAYMENT_BASE_URL
        case AIRMILE_BASE_URL
        case MOVIE_BASE_URL
        case MERCHANDISE_BASE_URL
        case FLIGHT_BASE_URL
        case HOTEL_BASE_URL
        case BUS_BASE_URL
        case AES_KEY
        case MODULE_ID
        case KNOW_MORE
        case EVG_BASE_URL
    }
    
    enum MemberID : String {
        case MEMBER_ID
    }
    
    func setAirMileBaseUrl(value: String){
        set(value, forKey: UserDefaultsKeys.AIRMILE_BASE_URL.rawValue)
        //synchronize()
    }
    
    func getAirMileBaseUrl() -> String{
        return string(forKey: UserDefaultsKeys.AIRMILE_BASE_URL.rawValue) ?? ""
    }
    
    //MARK: Save User Data
    func setPointRate(value: Double){
        set(value, forKey: "pointRate")
    }
    
    func getPointRate() -> Double{
        return double(forKey: "pointRate")
    }
    //MARK: Save User Data
    func setEGVURL(value: String){
        set(value, forKey: UserDefaultsKeys.EVG_BASE_URL.rawValue)
        //synchronize()
    }
    func getEGVURL() ->String{
          return string(forKey: UserDefaultsKeys.EVG_BASE_URL.rawValue) ?? ""
    }
    func setKnowMore(value: String){
        set(value, forKey: UserDefaultsKeys.KNOW_MORE.rawValue)
        //synchronize()
    }
    func getKnowMore() -> String{
        return string(forKey: UserDefaultsKeys.KNOW_MORE.rawValue) ?? ""
        //synchronize()
    }
    
    func setClientID(value: String){
        set(value, forKey: UserDefaultsKeys.CLIENT_ID.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getClientID() -> String{
        return string(forKey: UserDefaultsKeys.CLIENT_ID.rawValue) ?? ""
    }
    
    //MARK: Save User Data
    func setClientSecret(value: String){
        set(value, forKey: UserDefaultsKeys.CLIENT_SECRET.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getClientSecret() -> String{
        return string(forKey: UserDefaultsKeys.CLIENT_SECRET.rawValue) ?? ""
    }
    //MARK: Save User Data
    func setProgramID(value: String){
        set(value, forKey: UserDefaultsKeys.PROGRAM_ID.rawValue)
        //synchronize()
    }
    func setModuleID(value: String){
        set(value, forKey: UserDefaultsKeys.MODULE_ID.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getProgramID() -> String{
        return string(forKey: UserDefaultsKeys.PROGRAM_ID.rawValue) ?? ""
    }
    //MARK: Save User Data
    func setWebBaseUrl(value: String){
        set(value, forKey: UserDefaultsKeys.WEB_BASE_URL.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getWebBaseUrl() -> String{
        return string(forKey: UserDefaultsKeys.WEB_BASE_URL.rawValue) ?? ""
    }
    //MARK: Save User Data
    func setPCIDSSUrl(value: String){
        set(value, forKey: UserDefaultsKeys.PCIDSS_BASE_URL.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getPCIDSSUrl() -> String{
        return string(forKey: UserDefaultsKeys.PCIDSS_BASE_URL.rawValue) ?? ""
    }
    //MARK: Save User Data
    func setCommonBaseUrl(value: String){
        set(value, forKey: UserDefaultsKeys.COMMON_BASE_URL.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getCommonBaseUrl() -> String{
        return string(forKey: UserDefaultsKeys.COMMON_BASE_URL.rawValue) ?? ""
    }
    
    //MARK: Save User Data
    func setOrderBaseUrl(value: String){
        set(value, forKey: UserDefaultsKeys.ORDER_BASE_URL.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getOrderBaseUrl() -> String{
        return string(forKey: UserDefaultsKeys.ORDER_BASE_URL.rawValue) ?? ""
    }
    //MARK: Save User Data
    func setRechargeBaseUrl(value: String){
        set(value, forKey: UserDefaultsKeys.RECHARGE_BASE_URL.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getRechargeBaseUrl() -> String{
        return string(forKey: UserDefaultsKeys.RECHARGE_BASE_URL.rawValue) ?? ""
    }
    //MARK: Save User Data
    func setMemberBaseUrl(value: String){
        set(value, forKey: UserDefaultsKeys.MEMEBER_BASE_URL.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getMemberBaseUrl() -> String{
        return string(forKey: UserDefaultsKeys.MEMEBER_BASE_URL.rawValue) ?? ""
    }
    //MARK: Save User Data
    func setPaymentBaseUrl(value: String){
        set(value, forKey: UserDefaultsKeys.PAYMENT_BASE_URL.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getPaymentBaseUrl() -> String{
        return string(forKey: UserDefaultsKeys.PAYMENT_BASE_URL.rawValue) ?? ""
    }
    //MARK: Save User Data
    func setMovieBaseUrl(value: String){
        set(value, forKey: UserDefaultsKeys.MOVIE_BASE_URL.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getMovieBaseUrl() -> String{
        return string(forKey: UserDefaultsKeys.MOVIE_BASE_URL.rawValue) ?? ""
    }
    //MARK: Save User Data
    func setMerchandiseBaseUrl(value: String){
        set(value, forKey: UserDefaultsKeys.MERCHANDISE_BASE_URL.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getMerchandiseBaseUrl() -> String{
        return string(forKey: UserDefaultsKeys.MERCHANDISE_BASE_URL.rawValue) ?? ""
    }
    //MARK: Save User Data
    func setFlightBaseUrl(value: String){
        set(value, forKey: UserDefaultsKeys.FLIGHT_BASE_URL.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getFlightBaseUrl() -> String{
        return string(forKey: UserDefaultsKeys.FLIGHT_BASE_URL.rawValue) ?? ""
    }
    //MARK: Save User Data
    func setHotelBaseUrl(value: String){
        set(value, forKey: UserDefaultsKeys.HOTEL_BASE_URL.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getHotelBaseUrl() -> String{
        return string(forKey: UserDefaultsKeys.HOTEL_BASE_URL.rawValue) ?? ""
    }
    //MARK: Save User Data
    func setBusBaseUrl(value: String){
        set(value, forKey: UserDefaultsKeys.BUS_BASE_URL.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getBusBaseUrl() -> String{
        return string(forKey: UserDefaultsKeys.BUS_BASE_URL.rawValue) ?? ""
    }
    //MARK: Save User Data
    func setAesKey(value: String){
        set(value, forKey: UserDefaultsKeys.AES_KEY.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getAesKey() -> String{
        return string(forKey: UserDefaultsKeys.AES_KEY.rawValue) ?? ""
    }
    
    func setMemberModuleID(value: String){
        set(value, forKey: MemberID.MEMBER_ID.rawValue)
    }
    //    func getAppColor() ->String{
    //        return "AppColor"
    //    }
}


