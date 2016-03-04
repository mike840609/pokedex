//
//  Pokemon.swift
//  pokedex
//
//  Created by 蔡鈞 on 2016/3/4.
//  Copyright © 2016年 蔡鈞. All rights reserved.
//

import Foundation

class Pokemon{
    private var _name:String!
    private var _pokedexId:Int!
    
    var name:String{
        return _name
    }
    
    var pokedexId:Int{
        return _pokedexId
    }
    
    init(name:String,pokedexId:Int){
        _name = name
        _pokedexId = pokedexId
    }
    
}