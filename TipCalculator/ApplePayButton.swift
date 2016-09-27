//
//  ApplePayButton.swift
//  TipCalculator
//
//  Created by Haider Khan on 9/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit

class ApplePayButton: UIButton {

    convenience init() {
        self.init()
        self.layer.cornerRadius = 6
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
    
    func setBounds(bounds: CGRect) {
        super.bounds = bounds
        setBackgroundImage(paymentButtonImageForRect(originalFrame: self.bounds), for: UIControlState.normal)
    }
    
    func paymentButtonImageForRect(originalFrame: CGRect) -> UIImage {
        
        if originalFrame.isEmpty {
            return UIImage()
        }
        
        let backgroundColor = UIColor.white
        let foregroundColor = UIColor.black
        
        let frame = CGRect(x: 0, y: 0, width: originalFrame.height * 3.25, height: originalFrame.height)
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: originalFrame.width, height: originalFrame.height), true, UIScreen.main.scale)

        var backgroundPath = UIBezierPath(rect: frame)
        backgroundColor.setFill()
        backgroundPath.fill()
        foregroundColor.setFill()
        
        let applePayPath = UIBezierPath.init()
        applePayPath.move(to: CGPoint(x: frame.minX + 0.65968 * frame.width, y: frame.minY + 0.37344 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.63926 * frame.width, y: frame.minY + 0.54881 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.63575 * frame.width, y: frame.minY + 0.58038 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.63805 * frame.width, y: frame.minY + 0.55940 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63684 * frame.width, y: frame.minY + 0.56998 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.63425 * frame.width, y: frame.minY + 0.59516 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.63523 * frame.width, y: frame.minY + 0.58567 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63471 * frame.width, y: frame.minY + 0.59060 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.63384 * frame.width, y: frame.minY + 0.59516 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.63229 * frame.width, y: frame.minY + 0.57983 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.63338 * frame.width, y: frame.minY + 0.59024 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63286 * frame.width, y: frame.minY + 0.58513 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.62894 * frame.width, y: frame.minY + 0.54991 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.63125 * frame.width, y: frame.minY + 0.56962 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63010 * frame.width, y: frame.minY + 0.55958 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.60714 * frame.width, y: frame.minY + 0.37344 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.59549 * frame.width, y: frame.minY + 0.37344 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.62664 * frame.width, y: frame.minY + 0.62710 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.62762 * frame.width, y: frame.minY + 0.63714 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.62750 * frame.width, y: frame.minY + 0.63312 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.62762 * frame.width, y: frame.minY + 0.63586 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.62664 * frame.width, y: frame.minY + 0.64717 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.62762 * frame.width, y: frame.minY + 0.63751 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.62756 * frame.width, y: frame.minY + 0.63951 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.62000 * frame.width, y: frame.minY + 0.68604 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.62467 * frame.width, y: frame.minY + 0.66232 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.62243 * frame.width, y: frame.minY + 0.67546 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.61320 * frame.width, y: frame.minY + 0.71196 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.61752 * frame.width, y: frame.minY + 0.69681 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.61527 * frame.width, y: frame.minY + 0.70557 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.60593 * frame.width, y: frame.minY + 0.73039 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.61083 * frame.width, y: frame.minY + 0.71962 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.60841 * frame.width, y: frame.minY + 0.72564 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.59901 * frame.width, y: frame.minY + 0.74188 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.60340 * frame.width, y: frame.minY + 0.73513 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.60109 * frame.width, y: frame.minY + 0.73896 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.59780 * frame.width, y: frame.minY + 0.74353 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.60161 * frame.width, y: frame.minY + 0.77273 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.60282 * frame.width, y: frame.minY + 0.77127 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.60853 * frame.width, y: frame.minY + 0.76306 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.60380 * frame.width, y: frame.minY + 0.76999 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.60570 * frame.width, y: frame.minY + 0.76744 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.61787 * frame.width, y: frame.minY + 0.74207 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.61130 * frame.width, y: frame.minY + 0.75868 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.61447 * frame.width, y: frame.minY + 0.75156 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.62571 * frame.width, y: frame.minY + 0.71397 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.62070 * frame.width, y: frame.minY + 0.73422 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.62335 * frame.width, y: frame.minY + 0.72473 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.63258 * frame.width, y: frame.minY + 0.67765 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.62802 * frame.width, y: frame.minY + 0.70357 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63033 * frame.width, y: frame.minY + 0.69134 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.63921 * frame.width, y: frame.minY + 0.63167 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.63477 * frame.width, y: frame.minY + 0.66415 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63702 * frame.width, y: frame.minY + 0.64864 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.64613 * frame.width, y: frame.minY + 0.57509 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.64140 * frame.width, y: frame.minY + 0.61469 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.64376 * frame.width, y: frame.minY + 0.59553 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.67133 * frame.width, y: frame.minY + 0.37344 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.65968 * frame.width, y: frame.minY + 0.37344 * frame.height))
        applePayPath.close()
        applePayPath.move(to: CGPoint(x: frame.minX + 0.58557 * frame.width, y: frame.minY + 0.61360 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.58540 * frame.width, y: frame.minY + 0.58148 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58546 * frame.width, y: frame.minY + 0.60283 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58540 * frame.width, y: frame.minY + 0.59206 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.58540 * frame.width, y: frame.minY + 0.47618 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.58419 * frame.width, y: frame.minY + 0.43841 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58540 * frame.width, y: frame.minY + 0.46377 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58500 * frame.width, y: frame.minY + 0.45100 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.57969 * frame.width, y: frame.minY + 0.40319 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58344 * frame.width, y: frame.minY + 0.42545 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58189 * frame.width, y: frame.minY + 0.41377 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.57047 * frame.width, y: frame.minY + 0.37727 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.57744 * frame.width, y: frame.minY + 0.39260 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.57439 * frame.width, y: frame.minY + 0.38402 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.55547 * frame.width, y: frame.minY + 0.36742 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.56660 * frame.width, y: frame.minY + 0.37070 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.56153 * frame.width, y: frame.minY + 0.36742 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.54261 * frame.width, y: frame.minY + 0.37289 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55103 * frame.width, y: frame.minY + 0.36742 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.54671 * frame.width, y: frame.minY + 0.36925 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.53056 * frame.width, y: frame.minY + 0.39096 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.53846 * frame.width, y: frame.minY + 0.37654 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.53442 * frame.width, y: frame.minY + 0.38256 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.52969 * frame.width, y: frame.minY + 0.39297 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.53333 * frame.width, y: frame.minY + 0.42016 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.53471 * frame.width, y: frame.minY + 0.41742 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.54417 * frame.width, y: frame.minY + 0.40319 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.53748 * frame.width, y: frame.minY + 0.41140 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.54065 * frame.width, y: frame.minY + 0.40647 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.55461 * frame.width, y: frame.minY + 0.39808 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.54757 * frame.width, y: frame.minY + 0.39972 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.55109 * frame.width, y: frame.minY + 0.39808 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.56539 * frame.width, y: frame.minY + 0.40574 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55916 * frame.width, y: frame.minY + 0.39808 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.56280 * frame.width, y: frame.minY + 0.40063 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.57127 * frame.width, y: frame.minY + 0.42509 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.56799 * frame.width, y: frame.minY + 0.41103 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.57000 * frame.width, y: frame.minY + 0.41742 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.57387 * frame.width, y: frame.minY + 0.44954 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.57260 * frame.width, y: frame.minY + 0.43275 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.57346 * frame.width, y: frame.minY + 0.44096 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.57450 * frame.width, y: frame.minY + 0.47344 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.57427 * frame.width, y: frame.minY + 0.45848 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.57450 * frame.width, y: frame.minY + 0.46651 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.57450 * frame.width, y: frame.minY + 0.47637 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.53725 * frame.width, y: frame.minY + 0.50191 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55830 * frame.width, y: frame.minY + 0.47618 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.54567 * frame.width, y: frame.minY + 0.48476 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.52399 * frame.width, y: frame.minY + 0.57783 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.52848 * frame.width, y: frame.minY + 0.51980 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.52399 * frame.width, y: frame.minY + 0.54535 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.52554 * frame.width, y: frame.minY + 0.60575 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.52399 * frame.width, y: frame.minY + 0.58714 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.52451 * frame.width, y: frame.minY + 0.59644 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.53033 * frame.width, y: frame.minY + 0.63093 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.52664 * frame.width, y: frame.minY + 0.61524 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.52820 * frame.width, y: frame.minY + 0.62363 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.53840 * frame.width, y: frame.minY + 0.64845 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.53246 * frame.width, y: frame.minY + 0.63805 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.53517 * frame.width, y: frame.minY + 0.64407 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.54976 * frame.width, y: frame.minY + 0.65520 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.54169 * frame.width, y: frame.minY + 0.65302 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.54550 * frame.width, y: frame.minY + 0.65520 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.55922 * frame.width, y: frame.minY + 0.65119 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55317 * frame.width, y: frame.minY + 0.65520 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.55634 * frame.width, y: frame.minY + 0.65375 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.56689 * frame.width, y: frame.minY + 0.64042 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.56205 * frame.width, y: frame.minY + 0.64845 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.56464 * frame.width, y: frame.minY + 0.64480 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.57289 * frame.width, y: frame.minY + 0.62564 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.56914 * frame.width, y: frame.minY + 0.63586 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.57116 * frame.width, y: frame.minY + 0.63093 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.57496 * frame.width, y: frame.minY + 0.61834 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.57364 * frame.width, y: frame.minY + 0.62327 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.57427 * frame.width, y: frame.minY + 0.62071 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.57537 * frame.width, y: frame.minY + 0.61834 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.57641 * frame.width, y: frame.minY + 0.64900 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.58690 * frame.width, y: frame.minY + 0.64900 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.58661 * frame.width, y: frame.minY + 0.64407 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.58557 * frame.width, y: frame.minY + 0.61360 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58604 * frame.width, y: frame.minY + 0.63440 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58569 * frame.width, y: frame.minY + 0.62400 * frame.height))
        applePayPath.close()
        applePayPath.move(to: CGPoint(x: frame.minX + 0.50109 * frame.width, y: frame.minY + 0.43969 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.47750 * frame.width, y: frame.minY + 0.46213 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.49550 * frame.width, y: frame.minY + 0.45447 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.48754 * frame.width, y: frame.minY + 0.46213 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.46972 * frame.width, y: frame.minY + 0.46086 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.47474 * frame.width, y: frame.minY + 0.46213 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.47208 * frame.width, y: frame.minY + 0.46159 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.46418 * frame.width, y: frame.minY + 0.45812 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.46770 * frame.width, y: frame.minY + 0.46031 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.46586 * frame.width, y: frame.minY + 0.45940 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.46418 * frame.width, y: frame.minY + 0.29716 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.46955 * frame.width, y: frame.minY + 0.29479 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.46568 * frame.width, y: frame.minY + 0.29625 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.46741 * frame.width, y: frame.minY + 0.29552 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.47906 * frame.width, y: frame.minY + 0.29333 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.47220 * frame.width, y: frame.minY + 0.29388 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.47537 * frame.width, y: frame.minY + 0.29333 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.49152 * frame.width, y: frame.minY + 0.29863 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.48362 * frame.width, y: frame.minY + 0.29333 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.48783 * frame.width, y: frame.minY + 0.29516 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.50115 * frame.width, y: frame.minY + 0.31341 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.49521 * frame.width, y: frame.minY + 0.30191 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.49844 * frame.width, y: frame.minY + 0.30684 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.50726 * frame.width, y: frame.minY + 0.33823 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.50374 * frame.width, y: frame.minY + 0.31979 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.50582 * frame.width, y: frame.minY + 0.32819 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.50939 * frame.width, y: frame.minY + 0.37436 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.50864 * frame.width, y: frame.minY + 0.34845 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.50939 * frame.width, y: frame.minY + 0.36067 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.50109 * frame.width, y: frame.minY + 0.43969 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.50939 * frame.width, y: frame.minY + 0.40301 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.50657 * frame.width, y: frame.minY + 0.42490 * frame.height))
        applePayPath.close()
        applePayPath.move(to: CGPoint(x: frame.minX + 0.51112 * frame.width, y: frame.minY + 0.29516 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.49803 * frame.width, y: frame.minY + 0.27107 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.50772 * frame.width, y: frame.minY + 0.28476 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.50334 * frame.width, y: frame.minY + 0.27654 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.47941 * frame.width, y: frame.minY + 0.26268 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.49284 * frame.width, y: frame.minY + 0.26560 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.48656 * frame.width, y: frame.minY + 0.26268 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.46574 * frame.width, y: frame.minY + 0.26505 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.47451 * frame.width, y: frame.minY + 0.26268 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.46989 * frame.width, y: frame.minY + 0.26359 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.45438 * frame.width, y: frame.minY + 0.26998 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.46165 * frame.width, y: frame.minY + 0.26651 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.45784 * frame.width, y: frame.minY + 0.26815 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.45328 * frame.width, y: frame.minY + 0.27070 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.45328 * frame.width, y: frame.minY + 0.64900 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.46418 * frame.width, y: frame.minY + 0.64900 * frame.height))
        applePayPath.addLine(to: CGPoint(x: frame.minX + 0.46418 * frame.width, y: frame.minY + 0.48969 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.47675 * frame.width, y: frame.minY + 0.49261 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.46787 * frame.width, y: frame.minY + 0.49170 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.47208 * frame.width, y: frame.minY + 0.49261 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.49394 * frame.width, y: frame.minY + 0.48531 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.48292 * frame.width, y: frame.minY + 0.49261 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.48869 * frame.width, y: frame.minY + 0.49024 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.50772 * frame.width, y: frame.minY + 0.46250 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.49924 * frame.width, y: frame.minY + 0.48038 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.50386 * frame.width, y: frame.minY + 0.47272 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.51695 * frame.width, y: frame.minY + 0.42454 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.51159 * frame.width, y: frame.minY + 0.45228 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.51470 * frame.width, y: frame.minY + 0.43951 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.52029 * frame.width, y: frame.minY + 0.37217 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.51920 * frame.width, y: frame.minY + 0.40958 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.52029 * frame.width, y: frame.minY + 0.39206 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.51787 * frame.width, y: frame.minY + 0.32837 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.52029 * frame.width, y: frame.minY + 0.35574 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.51949 * frame.width, y: frame.minY + 0.34096 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.51112 * frame.width, y: frame.minY + 0.29516 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.51631 * frame.width, y: frame.minY + 0.31560 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.51401 * frame.width, y: frame.minY + 0.30447 * frame.height))
        applePayPath.close()
        applePayPath.move(to: CGPoint(x: frame.minX + 0.38275 * frame.width, y: frame.minY + 0.29516 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.38973 * frame.width, y: frame.minY + 0.22727 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.38743 * frame.width, y: frame.minY + 0.27709 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.39054 * frame.width, y: frame.minY + 0.25227 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.36995 * frame.width, y: frame.minY + 0.25957 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.38293 * frame.width, y: frame.minY + 0.22818 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.37474 * frame.width, y: frame.minY + 0.24169 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.36286 * frame.width, y: frame.minY + 0.32527 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.36557 * frame.width, y: frame.minY + 0.27545 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.36182 * frame.width, y: frame.minY + 0.30082 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.38275 * frame.width, y: frame.minY + 0.29516 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.37036 * frame.width, y: frame.minY + 0.32710 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.37803 * frame.width, y: frame.minY + 0.31304 * frame.height))
        applePayPath.close()
        applePayPath.move(to: CGPoint(x: frame.minX + 0.40219 * frame.width, y: frame.minY + 0.45301 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.41672 * frame.width, y: frame.minY + 0.37217 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.40202 * frame.width, y: frame.minY + 0.39936 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.41603 * frame.width, y: frame.minY + 0.37326 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.39215 * frame.width, y: frame.minY + 0.33001 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.40876 * frame.width, y: frame.minY + 0.33567 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.39654 * frame.width, y: frame.minY + 0.33056 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.36643 * frame.width, y: frame.minY + 0.34954 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.38172 * frame.width, y: frame.minY + 0.32673 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.37174 * frame.width, y: frame.minY + 0.34954 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.34429 * frame.width, y: frame.minY + 0.33111 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.36113 * frame.width, y: frame.minY + 0.34954 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.35294 * frame.width, y: frame.minY + 0.33056 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.31649 * frame.width, y: frame.minY + 0.38440 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.33287 * frame.width, y: frame.minY + 0.33165 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.32238 * frame.width, y: frame.minY + 0.35209 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.32503 * frame.width, y: frame.minY + 0.59845 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.30467 * frame.width, y: frame.minY + 0.44954 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.31350 * frame.width, y: frame.minY + 0.54572 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.34625 * frame.width, y: frame.minY + 0.65229 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.33068 * frame.width, y: frame.minY + 0.62419 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.33737 * frame.width, y: frame.minY + 0.65320 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.36822 * frame.width, y: frame.minY + 0.63477 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.35473 * frame.width, y: frame.minY + 0.65120 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.35796 * frame.width, y: frame.minY + 0.63477 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.39037 * frame.width, y: frame.minY + 0.65174 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.37849 * frame.width, y: frame.minY + 0.63477 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.38143 * frame.width, y: frame.minY + 0.65229 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.41095 * frame.width, y: frame.minY + 0.59937 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.39954 * frame.width, y: frame.minY + 0.65101 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.40530 * frame.width, y: frame.minY + 0.62546 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.42018 * frame.width, y: frame.minY + 0.53896 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.41741 * frame.width, y: frame.minY + 0.56962 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.42007 * frame.width, y: frame.minY + 0.54042 * frame.height))
        applePayPath.addCurve(to: CGPoint(x: frame.minX + 0.40219 * frame.width, y: frame.minY + 0.45301 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.42001 * frame.width, y: frame.minY + 0.53859 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.40236 * frame.width, y: frame.minY + 0.51743 * frame.height))
        applePayPath.close()
        applePayPath.fill()

        let applePayImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: originalFrame.width, height: originalFrame.height), true, UIScreen.main.scale)
        backgroundPath = UIBezierPath(rect: originalFrame)
        backgroundColor.setFill()
        backgroundPath.fill()
        applePayImage?.draw(at: CGPoint(x: originalFrame.midX - self.frame.midX, y: 0))
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage!
    }

}
