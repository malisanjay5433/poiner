//
//  SegmentioBuilder.swift
//  Segmentio
//
//  Created by Dmitriy Demchenko on 11/14/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

//import Segmentio
import UIKit

//struct SegmentioBuilder {
//
//    static func buildSegmentioView(segmentioView: Segmentio, segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 2)) {
//        segmentioView.setup(
//            content: segmentioContent(),
//            style: segmentioStyle,
//            options: segmentioOptions(segmentioStyle: segmentioStyle, segmentioPosition: segmentioPosition)
//        )
//    }
//
//    private static func segmentioContent() -> [SegmentioItem] {
//        return [
//            SegmentioItem(title: "EARNED", image: UIImage.init(named: "")),
//            SegmentioItem(title: "REDEEMED", image: UIImage.init(named: ""))
//        ]
//    }
//
//    static func buildSegmentioViewSignUpCORP(segmentioView: Segmentio, segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 2)) {
//        segmentioView.setup(
//            content: segmentioContentSignUpCORP(),
//            style: segmentioStyle,
//            options: segmentioOptions(segmentioStyle: segmentioStyle, segmentioPosition: segmentioPosition)
//        )
//    }
//
//    private static func segmentioContentSignUpCORP() -> [SegmentioItem] {
//        return [
//            //SegmentioItem(title: "Card Number", image: UIImage.init(named: "")),
//            SegmentioItem(title: "Customer ID", image: UIImage.init(named: "")),
//            //SegmentioItem(title: "Account Number", image: UIImage.init(named: ""))
//        ]
//    }
//
//    static func buildSegmentioViewSignUpOBC(segmentioView: Segmentio, segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 3)) {
//        segmentioView.setup(
//            content: segmentioContentSignUpOBC(),
//            style: segmentioStyle,
//            options: segmentioOptions(segmentioStyle: segmentioStyle, segmentioPosition: segmentioPosition)
//        )
//    }
//
//    private static func segmentioContentSignUpOBC() -> [SegmentioItem] {
//        return [
//            SegmentioItem(title: "Card Number", image: UIImage.init(named: "")),
//            SegmentioItem(title: "Customer ID", image: UIImage.init(named: "")),
//            SegmentioItem(title: "Account Number", image: UIImage.init(named: ""))
//        ]
//    }
//
//
//    static func buildSegmentioViewRecharage(segmentioView: Segmentio, segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 2)) {
//        segmentioView.setup(
//            content: segmentioContentRecharage(),
//            style: segmentioStyle,
//            options: segmentioOptions(segmentioStyle: segmentioStyle, segmentioPosition: segmentioPosition)
//        )
//    }
//
//    private static func segmentioContentRecharage() -> [SegmentioItem] {
//        return [
//            SegmentioItem(title: "Mobile", image: UIImage.init(named: "")),
//            SegmentioItem(title: "DTH", image: UIImage.init(named: "")),
//        ]
//    }
//
//    static func buildSegmentioViewMovie(segmentioView: Segmentio, segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 2)) {
//        segmentioView.setup(
//            content: segmentioContentMovie(),
//            style: segmentioStyle,
//            options: segmentioOptions(segmentioStyle: segmentioStyle, segmentioPosition: segmentioPosition)
//        )
//    }
//
//    private static func segmentioContentMovie() -> [SegmentioItem] {
//        return [
//            SegmentioItem(title: "Movie", image: UIImage.init(named: "")),
//            SegmentioItem(title: "Cinema", image: UIImage.init(named: "")),
//        ]
//    }
//    static func buildSegmentioViewBus(segmentioView: Segmentio, segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 2)) {
//        segmentioView.setup(
//            content: segmentioContentBus(),
//            style: segmentioStyle,
//            options: segmentioOptions(segmentioStyle: segmentioStyle, segmentioPosition: segmentioPosition)
//        )
//    }
//
//    private static func segmentioContentBus() -> [SegmentioItem] {
//        return [
//            SegmentioItem(title: "Boarding", image: UIImage.init(named: "")),
//            SegmentioItem(title: "Drop", image: UIImage.init(named: ""))
//        ]
//    }
//
//    static func buildSegmentioViewFlight(segmentioView: Segmentio, segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 2)) {
//        segmentioView.setup(
//            content: buildSegmentioViewFlight(),
//            style: segmentioStyle,
//            options: segmentioOptions(segmentioStyle: segmentioStyle, segmentioPosition: segmentioPosition)
//        )
//    }
//
//    private static func buildSegmentioViewFlight() -> [SegmentioItem] {
//        return [
//            SegmentioItem(title: "One Way", image: UIImage.init(named: "")),
//            SegmentioItem(title: "Round Trip", image: UIImage.init(named: "")),
//        ]
//    }
//
//
//    static func buildSegmentioAirMiles(segmentioView: Segmentio, content: [SegmentioItem],segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 2)) {
//        segmentioView.setup(
//            content: content,
//            style: segmentioStyle,
//            options: segmentioOptions(segmentioStyle: segmentioStyle, segmentioPosition: segmentioPosition)
//        )
//    }
//
//    static func buildSegmentioViewForBus(segmentioView: Segmentio, content: [SegmentioItem],segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 2)) {
//        segmentioView.setup(
//            content: content,
//            style: segmentioStyle,
//            options: segmentioOptions(segmentioStyle: segmentioStyle, segmentioPosition: segmentioPosition)
//        )
//    }
//
//    static func buildSegmentioViewAllPlans(segmentioView: Segmentio, content: [SegmentioItem],segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 2)) {
//        segmentioView.setup(
//            content: content,
//            style: segmentioStyle,
//            options: segmentioOptions(segmentioStyle: segmentioStyle, segmentioPosition: segmentioPosition)
//        )
//    }
//
//    static func buildSegmentioViewMerchandise(segmentioView: Segmentio, segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 2)) {
//        segmentioView.setup(
//            content: buildSegmentioViewMerchandise(),
//            style: segmentioStyle,
//            options: segmentioOptions(segmentioStyle: segmentioStyle, segmentioPosition: segmentioPosition)
//        )
//    }
//
//    private static func buildSegmentioViewMerchandise() -> [SegmentioItem] {
//        return [
//            SegmentioItem(title: "Category", image: UIImage.init(named: "")),
//            SegmentioItem(title: "Sale", image: UIImage.init(named: "")),
//        ]
//    }
//
//    private static func segmentioOptions(segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 2)) -> SegmentioOptions {
//        var imageContentMode = UIView.ContentMode.center
//        switch segmentioStyle {
//        case .imageBeforeLabel, .imageAfterLabel:
//            imageContentMode = .scaleAspectFit
//        default:
//            break
//        }
//
//        return SegmentioOptions(
//            backgroundColor: .appColor_OBC,
//            segmentPosition: segmentioPosition,
//            scrollEnabled: true,
//            indicatorOptions: segmentioIndicatorOptions(),
//            horizontalSeparatorOptions: segmentioHorizontalSeparatorOptions(),
//            verticalSeparatorOptions: segmentioVerticalSeparatorOptions(),
//            imageContentMode: imageContentMode,
//            labelTextAlignment: .center,
//            labelTextNumberOfLines: 1,
//            segmentStates: segmentioStates(),
//            animationDuration: 0.3
//        )
//    }
//
//    private static func segmentioStates() -> SegmentioStates {
//        let font = UIFont.init(name: "AvenirNext-DemiBold", size: 17.0)!
//        return SegmentioStates(
//            defaultState: segmentioState(
//                backgroundColor: .clear,
//                titleFont: font,
//                titleTextColor: UIColor.white.withAlphaComponent(0.7)
//            ),
//            selectedState: segmentioState(
//                backgroundColor: .clear,
//                titleFont: font,
//                titleTextColor:.white
//            ),
//            highlightedState: segmentioState(
//                backgroundColor: .clear,
//                titleFont: font,
//                titleTextColor: .white
//            )
//        )
//    }
//
//    private static func segmentioState(backgroundColor: UIColor, titleFont: UIFont, titleTextColor: UIColor) -> SegmentioState {
//        return SegmentioState(
//            backgroundColor: backgroundColor,
//            titleFont: titleFont,
//            titleTextColor: titleTextColor
//        )
//    }
//
//    private static func segmentioIndicatorOptions() -> SegmentioIndicatorOptions {
//        return SegmentioIndicatorOptions(
//            type: .bottom,
//            ratio: 1,
//            height: 5,
//            color: .white
//        )
//    }
//
//    private static func segmentioHorizontalSeparatorOptions() -> SegmentioHorizontalSeparatorOptions {
//        return SegmentioHorizontalSeparatorOptions(
//            type: .topAndBottom,
//            height: 1,
//            color: .clear
//        )
//    }
//
//    private static func segmentioVerticalSeparatorOptions() -> SegmentioVerticalSeparatorOptions {
//        return SegmentioVerticalSeparatorOptions(
//            ratio: 1,
//            color: .clear
//        )
//    }
//
//}
