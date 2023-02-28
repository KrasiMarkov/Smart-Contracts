pragma solidity 0.4.24;

contract StateFull {

    enum State { Locked, Unlocked, Restricted }

    struct Counter {

        uint256 counter;
        uint256 timestamp;
        address addr;
    }

    address owner;
    Counter public counter;
    State public state;


    constructor() public {
 
       owner = msg.sender;
    }

    modifier onlyOwner {
       
       require(msg.sender == owner);
       _;
    }

    modifier canExecute {

       require(state != State.Locked);
	   require( (state == State.Unlocked) || ((state == State.Restricted) && (msg.sender == owner)));
		_;
    }


    function changeState(State _state) public onlyOwner {

        state = _state;
    }

    function increments() public canExecute {

        counter.counter++;
        counter.timestamp = now;
        counter.addr = msg.sender;

    }

}
