//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import PlaygroundSupport

import ImgCarouselView

URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)

let viewController = UIViewController()
viewController.view.backgroundColor = .white

//let view = UIView()
//view.backgroundColor = .orange
//
//view.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//viewController.view.addSubview(view)

let imgCarouselView = ImgCarouselView.init(frame: CGRect(
    x: viewController.view.bounds.width / 2,
    y: viewController.view.bounds.height / 2,
    width: 100,
    height: 100
    )
)
viewController.view.addSubview(imgCarouselView)

PlaygroundPage.current.liveView = viewController

imgCarouselView.configure(urls: [
    URL(string: "https://www.pakutaso.com/shared/img/thumb/NEKONEKOIMG_7878_TP_V.jpg")!,
    URL(string: "https://www.pakutaso.com/shared/img/thumb/NEKONEKOIMG_7878_TP_V.jpg")!
])
