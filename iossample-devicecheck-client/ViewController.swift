//
//  ViewController.swift
//  iossample-devicecheck-client
//
//  Created by Owen on 2017/06/11.
//  Copyright © 2017年 owen. All rights reserved.
//

import UIKit
import DeviceCheck
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.requestToken()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func requestToken() {
        DCDevice.current.generateToken {
            (data, error) in
            guard let data = data else {
                return
            }
            let token = data.base64EncodedString()
            //  トークンをサーバーに投げる
            Alamofire.request("https://hogehogehoge.com/v1/requestToken", method: .post, parameters: ["deviceToken": token]).responseString {
                (request) in
                //  ここで処理
                print(request.value)
            }
        }
    }
}

