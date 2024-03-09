import Cocoa
import Foundation

let g = 10

struct Cannon {
    var teta: Int = 0
    var v: Int = 0
}

struct Bottle {
    var position: Int = 0
    var delta: Double = 0.5
    var status: Bool = false
}

struct Player {
    var nickname: String = ""
    var score: Int = 0
}

class Game {
    var player: Player
    var cannon: Cannon
    var bottle: Bottle
    
    
    init(player: Player, cannon: Cannon, bottle: Bottle) {
        self.player = player
        self.cannon = cannon
        self.bottle = bottle
    }
    
    func setNickname(_ nick: String) {
        player.nickname = nick
    }
    func getNickname() -> String{
        player.nickname
    }
    func setBottlePosition(_ position: Int) {  // 0-1500 m
        bottle.position = position
    }
    func setCannon(_ teta: Int, _ v: Int){
        cannon.teta = teta
        cannon.v = v
    }
    
    func doFire() -> Bool {
        
        if bottle.status == true {
            return true
        }
        return false
    }
}


func gameMainProcess(nickname: String, bottlePosition: Int, angle: Int, velocity: Int){
    
    print("Hello")
    var player = Player()
    var cannon = Cannon()
    var bottle = Bottle()
    
    var game1: Game = Game(player: player, cannon: cannon, bottle: bottle)
    
    
    var teta = 45
    var v = 90
    
    game1.setNickname("Zeynep")
    game1.setBottlePosition(1000) // 0 - 1500
    game1.setCannon(teta, v) // 0 - 180, 0-100
    
    print("\(game1.getNickname()) joined the game.")
    
    // R = V*V*sin(2*teta)/g
    var R = (cannon.v * cannon.v) * Int(sin(Double(2*(cannon.teta)))) / g
    var d: Double = Double(bottle.position)
    var delta = bottle.delta
    
    
    if d - delta <= Double(R) && Double(R) <= d + delta {
        bottle.status = true
        player.score += 1
        print("\(game1.getNickname()) shot the bottle!")
    }
    
    print("\(game1.getNickname())'s score is: \(player.score). ")
    
}

gameMainProcess(nickname: "Zeynep", bottlePosition: 1000, angle: 45, velocity: 90)
