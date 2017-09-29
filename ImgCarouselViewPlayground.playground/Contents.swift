//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import PlaygroundSupport
import ImgCarouselView

let viewController = UIViewController()
viewController.view.backgroundColor = .white

let view = UIView()
view.backgroundColor = .orange

view.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
viewController.view.addSubview(view)

PlaygroundPage.current.liveView = viewController
