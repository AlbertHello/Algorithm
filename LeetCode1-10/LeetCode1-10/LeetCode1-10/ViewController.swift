//
//  ViewController.swift
//  LeetCode1-10
//
//  Created by WenDu3783 on 2018/2/2.
//  Copyright © 2018年 文都. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.brown
    }
}


// 业务
extension ViewController {
    
    //1 TwoSum
    fileprivate func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var num1=0
        var num2=0
        var i=0
        var j=0
        var flag = false
        while i<nums.count-1 {
            num1=nums[i]
            j = i+1
            while j<nums.count{
                num2=nums[j]
                if num2+num1 == target {
                    flag=true
                    break
                }
                j+=1
            }
            if flag {
                break
            }
            i+=1
        }
        return [i, j]
    }
    
    
    
    
    
    
}
