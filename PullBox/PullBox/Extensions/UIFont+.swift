//
//  UIFont+.swift
//  PullBox
//
//  Created by mingmac on 2023/01/16.
//

import UIKit

extension UIFont {
    enum FontType {
        enum Pretentdard: String {
            case bold = "Pretendard-Bold"
            case extraBold = "Pretendard-ExtraBold"
            case light = "Pretendard-Light"
            case medium = "Pretendard-Medium"
            case regular = "Pretendard-Regular"
            case semiBold = "Pretendard-semiBold"
        }
    }
    
    static func pretendardFont(size: CGFloat, style: FontType.Pretentdard) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
