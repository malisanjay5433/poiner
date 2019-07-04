//
//  MoreViewController.swift
//  PioneerApp
//
//  Created by Sanjay Mali on 10/06/19.
//  Copyright © 2019 theappmaker. All rights reserved.
//

import UIKit
import YouTubePlayer
class MoreViewController: UIViewController ,ShowAlertView,UITextFieldDelegate{
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    var categoryData = [CategoryDataModel]()
    var searchedCategoryData = [CategoryDataModel]()
    
    var metatotalCount:CategoryModel?
    
    var page = 1
    var limit = 0
    var nextPage:String?
    let threshold = 10 // threshold from bottom of tableView
    var isLoadingMore = false // flag
    var offset = 0
    var didScrollOffset = 0
    var totalPropertyCount = 0
    var selectedApi:String?
    var likes: [String]?
    var categoryData1:CategoryDataModel?
    var isVideoCell:Bool?
    @IBOutlet weak var searchbox: UITextField!
    var iSearchEnabled:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 320
        //        self.searchbox.delegate = self
        self.iSearchEnabled = false
        self.isVideoCell = false
        segmentController.selectedSegmentIndex = 0
        if segmentController.selectedSegmentIndex == 0{
            getFeed(api: APIConstants.LR_ENDPOINT.categoryHealth, page:1)
            selectedApi = APIConstants.LR_ENDPOINT.categoryHealth
        }
    }
    
    @IBAction func segmentAction(_ sender: Any) {
        page = 1
        self.iSearchEnabled = false
        self.isVideoCell = false
        if segmentController.selectedSegmentIndex == 0{
            selectedApi = APIConstants.LR_ENDPOINT.categoryHealth
            getFeed(api: APIConstants.LR_ENDPOINT.categoryHealth,page:page)
        }else if segmentController.selectedSegmentIndex == 1{
            selectedApi = APIConstants.LR_ENDPOINT.Bollywood
            getFeed(api: APIConstants.LR_ENDPOINT.Bollywood,page:page)
        }
        if segmentController.selectedSegmentIndex == 2{
            selectedApi = APIConstants.LR_ENDPOINT.Sports
            getFeed(api: APIConstants.LR_ENDPOINT.Sports,page:page)
        }else if segmentController.selectedSegmentIndex == 3{
            self.isVideoCell = true
            //            http://159.89.162.248/v1/dev/videos/
            //            http://159.89.162.248/v1/dev/news/?category__category=video-gallery&page=1
            selectedApi = APIConstants.LR_ENDPOINT.categoryVideos
            getFeed(api: APIConstants.LR_ENDPOINT.categoryVideos,page:page)
        }
        if segmentController.selectedSegmentIndex == 4{
            //            selectedApi = APIConstants.LR_ENDPOINT.categoryPhotos
            //            getFeed(api: APIConstants.LR_ENDPOINT.categoryPhotos,page:page)
        }else if segmentController.selectedSegmentIndex == 5{
            //            selectedApi = APIConstants.LR_ENDPOINT.
            //            getFeed(api: APIConstants.LR_ENDPOINT.categoryPhotos,page:page)
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let x = self.categoryData
        if (textField.text?.count)! > 1{
            searchApi(api:textField.text, page: 1)
        }else{
            print(textField.text)
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        iSearchEnabled = false
    }
    @IBAction func BackBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MoreViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        var numOfSections: Int = 0
        if categoryData.count > 0{
            tableView.separatorStyle = .singleLine
            numOfSections            = 1
            tableView.backgroundView = nil
        }
        else{
            let noDataLabel: UILabel  = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text          = "No data available"
            noDataLabel.textColor     = UIColor.black
            noDataLabel.textAlignment = .center
            tableView.backgroundView  = noDataLabel
            tableView.separatorStyle  = .none
        }
        return numOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        if isVideoCell == true{
        //            return searchedCategoryData.count
        //        }else{
        return categoryData.count
        //        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell") as! FeedCell
        if isVideoCell == true{
            let cell = tableView.dequeueReusableCell(withIdentifier:"VideoPlayerCell") as! VideoPlayerCell
            let data = categoryData[indexPath.row]
            let url = URL(string: data.url!)
            //            cell.video_Player.loadVideoURL(url!)
            let id = data.url!.replacingOccurrences(of: "https://www.youtube.com/embed/", with: "")
            cell.video_Player.loadVideoID(id)
            cell.titleLabel.text = "\(data.title?.htmlToString ?? "")"
            cell.likeButton.setTitle("\(data.like)", for: .normal)
            cell.unlikeButton.setTitle("\(data.visit)", for: .normal)
            return cell
            
        }
        else{
            
            let data = categoryData[indexPath.row]
            cell.likeslbl.text = "\(data.like ?? 0)"
            cell.locationLbl.text = "\(data.city ?? "")"
            cell.bulletinLbl.text = "\(data.title?.htmlToString ?? "")"
            cell.viewsLbl.text = "\(data.visit!)"
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MMM d, yyyy"  //"MMM d, h:mm a" for  Sep 12, 2:11 PM
            let datee = dateFormatterGet.date(from: data.created_date!)
            cell.likeBtn.tag = indexPath.row
            cell.likeBtn.addTarget(self, action:#selector(likePost), for:.touchUpInside)
            cell.dateLbl.text =  dateFormatterPrint.string(from: datee ?? Date())
            print(dateFormatterPrint.string(from: datee ?? Date()))
            let imageUrl = data.get_images?.first
            offset = indexPath.row
            //        cell.likeBtn.addTarget(self, action: "handleLikes:", Selector("handleLikes:"): .touchUpInside)
            if imageUrl != "" {
                print(imageUrl)
                if imageUrl != nil{
                    let url = URL(string: APIConstants.ROOT.media  + imageUrl!)
                    cell.imageBanner.loadImageWithUrl(url!)
                }else{
                    cell.imageBanner.image = UIImage(named:"product_no_image")
                    cell.imageBanner.tintColor = UIColor.black
                }
                
                if indexPath.row == self.categoryData.count - 1 { // last cell
                    if (self.metatotalCount?.meta?.totalRecords)! > self.categoryData.count { // more items to fetch
                        page += 1
                        print(page)
                        getNextFeed(api:self.metatotalCount?.meta?.next, page:page)
                    }
                }
            }
            return cell
        }
    }
}
extension MoreViewController{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isVideoCell ==  false{
            self.categoryData1 = categoryData[indexPath.row]
            self.performSegue(withIdentifier:"DetailPage", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailPage"{
            let vc = segue.destination  as! DetailPageViewController
            vc.categoryData1 = self.categoryData1
        }
    }
    
    //
    //   @objc func handle(_ sender: UIButton){
    //        print(sender.tag) // This works, every cell returns a different number and in order.
    //        if likes?[sender.tag] == "like" {
    ////            likes?[sender.tag] = "unlike"
    //            sender.setImage(UIImage(named:"check"), for:.normal)
    //
    //        }
    //        else {
    ////            likes?[sender.tag] = "like"
    //            sender.setImage(UIImage(named:"check"), for:.normal)
    //        }
    //        sender.setTitle(likes?[sender.tag], for:.normal)
    ////    setTitle(likes?[sender.tag], forState:.normal)
    ////            setTitle(likes?[sender.tag], for
    //
    //    }
    @objc func likePost(_ sender:UIButton){
        let id =  self.categoryData[sender.tag].id
        let param = ["id":"\(id!)","increment":"True"] as [String : Any]
        DataManager.POSTContentTypeJSON(api:APIConstants.LR_ENDPOINT.like, param:param, moduleId:"", method:"POST") { (data,response,error) in
            
            guard  data != nil else {
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                
                if httpResponse.statusCode == 400{
                    self.showAlert(title:"", message: "Sorry something went wrong")
                }
            }
            
            let decoder = JSONDecoder()
            if let stringData = String(data: data!, encoding: String.Encoding.utf8) {
                print("json data = \(stringData)") //JSONSerialization
            }
            do{
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
                
            catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func getFeed(api:String?,page:Int?){
        if categoryData.count > 0{
            self.categoryData.removeAll()
        }
        var ap:String?
        if isVideoCell == true{
            ap  = api
        }else{
            ap  = api! + "&page=\(page!)"
        }
        
        DataManager.GET(api: ap! , method:"GET") { (data, response, error) in
            guard  data != nil else {
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                
                if httpResponse.statusCode == 400{
                    self.showAlert(title:"", message: "Sorry something went wrong")
                }
            }
            
            let decoder = JSONDecoder()
            if let stringData = String(data: data!, encoding: String.Encoding.utf8) {
                print("json data = \(stringData)") //JSONSerialization
            }
            do{
                
                let json = try decoder.decode(CategoryModel.self, from: data!)
                print("json:\(String(describing: json))")
                if json != nil {
                    self.metatotalCount = json
                    self.categoryData = self.categoryData + json.data!
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
                
            catch{
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getNextFeed(api:String?,page:Int?){
        
        DataManager.getNext(api: api! , method:"GET") { (data, response, error) in
            guard  data != nil else {
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                
                if httpResponse.statusCode == 400{
                    self.showAlert(title:"", message: "Sorry something went wrong")
                }
            }
            
            let decoder = JSONDecoder()
            if let stringData = String(data: data!, encoding: String.Encoding.utf8) {
                print("json data = \(stringData)") //JSONSerialization
            }
            do{
                
                let json = try decoder.decode(CategoryModel.self, from: data!)
                print("json:\(String(describing: json))")
                if json != nil {
                    self.metatotalCount = json
                    self.categoryData = self.categoryData + json.data!
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
                
            catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func searchApi(api:String?,page:Int?){
        DataManager.GET(api:"news/?search=" + api!  , method:"GET") { (data, response, error) in
            guard  data != nil else {
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                
                if httpResponse.statusCode == 400{
                    self.showAlert(title:"", message: "Sorry something went wrong")
                }
            }
            
            let decoder = JSONDecoder()
            if let stringData = String(data: data!, encoding: String.Encoding.utf8) {
                print("json data = \(stringData)") //JSONSerialization
            }
            do{
                
                self.iSearchEnabled = true
                
                let json = try decoder.decode(CategoryModel.self, from: data!)
                print("json:\(String(describing: json))")
                if json != nil {
                    self.metatotalCount = json
                    self.searchedCategoryData = json.data!
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
                
            catch{
                print(error.localizedDescription)
            }
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewContentHeight = tableView.contentSize.height
        let scrollOffsetThreshold = scrollViewContentHeight - tableView.bounds.size.height
        if(scrollView.contentOffset.y > scrollOffsetThreshold && tableView.isDragging) {
            
        }
    }
    
}

