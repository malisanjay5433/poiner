//
//  FeedViewController.swift
//  PioneerApp
//
//  Created by Sanjay Mali on 20/05/19.
//  Copyright © 2019 theappmaker. All rights reserved.
//

import UIKit


class FeedViewController: UIViewController,ShowAlertView{
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    var categoryData = [CategoryDataModel]()
    var pageSize = 10
    var limit = 0
    var nextPage:String?
    let threshold = 10 // threshold from bottom of tableView
    var isLoadingMore = false // flag
    var offset = 0
    var didScrollOffset = 0
    var totalPropertyCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 320
        segmentController.selectedSegmentIndex = 0
        if segmentController.selectedSegmentIndex == 0{
            getFeed(api: APIConstants.LR_ENDPOINT.categoryDesh)

        }
    }

    @IBAction func segmentAction(_ sender: Any) {
        if segmentController.selectedSegmentIndex == 0{
            getFeed(api: APIConstants.LR_ENDPOINT.categoryDesh)
        }else if segmentController.selectedSegmentIndex == 1{
            getFeed(api: APIConstants.LR_ENDPOINT.categoryVidesh)
        }
        if segmentController.selectedSegmentIndex == 2{
            getFeed(api: APIConstants.LR_ENDPOINT.categoryHealth)
        }else if segmentController.selectedSegmentIndex == 3{
            getFeed(api: APIConstants.LR_ENDPOINT.categoryTechnology)
        }
        if segmentController.selectedSegmentIndex == 4{
            getFeed(api: APIConstants.LR_ENDPOINT.categoryPhotos)
        }else if segmentController.selectedSegmentIndex == 5{
            getFeed(api: APIConstants.LR_ENDPOINT.categoryPhotos)
        }
    }
}

extension FeedViewController:UITableViewDelegate,UITableViewDataSource{
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
        return categoryData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell") as! FeedCell
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
        cell.dateLbl.text =  dateFormatterPrint.string(from: datee ?? Date())
        print(dateFormatterPrint.string(from: datee ?? Date()))
        let imageUrl = data.get_images?.first
        if imageUrl != "" {
            print(imageUrl)
            if imageUrl != nil{
                let url = URL(string: APIConstants.ROOT.media  + imageUrl!)
                cell.imageBanner.loadImageWithUrl(url!)
            }else{
                cell.imageBanner.image = UIImage(named:"logoPoiner")
            }
           
            
        }
//        cell.shareLbl.text = "\(data)"
        return cell
    }
}

extension FeedViewController{
    func getFeed(api:String?){
        if categoryData.count > 0{
//            categoryData.removeAll()
        }
        print(api)
        DataManager.GET(api: api! , method:"GET") { (data, response, error) in
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
                self.categoryData = json.data!
                self.nextPage = json.meta?.next
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
                
            catch{
                print(error.localizedDescription)
            }
        }
        }
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        let offsetY = scrollView.contentOffset.y
//        let contentHeight = scrollView.contentSize.height
//        if offsetY > contentHeight - scrollView.frame.size.height {
//            getFeed(api:self.nextPage)
//            self.tableView.reloadData()
//         }
//     }

    
//  func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let contentOffset = scrollView.contentOffset.y
//        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
//
//        if !isLoadingMore && (Int(maximumOffset - contentOffset) <= threshold) {
//            // Get more data - API call
//            self.isLoadingMore = true
//            // Update UI
//            getFeed(api:nextPage)
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//                self.isLoadingMore = false
//            }
//        }
//    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {        
        let scrollViewContentHeight = tableView.contentSize.height
        let scrollOffsetThreshold = scrollViewContentHeight - tableView.bounds.size.height
        if(scrollView.contentOffset.y > scrollOffsetThreshold && tableView.isDragging) {
            if totalPropertyCount > categoryData.count && offset > didScrollOffset {
                didScrollOffset = offset
                self.offset += self.limit
                getFeed(api:nextPage)
            }
        }
 }
}
