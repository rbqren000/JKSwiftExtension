//
//  TestFileViewController.swift
//  JKSwiftExtension_Example
//
//  Created by IronMan on 2020/11/25.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import Dispatch
import JKSwiftExtension
class TestFileViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TestFile"
        
        headDataArray = ["一、基本的使用"]
        dataArray = [["设置有内边距的label", "设置有内边距的label", "设置有内边距的label", "设置有内边距的label", "设置有内边距的label", "数组测试", "struct", "test"]]
    }
    
    deinit {
        print("----------")
    }
}

extension TestFileViewController {
    
    /// 计算x的n次方
    /// - Parameters:
    ///   - x: 值
    ///   - n: 次方
    /// - Returns: 结果
    func sum(x: Double, n: Int) -> Double {
        if (n == 0) {
            return 1
        }
        // 这里重复利用了t的资源
        let t = sum(x: x, n: n / 2)
        if (n % 2 == 1) {
            // 如果n是奇数
            // 这里多了一个x，因为：如果n是17，t的结果是8次后的，2个t就是16次，少了一次
            return t * t * x
        } else {
            // n是偶数
            // 如果n是16,t的结果是8次后的，2个t也就是16次，刚刚好
            return t * t
        }
    }
 
    @objc func test18() {
        self.navigationController?.pushViewController(PresetntOneViewController(), animated: true)
    }
    
    @objc func test17() {
        //var array1 = ["a", "b", "c"]
        // 也不可以越界
        //array1.insert("yy", at: 0)
        //print(array1)
        let oldString = "12345678"
        
    }
    
    @objc func test16() {
        self.navigationController?.pushViewController(JKVVViewController(), animated: true)
    }
    
    @objc func test15() {
        self.navigationController?.pushViewController(NineViewController(), animated: true)
    }
    
    @objc func test14() {
        let numbers = [1,2, nil,4]
        let result = numbers.compactMap{ $0 } //[16, 64, 4]
        print(result)  // [3,4,5,6]
    }
    
    @objc func test13() {
       self.navigationController?.pushViewController(ThreeViewController(), animated: true)
    }
    
    @objc func test12() {
        // showAlertAgreement()
        var sectionModels = [[11, 12, 13], [21, 22, 23]]
        print("数组：\(sectionModels)")
        //var items = sectionModels[0]
        // items.remove(at: 1)
        sectionModels[0].removeAll(where: { $0  == 12 })
        print("移除后数组：\(sectionModels)")
    }
    
    @objc func test11() {
        // self.navigationController?.pushViewController(RadiusViewController(), animated: true)
        print("开始")
        DispatchQueue.global().async {
            /// 初始化值 S = 0
            let semaphore = DispatchSemaphore(value: 0)
            for index in 0..<4 {
                /// S = 0 - 1，S = -1, 进程阻塞并进入等待队列
                DispatchQueue.global().async {
                    print(index)
                    Thread.sleep(forTimeInterval: 3)
                    DispatchQueue.main.async {
                        /// S = -1 + 1，S = 0, 唤醒对应的等待进程，并继续执行
                        semaphore.signal()
                    }
                }
                semaphore.wait()
            }
            DispatchQueue.main.async {
                print("全部执行完毕")
            }
        }
        print("结束")
    }
    
    //MARK: 上传图片
    /// 上传图片，压缩在内部统一处理
    //MARK: 上传图片
    /// 上传图片，压缩在内部统一处理
    func uploadImageResurce() {
        
        // 创建调度组
        let workingGroup = DispatchGroup()
        // 创建多列
        let workingQueue = DispatchQueue.global()
        let images = [1, 2, 3, 4, 5, 6]
        var imageUrls = images.map { _ in
            ""
        }
        // 最初的url数组
        debugPrint("最初的url数组：\(imageUrls)")
        // var a: Int = 0
        for (index, image) in images.enumerated() {
           
            workingGroup.enter()
            JKAsyncs.asyncDelay(index == 2 ? 5 : 1) {
            } _: {
                print("接口 \(index) 数据请求完成 值：\(image)")
                imageUrls[index] = "\(image)"
                workingGroup.leave()
            }
//            a = a + 1
//            // 入组
//            if a == 2 {
//                break
//            }
        }
        // 调度组里的任务都执行完毕
        workingGroup.notify(queue: workingQueue, execute: {
            // 全部
            debugPrint("全部结束, 生成的url：\(imageUrls)")
        })
    }
    
