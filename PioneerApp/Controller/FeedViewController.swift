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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 320
        
    }

    @IBAction func segmentAction(_ sender: Any) {
        if segmentController.selectedSegmentIndex == 0{
            getFeed(api: APIConstants.LR_ENDPOINT.categoryDesh)
        }else if segmentController.selectedSegmentIndex == 1{
            getFeed(api: APIConstants.LR_ENDPOINT.categoryVidesh)
        }
    }
}

extension FeedViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell") as! FeedCell
        let data = categoryData[indexPath.row]
        cell.likeslbl.text = "\(data.like ?? 0)"
        cell.locationLbl.text = "\(data.city ?? "")"
        cell.bulletinLbl.text = "\(data.title ?? "")"
        cell.viewsLbl.text = "\(data.visit!)"
//        let url = URL(string: "\(data.get_images?.first ?? "")")
//        cell.imageBanner.loadImageWithUrl(url!)
//        cell.shareLbl.text = "\(data)"
        return cell
    }
}

extension FeedViewController{
    func getFeed(api:String?){
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
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
                
            catch{
                print(error.localizedDescription)
            }
        }
        }
    }
