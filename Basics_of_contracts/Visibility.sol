pragma solidity 0.4.24;

contract Visibility {

    uint256 public state;
    uint256 private privateState;
    uint256 internal internalState;
   

    function test() public {
       state++;
    }
   
    function testPrivate() private {
       privateState++;
    }

    function testInternal() internal {
       internalState++;
    }

    
    
}

contract Test {

    Visibility visible = new Visibility();

    function test() public {
        visible.test();
        
    }
}