//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by 蔡鈞 on 2016/3/5.
//  Copyright © 2016年 蔡鈞. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon:Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttack: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        
        
        pokemon.downloadPokemonDetails { () -> () in
            // 當完成下載後此閉包會被呼叫
            print("DID WE GET HERE")
            self.updateUI()
        }
    }

    func updateUI(){
        
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        pokedexLbl.text = "\(pokemon.pokedexId)"
        baseAttack.text = pokemon.attack
        weightLbl.text = pokemon.weight
        
        if pokemon.nextEvolutionId == ""{
        
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
            
        }else{
        
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: "\(pokemon.nextEvolutionId)")
            
            var str = "Next Evolution:\(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvolutionLvl != ""{
                str += "-LVL\(pokemon.nextEvolutionLvl)"
            }
        
        }
        
        
    }
    

    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
   

}
