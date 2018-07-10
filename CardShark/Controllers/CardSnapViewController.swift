//
//  CardSnapViewController.swift
//  CardShark
//
//  Created by Angela Yu on 6/20/18.
//  Copyright © 2018 Angela Yu. All rights reserved.
//

import UIKit

class CardSnapViewController: UIViewController {
    
    @IBOutlet var cardFrameView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cardFrameView.layer.cornerRadius = 5
        cardFrameView.layer.borderWidth = 1
        cardFrameView.layer.borderColor = UIColor.white.cgColor
        cardFrameView.backgroundColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
