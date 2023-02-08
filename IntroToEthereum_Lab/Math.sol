pragma solidity 0.4.24;

contract Math {

    function Add(uint256 a, uint256 b) public returns (uint256){
        return a + b;
    }

    function Subtract(uint256 a, uint256 b) public returns (uint256){
       return a - b;
    }

    function Multiply(uint256 a, uint256 b) public returns (uint256) {
        return a * b;
    }

    function Divide(uint256 a, uint256 b) public returns(uint256){
      return a / b;
    }
}


