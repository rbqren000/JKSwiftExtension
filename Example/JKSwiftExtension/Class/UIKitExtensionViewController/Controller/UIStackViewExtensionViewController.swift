//
//  UIStackViewExtensionViewController.swift
//  JKSwiftExtension_Example
//
//  Created by IronMan on 2020/11/13.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import JKSwiftExtension

class UIStackViewExtensionViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headDataArray = ["一、链式编程"]
        dataArray = [["布局时是否参照基准线，默认是 false（决定了垂直轴如果是文本的话，是否按照 baseline 来参与布局）", "设置布局时是否以控件的LayoutMargins为标准，默认为false，是以控件的bounds为标准", "子控件布局方向(水平或者垂直),也就是轴方向", "子视图在轴向上的分布方式", "设置子控件间距", "添加排列子视图"]]
    }
}

// MARK: - 一、链式编程
extension UIStackViewExtensionViewController {
    
    // MARK: 1.1、布局时是否参照基准线，默认是 false（决定了垂直轴如果是文本的话，是否按照 baseline 来参与布局）
    @objc func test11() {
        JKPrint("布局时是否参照基准线，默认是 false（决定了垂直轴如果是文本的话，是否按照 baseline 来参与布局）")
        let stackView = UIStackView(frame: CGRect(x: 50, y: 100, width: 200, height: 100)).set(baselineRelative: true)
        stackView.backgroundColor = .randomColor
        self.view.addSubview(stackView)
        
        let testLabel1 = UILabel(frame: CGRect(x: 10, y: 10, width: 150, height: 30))
        testLabel1.text = "我是一只小小鸟1"
        testLabel1.backgroundColor = .randomColor
        stackView.addSubview(testLabel1)
        
        
        let testLabel2 = UILabel(frame: CGRect(x: 10, y: 50, width: 150, height: 30))
        testLabel2.text = "我是一只小小鸟2"
        testLabel2.backgroundColor = .randomColor
        stackView.addSubview(testLabel2)
        
        JKAsyncs.asyncDelay(3) {
        } _: {
            stackView.removeFromSuperview()
        }
    }
    
    // MARK: 1.2、设置布局时是否以控件的LayoutMargins为标准，默认为false，是以控件的bounds为标准
    @objc func test12() {
        JKPrint("设置布局时是否以控件的LayoutMargins为标准，默认为false，是以控件的bounds为标准")
        
        let stackView = UIStackView(frame: CGRect(x: 50, y: 100, width: 200, height: 100)).set(layoutMarginsRelative: true)
        stackView.backgroundColor = .randomColor
        self.view.addSubview(stackView)
        
        let testLabel1 = UILabel(frame: CGRect(x: 10, y: 10, width: 150, height: 30))
        testLabel1.text = "我是一只小小鸟1"
        testLabel1.backgroundColor = .randomColor
        stackView.addSubview(testLabel1)
        
        
        let testLabel2 = UILabel(frame: CGRect(x: 10, y: 50, width: 150, height: 30))
        testLabel2.text = "我是一只小小鸟2"
        testLabel2.backgroundColor = .randomColor
        stackView.addSubview(testLabel2)
        
        JKAsyncs.asyncDelay(3) {
        } _: {
            stackView.removeFromSuperview()
        }
    }
    
    // MARK: 1.3、子控件布局方向(水平或者垂直),也就是轴方向
    @objc func test13() {
        JKPrint("子控件布局方向(水平或者垂直),也就是轴方向")
        
        let stackView = UIStackView(frame: CGRect(x: 50, y: 100, width: 200, height: 100)).set(axis: NSLayoutConstraint.Axis.horizontal)
        stackView.backgroundColor = .randomColor
        self.view.addSubview(stackView)
        
        let testLabel1 = UILabel(frame: CGRect(x: 10, y: 10, width: 150, height: 30))
        testLabel1.text = "我是一只小小鸟1"
        testLabel1.backgroundColor = .randomColor
        stackView.addSubview(testLabel1)
        
        
        let testLabel2 = UILabel(frame: CGRect(x: 10, y: 50, width: 150, height: 30))
        testLabel2.text = "我是一只小小鸟2"
        testLabel2.backgroundColor = .randomColor
        stackView.addSubview(testLabel2)
        
        JKAsyncs.asyncDelay(3) {
        } _: {
            stackView.removeFromSuperview()
        }
    }
    
    // MARK: 1.4、子视图在轴向上的分布方式
    @objc func test14() {
        JKPrint("子视图在轴向上的分布方式")
        
        let stackView = UIStackView(frame: CGRect(x: 50, y: 100, width: 200, height: 100)).set(distribution: UIStackView.Distribution.fill)
        stackView.backgroundColor = .randomColor
        self.view.addSubview(stackView)
        
        let testLabel1 = UILabel(frame: CGRect(x: 10, y: 10, width: 150, height: 30))
        testLabel1.text = "我是一只小小鸟1"
        testLabel1.backgroundColor = .randomColor
        stackView.addSubview(testLabel1)
        
        
        let testLabel2 = UILabel(frame: CGRect(x: 10, y: 50, width: 150, height: 30))
        testLabel2.text = "我是一只小小鸟2"
        testLabel2.backgroundColor = .randomColor
        stackView.addSubview(testLabel2)
        
        JKAsyncs.asyncDelay(3) {
        } _: {
            stackView.removeFromSuperview()
        }
    }
    
    // MARK: 1.5、对齐模式
    @objc func test15() {
        JKPrint("子视图在轴向上的分布方式")
        
        let stackView = UIStackView(frame: CGRect(x: 50, y: 100, width: 200, height: 100)).set(distribution: UIStackView.Distribution.fill)
        stackView.backgroundColor = .randomColor
        self.view.addSubview(stackView)
        
        let testLabel1 = UILabel(frame: CGRect(x: 10, y: 10, width: 150, height: 30))
        testLabel1.text = "我是一只小小鸟1"
        testLabel1.backgroundColor = .randomColor
        stackView.addSubview(testLabel1)
        
        
        let testLabel2 = UILabel(frame: CGRect(x: 10, y: 50, width: 150, height: 30))
        testLabel2.text = "我是一只小小鸟2"
        testLabel2.backgroundColor = .randomColor
        stackView.addSubview(testLabel2)
        
        JKAsyncs.asyncDelay(3) {
        } _: {
            stackView.removeFromSuperview()
        }
    }
    // MARK: 1.6、设置子控件间距
    @objc func test16() {
        let stackView = UIStackView(frame: CGRect(x: 50, y: 100, width: 200, height: 100)).set(spacing: 20)
        stackView.backgroundColor = .randomColor
        self.view.addSubview(stackView)
        
        let testLabel1 = UILabel(frame: CGRect(x: 10, y: 10, width: 150, height: 30))
        testLabel1.text = "我是一只小小鸟1"
        testLabel1.backgroundColor = .randomColor
        stackView.addSubview(testLabel1)
        
        let testLabel2 = UILabel(frame: CGRect(x: 10, y: 50, width: 150, height: 30))
        testLabel2.text = "我是一只小小鸟2"
        testLabel2.backgroundColor = .randomColor
        stackView.addSubview(testLabel2)
        
        JKAsyncs.asyncDelay(3) {
        } _: {
            stackView.removeFromSuperview()
        }

    }
}
