//
//  AppAssembler.swift
//  Coinless
//
//  Created by Luthfi Asmara on 29/01/24.
//

import Foundation

protocol Assembler:  AuthAssembler,
                     HomeAssembler,
                     ProfileAssembler {}


class AppAssembler: Assembler {}

