pragma solidity 0.4.24;

contract Agreement {

  address[] public owners;
  uint public nextToVote = 0;

  struct Proposer { 
    
    uint value;
    address addr;
    uint timestamp;
  }

  constructor(address[] _owners) public {

    owners = _owners;
  }


  Proposer public proposal;


  
  modifier canPropose {

    for(uint index = 0; index < owners.length; index++) {
			if(owners[index] == msg.sender) {
				_;
				break;
			}
		}
  }


  function() public payable {}

  
  function propose(uint value, address addr) public canPropose {

		require(now > proposal.timestamp + 5 minutes);
		
		proposal = Proposer(value, addr, now);
		nextToVote = 0;
	}


  function vote() public {
	
		require(nextToVote < owners.length);
		require(owners[nextToVote] == msg.sender);
		require(now <= proposal.timestamp + 5 minutes);
		require(address(this).balance >= proposal.value);
		
		nextToVote++;
		
		if(nextToVote >= owners.length) {
			proposal.addr.transfer(proposal.value);
		}
		
	}

}