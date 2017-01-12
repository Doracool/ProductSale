//
//  UIView+Extension.swift
//  Swift邮币卡
//
//  Created by 李涛涛 on 2017/1/11.
//  Copyright © 2017年 点石科技. All rights reserved.
//

import Foundation
import UIKit

extension UIView{

    var x: CGFloat {
        get {
            return self.frame.origin.x;
        }
        set {
            self.frame.origin.x = newValue;
        }
    }

    var y: CGFloat {
        get {
            return self.frame.origin.y;
        }
        set {
            self.frame.origin.y = newValue;
        }
    }

    var centerX: CGFloat {
        get {
            return self.center.x;
        }
        set {
            self.center.x = newValue;
        }
    }

    var centerY: CGFloat {
        get {
            return self.center.x;
        }
        set {
            self.center.y = newValue;
        }
    }

    var width: CGFloat {
        get {
            return self.frame.size.width;
        }
        set {
            self.frame.size.width = newValue;
        }
    }


    var height: CGFloat {
        get {
            return self.frame.size.height;
        }
        set {
            self.frame.size.height = newValue;
        }
    }

    var size: CGSize {
        get {
            return self.frame.size;
        }
        set {
            self.frame.size = newValue;
        }
    }

    var origin: CGPoint {
        get {
            return self.frame.origin;
        }
        set {
            self.frame.origin = newValue;
        }
    }
}