    //MARK: 上传图片
    /// 上传图片，压缩在内部统一处理
    //MARK: 上传图片
    /// 上传图片，压缩在内部统一处理
    func uploadImageResurce1() {
        
        // 创建调度组
        let workingGroup = DispatchGroup()
        // 创建多列
        let workingQueue = DispatchQueue.global()

        debugPrint("开始执行的代码")
        
        workingGroup.enter()
        JKAsyncs.asyncDelay(5) {
        } _: {
            print("接口1执行结束")
            workingGroup.leave()
        }

        workingGroup.enter()
        JKAsyncs.asyncDelay(2) {
            print("")
        } _: {
            print("接口2执行结束")
            workingGroup.leave()
        }

        // 调度组里的任务都执行完毕
        workingGroup.notify(queue: workingQueue, execute: {
            // 全部
            debugPrint("全部结束")
        })
        debugPrint("最后的代码")
    }
    
    func uploadImageResurce2() {
        
        // 创建调度组
        let workingGroup = DispatchGroup()
        // 创建多列
        let workingQueue = DispatchQueue.global()

        var result: Bool = false
        debugPrint("开始执行的代码")
        workingGroup.enter()
        netWork1 {
            print("接口1执行结束")
            result = false
            workingGroup.leave()
        }

        workingGroup.enter()
        netWork2 {
            result = true
            print("接口2执行结束")
            workingGroup.leave()
        }

        // 调度组里的任务都执行完毕
        workingGroup.notify(queue: workingQueue, execute: {
            // 全部
            debugPrint("全部结束: \(result)")
        })
        debugPrint("最后的代码")
    }
    
    func netWork1(finishClosure: @escaping (() -> Void)) {
        JKAsyncs.asyncDelay(10) {
        } _: {
            finishClosure()
        }
    }
    
    func netWork2(finishClosure: @escaping (() -> Void)) {
        JKAsyncs.asyncDelay(3) {
        } _: {
            finishClosure()
        }
    }
}

extension String {
    // 添加千分位，小数点后面保留三位，默认四舍五入
    func tradeAmountAddCommaString(maximumFractionDigits: Int = 2, minimumFractionDigits: Int = 2, roundingModel: NumberFormatter.RoundingMode = .up, numberStyle: NumberFormatter.Style = .none) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = roundingModel
        formatter.maximumFractionDigits = maximumFractionDigits
        formatter.minimumFractionDigits = minimumFractionDigits
        if self.contains(".") {
            // 整数位最少位数
            formatter.minimumIntegerDigits = 1
        }
        var num = NSDecimalNumber(string: self)
        if num.doubleValue.isNaN {
            num = NSDecimalNumber(string: "0")
        }
        if let result = formatter.string(from: num) {
            return result
        }
        return self
    }
}

extension TestFileViewController {
    @objc func showAlertAgreement() {
        let title = "用户协议和隐私政策"

        let linkDic = ["《用户协议》": "http://*",
                       "《隐私政策》": "http://*",]

        let protocolPolicyContent = "\t用户协议和隐私政策请您务必审值阅读、充分理解 “用户协议” 和 隐私政策, 各项条款，包括但不限于：为了向您提供即时通讯、内容分享等服务，我们需要收集您的设备信息、操作日志等个人信息。\n\t您可阅读《用户协议》和《隐私政策》了解详细信息。如果您同意，请点击 “同意” 开始接受我们的服务;"
    
        let paraStyle = NSMutableParagraphStyle()
        // 右对齐
        paraStyle.alignment = .left
        let attributedText = NSMutableAttributedString.createHighlightRichText(content: protocolPolicyContent, highlightRichTexts: linkDic.allKeys(), contentTextColor: UIColor.brown, contentFont: UIFont.systemFont(ofSize: 15), highlightRichTextColor: UIColor.blue, highlightRichTextFont: UIFont.systemFont(ofSize: 15), paraStyle: paraStyle)
    
        let alertVC = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            .addActionTitles(["取消", "同意"]) { vc, action in
                print(action.title)
            }
        
        alertVC.setValue(attributedText, forKey: "attributedMessage")
        alertVC.messageLabel?.jk.addGestureTap { reco in
            (reco as? UITapGestureRecognizer)?.didTapLabelAttributedText(linkDic) {[weak self] text, url in
                guard let weakSelf = self else {
                    return
                }
                print("\(text), \(url ?? "_")")
                alertVC.dismiss(animated: true, completion: nil)
                let vc = JKVVViewController()
                vc.backClosure = {
                    weakSelf.present(alertVC, animated: true, completion: nil)
                }
                // vc.modalPresentationStyle = .overFullScreen
                weakSelf.navigationController?.pushViewController(vc, animated: true)
                //alertVC.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
            }
        }
        self.present(alertVC, animated: true, completion: nil)
    }
}


