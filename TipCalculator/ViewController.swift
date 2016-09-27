//
//  ViewController.swift
//  TipCalculator
//
//  Created by Haider Khan on 9/24/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import PassKit
import UIKit

class ViewController: UIViewController {
    
    /*****************************************************
     * Outlets
     *****************************************************/
        
    @IBOutlet weak var applePayButton: UIButton!
    
    // Our total value including the tip and bill amount
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalStaticLabel: UILabel!
    
    // Top tip view that holds bill info and total info
    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var tipText: UITextField!
    @IBOutlet weak var tipViewHeight: NSLayoutConstraint!
    
    // Bottom tip percentages
    @IBOutlet weak var tipTotalsContainer: UIView!
    @IBOutlet weak var topTipContainer: UIView!
    @IBOutlet weak var middleTipContainer: UIView!
    @IBOutlet weak var bottomTipContainer: UIView!
    @IBOutlet weak var topTipLabel: UILabel!
    @IBOutlet weak var middleTipLabel: UILabel!
    @IBOutlet weak var bottomTipLabel: UILabel!
    @IBOutlet weak var topTipStaticLabel: UILabel!
    @IBOutlet weak var middleTipStaticLabel: UILabel!
    @IBOutlet weak var bottomTipStaticLabel: UILabel!
    
    /*****************************************************
     * Enums
     *****************************************************/
    
    // Our tip state changes - by default we have the top tip chosen
    enum TipState {
        case top
        case middle
        case bottom
    }

    /*****************************************************
     * Constants
     *****************************************************/
    
    let gradientLayer: CAGradientLayer = CAGradientLayer()
    let screenSize = UIScreen.main.bounds
    
    let SupportedPaymentNetworks = [PKPaymentNetwork.visa, PKPaymentNetwork.masterCard, PKPaymentNetwork.amex]
    let ApplePaySwagMerchantID = "merchant.com.zkhaider"
    
    /*****************************************************
     * iVars
     *****************************************************/
    
    var numberFormatter = NumberFormatter()
    var keyboardHeight = Float()
    var tipState = TipState.top // Set tip top to the default value
    var isApplePayButtonShown = false
    var animatedTipView = false
    
    var tipValues = [0.10, 0.15, 0.20]
    var staticTipValues = [10, 15, 20]

    /*****************************************************
     * LifeCycle Methods
     *****************************************************/

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get defaults
        let defaults = UserDefaults.standard
        let top = defaults.double(forKey: "top")
        let middle = defaults.double(forKey: "middle")
        let bottom = defaults.double(forKey: "bottom")
        
        if (top != 0) {
            staticTipValues[0] = Int(top)
            tipValues[0] = top / 100
        }
        
        if (middle != 0) {
            staticTipValues[1] = Int(middle)
            tipValues[1] = middle / 100
        }
        
        if (bottom != 0) {
            staticTipValues[2] = Int(bottom)
            tipValues[2] = bottom / 100
        }
        
        initViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Update bounds - uncomment for a gradient
//        gradientLayer.frame = tipView.bounds
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Get defaults
        let defaults = UserDefaults.standard
        let top = defaults.double(forKey: "top")
        let middle = defaults.double(forKey: "middle")
        let bottom = defaults.double(forKey: "bottom")
        
        if (top != 0) {
            staticTipValues[0] = Int(top)
            tipValues[0] = top / 100
        }
        
        if (middle != 0) {
            staticTipValues[1] = Int(middle)
            tipValues[1] = middle / 100
        }
        
        if (bottom != 0) {
            staticTipValues[2] = Int(bottom)
            tipValues[2] = bottom / 100
        }
        
