pragma solidity 0.4.24;

contract Exception {

    function testRequire(uint a, uint b) public pure returns (uint){
 
        require(a >= b, "a shold be higher than b"); 

        return a - b;
    }

    function testAssert(uint a, uint b) public pure returns (uint){
 
        assert(a >= b); 

        return a - b;
    }
}
