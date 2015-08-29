
//  ViewController.swift
//  Tipzi
//
//  Created by Long Nguyen on 8/20/15.
//  Copyright (c) 2015 Long Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOfDiner:Double = 0.0
    
    //supporting declare
    
    var emptyString: String = ""
    //Button
    
    @IBOutlet weak var onePersonButton: UIButton!
    @IBOutlet weak var twoPeopleButton: UIButton!
    @IBOutlet weak var threePeopleButton: UIButton!
    @IBOutlet weak var fourPeopleButton: UIButton!
    
    //Label and Field
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    @IBOutlet weak var eachLabel: UILabel!
    @IBOutlet weak var dollarLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    //View
    @IBOutlet weak var tipziView: UIImageView!
    @IBOutlet weak var billAmountView: UIView!
    @IBOutlet weak var calculationView: UIView!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var tipView: UIView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
    tipLabel.text = "$0.00"
    totalLabel.text = "$0.00"
    tipPercentageSlider.value = 0.1
    tipPercentageLabel.text = "10%"
    self.eachLabel.hidden = true
    billAmountField.becomeFirstResponder()
    animationView()
    numberOfDiner = 1.0
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
    //Manage the number of people
    
    @IBAction func dinerNumberCalculation(sender: AnyObject) {
    switch (sender.tag) {
        
case 1:
    numberOfDiner = 1
    self.refreshIcon()
onePersonButton.setImage(UIImage(named:"human_filled.png"), forState:UIControlState.Normal)
self.eachLabel.hidden = true
updateTotalBill()
        
case 2:
    numberOfDiner = 2
    self.refreshIcon()
onePersonButton.setImage(UIImage(named:"human_filled.png"), forState:UIControlState.Normal)
twoPeopleButton.setImage(UIImage(named:"human_filled.png"), forState:UIControlState.Normal)

self.eachLabel.hidden = false
updateTotalBill()
case 3:
    numberOfDiner = 3
    self.refreshIcon()
twoPeopleButton.setImage(UIImage(named:"human_filled.png"), forState:UIControlState.Normal)
threePeopleButton.setImage(UIImage(named:"human_filled.png"), forState:UIControlState.Normal)
self.eachLabel.hidden = false

updateTotalBill()
        
case 4:
    numberOfDiner = 4
    self.refreshIcon()
    twoPeopleButton.setImage(UIImage(named:"human_filled.png"), forState:UIControlState.Normal)
    threePeopleButton.setImage(UIImage(named:"human_filled.png"), forState:UIControlState.Normal)
    fourPeopleButton.setImage(UIImage(named:"human_filled.png"), forState:UIControlState.Normal)
    self.eachLabel.hidden = false
    
    updateTotalBill()
    
default:
    break
    }
    animationView()
    }
    
    func refreshIcon() {
    twoPeopleButton.setImage(UIImage(named:"human_not_filled.png"), forState:UIControlState.Normal)
    threePeopleButton.setImage(UIImage(named:"human_not_filled.png"), forState:UIControlState.Normal)
    fourPeopleButton.setImage(UIImage(named:"human_not_filled.png"), forState:UIControlState.Normal)
    }
    
    func updateTotalBill() {
    var tipPercentage = tipPercentageSlider.value
    var tipRate = tipPercentage / 100
    var updatedBillAmount = NSString(string: billAmountField.text).doubleValue
    var updatedTip:Double = Double (updatedBillAmount) * Double(tipRate)
    var updatedTotal = updatedTip + updatedBillAmount
    var updatedTotalSplit: Double = Double(updatedTotal) / numberOfDiner
    tipLabel.text = "+\(updatedTip)"
    totalLabel.text = "\(updatedTotalSplit)"
    tipLabel.text = String(format: "$%.2f",updatedTip)
    totalLabel.text = String(format: "$%.2f",updatedTotalSplit)
    
    }
    
    
    @IBAction func sliderCalculation(sender: AnyObject) {
    var tipPercentageValue = Int(tipPercentageSlider.value)
    //get the value on the slider
    
    tipPercentageLabel.text = "\(tipPercentageValue)%"
    //put the value of the slider control on the label
    
    animationView()
    
    updateTotalBill()
    
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
    var billAmount = NSString(string: billAmountField.text).doubleValue
    var tip = billAmount * 0.1
    var total = billAmount + tip
    tipLabel.text = "+\(tip)"
    totalLabel.text = "\(total)"
    
    animationView()
    updateTotalBill()
    }
  
    
    

    func animationView() {
    //hiding the controlview and the bill, tip ammount
    
    
    if billAmountField.text == emptyString {
    UIView.animateWithDuration(0.5, animations: {
    self.dollarLabel.hidden = false
    self.totalView.alpha = 0
    self.calculationView.alpha = 0
    self.tipView.alpha = 0
    self.billAmountView.frame = CGRectMake(0, 150, 320, 63)
    })
}
    else {
    UIView.animateWithDuration(0.5, animations: {
    self.totalView.alpha = 1
    self.calculationView.alpha = 1
    self.billAmountField.alpha = 1
    self.tipView.alpha = 1
    self.dollarLabel.hidden = true
    self.billAmountView.frame = CGRectMake(0, 58, 320, 63)
    })
    }

    
    }
    
}

