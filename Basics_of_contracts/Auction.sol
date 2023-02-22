pragma solidity 0.4.24;

contract Auction {

    address public owner;

    uint public startBlock;

    uint public endBlock;

    bool public canceled;

    address public highestBidder;

    mapping(address => uint256) public fundsByBidder;


    constructor(uint _startBlock, uint _endBlock) public {

       require(_startBlock <= endBlock);
       require(_startBlock > block.number);

       owner = msg.sender;
       startBlock = _startBlock;
       endBlock = _endBlock;

    }

    modifier onlyRunning {

       require(canceled == false);
       require((block.number > startBlock) && (block.number < endBlock));
       _;
    }

    modifier onlyOwner {

        require(msg.sender == owner);
        _;
    }

    modifier onlyNotOwner {

        require(msg.sender != owner);
        _;
    }

    modifier onlyAfterStart {

        require(block.number > startBlock);
        _;
    }

    modifier onlyBeforeEnd {

        require(block.number < endBlock);
        _;
    }

    modifier onlyNotCanceled {

        require(canceled == false);
        _;
    }

    modifier onlyEndedOrCanceled {

        require((canceled == true) || (block.number > endBlock));
        _;
    }

    function placeBid() 
    public 
    payable 
    onlyAfterStart 
    onlyBeforeEnd
    onlyNotCanceled
    onlyNotOwner {
       
       require(msg.value > 0);

       uint newBid = fundsByBidder[msg.sender] + msg.value;

       uint lastHighestBid = fundsByBidder[highestBidder];

       require(newBid > lastHighestBid);

       fundsByBidder[msg.sender] = newBid;

       highestBidder = msg.sender;

       emit logBid(msg.sender, newBid, highestBidder, lastHighestBid);
    }

    function withdraw() public onlyEndedOrCanceled {

       address withdrawalAccount;

       uint withdrawalAmount;

       if(canceled == true){
         
          withdrawalAmount = fundsByBidder[msg.sender];

        } else {

              require(msg.sender != highestBidder);

            if(msg.sender == owner){
          
                 withdrawalAmount = fundsByBidder[highestBidder];
          } else {

             withdrawalAmount = fundsByBidder[msg.sender];
          }
 
        }

        require(withdrawalAmount > 0);

        fundsByBidder[withdrawalAccount] -= withdrawalAmount;

        msg.sender.transfer(withdrawalAmount);

        emit logWithdraw(msg.sender, withdrawalAccount, withdrawalAmount);
    }

    function cancelAction() 
    public
    onlyOwner
    onlyBeforeEnd
    onlyNotCanceled {
      
      canceled = true;

      emit logCancelled();
    }

    event logBid(address bidder, uint bid, address highestBidder, uint highestBid);

    event logWithdraw(address withdrawer, address withdrawalAccount, uint amount);

    event logCancelled();

}