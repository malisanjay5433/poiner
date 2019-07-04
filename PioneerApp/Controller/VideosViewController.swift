////
////  VideosViewController.swift
////  HDFCPerks
////
////  Created by Sanjay Mali on 28/05/18.
////  Copyright © 2018 Sanjay Mali. All rights reserved.
////
//
//import UIKit
//import AAPlayer
//struct Videos:Decodable {
//    var DisLikeCount:Int?
//    var LikeCount:Int?
//    var Status:String?
//    let UplodedDate:String?
//    let VideoDesc:String?
//    let VideoID:Int?
//    let VideoName:String?
//    let VideoUrl:String?
//    let ViewCount:Int?
//}
//struct LikModel:Decodable{
//    var isAuthorised: Int?
//    var Code: Int?
//    var Message : String?
//    var Succeeded : Int
//    var Data :Bool?
//}
//class VideosViewController: UIViewController,AAPlayerDelegate,ShowAlertView{
//    @IBOutlet weak var tableView:UITableView!
//    let user = UserDefaultDetails()
//
//    var video = [Videos]()
//    var images: [URL?]!
//    var like_param:[String:Any]?
//    var unlike_param:[String:Any]?
//    var selectedCell:VideoPlayerCell?
//    var islike = false
//    var isunlike = false
//
//    var indexPath:IndexPath?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.tableView.dataSource = self
//        self.tableView.delegate = self
//        tableView.estimatedRowHeight = 163.0
//        tableView.rowHeight = UITableViewAutomaticDimension
//        self.title  = "Videos"
//        getVideo()
//    }
//    func getVideo() {
//        let user = UserDefaultDetails()
//        let UUID = ["UUID":user.getUDID()]
//        DataManager.getJSONFromURL (APIConstants.PERKS_ENDPOINT.GetVideos, param:UUID) { (data, error) in
//            guard let data = data else { return
//            }
//            let decoder = JSONDecoder()
//            do{
//                let json = try decoder.decode(HDFCGenericModel<Videos>.self, from: data)
//                let a = json as HDFCGenericModel<Videos>
//                //                print("a:\(a)")
//                self.video = a.Data!
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//        }
//
//    }
//}
//
//extension VideosViewController:UITableViewDelegate,UITableViewDataSource{
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return video.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoPlayerCell", for:indexPath)  as! VideoPlayerCell
//        self.selectedCell = cell
//        cell.layer.shadowColor = UIColor.black.cgColor
//        cell.layer.shadowOpacity = 1
//        cell.layer.shadowOffset = CGSize.zero
//        cell.layer.shadowRadius = 5
//        self.indexPath = indexPath
//        let url = URL(string: video[indexPath.row].VideoUrl!)
//        cell.video_Player.loadVideoURL(url!)
//
//        print("video[indexPath.row].Status!:\(video[indexPath.row].Status!)")
//        if video[indexPath.row].Status! == "LIKE"{
//            cell.likeButton.setTitle("\(video[indexPath.row].LikeCount!)", for:.normal)
//            cell.likeButton.setImage(UIImage(named:"thumb_upfilled"), for: .normal)
//
//            cell.unlikeButton.setTitle("\(video[indexPath.row].DisLikeCount!)", for:.normal)
//            cell.unlikeButton.setImage(UIImage(named:"thumb_down"), for: .normal)
//
//        }
//        else if video[indexPath.row].Status! == "DISLIKE"{
//            cell.likeButton.setImage(UIImage(named:"thumb_up"), for: .normal)
//            cell.likeButton.setTitle("\(video[indexPath.row].LikeCount!)", for:.normal)
//
//            cell.unlikeButton.setImage(UIImage(named:"thumb_down_filled"), for: .normal)
//            cell.unlikeButton.setTitle("\(video[indexPath.row].DisLikeCount!)", for:.normal)
//        }
//        else{
//            cell.likeButton.setImage(UIImage(named:"thumb_up"), for: .normal)
//            cell.likeButton.setTitle("\(video[indexPath.row].LikeCount!)", for:.normal)
//            cell.unlikeButton.setImage(UIImage(named:"thumb_down"), for: .normal)
//            cell.unlikeButton.setTitle("\(video[indexPath.row].DisLikeCount!)", for:.normal)
//        }
//        cell.titleLabel.text = video[indexPath.row].VideoName!
//        cell.likeButton.tag  = indexPath.row
//        cell.likeButton.addTarget(self, action: #selector(like(_:)), for: .touchUpInside)
//        like_param  = ["Status":"LIKE","UUID":user.getUDID(),"VideoID":video[indexPath.row].VideoID!]
//
//
//        cell.unlikeButton.tag  = indexPath.row
//        cell.unlikeButton.addTarget(self, action: #selector(unlike(_:)), for: .touchUpInside)
//        unlike_param = ["Status":"DISLIKE","UUID":user.getUDID(),"VideoID":video[indexPath.row].VideoID!]
//
//        cell.viewButton.setTitle("\(video[indexPath.row].ViewCount!)", for:.normal)
//        cell.shareButton.tag  = indexPath.row
//        cell.shareButton.addTarget(self, action: #selector(share(_:)), for: .touchUpInside)
//        cell.infoButton.setImage(UIImage(named:"info-3"), for: .normal)
//        return cell
//    }
//
//
//    func like(param:[String:Any],api:String?,indexp:Int){
//        DataManager.getJSONFromURL (api!, param:param) { (data, error) in
//            print(api!,param,indexp)
//            guard let data = data else { return
//            }
//            let decoder = JSONDecoder()
//            do{
//                let json = try decoder.decode(LikModel.self, from: data)
//                print(json)
//                if json.Data == true{
//                    if self.islike == false{
//                        DispatchQueue.main.async {
//                            self.video[indexp].LikeCount! += 1
//                            self.video[indexp].Status = "LIKE"
//                            let x = self.video[indexp].LikeCount!
//                            print("LikeCount:\(x)")
//                            self.selectedCell?.likeButton.setTitle("\(x)", for:.normal)
//                            self.selectedCell?.likeButton.setImage(UIImage(named:"thumb_upfilled"), for: .normal)
//                            self.islike = true
//                            self.tableView.reloadData()
//
//                        }
//
//                    }
//                    else{
//                        DispatchQueue.main.async {
//                            self.video[indexp].LikeCount! -= 1
//                            self.video[indexp].Status = ""
//                            let x = self.video[indexp].LikeCount!
//                            print("LikeCount:\(x)")
//                            self.selectedCell?.likeButton.setTitle("\(x)", for:.normal)
//                            self.selectedCell?.likeButton.setImage(UIImage(named:"thumb_up"), for: .normal)
//                            self.islike = false
//                            self.tableView.reloadData()
//                        }
//                    }
//                }
//                else{
//                    self.showAlert(title:"Error", message:"Something went wrong!!")
//                }
//
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//        }
//    }
//
//
//    func unlike(param:[String:Any],api:String?,indexp:Int){
//        DataManager.getJSONFromURL (api!, param:param) { (data, error) in
//            print(api!,param,indexp)
//            guard let data = data else { return
//            }
//            let decoder = JSONDecoder()
//            do{
//                let json = try decoder.decode(LikModel.self, from: data)
//                print(json)
//                if json.Data == true{
//                    if self.isunlike == false{
//                        DispatchQueue.main.async {
//                            self.video[indexp].DisLikeCount! += 1
//                            self.video[indexp].Status = "DISLIKE"
//                            let x = self.video[indexp].DisLikeCount!
//                            self.selectedCell?.unlikeButton.setTitle("\(x)", for:.normal)
//                            self.selectedCell?.unlikeButton.setImage(UIImage(named:"thumb_upfilled"), for: .normal)
//                            self.isunlike = true
//                            self.tableView.reloadData()
//                        }
//
//                    }
//                    else{
//                        DispatchQueue.main.async {
//                            self.video[indexp].DisLikeCount! -= 1
//                            self.video[indexp].Status = ""
//                            let x = self.video[indexp].DisLikeCount!
//                            self.selectedCell?.unlikeButton.setTitle("\(x)", for:.normal)
//                            self.selectedCell?.unlikeButton.setImage(UIImage(named:"thumb_down"), for: .normal)
//                            self.isunlike = false
//                            self.tableView.reloadData()
//                        }
//                    }
//                }
//                else{
//                    self.showAlert(title:"Error", message:"Something went wrong!!")
//                }
//
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//        }
//    }
//    @objc func like(_ sender:UIButton){
//        if islike == false{
//            like(param:like_param!, api:APIConstants.PERKS_ENDPOINT.InsertVideoView,indexp:sender.tag)
//        }else{
//            like(param:unlike_param!, api:APIConstants.PERKS_ENDPOINT.InsertVideoView,indexp:sender.tag)
//        }
//    }
//    @objc func unlike(_ sender: UIButton){
//        if isunlike == false{
//            unlike(param:like_param!, api:APIConstants.PERKS_ENDPOINT.InsertVideoView,indexp:sender.tag)
//        }else{
//            unlike(param:unlike_param!, api:APIConstants.PERKS_ENDPOINT.InsertVideoView,indexp:sender.tag)
//        }
//    }
//
//    @IBAction func share(_ sender:UIButton){
//        let share = video[sender.tag]
//        let shareText = share.VideoUrl
//        if let text = shareText {
//            let vc = UIActivityViewController(activityItems: [text], applicationActivities: [])
//            present(vc, animated: true)
//        }
//    }
//}
//extension UIButton {
//    func centerTextAndImage(spacing: CGFloat) {
//        let insetAmount = spacing / 2
//        let writingDirection = UIApplication.shared.userInterfaceLayoutDirection
//        let factor: CGFloat = writingDirection == .leftToRight ? 1 : -1
//        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount*factor, bottom: 0, right: insetAmount*factor)
//        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount*factor, bottom: 0, right: -insetAmount*factor)
//        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
//    }
//}
