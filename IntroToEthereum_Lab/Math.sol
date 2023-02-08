pragma solidity 0.4.24;

contract Math {

    function Add(uint256 a, uint256 b) public returns (uint256){
        return a + b;
    }

    function Sub(uint256 a, uint256 b) public returns (uint256){
       return a - b;
    }

    function Mul(uint256 a, uint256 b) public returns (uint256) {
        return a * b;
    }

    function Div(uint256 a, uint256 b) public returns(uint256){
      return a / b;
    }
}


