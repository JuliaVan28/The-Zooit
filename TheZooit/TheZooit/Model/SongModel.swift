//
//  MusicAlbum.swift
//  TheZooit
//
//  Created by Muhammad Usman Siddiqui on 27/10/2023.
//

import Foundation

struct SongModel: Identifiable, Equatable {
    var id: UUID = UUID()
    
    var name: String
    var file: String
}
