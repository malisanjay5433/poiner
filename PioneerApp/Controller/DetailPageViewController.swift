//
//  DetailPageViewController.swift
//  PioneerApp
//
//  Created by Sanjay Mali on 04/06/19.
//  Copyright © 2019 theappmaker. All rights reserved.
//

import UIKit

class DetailPageViewController: UIViewController {
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var bulletinLbl: UILabel!
    @IBOutlet weak var newlbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var shareLbl: UILabel!
    @IBOutlet weak var commentBl: NSLayoutConstraint!
    @IBOutlet weak var likeslbl: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var viewsLbl: UILabel!
    @IBOutlet weak var imageBanner: ImagePlaceholderLoader!
    var categoryData1:CategoryDataModel?
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageUrl = categoryData1!.get_images?.first
        if imageUrl != "" {
            if imageUrl != nil{
                let url = URL(string: APIConstants.ROOT.media  + imageUrl!)
                imageBanner.loadImageWithUrl(url!)
            }else{
                imageBanner.image = UIImage(named:"product_no_image")
                imageBanner.tintColor = UIColor.black
            }
            
            likeslbl.text = "\(categoryData1?.like ?? 0)"
            viewsLbl.text = "\(categoryData1?.visit ?? 0)"
            bulletinLbl.text = "\(categoryData1?.description!.htmlToString ?? "")"
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MMM d, yyyy"
            //"MMM d, h:mm a" for  Sep 12, 2:11 PM
            print(categoryData1?.description)
            let datee = dateFormatterGet.date(from: (categoryData1?.created_date) ?? "" )
//            dateLbl.text =  dateFormatterPrint.string(from: datee!)
           dateLbl.text =  dateFormatterPrint.string(from: datee ?? Date())
        }
    }
    @IBAction func BackBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        scrollView.contentSize = CGSize(width: 375, height: 800 * 2)
    }
}
