pragma solidity 0.4.24;

contract Ownership {

    uint state;
    address owner;

    constructor() public {

        owner = msg.sender;

    }

    modifier onlyOwner {

        require(msg.sender == owner, "Can be invoked by the owner only!");
        _;
    }

    function kill() public onlyOwner {

        selfdestruct(owner);

    }

    function setNewState(uint _state) public onlyOwner {

        state = _state;
    }

    function getOwnerBalance() public view returns(uint 256){

        return owner.balance;
    }
}