pragma solidity 0.4.24;

contract OwnerLab {

    address public owner;

    address public proposedOwner;

    uint timeLimit;

    event OwnershipTransferred (address indexed priviousOwner, address indexed newOwner); 
    event OwnershipAccepted (address indexed newOwner); 
    

    constructor() public {

       owner = msg.sender;
    }


    modifier onlyOwner {

        require(msg.sender == owner, "Can be invoked by the owner only!");
        _;
    }

    modifier onlyProposedOwner {

        require(msg.sender == proposedOwner, "Can be invoked by the proposed owner only!");
        _;
    }
    

    function transferOwnership(address newOwner) public onlyOwner {

        require(newOwner != address(0x0));

        emit OwnershipTransferred (owner, newOwner); 

        proposedOwner = newOwner;

        timeLimit = now;

    }

    function acceptOwnership() public onlyProposedOwner {

        require(now < timeLimit + 30 seconds);

        emit OwnershipAccepted (msg.sender);

        owner = msg.sender;
    }


}