        initStaticLabels()

        
        if (!animatedTipView) {
            animatedTipView = true
            animateTipViewHeight()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*****************************************************
     * Initialization Methods
     *****************************************************/

    fileprivate func initViews() {
        
        // Init views...
        initKeyboardHeight()
        initNavBar()
        initNumberFormatter()
        initTipText()
        initTipView()
        initTipTotalsContainer()
        initApplePayButton()
    }
    
    fileprivate func initKeyboardHeight() {
        
        // Register before you become first responder
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        
        // Get the
        tipText.becomeFirstResponder()
        perform(#selector(tipText.resignFirstResponder), with: nil, afterDelay: 0.1)

    }
    
    private func initNavBar() {
        
        // Set navigation bar to clear background and remove border (shadowImage)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func initNumberFormatter() {
        
        // Set our number formatter
        numberFormatter.locale = NSLocale.current
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = NSLocale.current.currencySymbol
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
    }
    
    private func initTipText() {

        // Set the tip text alpha to 0.0 we fade this in later
        tipText.alpha = 0.0

        // Set placeholder white color
        tipText.attributedPlaceholder = NSAttributedString(string:"$0.00",
                                                           attributes:[NSForegroundColorAttributeName: UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)])
        
        // Add a target for modifying the value for the currency
        tipText.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    }
    
    private func initTipView() {
        
        // Set a gradient on tip view - uncomment if you want a gradient
        //        let color1 = UIColor(red:0.92, green:0.12, blue:0.39, alpha:1.00).cgColor
        //        let color2 = UIColor(red:0.61, green:0.14, blue:0.26, alpha:1.00).cgColor
        //        gradientLayer.colors = [color1, color2]
        //        gradientLayer.locations = [0.0, 1.0]
        //        tipView.layer.insertSublayer(gradientLayer, at: 0)
        
        // Set alphas to labels
        totalStaticLabel.alpha = 0.0
        totalLabel.alpha = 0.0
        
        // Init height constraint with 0 constant then animate later
        tipViewHeight.constant = 0
        
        // Initialize top tip view
        tipView.backgroundColor = UIColor(red:0.92, green:0.12, blue:0.39, alpha:1.00)
        tipView.layer.shadowColor = UIColor.black.cgColor
        tipView.layer.shadowOpacity = 1
        tipView.layer.shadowOffset = CGSize.zero
        tipView.layer.shadowRadius = 5

    }
    
    private func initTipTotalsContainer() {
        
        // Set the alpha to 0.0 - animate in later in viewDidAppear
        tipTotalsContainer.alpha = 0.0
        
        // Set a selector function on the top tip label to resign first responder on the text field
        let topTipGesture = UITapGestureRecognizer(target: self, action: #selector(self.topTipLabelTapped))
        topTipGesture.numberOfTapsRequired = 1
        topTipGesture.numberOfTouchesRequired = 1
        self.topTipContainer.isUserInteractionEnabled = true
        self.topTipContainer.addGestureRecognizer(topTipGesture)
    
        let middleTipGesture = UITapGestureRecognizer(target: self, action: #selector(self.middleTipLabelTapped))
        middleTipGesture.numberOfTapsRequired = 1
        middleTipGesture.numberOfTouchesRequired = 1
        self.middleTipContainer.isUserInteractionEnabled = true
        self.middleTipContainer.addGestureRecognizer(middleTipGesture)
        
        let bottomTipGesture = UITapGestureRecognizer(target: self, action: #selector(self.bottomTipLabelTapped))
        bottomTipGesture.numberOfTapsRequired = 1
        bottomTipGesture.numberOfTouchesRequired = 1
        self.bottomTipContainer.isUserInteractionEnabled = true
        self.bottomTipContainer.addGestureRecognizer(bottomTipGesture)
        
        // Init shadows
        topTipContainer.layer.shadowColor = UIColor.black.cgColor
        topTipContainer.layer.shadowOpacity = 0
        topTipContainer.layer.shadowOffset = CGSize.zero
        topTipContainer.layer.shadowRadius = 0
        
        middleTipContainer.layer.shadowColor = UIColor.black.cgColor
        middleTipContainer.layer.shadowOpacity = 0
        middleTipContainer.layer.shadowOffset = CGSize.zero
        middleTipContainer.layer.shadowRadius = 0
        
        bottomTipContainer.layer.shadowColor = UIColor.black.cgColor
        bottomTipContainer.layer.shadowOpacity = 0
        bottomTipContainer.layer.shadowOffset = CGSize.zero
        bottomTipContainer.layer.shadowRadius = 0
        
        initStaticLabels()
    }
    
    private func initStaticLabels() {
        
        // Go ahead and set the static label values
        topTipStaticLabel.text = String(staticTipValues[0]) + "%"
        middleTipStaticLabel.text = String(staticTipValues[1]) + "%"
        bottomTipStaticLabel.text = String(staticTipValues[2]) + "%"
    }
    
    private func initApplePayButton() {
        applePayButton.alpha = 0.0
        applePayButton.clipsToBounds = true
        applePayButton.layer.cornerRadius = 6
        applePayButton.addTarget(self, action: #selector(applePayTapped), for: .touchUpInside)
    }
    
    /*****************************************************
     * Animation Methods
     *****************************************************/

    private func animateTipViewHeight() {
        
        // calculate the height needed for the top view to animate to
        let animatedHeight = Float(screenSize.height) - keyboardHeight - 100
        
        // Go ahead and animate view from the top
        self.tipViewHeight.constant = CGFloat(animatedHeight)
        UIView.animate(
            withDuration: 0.7,
            delay: 1.0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 1.0,
            options: UIViewAnimationOptions.curveEaseIn,
            animations: {
                self.tipView.layoutIfNeeded()
                self.tipText.alpha = 1.0
                self.tipTotalsContainer.alpha = 1.0
                self.totalLabel.alpha = 1.0
                self.totalStaticLabel.alpha = 1.0
                // Go ahead and add a settings icon to the top right of the nav bar item
                let settingsButton = UIBarButtonItem(title: "\u{2699}", style: .plain, target: self, action: #selector(self.goToSettings))
                self.navigationItem.rightBarButtonItem = settingsButton
            },
            completion: {(_) -> Void in
                self.tipText.becomeFirstResponder()
        })

    }
    
    private func animateColorChange() {
        
        let pickedColor = UIColor(red:0.47, green:0.24, blue:0.67, alpha:1.00)
        let normalColor = UIColor(red:0.61, green:0.14, blue:0.26, alpha:1.00)
        
        // Switch over state 
        switch tipState {
            case .top:
                
                UIView.animate(
                    withDuration: 0.3,
                    delay: 0,
                    options: UIViewAnimationOptions.curveEaseIn,
                    animations: {
                        self.topTipContainer.backgroundColor = pickedColor
                    },
                    completion: nil)
                
                UIView.animate(
                    withDuration: 0.3,
                    delay: 0,
                    options: UIViewAnimationOptions.curveEaseIn,
                    animations: {
                        self.middleTipContainer.backgroundColor = normalColor
                    },
                    completion: nil)
                
                UIView.animate(
                    withDuration: 0.3,
                    delay: 0,
                    options: UIViewAnimationOptions.curveEaseIn,
                    animations: {
                        self.bottomTipContainer.backgroundColor = normalColor
                    },
                    completion: nil)
                
                break
            case .middle:
                
                UIView.animate(
                    withDuration: 0.3,
                    delay: 0,
                    options: UIViewAnimationOptions.curveEaseIn,
                    animations: {
                        self.topTipContainer.backgroundColor = normalColor
                    },
                    completion: nil)
                
                UIView.animate(
                    withDuration: 0.3,
                    delay: 0,
                    options: UIViewAnimationOptions.curveEaseIn,
                    animations: {
                        self.middleTipContainer.backgroundColor = pickedColor
                    },
                    completion: nil)
                
                UIView.animate(
                    withDuration: 0.3,
                    delay: 0,
                    options: UIViewAnimationOptions.curveEaseIn,
                    animations: {
                        self.bottomTipContainer.backgroundColor = normalColor
                    },
                    completion: nil)

                break
            case .bottom:
                
                UIView.animate(
                    withDuration: 0.3,
                    delay: 0,
                    options: UIViewAnimationOptions.curveEaseIn,
                    animations: {
                        self.topTipContainer.backgroundColor = normalColor
                    },
                    completion: nil)
                
                UIView.animate(
                    withDuration: 0.3,
                    delay: 0,
                    options: UIViewAnimationOptions.curveEaseIn,
                    animations: {
                        self.middleTipContainer.backgroundColor = normalColor
                    },
                    completion: nil)
                
                UIView.animate(
                    withDuration: 0.3,
                    delay: 0,
                    options: UIViewAnimationOptions.curveEaseIn,
                    animations: {
                        self.bottomTipContainer.backgroundColor = pickedColor
                    },
                    completion: nil)

                break
        }
    }
    
    /*****************************************************
     * Router Methods
     *****************************************************/
    
    func goToSettings() {
        
        let viewControllerIdentifier = "settingsViewController"
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let settingsViewController = storyBoard.instantiateViewController(withIdentifier: viewControllerIdentifier) as! SettingsViewController
        self.navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    /*****************************************************
     * Keyboard Methods
     *****************************************************/

    func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let frameValue = userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue
            let frame = frameValue.cgRectValue
            keyboardHeight = Float(frame.height)
        }
    }
    
    /*****************************************************
     * TextField Methods
     *****************************************************/

    func textFieldDidChange(textField: UITextField) {
        let text = textField.text?
            .replacingOccurrences(of: numberFormatter.currencySymbol, with: "")
            .replacingOccurrences(of: numberFormatter.groupingSeparator, with: "")
            .replacingOccurrences(of: numberFormatter.decimalSeparator, with: "")
        let string = NSString(string: text!)
        
        // Convert string to number 
        let currencyValue = string.doubleValue / 100.0
        
        // Modify for tips 
        let topTipValue = (currencyValue * tipValues[0])  + currencyValue
        let middleTipValue = (currencyValue * tipValues[1]) + currencyValue
        let bottomTipValue = (currencyValue * tipValues[2]) + currencyValue
        
        // Set values
        textField.attributedText = NSAttributedString(string:String(currencyValue),
                                                      attributes:[NSForegroundColorAttributeName: UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)])
        textField.text = numberFormatter.string(for: currencyValue)
        topTipLabel.text = numberFormatter.string(for: topTipValue)
        middleTipLabel.text = numberFormatter.string(for: middleTipValue)
        bottomTipLabel.text = numberFormatter.string(for: bottomTipValue)
        
        // Set our total tip based on the tip state change 
        switch tipState {
            case .top:
                
                // Set the total based on the top tip value
                self.totalLabel.text = numberFormatter.string(for: topTipValue)
                break
            case .middle:
            
                // Set the total based on the middle tip value 
                totalLabel.text = numberFormatter.string(for: middleTipValue)
                break
            case .bottom:
            
                // Set the total bsed on the bottom tip value 
                totalLabel.text = numberFormatter.string(for: bottomTipValue)
                break
        }
        
        if (!isApplePayButtonShown) {
            self.isApplePayButtonShown = true
            UIView.animate(
                withDuration: 0.3, delay: 0,
                options: UIViewAnimationOptions.curveEaseIn,
                animations: {
                    self.applePayButton.alpha = 1.0
                },
                completion: nil
            )
        }
    }
    
    /*****************************************************
     * Tip Label Methods
     *****************************************************/
    
    @objc func applePayTapped() {
        
//        let request = PKPaymentRequest()
//        request.countryCode = "US"
//        request.currencyCode = "USD"
//        request.merchantIdentifier = ApplePaySwagMerchantID
//        request.supportedNetworks = SupportedPaymentNetworks
//        request.merchantCapabilities = PKMerchantCapability.capability3DS
//        
//        let totalValue = NSString(string: totalLabel.text!).doubleValue
//        request.paymentSummaryItems = [
//            PKPaymentSummaryItem(label: "Tip Amount", amount: NSDecimalNumber(value: totalValue))
//        ]
//        
//        let applePayController = PKPaymentAuthorizationViewController(paymentRequest: request)
//        let canMakePayments = PKPaymentAuthorizationViewController.canMakePayments()
//        if (canMakePayments) {
//            self.present(applePayController, animated: true, completion: nil)
//        }
    }
    
    @objc func topTipLabelTapped() {
        self.tipText.resignFirstResponder()
        
        // Set the state
        tipState = TipState.top
        
        animateColorChange()

        setTotalTipValueFromLabel(label: topTipLabel)
    }
    
    @objc func middleTipLabelTapped() {
        
        // Set the state
        tipState = TipState.middle
        
        animateColorChange()
        
        setTotalTipValueFromLabel(label: middleTipLabel)
    }
    
    @objc func bottomTipLabelTapped() {
        
        // Set the state 
        tipState = TipState.bottom
        
        animateColorChange()
        
        setTotalTipValueFromLabel(label: bottomTipLabel)
    }
    
    private func setTotalTipValueFromLabel(label: UILabel) {
        
        if let total = label.text, !total.isEmpty {
            
            // Convert to NSString and set the formatted value 
            totalLabel.text = total
        }
    }
    
    /*****************************************************
     * Currency Methods
     *****************************************************/

    func currencyStringFromNumber(number: Double) -> String {
        return numberFormatter.string(from: NSNumber(value: number))!
    }
    
    /*****************************************************
     * ApplePay Methods
     *****************************************************/
    
    
    
}

