import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
    stable var currentValue : Float = 300;
     currentValue := 300;
    stable var startTime = Time.now();
    Debug.print(debug_show(startTime));

    let id  = 4324324325254254;
    Debug.print(debug_show(id));

    public func topUp(amount: Float) {
        currentValue += amount;
        Debug.print(debug_show(currentValue));
    };

    public func withdraw(amount: Float) {
        let tempValue : Float = currentValue - amount;
        if(tempValue < 0) {
            Debug.print("Not enough money");
        } else {
            currentValue -= amount;
            Debug.print(debug_show(currentValue));
        }
    };

    public query func checkBalance() : async Float {
        return currentValue;
    };


    public func compund(){
        let currentTime = Time.now();
        let timeDiff = currentTime - startTime;
        let timeDiffSecond = timeDiff / 1000000000;
        currentValue := currentValue * (1.0001 ** Float.fromInt(timeDiffSecond));
        startTime := currentTime;
    };
    
}