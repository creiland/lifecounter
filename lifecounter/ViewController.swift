//
//  ViewController.swift
//  lifecounter
//
//  Created by Conor Reiland on 1/28/19.
//  Copyright © 2019 Conor Reiland. All rights reserved.
//

import UIKit

let base = 20
var lifesToAdd = 5
fileprivate var numberPlayers = 4


class Player{
    var points: Int
    var player: Int
    
    init(player: Int) {
        
        self.player = player
        self.points = base
    }
    
    func add(num: Int){
        self.points += num
    }
    
    func subtract(num: Int){
        self.points -= num
    }
    
}

class ViewController: UIViewController,UITextFieldDelegate {
    
    let numberToolbar: UIToolbar = UIToolbar()
    
    var history: [String] = ["Start Game"]
    
    @IBOutlet weak var textfield: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let receiverVC = segue.destination as! SecondViewController
        receiverVC.strings = history
    }
    
    var playerOne = Player(player: 1)
    var playerTwo = Player(player: 2)
    var playerThree = Player(player: 3)
    var playerFour = Player(player: 4)
    var playerFive = Player(player: 5)
    var playerSix = Player(player: 6)
    var playerSeven = Player(player: 7)
    var playerEight = Player(player: 8)
    
    
    
    //Player score values
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    @IBOutlet weak var playerThreeLabel: UILabel!
    @IBOutlet weak var playerFourLabel: UILabel!
    //Renaemd this one weak
    @IBOutlet weak var playerFiveLabel: UILabel!
    @IBOutlet weak var playerSixLabel: UILabel!
    @IBOutlet weak var playerSevenLabel: UILabel!
    @IBOutlet weak var playerEightLabel: UILabel!
    
    
    
    @IBOutlet weak var lossLabel: UILabel!
    
    //Player plus button labels
    @IBOutlet weak var plusFiveOne: UIButton!
    @IBOutlet weak var plusFiveTwo: UIButton!
    @IBOutlet weak var plusFiveThree: UIButton!
    @IBOutlet weak var plusFiveFour: UIButton!
    @IBOutlet weak var plusFiveFive: UIButton!
    @IBOutlet weak var plusFiveSix: UIButton!
    @IBOutlet weak var plusFiveSeven: UIButton!
    @IBOutlet weak var plusFiveEight: UIButton!
    
    //Player minus labels
    @IBOutlet weak var minusOne: UIButton!
    @IBOutlet weak var minusTwo: UIButton!
    @IBOutlet weak var minusThree: UIButton!
    @IBOutlet weak var minusFour: UIButton!
    @IBOutlet weak var minusFive: UIButton!
    @IBOutlet weak var minusSix: UIButton!
    @IBOutlet weak var minusSeven: UIButton!
    @IBOutlet weak var minusEight: UIButton!
    
    //Playerstacks
    

    
    var plusList: [UIButton] = []
    var minusList: [UIButton] = []
    
    
    @IBOutlet weak var Player1Stack: UIStackView!
    @IBOutlet weak var Player2Stack: UIStackView!
    @IBOutlet weak var Player3Stack: UIStackView!
    @IBOutlet weak var Player4Stack: UIStackView!
    @IBOutlet weak var Player5Stack: UIStackView!
    @IBOutlet weak var Player6Stack: UIStackView!
    @IBOutlet weak var Player7Stack: UIStackView!
    @IBOutlet weak var Player8Stack: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerOneLabel.text = "P1: " + String(base)
        playerTwoLabel.text = "P2: " + String(base)
        playerThreeLabel.text = "P3: " + String(base)
        playerFourLabel.text = "P4: " + String(base)
        playerFiveLabel.text = "P5: " + String(base)
        playerSixLabel.text = "P6: " + String(base)
        playerSevenLabel.text = "P7: " + String(base)
        playerEightLabel.text = "P8: " + String(base)
        
        Player5Stack.isHidden = true
        Player6Stack.isHidden = true
        Player7Stack.isHidden = true
        Player8Stack.isHidden = true
        
        self.textfield.delegate = self
        
        numberToolbar.barStyle = UIBarStyle.blackTranslucent
        numberToolbar.items=[
            UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(keyboardCancel)),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Apply", style: UIBarButtonItem.Style.plain, target: self, action: #selector(keyboardApply))
        ]
        
        numberToolbar.sizeToFit()
        
        textfield.inputAccessoryView = numberToolbar
        
        plusList = [plusFiveOne, plusFiveTwo, plusFiveThree, plusFiveFour, plusFiveFive, plusFiveSix, plusFiveSeven, plusFiveEight]
        
        minusList = [minusOne, minusTwo, minusThree, minusFour, minusFive, minusSix, minusSeven, minusEight]
        
        
        /*
        plusList.append(plusFiveOne)
        plusList.append(plusFiveTwo)
        plusList.append(plusFiveThree)
        plusList.append(plusFiveFour)
        plusList.append(plusFiveFive)
        plusList.append(plusFiveSix)
        plusList.append(plusFiveSeven)
        plusList.append(plusFiveEight)
 */
        
        
        //do it for every relevant textfield if there are more than one
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func buttonPress(_ sender: UIButton) {
        var tagNum: Int
        var label: UILabel
        var player: Player
        
        if sender.tag >= 70{
            tagNum = sender.tag - 70
            label = playerEightLabel
            player = playerEight
        }
        else if sender.tag >= 60{
            tagNum = sender.tag - 60
            label = playerSevenLabel
            player = playerSeven
            
        }
        else if sender.tag >= 50{
            tagNum = sender.tag - 50
            label = playerSixLabel
            player = playerSix
            
        }
        else if sender.tag >= 40{
            tagNum = sender.tag - 40
            label = playerFiveLabel
            player = playerFive
            
        }
        else if sender.tag >= 30{
            tagNum = sender.tag - 30
            label = playerFourLabel
            player = playerFour
            
        }else if sender.tag >= 20{
            tagNum = sender.tag - 20
            label = playerThreeLabel
            player = playerThree
            
        }else if sender.tag >= 10{
            tagNum = sender.tag - 10
            label = playerTwoLabel
            player = playerTwo
        }else{
            tagNum = sender.tag
            label = playerOneLabel
            player = playerOne
        }
        
        var actionType = ""
        
        switch  tagNum{
        case 1:
            player.subtract(num: 1)
            actionType = "lost one life"
        case 2:
            player.add(num: 1)
            actionType = "added one life"
        case 3:
            player.add(num: lifesToAdd)
            actionType = "added " + String(lifesToAdd) + " lives"
        default:
            player.subtract(num: lifesToAdd)
            actionType = "lost " + String(lifesToAdd) + " lives"
        }
        
        label.text = "P" + String(player.player) + ": " + String(player.points)
        history.append("Player " + String(player.player) + " " + actionType)
        
        if player.points <= 0{
            lossLabel.text = "Player " + String(player.player) + " Losses"
            lossLabel.isHidden = false
        }
        
        //plusButtonOne.setTitle(<#T##title: String?##String?#>, for: <#T##UIControl.State#>)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBOutlet weak var plusButtonOne: UIButton!
    
    
    @objc func keyboardCancel () {
        for item in history{
            print(item)
        }
        self.view.endEditing(true)
    }
    
    @objc func keyboardApply() {
        self.view.endEditing(true)
        
        for  button in plusList {
            button.setTitle("+"+textfield.text!, for: .normal)
        }
        
        for button in minusList {
            button.setTitle("-"+textfield.text!, for: .normal)
        }
        
        lifesToAdd = Int(textfield.text!)!
        
    }
    
    
    @IBAction func addPlayer(_ sender: Any) {

        
        switch numberPlayers {
        case 2:
            Player3Stack.isHidden = false
        case 3:
            Player4Stack.isHidden = false
        case 4:
            Player5Stack.isHidden = false
        case 5:
            Player6Stack.isHidden = false
        case 6:
            Player7Stack.isHidden = false
        case 7:
            Player8Stack.isHidden = false
        default:
            numberPlayers -= 1
            
        }
        numberPlayers += 1
        
    }
    
    
    @IBAction func subtractPlayer(_ sender: Any) {
        switch numberPlayers {
        case 3:
            Player3Stack.isHidden = true
        case 4:
            Player4Stack.isHidden = true
        case 5:
            Player5Stack.isHidden = true
        case 6:
            Player6Stack.isHidden = true
        case 7:
            Player7Stack.isHidden = true
        case 8:
            Player8Stack.isHidden = true
        default:
            numberPlayers += 1
        }
        numberPlayers -= 1
    }
    
    
}

