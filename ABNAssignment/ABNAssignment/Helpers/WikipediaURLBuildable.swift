//
//  WikipediaURLBuildable.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 22/06/26.
//

protocol WikipediaURLBuildable {
    var name: String { get }
    var latitude: Double { get }
    var longitude: Double { get }
}

extension Stadium: WikipediaURLBuildable {}
