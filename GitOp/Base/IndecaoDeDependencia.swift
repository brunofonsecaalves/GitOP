//
//  IndecaoDeDependencia.swift
//  GitOp
//
//  Created by Bruno Alves on 11/02/21.
//

import Foundation
import UIKit

class ControllerGeometrica: UIViewController {
    
    let forma: FormaGeometrica
    
    init(forma: FormaGeometrica) {
        self.forma = forma
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ViewModelB {
}

protocol FormaGeometrica {
    init(altura: Double, largura: Double)
    func desenhar()
    func tamanho()
    var altura: Double { get set }
    var largura: Double { get set }
}

class Circulo: FormaGeometrica {
    required init(altura: Double, largura: Double) {
        self.altura = altura
        self.largura = largura
    }
    
    var altura: Double
    
    var largura: Double
    
    func desenhar() {
        // desenhar
    }
    
    func tamanho() {
        //let tamanhp = altura * largura
    }
    
}

class Quadrado: FormaGeometrica {
    required init(altura: Double, largura: Double) {
        self.altura = altura
        self.largura = largura
    }
    
    func desenhar() {
        // desenhar
    }
    
    func tamanho() {
        // dsenhar tamanho
    }
    
    var altura: Double = 8
    
    var largura: Double = 7
    
}

class Triangulo: FormaGeometrica {
    
    required init(altura: Double, largura: Double) {
        self.altura = altura
        self.largura = largura
    }
    
    func desenhar() {
        //
    }
    
    func tamanho() {
        //
    }
    
    var altura: Double = 8
    
    var largura: Double = 12
    
    
}

let circulo = Circulo(altura: 25, largura: 20)
let a = ControllerGeometrica(forma: circulo)

let triangulo = Triangulo(altura: 4, largura: 3)
let b = ControllerGeometrica(forma: triangulo)
