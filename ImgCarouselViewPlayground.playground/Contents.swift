//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import PlaygroundSupport
import ImgCarouselView

let viewController = UIViewController()
viewController.view.backgroundColor = .white
PlaygroundPage.current.liveView = viewController

// ------------------------------------
// setup
// ------------------------------------

// add imgCarouselView
let imgCarouselView = ImgCarouselView(
    frame: CGRect(
        x: 0,
        y: 0,
        width: viewController.view.bounds.width,
        height: viewController.view.bounds.height
    )
)
viewController.view.addSubview(imgCarouselView)

// configure imgCarouselView
if let image = UIImage(named: "sample-m"),
    let imageUrl01 = URL(string: "https://www.pakutaso.com/shared/img/thumb/taiyonotouSDIM3846_TP_V.jpg"),
    let imageUrl02 = URL(string: "https://www.pakutaso.com/shared/img/thumb/NEKONEKOIMG_7878_TP_V.jpg") {
    
    imgCarouselView.configure(
        imageSources: [
            .url(imageUrl01),
            .url(imageUrl02),
            .image(image)
        ]
    )
    
    // customize contentMode (if you want)
//    imgCarouselView.configure(
//        imageSources: [
//            .url(imageUrl01),
//            .url(imageUrl02),
//            .image(image)
//        ],
//        cellContentMode: .scaleAspectFill
//    )
}
