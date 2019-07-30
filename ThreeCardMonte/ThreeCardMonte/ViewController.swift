//
//  ViewController.swift
//  ThreeCardMonte
//
//  Created by Alex Paul on 11/5/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstCard: UIButton!
    @IBOutlet weak var secondCard: UIButton!
    @IBOutlet weak var thirdCard: UIButton!
    @IBOutlet weak var gameStatus: UILabel!
    
    var images = [UIImage]()
    var cards = [UIButton]()
    var didWin = false
    
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 48/255, green: 104/255, blue: 26/255, alpha: 1)
    
    images = [UIImage.init(named: "kingCard")!, UIImage.init(named: "threeCard")!, UIImage.init(named: "threeCard")!]
    cards = [firstCard, secondCard, thirdCard]
  }
    @IBAction func cardPick(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if images[0] == UIImage(named: "kingCard") {
                win(button: firstCard, imageName: "kingCard")
            } else {
                lose(button: firstCard, imageName: "threeCard")
            }
            disableCards()
            
        case 1:
            if images[1] == UIImage(named: "kingCard") {
                win(button: secondCard, imageName: "kingCard")
                //
            } else {
                lose(button: secondCard, imageName: "threeCard")
            }
            disableCards()
            
        case 2:
            if images[2] == UIImage(named: "kingCard") {
                win(button: thirdCard, imageName: "kingCard")
            } else {
                lose(button: thirdCard, imageName: "threeCard")
            }
            disableCards()
            
        default:
            print("kay, thanks bye")
        }
        if !didWin
        {
            for (index, image) in images.enumerated() {
                if image == UIImage(named: "kingCard") {
                    cards[index].setImage(UIImage.init(named: "kingCard"), for: .normal)
                }
            }
        }
    }
    
    func win (button: UIButton, imageName: String) {
        button.setImage(UIImage.init(named: imageName), for: .normal)
        gameStatus.text = "You Win!"
        //set gamestatus - parameter in func
    }
    
    func lose (button: UIButton, imageName:String) {
        button.setImage(UIImage.init(named: imageName), for: .normal)
        gameStatus.text = "Sorry, you lose"
    }
    
    @IBAction func newGame(_ sender: Any) {
        images = images.shuffled()
        
        firstCard.setImage(UIImage.init(named: "cardBackRed"), for: .normal)
        secondCard.setImage(UIImage.init(named: "cardBackRed"), for: .normal)
        thirdCard.setImage(UIImage.init(named: "cardBackRed"), for: .normal)
        firstCard.isEnabled = true
        secondCard.isEnabled = true
        thirdCard.isEnabled = true
    }
    
    func disableCards () {
        firstCard.isEnabled = false
        secondCard.isEnabled = false
        thirdCard.isEnabled = false
    }
}





