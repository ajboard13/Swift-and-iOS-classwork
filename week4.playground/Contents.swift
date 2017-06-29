func faherenheitToCelcius(fahrenheitValue:Double) -> Double {
    
    var result:Double
    
    result = (((fahrenheitValue - 32) * 5) / 9)
    
    return result
}

print(faherenheitToCelcius(fahrenheitValue: 100))

var outdoorTemperatureInFahrenheit = 88.2
var outdoorTemperatureInCelcius = faherenheitToCelcius(fahrenheitValue: outdoorTemperatureInFahrenheit)

print(outdoorTemperatureInCelcius)

//================================================

func celsiusToFahrenheit(celsiusValue:Double) -> Double {
    
    var result:Double
    
    result = (((celsiusValue * 9) / 5) + 32)
    
    return result
}

print(celsiusToFahrenheit(celsiusValue: 100))

// ======================================================

func buildASentenceUsingSubject(subject:String,
                                verb:String,
                                noun:String) -> String
{
    return subject + " " + verb + " " + noun + "!"
    
}

print(buildASentenceUsingSubject(subject:"Swift",
                                 verb:"is",
                                 noun:"cool"))


//=======================================================

func addMyAccountBalances(balances:Double...) -> Double {
    
    var result:Double=0
    
    for balance in balances {
        result += balance
    }
    
    return result
}

print(addMyAccountBalances(balances: 77.87))
print(addMyAccountBalances(balances: 77.87, 12.67, 990.00, 56.01, 33.98, 44.66))

//=======================================================


func findLargestBalance(balances:Double...) -> Double {
    
    var result:Double = -Double.infinity
    
    for balance in balances {
        if balance > result {
            result = balance
        }
    }
    
    return result
}

//print(findLargestBalance(34,56,67,78,89,900,1234567,4))
//print(-Double.infinity)

func findSmallestBalance(balances:Double...) -> Double {
    
    var result:Double = Double.infinity
    
    for balance in balances {
        if balance < result {
            result = balance
        }
    }
    
    return result
}

print(findSmallestBalance(balances:34,56,67,78,89,900,1234567,4))

//=======================================================

var account1 = ("State Bank Personal", 1011.10)
var account2 = ("State Bank Business", 24309.63)

func deposit(amount:Double,
             account: (name:String, balance:Double)) ->(String, Double) {
    
    let newBalance:Double = account.balance + amount
    
    return(account.name, newBalance)
}

func withdraw(amount:Double,
              account: (name:String, balance:Double)) ->(String, Double) {
    
    let newBalance:Double = account.balance - amount
    
    return(account.name, newBalance)
}

let mondayTransaction = deposit
let fridayTransaction = withdraw

let mondayBalance = mondayTransaction(300.00,  account1)
let fridayBalance = fridayTransaction(1200, account2)

print("Account is: \(mondayBalance.0) balance is: \(mondayBalance.1)")
print(fridayBalance)



func chooseTransaction(transaction:String) -> (Double, (String, Double))
    ->(String, Double)
{
    if transaction == "Deposit"{
        return deposit
    }
    return withdraw
}

let myTransaction = chooseTransaction(transaction: "Deposit")
print(myTransaction(223.50,account2))



func bankVault(passcode:String) -> String{
    func openBankVault(_: Void) ->String{
        return "Vault Open"
    }
    func closeBankVault() -> String{
        return "Vault Closed"
    }
    if passcode == "secret"{
        return openBankVault()
    }
    else {
        return closeBankVault()
    }
}

print(bankVault(passcode: "some wrong secret"))
print(bankVault(passcode: "secret"))


func writeCheck(payee:String = "Unknown", amount:String = "10.00")->String{
    return "check payable to " + payee + " for $" + amount;
}

print(writeCheck())
print(writeCheck(payee: "Jane Doe"))
print(writeCheck(payee: "Jane Doe", amount: "45.00"))


func writeCheckFrom(payer:String, _ payee:String, _ amount:Double)-> String{
    return "Check payable from \(payer) to \(payee) for $\(amount)"
}

print(writeCheckFrom(payer: "Joe Smith", "George Bush", 1_000.0))


func cashCheck(from:String, to:inout String, total:Double) -> String{
    var to = to
    if to == "Cash" {
        to = from
    }
    return "Hello"
}

var payer = "James Perry"
var payee = "Cash"
print(payee)
print(cashCheck(from: "George Smith", to: &payee, total: 304.90))

/*
 
 CLOSURE
 
{(parameters) -> return_type in
 statements
}
*/


var printMe = {print("Hello!")}
printMe()


let names = ["aaron","josh","matt","drew", "somelongername"]



var reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1>s2
})

print(reversedNames)



