//
//  ViewController.swift
//  LeetCode1-10
//
//  Created by Albert on 2018/2/2.
//  Copyright © 2018年 58. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.brown
        let testArray = [2,7,11,15];
        let target = 26;
        let indexArray = twoSum(testArray, target);
        print(indexArray);
        
        
    }
}


extension ViewController {
    
    //1. TwoSum
    fileprivate func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var i=0
        var j=0
        while i<nums.count-1 {
            j = i+1
            while j<nums.count{
                if nums[i]+nums[j] == target {
                    return [i,j]
                }
                j+=1
            }
            i+=1
        }
        return []
    }
    /**
     复杂度分析：
     时间复杂度：O(n2)。对于每个元素，我们试图通过遍历数组的其余部分来寻找它所对应的目标元素，这将耗费
O(n)的时间。因此时间复杂度为O(n2)。
     空间复杂度：O(1)。
     */
    

}

