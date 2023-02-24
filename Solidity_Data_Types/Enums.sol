pragma solidity 0.4.24;

contract Enumerations {

    enum Colors { Blue, Red, Green }

    Colors choice;
    Colors constant defaultChoice = Colors.Green;

    function chooseRed() public {

       choice = Colors.Red;
    }

    function choose(uint _color) public {

       choice = Colors(_color);
    }

    function getChoice() public view returns(Colors){

        return choice;
    }

    function getDefaultChoice() public pure returns (uint){

       return uint(defaultChoice);
    }
}