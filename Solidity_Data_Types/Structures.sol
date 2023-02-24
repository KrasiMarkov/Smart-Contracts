pragma solidity 0.4.24;

contract Structures {

    struct HighestBidder {

        address addr;
        uint amount;
    }

    HighestBidder public highestBidder;

    constructor() public {
         
        //
        highestBidder = HighestBidder(msg.sender, 0);

        //
        highestBidder = HighestBidder( { addr: msg.sender, amount: 0 } );

        //
        highestBidder.addr = msg.sender;
        highestBidder.amount = 0;

    }

    function bid() public payable {

        if(msg.value > highestBidder.amount){
           
           highestBidder = HighestBidder(msg.sender, msg.value);
        }
    }
}