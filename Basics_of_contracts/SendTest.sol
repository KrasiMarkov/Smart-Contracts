pragma solidity 0.4.24;

contract Sender {

    uint public payments;

    function send(address _receiver) public payable {
       _receiver.send(msg.value);
       payments++;
    }

    function transfer(address _receiver) public payable {
        _receiver.transfer(msg.value);
       payments++;
    }
}

contract Receiver {

    uint public balance = 0;
   
    event Receive(uint indexed value);

    function () public payable {

        emit Receive(msg.value);
        
    }
}