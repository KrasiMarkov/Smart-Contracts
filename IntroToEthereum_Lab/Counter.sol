pragma solidity 0.4.24;

contract Counter {

    uint256 public counter;

    function incrementCounter(uint256 value) public {
        counter = counter + value;
    }
}