enum passwordError: Error{
    case TooShort
    case NoUpperCaseCharacter
    case NoLowerCaseCharacter
}

func checkValidPassword(password: String) throws -> Bool {
    var containsUpperCase: Bool = false
    var containsLowerCase: Bool = false
    
    if password.characters.count < 8 {
        throw passwordError.TooShort
    }
    for c in password.characters {
        if c >= "A" && c <= "Z" {
            containsUpperCase = true
            break
        }
    }
    
    for c in password.characters {
        if c >= "a" && c <= "z" {
            containsLowerCase = true
            break
        }
    }
    
    if containsUpperCase == false {
        throw passwordError.NoUpperCaseCharacter
    }
    
    if containsLowerCase == false {
        throw passwordError.NoLowerCaseCharacter
    }
    
    return true
    
}



func tryPassword(password: String){
    do {
        try checkValidPassword(password: password)
        print("Password is good")
    }
    catch {
        print(" Houston, we have a problem!")
    }
}

tryPassword(password: "hello")

tryPassword(password: "password")

tryPassword(password: "Password")

tryPassword(password: "Hello")