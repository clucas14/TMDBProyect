//
//  URL.swift
//  TMDBProyect
//
//  Created by Casa on 23/11/23.
//

import Foundation

let mainURL = URL(string: "https://api.themoviedb.org/3/movie")!

//MARK: WARNING
let AK:[UInt8] = [0x22+0x20,0x9E-0x39,0x32+0x2F,0xBA-0x48,0x68-0x03,0xC9-0x57,0x0F+0x11,0x2D+0x38,0xD0-0x57,0x31+0x19,0x8A-0x22,0x19+0x49,0x77-0x30,0x6A-0x07,0x94-0x2B,0x2C+0x23,0xCF-0x66,0x42+0x08,0x8D-0x44,0x55+0x00,0xE1-0x67,0x7D-0x34,0x47-0x16,0x0A+0x44,0x5A+0x0F,0x61-0x17,0x39-0x00,0x33-0x05,0xBE-0x59,0xB4-0x3B,0x1A+0x30,0x50+0x18,0x31+0x33,0x5E-0x07,0x90-0x3F,0x4E+0x1B,0x49+0x06,0x56+0x13,0x00+0x49,0x20+0x11,0x2D+0x2C,0x44+0x36,0x1B+0x3E,0xB0-0x39,0x45+0x0A,0x9B-0x44,0x95-0x3C,0x4F+0x2A,0x37+0x23,0x3F+0x05,0x2D+0x14,0x7D-0x04,0x02+0x4D,0x63-0x1F,0x2E+0x18,0x2C+0x3D,0x6E-0x1F,0x7A-0x23,0xA1-0x47,0xB0-0x45,0x78-0x29,0x87-0x30,0xA8-0x53,0x7F-0x08,0x38+0x21,0x7E-0x2A,0x07+0x64,0x4B-0x17,0x3A+0x14,0x20+0x12,0x4C-0x03,0x37-0x06,0x1D+0x3C,0x79-0x0C,0xAE-0x55,0x06+0x2D,0x8D-0x34,0xA3-0x29,0x80-0x14,0x18+0x54,0x3D+0x1C,0x0C+0x47,0x7D-0x34,0xA9-0x36,0x06+0x43,0xC6-0x58,0x11+0x3D,0x2E+0x03,0x4B+0x0E,0x53+0x16,0x29+0x20,0x07+0x2F,0x81-0x38,0x1B+0x4F,0x02+0x57,0x2B+0x06,0x6F-0x21,0x74-0x1D,0xAD-0x54,0x3A-0x07,0x6C-0x1D,0x7E-0x2A,0x33+0x17,0x6F-0x06,0x06+0x47,0x19+0x3E,0x28+0x2A,0x6D-0x04,0x7F-0x26,0x1D+0x5D,0x66+0x01,0x10+0x24,0x91-0x44,0x51-0x0D,0x43+0x02,0x20+0x58,0x8D-0x33,0x08+0x4F,0x68-0x23,0x0B+0x26,0x6D-0x1F,0x2D+0x2A,0x0F+0x3F,0x1C+0x50,0x13+0x3B,0x30+0x49,0x7C-0x33,0xCB-0x58,0x8B-0x42,0xBF-0x51,0x27+0x27,0x63+0x07,0x1E+0x44,0x1C+0x17,0x55-0x13,0x25+0x47,0x97-0x34,0xBF-0x46,0x6C-0x23,0x47-0x11,0x68-0x11,0xC5-0x4C,0x4C-0x02,0x6C-0x04,0x3D+0x26,0x40+0x07,0x56+0x16,0x6E-0x08,0x6F-0x0C,0x78-0x0B,0x0C+0x4A,0xD0-0x68,0x34+0x26,0x43+0x00,0x29+0x21,0x11+0x53,0x6B-0x1F,0x16+0x2D,0x4E-0x04,0x21+0x11,0xB4-0x5A,0x4E+0x0A,0x36+0x14,0xF3-0x79,0x81-0x20,0x91-0x3A,0x45-0x0C,0x8A-0x15,0x78-0x2F,0xC6-0x5C,0xA2-0x33,0xE3-0x6B,0x02+0x64,0x8C-0x3B,0x58-0x2A,0x5A-0x06,0x48+0x0C,0x5A-0x12,0x16+0x2E,0x98-0x3F,0x12+0x62,0xB8-0x52,0x00+0x54,0x03+0x2F,0xAF-0x49,0xA8-0x50,0x0B+0x22,0x0B+0x2B,0x08+0x3B,0x06+0x2C,0x1F+0x5A,0x5B-0x2B,0x01+0x6C,0x48+0x02,0x2D+0x27,0x2E+0x1A,0x63+0x0F,0x97-0x21,0xDD-0x63,0x02+0x65,0x3F+0x05,0x48-0x17,0x34+0x14,0x1F+0x4D,0x34+0x3B,0x27+0x29,0x6C-0x26,0x3A+0x0C,0x54+0x13,0x69-0x02,0xE4-0x72,0xB3-0x47,0x4C-0x09,0x76-0x2B,0x00+0x35,0x59-0x0D,0x41+0x20,0x0F+0x25]

extension URL {
    static let getPopularMovies = mainURL.appending(path: "popular")
}
