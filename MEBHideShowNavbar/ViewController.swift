//
//  ViewController.swift
//  MEBHideShowNavbar
//
//  Created by Martin on 2014-10-30.
//  Copyright (c) 2014 Martin Borstrand. All rights reserved.
//

import UIKit

var testLabel: UILabel!
var customNavbar: UIView!
var button: UIButton!
var navbarTitle: UILabel!
var imageView: UIImageView!

class ViewController: UIViewController, UIScrollViewDelegate {
  
  let scrollView: UIScrollView = UIScrollView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
    scrollView.showsVerticalScrollIndicator = false
    scrollView.delegate = self
    self.view.addSubview(scrollView)
    
    imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height));
    var image = UIImage(named: "test-image");
    imageView.image = image;
    view.addSubview(imageView);
    
    customNavbar = UIView (frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 64.0))
    customNavbar.backgroundColor = UIColor .grayColor()
    customNavbar.alpha = 0.0
    customNavbar.frame.origin.y = -88
    view.addSubview(customNavbar)
    
    navbarTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
    navbarTitle.textAlignment = NSTextAlignment.Center
    navbarTitle.frame.origin.y = 0
    navbarTitle.font = UIFont(name: "Montserrat-Bold", size: 18)
    navbarTitle.frame.origin.x = -100
    navbarTitle.text = "MEBHideShowNavbar".uppercaseString
    navbarTitle.alpha = 0
    navbarTitle.textColor = self.colorByHex(0xffffff, alpha: 1)
    customNavbar.addSubview(navbarTitle)
    
    scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
  }
  
  func startIntroAnim(){
    
    UIView.animateWithDuration(0.6, delay: 0.7, options: .CurveEaseOut , animations: {
      
      customNavbar.alpha = 0.0
      testLabel.alpha = 1.0
      
      }, completion: { finished in
        println("Content Showned")
    })
  }
  
  func showCustomNavbarAnimation(){
    
    UIView.animateWithDuration(0.7, delay: 0.2, options: .CurveEaseOut , animations: {
      
      customNavbar.frame.origin.y = 0
      customNavbar.backgroundColor = self.colorByHex(0x3FDDA7, alpha: 0.98)
      customNavbar.alpha = 1.0
      
      navbarTitle.alpha = 1.0
      navbarTitle.frame.origin.y = 15
      navbarTitle.frame.origin.x = 0
      navbarTitle.textColor = self.colorByHex(0xffffff, alpha: 1)
      
      }, completion: { finished in
        println("Custom Navbar Showned")
    })
  }
  
  func hideCustomNavbar() {
    
    UIView.animateWithDuration(0.1, delay: 0.1, options: .CurveEaseOut , animations: {
      
      customNavbar.frame.origin.y = -88
      customNavbar.backgroundColor = self.colorByHex(0x000000, alpha: 1)
      customNavbar.alpha = 0.0
      
      navbarTitle.alpha = 0.0
      navbarTitle.frame.origin.y = 0
      navbarTitle.frame.origin.x = 0
      
      }, completion: { finished in
        println("Custom Navbar Hidden Showned")
    })
  }
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
    
    if(scrollView.contentOffset.y > 10.0) {
      println("ScrollViewDidScrollHere")
      showCustomNavbarAnimation()
    } else {
      hideCustomNavbar()
    }
    println(scrollView.contentOffset.y)
  }
  
  func colorByHex (hex: Int, alpha: Double = 1.0) -> UIColor {
    let red = Double((hex & 0xFF0000) >> 16) / 255.0
    let green = Double((hex & 0xFF00) >> 8) / 255.0
    let blue = Double((hex & 0xFF)) / 255.0
    var color: UIColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    return color
  }
  
}
