import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";
actor DBank {
    stable var currentValue:Float=100;

    stable var startTime= Time.now();
    
    public func topUp(amount:Float){
        currentValue+=amount;
        Debug.print(debug_show(currentValue));
    };
    public func topDown(amount:Float){
        let tempValue:Float=currentValue-amount;
        if(tempValue>=0)
        {
            currentValue-=amount;
            Debug.print(debug_show(currentValue));
        }
        else
        {
            Debug.print("You dont have that much money in your bank");
        }
        
    };
    public func compound(){
        let currentTime=Time.now();
        let elapseTimeNS=currentTime-startTime;
        let elapseTimeS=elapseTimeNS/1000000000;
        currentValue:=currentValue*1.01**Float.fromInt(elapseTimeS);
        startTime:=currentTime;
        
    };
    public query func showValue():async Float{
        return currentValue;

    } ;
}